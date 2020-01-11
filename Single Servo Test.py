# Author : Prajwal, Prasanna
# Servo Tester 
# Converts it to SERVO mapped angles which can be sent to the bot.

import time
import serial
def calculate_PWM(angle):
    pwm= 500.0 + (((2500.0-500.0)/(180-0))*(angle-0))
    return pwm

ser = serial.Serial("COM4",115200);
toWait = 1
speed = int(input("Speed of the Servos?? : "))
speedString = "P=" + ((str(speed)))+"\n"
print(speedString)
ser.write(speedString.encode('utf-8'))
num=2500
while(num>=0):
    line = "S=5:" + str(num) + "\n"
    print(line);
    c = ser.read()
    ser.write(line.encode('utf-8'))
    while(1):
        c = ser.read();
        print(c)
        if c == b'i':
            break;
    #while(toWait != 0):
    #    toWait = int(input("Press Zero to Continue Sending" ))
    num=num-1
ser.close
