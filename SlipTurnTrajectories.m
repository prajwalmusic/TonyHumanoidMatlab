T = 1; %Time Period
K = 32.5; %Half Pelvis Distance
L = 50; % Length of the step
Py = 50 ;
Px = 47;
lx = 124;
ly = 77;
H = 20; %Foot Height
Zo = 210;
t=0;
fileID = fopen('angles_slip.txt','w');
xr1 = K;
yr1 = 0;
zr1 = 210;
xl1 = -K;
yl1 = 0;
zl1 = 210;
while(t<T)
    if (t == 0)
    xrf = K;
    yrf = L/2;
    zrf = 0;
    [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
    xlf = -K;
    ylf = -L/2;
    zlf = 0;
    [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
    else 
        if(t==0.5)
            xrf = K;
            yrf = L/2-Py;
            zrf = 0;
            [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
            xlf = -K;
            ylf = -(L/2-Py);
            zlf = 0;
            [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
        end
    end
    t = t+0.5;
    thetas = [te1,te2,te3,te4,te5,te6,te7,te8,te9,te10];
    fprintf(fileID,'%d\t',round(thetas));
    fprintf(fileID,'\n');
end
tant = (- 3 * Px * Py)/(lx^2+ly^2+(3*Py^2));
turn = atand(tant);
fprintf("Expected Turn in Degrees : %f \n ",turn);
fclose(fileID);
