"""
Program for raspberry pi pico
controls the switching of appliances in  a house
this code can be used for houses 1, 2, and 3
to be used for house 4, the value of num_reg in the process_list function must be changed to 2
"""

import machine
from machine import UART, Pin
import utime
import time
from time import sleep

#UART pin
uart = UART(1,1200,parity=None,stop=1,rx=Pin(9),tx=Pin(8))

#shift registers will be in series configuration, so only need 3 pins
data_reg = Pin(0, Pin.OUT) #pin 1 on PI
clock = Pin(1, Pin.OUT) #pin 2 on PI
strobe = Pin(2, Pin.OUT) #pin 4 on PI

#input pins for single bit set values from Pi
transition = Pin(27,Pin.IN) #pin 5 on pico, Pi will pull pin low when transition needs to be made, and at the end of the simulation

#variable indicating number of output pins in total for this house
num_pins = 24

state_vectors = [] #global variable to store switch_vectors
index = 0 #keeps track of which vector to pull so that queue is not needed
#first vector is loaded to register before simulation starts, index is incremented each time new value is loaded
#when index reaches length of state vector list there will still be one more value to be strobed to the output
#change_states function will call load_to_reg function if index is in range
#if index is out of range (ie equal to len(state_vectors)) then index is incremented in change_states
#when transition pin is pulled low, if index > len(state_vectors) this indicates the end of the simulation, the the reset sequence starts

#function takes UART message with list of state vectors and processes it into list which can be used
#UART message will be list of ints where each 3 ints corresponds to one state vector
#use bitwise operations to generate 24bit vector (or 16 bit for house 4)
def process_list(data):
    num_reg = 3 #CHANGE VALUE TO 2 FOR HOUSE 4
    vector = 0 #temporary variable to store 
    for i in range(len(data)/num_reg):
        ind = i*num_reg
        for j in range(num_reg):
            vector = (vector | (data[ind + j] << (j*8))) #LSBs first
        state_vectors.append(vector)
        vector = 0 #set vector back to 0 to load next one

    
def wait_for_list():
    data = None
    while True:
        data = uart.read()
        if not data is None:
            break
    process_list(list(data))

#function loads value onto shift registers but does not strobe it to output
#loads to register by bit shifting the vector to make value being loaded LSB, then ANDing with 1
#done in big endian as registers load values in series from Q1 to Q8  
def load_to_reg(vector):
    global index
    for i in range (num_pins):
        data_reg.value((vector >> (num_pins-1-i)) & 1) #loads in big endian as pin 1 should be bit 1
        clock.value(1)
        clock.value(0)
        index+=1

#function strobes value loaded to register to output when transition call is made
#loads next value into register for the next transition
def change_states():
    #strobe next value to register outputs
    strobe.value(1)
    strobe.value(0)
    if index<len(state_vectors):
        load_to_reg(state_vectors[index]) #load next value without strobing
    else:
        index+=1 #increments index if load_to_reg call not made
    while True:
        if transition.value(): #wait to make sure pin is back high so this funciton is not called twice in transition signal
            break
    
#function waits for GPIO pin on Pi to be high to indication switch transition must be made
#also checks for "simulation" pin on pi to be high indication similation is over
def wait_for_transition():
    while True:
        if not transition.value():
            if index > len(state_vectors):
                break
            change_states()

#function clears state vectors and resets index
#loads all 0s onto shift register        
def reset():
    global state_vectors
    state_vectors = []
    global index
    index = 0
    data_reg.value(0)
    for _ in range (num_pins):
        clock.value(1)
        clock.value(0)
    strobe.value(1)
    strobe.value(0)
    
    
def main():
    #set clock and strobe values for registers to LOW as they respond to positive edge
    clock.value(0)
    strobe.value(0)
    while True: #main loop
        wait_for_list() #this will call function to process the list
        load_to_reg(state_vectors[index]) #first call of this loads 0th vector to shift register but doesn't strobe
        uart.write('ready') #send ready message to Pi
        wait_for_transition() #this will call funciton that executes the transition
        reset() #empty vector list, set register values to all 0s, resent index to 0

if __name__ == "__main__":
    main()
