# Author : Prajwal, Prasanna
# Receievs walking sequence angles from 3D LIP Algorithm
# Converts it to SERVO mapped angles which can be sent to the bot.

import time
import serial
def calculate_PWM(angle):
    pwm= 500.0 + (((2500.0-500.0)/(180-0))*(angle-0))
    return pwm
#filename = str(input("Enter the file Name: "))
#filename = filename + ".txt";
f=open("angles_generated.txt");
#newfilename = str(input("Enter output file Name : "))
newfilename = "TEMP" + ".txt"
f2=open(newfilename,'w');
angles=f.readlines();
newangles=[0]*10;
finalangles=[]
Offsets=[-50, -10, -20, 0, 0, -80, 100, 68, 0, 0]
#f2.write("Max: 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500 2500\nMin: 500 500 500 500 500 500 500 500 500 500 500 500 500 500 500 500 500 500\nCen: 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500\nHom: 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500 1500\nDir: True True True True True True True True True True True True True True True True True True\nLab:Servo 1:Servo 2:Servo 3:Servo 4:Servo 5:Servo 6:Servo 7:Servo 8:Servo 9:Servo 10:Servo 11:Servo 12:Servo 13:Servo 14:Servo 15:Servo 16:Servo 17:Servo 18:\nPrm: 0 2 1 0 1\nGrp: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n")   
print(len(angles))
for step in angles:
    current_step=step.split();
    newangles[0]=90-(int(current_step[0])*1.4) #theta1
    newangles[1]=90+int(current_step[1])  #theta2
    newangles[2]=180-(30+abs(int(current_step[2]))) #theta3
    newangles[3]=90+int(current_step[3]) #theta4
    newangles[4]=90+(1.4*int(current_step[4])) #theta5
    newangles[5]=90-(1.4*int(current_step[5]))#theta6 
    newangles[6]=180-(90+int(current_step[6])) #theta7
    newangles[7]=30+abs(int(current_step[7])) #theta8
    newangles[8]=180-(90+int(current_step[8])) #theta9
    newangles[9]=90+(int(current_step[9])*1.4) #theta10
    #print(current_step[0],current_step[1],current_step[2],current_step[3],current_step[4],current_step[5],current_step[6],current_step[7],current_step[8],current_step[9])
    print(newangles)
    current_pwm=[]
    f2.write("L=")
    offNum = 0
    for i in newangles:
        pwm=calculate_PWM(i)+Offsets[offNum];
        current_pwm.append(int(pwm))
        offNum = offNum+1
        f2.write(str(int(pwm))+":")
    f2.write('\n');
f2.close()
f.close()
#######################
ser = serial.Serial("COM4",115200);
toWait = 1
speed = int(input("Speed of the Servos?? : "))
speedString = "P=" + ((str(speed)))+"\n"
print(speedString)
ser.write(speedString.encode('utf-8'))
num=2
while(num>=0):
    f2 = open(newfilename)
    toBeSent = f2.readlines()
    c = ser.read()
    for line in toBeSent:
        ser.write(line.encode('utf-8'))
        while(1):
            c = ser.read();
            print(c)
            if c == b'i':
                break;
        while(toWait != 0):
            toWait = int(input("Press Zero to Continue Sending" ))
    num=num-1
    f2.close()
ser.close
