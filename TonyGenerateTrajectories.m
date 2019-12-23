
T = 1; %Time Period
K = 32.5; %Half Pelvis Distance
L = 60; % Length of the step
H = 20; %Foot Height
Zo = 210;
t=0;
fileID = fopen('angles_generated.txt','w');
while (t<=T)
    Const1 = (L * sech(sqrt(K) * T /2))/4;
    Const2 = (- L * sech(sqrt(K)* T /2))/4;
    if t<=0.5
       xr1 =(K*(sin(2*pi*t/T)+1));
       yr1 =(Const1*exp(sqrt(K)*t))+(Const2*exp(-1*sqrt(K)*t));
       zr1 =Zo ;
       xrf =K ;
       yrf =0 + L/4 ;
       zrf =0 ;
       [te1,te2,te3,te4,te5]=TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
       xl1 =(K*(sin(2*pi*t/T)-1));
       yl1 =((Const1*exp(sqrt(K)*t))+(Const2*exp(-1*sqrt(K)*t)));
       zl1 =Zo ;
       xlf = - K ;
       ylf =((L/2)*(sin((2*pi*(t+T/2)/T)+pi/2))) +  L/4;
       zlf =(H *( 1 + (sin( 4 * pi *( t+(T/2)/T ) - pi/2)))/2);
      [te6,te7,te8,te9,te10]=TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
      thetas = [te1 te2 te3 te4 te5 te6 te7 te8 te9 te10];
   else
      xr1 =(K*(sin(2*pi*t/T)+1));
      yr1 =Const1*exp(sqrt(K)*(t-T/2))+Const2*exp(-1*sqrt(K)*(t-T/2))+L/2;
      zr1 = Zo;
      xrf = K;
      yrf =((L/2)*sin(2*pi*t/T + pi/2))+ (3*L/4);
      zrf =(H)*(1+sin(4*pi*t/T - pi/2))/2;
      [te1,te2,te3,te4,te5]=TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
      xl1 =(K*(sin(2*pi*t/T)-1));
      yl1 =Const1*exp(sqrt(K)*(t-T/2))+Const2*exp(-1*sqrt(K)*(t-T/2))+L/2;
      zl1 = Zo;
      xlf = - K;
      ylf = 3*L/4;
      zlf = 0;
       fprintf(" %f\t,%f\t,%f\t, %f\t,%f\t,%f\n ",xr1,yr1,zr1,xl1,yl1,zl1);
      fprintf(" %f\t,%f\t,%f\t, %f\t,%f\t,%f\n ",xrf,yrf,zrf,xlf,ylf,zlf);
      [te6,te7,te8,te9,te10]=TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
      thetas = [te1 te2 te3 te4 te5 te6 te7 te8 te9 te10];
    end
    fprintf(fileID,'%d\t',round(thetas));
    fprintf(fileID,'\n');
    t=t+0.05;

%      plot3(xr1,yr1,zr1,xlf,ylf,zlf,'-ob')
%       hold on
%       plot3(xl1,yl1,zl1,xrf,yrf,zrf,'-xk')
%       hold on
end
fclose(fileID);

% plot3(xr1q,yr1q,zr1q,xrfq,yrfq,zrfq,'-ob')
% hold on
% plot3(xl1q,yl1q,zl1q,xlfq,ylfq,zlfq,'-xk')