T = 1; %Time Period
K = 32.5; %Half Pelvis Distance
L = 50; % Length of the step
Py = 25;
Px = 50;
lx = 120;
ly = 77;
H = 20; %Foot Height
Zo = 210;
t=0;
InterStepSize = 25;
N = Py/InterStepSize;
fileID = fopen('angles_slip.txt','w');
xr1 = K;
yr1 = 0;
zr1 = 210;
xl1 = -K;
yl1 = 0;
zl1 = 210;
while(t<=T)
    if (t == 0)
    xrf = K;
    yrf = L/2;
    zrf = 0;
    [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1,'r');
    xlf = -K;
    ylf = -L/2;
    zlf = 0;
    [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1,'l');
    else 
            xrf = K;
            yrf = L/2-(InterStepSize * t * N/T);
            zrf = 0;
            [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1,'r');
            xlf = -K;
            ylf = -(L/2-(InterStepSize * t * N/T));
            zlf = 0;
            [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1,'l');
    end
    t = t+(T/N);
    thetas = [te1,te2,te3,te4,te5,te6,te7,te8,te9,te10];
    fprintf(fileID,'%d\t',round(thetas));
    fprintf(fileID,'\n');
end
tant = (- 3 * Px * Py)/(lx^2+ly^2+(3*Py^2));
turn = atand(tant);
fprintf("Expected Turn in Degrees : %f \n ",turn);
fclose(fileID);
