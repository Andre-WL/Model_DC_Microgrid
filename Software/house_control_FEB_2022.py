"""
Microgrid systems controller firmware
"""

import sys
import csv
import time
from time import sleep
import serial
from smbus import SMBus
import numpy as np
import RPi.GPIO as GPIO
import multiprocessing
import os

# Global Variables
DAY_LENGTH = 1440 # Simulation minutes in a day
DEBUG = False

SERIAL_DEVICE = '/dev/serial0' # https://raspberrypi.stackexchange.com/questions/45570/how-do-i-make-serial-work-on-the-raspberry-pi3-pizerow-pi4-or-later-models/45571#45571
BAUDRATE = 1200 #1200 bits per second
UART = serial.Serial(SERIAL_DEVICE, BAUDRATE) #UART also needs to be configured to output 3.3V

#setup pins for telling pico to transition and end simulation
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
switch_pins = {'house1':4,'house2':17,'house3':27,'house4':22}#these must be configured to output 3.3V, not 5V
for house in switch_pins:
    GPIO.setup(switch_pins[house],GPIO.OUT)
    GPIO.output(switch_pins[house],True)
    
#set up select pins for multiplexer
sb0 = 23
GPIO.setup(sb0,GPIO.OUT)
sb1 = 24
GPIO.setup(sb1,GPIO.OUT)

#set up I2C for ADC
i2c = SMBus(1)
ADC_addr = 0x4e
p_step = 100/(2**12) #12 bit resolution


"""Each command maps to:
 6 digit hex "switch vector" that in binary will be all 1s or all 0s except bit representing the appliance being switched
 int as 0 or 1 dictating whether appliance being switch off (0) or on (1)"""
command_map = {house1: ('light_l_off': (0xffffdf, 0), 'light_l_on': (0x000020, 1),
                    'light1_k_off': (0xffefff, 0), 'light1_k_on': (0x001000, 1),
                    'light2_k_off': (0xffffbf, 0), 'light2_k_on': (0x000040, 1),
                    'stereo_off': (0xff7fff, 0), 'stereo_on': (0x008000, 1),
                    'lamp_l_off': (0xfbffff, 0), 'lamp_l_on': (0x040000, 1),
                    'heater_off': (0xffff7f, 0), 'heater_on': (0x000080, 1),
                    'tv_off': (0xfffeff, 0), 'tv_on': (0x000100, 1),
                    'fridge_off': (0xffffef, 0), 'fridge_on': (0x000010, 1),
                    'dishwasher_off': (0xfffffd, 0), 'dishwasher_on': (0x000002, 1),
                    'oven_off': (0xfffdff, 0), 'oven_on': (0x000200, 1),
                    'toaster_off': (0xfffffe, 0), 'toaster_on': (0x000001, 1),
                    'jug_off': (0xfffff7, 0), 'jug_on': (0x000008, 1),
                    'lamp_b1_off': (0xfdffff, 0), 'lamp_b1_on': (0x020000, 1),
                    'clock_b1_off': (0xefffff, 0), 'clock_b1_on': (0x100000, 1), # There is no clock in b2 now
                    'water_heater_off': (0xfffffb, 0), 'water_heater_on': (0x000004, 1),
                    'laptop_charger1_b2_off': (0xffdfff, 0), 'laptop_charger1_b2_on': (0x002000, 1),
                    'laptop_charger2_b2_off': (0xffbfff, 0), 'laptop_charger2_b2_on': (0x004000, 1),
                    'lamp_b2_off': (0xf7ffff, 0), 'lamp_b2_on': (0x080000, 1),
                    'phone_charger1_b2_off': (0xdfffff, 0), 'phone_charger1_b2_on': (0x200000, 1),
                    'phone_charger2_b2_off': (0xbfffff, 0), 'phone_charger2_b2_on': (0x400000, 1),
                    'light_b1_off': (0xfeffff, 0), 'light_b1_on': (0x010000, 1),
                    'light_bath_off': (0xfff7ff, 0), 'light_bath_on': (0x000800, 1),
                    'light_b2_off': (0xfffbff, 0), 'light_b2_on': (0x000400, 1)), 'house2': (), 'house3': (), 'house4': ()
                    }

"""reads input csv file to create a map of transitions
transition map uses time of transition as key, key leads to list of "switch vectors" with the corresponding "off" or "on" indicator"""
def parse(file, house_num):
    """Parse the csv file into a transition map"""
    global PLAYBACK_TIME
    global DEBUG
    global TIME_STEP
    house = 'house1'
    transition_map = {}
    print('Creating transition map from CSV')
    for row in file:
        if row[0] == 'playback_time':
            PLAYBACK_TIME = int(row[1])
        elif row[0] == 'debug':
            DEBUG = True
        elif row[0] == 'house':
            assert int(row[1]) > 0 or int(row[1]) < 5, "House number outside allowable range of 1-4: " + row[0]
            house = 'house' + row[1]
            assert house not in transition_map, "Multiple instances of " + house + " in input file"
            transition_map[house] = {}
        elif row[0] in command_maps[house]: # valid command
            command = row[0]
            for column in row[1:]:
                if column:
                    column = int(column)
                    assert column >= 0 or coumn <= 1440, "Switch times must be between 0 and 1440, error in:" + row
                if column in transition_map[house]:
                    transition_map[house][column].append(command_map[house][command])
                else:
                    transition_map[house][column] = [command_map[house][command]]
    assert PLAYBACK_TIME <= 300, "Playback Time too long; must be between 30 and 300 seconds"  #if PLAYBACK_TIME is >300
    assert PLAYBACK_TIME >= 30, "Playback Time too short; must be between 30 and 300 seconds"  #if PLAYBACK_TIME is <30
    TIME_STEP = PLAYBACK_TIME/DAY_LENGTH # Time step in seconds for the simulation
    if DEBUG:
        print("transition_map = ", transition_map)
        print("PLAYBACK_TIME = ", PLAYBACK_TIME)
        print("DAY_LENGTH = ", DAY_LENGTH)
        print("TIME_STEP = ", TIME_STEP)
        print("SERIAL_PDEVICE = ", SERIAL_DEVICE) # python3 -m serial.tools.list_ports
        print("BAUDRATE = ", BAUDRATE)
        print("DEBUG = ", DEBUG)
    return transition_map

#takes transition map and creates vector list in order when transitions will happen
def create_vector_list(transitions, house):
    num_reg = 3
    if house == 'house4'
        num_reg = 2
    vector = 0x00 #inital state vector is all zeros (not added to list)
    vector_list=[]
    print('Creating vector list from transition map')
    for i in range (1441): #go through all minutes in a day as map keys will not be in numeric order
        if i in transitions:
            switch_list = transitions[i] #list of switch vectors occuring in this minute
            for switch in switch_list:
                if switch[1] == 0:
                    vector = (vector & switch[0]) #turn off
                if switch[1] == 1:
                    vector = (vector | switch[0]) #turn on
            for j in range(num_reg): #append each state vector to list as individual byte size elements for serial transmission
                vector_list.append((vector>>(j*8))&0xff) #each broken vector loaded in little endian
    return vector_list

#set select pins on multiplexxer to listen/talk to correct house
def set_address(house):
    if house == 'house1':
        GPIO.output(sb0,False)
        GPIO.output(sb1,False)
    if house == 'house2':
        GPIO.output(sb0,True)
        GPIO.output(sb1,False)
    if house == 'house3':
        GPIO.output(sb0,False)
        GPIO.output(sb1,True)
    if house == 'house4':
        GPIO.output(sb0,False)
        GPIO.output(sb1,True)

def sim_time(minutes):
    """Converts minutes as a float into hh:mm form"""
    return '{:02d}:{:02d}'.format(*divmod(minutes, 60))

#reads ADC but does not store it
def read_ADC():
    return i2c.read_i2c_block_data(0x4e,0x00,2)

#takes ADC reading and converts it into power level
def process_ADC():
    ADC_data = read_ADC()
    data = ADC_data[0] | (ADC_data[1]<<4) #12bits as 2 bytes, lower byte uses only 4 lower bits, hence bit shifting upper byte by 4, not 8
    return data*p_step

#system calls graph.py with arguments to give filename of csv with graph data, time step, and each house
def run_graph(arg):
    command = 'python3 graph.py' + arg
    os.system(command)

def main():
    """Main"""
    # Handle args
    args = sys.argv[1:]  #all but first argument(which is just the name of the program)
    INPUT_FILE_NAME = 'program.csv'
    OUTPUT_FILE_NAME = "ADC_DATA_" + str(time.time_ns()) + ".csv"
    if args: #if args is not empty
        assert len(args) == 2 or len(args) == 4, "Invalid number of input arguments"
        #assigning input and output file names
        if args[0] == '-i':
            INPUT_FILE_NAME = args[1]
        elif args[0] == '-o':
            OUTPUT_FILE_NAME = args[1]
        else:
            raise RuntimeError("Unrecognised parameter: " + args[0] + " " + args[1])
        if len(args) == 4:
            if args[2] == '-i':
                INPUT_FILE_NAME = args[3]
            elif args[2] == '-o':
                OUTPUT_FILE_NAME = args[3]
            else:
                raise RuntimeError("Unrecognised parameter: " + args[2] + " " + args[3])
    # Setup
    #Read input file
    with open(INPUT_FILE_NAME, encoding='utf-8', newline='') as input_csv:
        reader = csv.reader(input_csv, delimiter=',', quotechar='|')
        transition_map = parse(reader)
        
    #generate and send vector lists
    for house in transition_map:
        set_address(house)
        vector_list = create_vector_list(transition_map[house],house)
        UART.write(vector_list)
        while True:
            wait = UART.read(5)
        if not wait is None:
            if str(wait) == "b'ready'":
                break
            
    #add column headers to output file and start graph process
    
    arg = ' ' + OUTPUT_FILE_NAME + ' ' + str(TIME_STEP) #arg for sub process must include ADC data filename and time step for updating graph
    
    fieldnames = ['minute']
    for house in transition_map:
        fieldnames.append(house)
        arg = arg + ' ' + house #add house name to arg
    with open(OUTPUT_FILE_NAME,'w') as csv_file:
        csv_writer = csv.DictWriter(csv_file, fieldnames = fieldnames)
        csv_writer.writeheader()
    
    #start graph process (graph updates live during simulation)
    graph = multiprocessing.Process(target = run_graph, args = (arg,))
    graph.start()
    
    # Simulation
    print('Starting simulation')
    for i in range(0, DAY_LENGTH+1): # Include 1440th minute
        t_start = time.perf_counter()
        if DEBUG:
            print("Simulation Time: ", sim_time(i))
            
        #check for switching
        for house in transition_map:
            if i in house:
                GPIO.output(switch_pins[house],False) #pull relevant switch lines low
        for house in switch_pins:
            GPIO.output(switch_pins[house],True) #set switch lines back high
            
            
        #get data from ADC
        ADC_data = []
        throwaway = True #boolean to indicate if throwaway reading has been completed
        for house in transition_map:
            set_address(house) #set address to next house being sampled
            if throwaway:
                read_ADC() #reading last conversion will initiate next conversion, first reading must be thrown away
                throwaway = False
            else:
                ADC_data.append(process_ADC()) #this will read data from conversion on previous house and initate conversion on current house
        ADC_data.append(process_ADC()) #last reading done outside of loop as first in loop is thrown away
        
        #output ADC data to CSV
        with open(OPUT_FILE_NAME,'a') as csv_file:
            csv_writer = csv.DictWriter(csv_file, fieldnames = fieldnames)
            info = {'minute':i}
            index = 0
            for house in transition_map:
                info[house]=ADC_data[index]
                index++
            csv_writer.writerow(info)
        
        #check that tick has not taken longer than time step
        t_exec = time.perf_counter() - t_start
        if t_exec < TIME_STEP:
            if DEBUG:
                print("t_exec = ", t_exec)
            time.sleep(TIME_STEP - t_exec)
        elif DEBUG:
            print("Loop takes longer than time step to execute")
    for house in transition_map:
        GPIO.output(switch_pins[house],False)
    print('Simulation finished')


if __name__ == "__main__":
    main()
