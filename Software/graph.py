"""
program for live updating a power vs time graph during a simulation
program is started trhough a system call initiated by the house control program
"""

import time
import sys
import csv
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from matplotlib import style
import numpy as np

plt.style.use('fivethirtyeight')

def animate(i):
    in_file = sys.argv[1]
    houses = sys.argv[3:]
    time =[]
    power = {}
    for house in houses:
        power[house] = []
    with open(in_file, 'r') as data:
        reader = csv.reader(data, delimiter=',')
        for row in reader:
            if row[0] != 'minute':
                time.append(int(row[0]))
                for i in range(len(houses)):
                    power[houses[i]].append(float(row[i+1]))
    plt.cla()
    for house in power:
        plt.plot(time,power[house],label=house)
    plt.legend(loc='upper left')
    plt.tight_layout()
    plt.xlabel("Time (minutes from midnight)")
    plt.ylabel("Power (Watts)")
    plt.title("Power Consumption vs Time")
    plt.xlim([0,1440])
    plt.ylim([0,100])
    

def main():
    time_step = float(sys.argv[2]) * 1000
    ani = FuncAnimation(plt.gcf(), animate, interval = time_step)
    plt.show()
    sys.exit(1)
    
if __name__ == "__main__":
    main()
