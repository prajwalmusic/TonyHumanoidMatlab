%%% Function to Solve inverse kinematics of 5-dof leg of humanoind robot
%%% Inputs = 6 co-ordinates, from x,y,z foot co-ordinates and x,y,z hip
%%% co-ordinates/
%%% Returns 5 angles - hip roll, pitch. knee pitch. ankle pitch, roll
%%% Based on Equations in the Paper:
%%% Solving Inverse Kinematics using Geometric Anaylsis on Small-Scale
%%% Humanoid Robot submitted to IEEE/SICE International Symposium on System
%%% Integration 2020
%%% Authors: Prasanna Venkatesan K S and Prajwal Rajendra Mahendrakar

function [te1,te2,te3,te4,te5] = TonyIK(xf,yf,zf,x1,y1,z1,leg)
%Robot Parameters[45,65,65,50,17]
l1 =45;
l2 =65;
l3 =65;
l4 =50;
l5 =17;
xf = round(xf,2);
yf = round(yf,2);
zf = round(zf,2);
x1 = round(x1,2);
y1 = round(y1,2);
z1 = round(z1,2);
%Intialize known co-ordinates
options = optimset('Display','off');
y2 = y1;
y5 = yf;
y4 = y5;
x5 = xf;
z5 = zf + l5;
%calculate slope of the leg
slope = (z1 - z5)/(x1 - x5);
%solve equations
 if (slope == Inf) || (x1 == x5)
    %Solve for x2 and z2
    x2 = x1;
    z2 = z1 - l1;
    te1 = atan((x1-x2)/(z1-z2));
    te5 = -te1;
    %solve for x4 and z4
    x4 = x5;
    z4 = z5 + l4;
    %solve for x3, y3, z3
    x3 = x2;
    %Solve for y3 and z3

     myfun = @(x)[(x(1)-y4)^2 + (x(2)-z4)^2 - l3^2 ,
                (y2-x(1))^2 + (z2-x(2))^2 - l2^2];
     sol = fsolve(myfun,[z2,0],options);
     y3 = sol(1);
     z3 = sol(2);
 else
    %Solve for x2 and z2
    myfun1 = @(x) [(x1 - x(1))^2 + (z1 - x(2))^2 - l1^2 ,
                    z1 - x(2) + slope*x(1) - slope*x1 ];
    sol = fsolve(myfun1,[x5,z1],options);
    x2 = sol(1);
    z2 = sol(2);
    
    myfun2 = @(x)[ ( x(1) - x5)^2 + (x(2) - z5)^2 - l4^2 ,
                     x(2) - z5  - slope *x(1) + slope*x5 ];
    sol = fsolve(myfun2,[0 ,z2],options);
    x4 = sol(1);
    z4 = sol(2);
    
    te1 = - atan((x1-x2)/(z1-z2));
    te5 = -te1;
    
    myfun3 = @(x)[ (x(1) - x4)^2 + (x(2) - y4)^2 + (x(3) - z4)^2 - l3^2 , 
                   (x2 - x(1))^2 + (y2 - x(2))^2 + (z2 - x(3))^2 - l2^2 ,
                    x(3) - z4 - slope*x(1) + slope* x4 ];

    sol = fsolve(myfun3,[0,z1,0],options);
    x3 = sol(1);
    y3 = sol(2);
    z3 = sol(3);
   
 end
 if(leg == 'r')
    fprintf(" xr1 = %f; yr1 = %f; zr1 = %f;  xr2 = %f; yr2 = %f; zr2 = %f;\n", x1,y1,z1,x2,y2,z2);
    fprintf(" xr3 = %f; yr3 = %f; zr3 = %f;  xr4 = %f; yr4 = %f; zr4 = %f;\n", x3,y3,z3,x4,y4,z4);
    fprintf(" xr5 = %f; yr5 = %f; zr5 = %f;  xrf = %f; yrf = %f; zrf = %f;\n", x5,y5,z5,xf,yf,zf);
 else
    fprintf(" xl1 = %f; yl1 = %f; zl1 = %f;  xl2 = %f; yl2 = %f; zl2 = %f;\n", x1,y1,z1,x2,y2,z2);
    fprintf(" xl3 = %f; yl3 = %f; zl3 = %f;  xl4 = %f; yl4 = %f; zl4 = %f;\n", x3,y3,z3,x4,y4,z4);
    fprintf(" xl5 = %f; yl5 = %f; zl5 = %f;  xlf = %f; ylf = %f; zlf = %f;\n", x5,y5,z5,xf,yf,zf);
 end
    te2 = abs(atan((y3-y2)/(z2-z3)));
    te4 = abs(atan2((y3-y4),(z3-z4)));
    te3 = -(abs(te2)+abs(te4));

    te1 = te1*180/pi;
    te2 = te2*180/pi;
    te3 = te3*180/pi;
    te4 = te4*180/pi;
    te5 = te5*180/pi;
end