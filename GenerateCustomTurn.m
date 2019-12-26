T = 3; %Time Period of entire cycle
T1 = 1;
T2 = 1;
K = 32.5; %Half Pelvis Distance
L = 70; % Length of the step
L2 = 50;
Py = 10; %Slip Length in Y axis
Px = 50;
lx = 120; %length of the foot
ly = 77; %breadth of the foot
H = 20; %Step Height
Zo = 210; %COM
t=0;
InterStepSize = 5;
N = Py/InterStepSize;
fileID = fopen('Smooth_Turn.txt','w');
while (t<=T)
    %Walk forward 50mm   Slip right 10mm
    if(t<T1)
        Const1 = (L * sech(sqrt(K) * T1 /2))/4;
        Const2 = (- L * sech(sqrt(K)* T1 /2))/4;
        if (t<=T1/2)
         xr1 =(K*(sin(2*pi*t/T1)+1));
         yr1 =(Const1*exp(sqrt(K)*t))+(Const2*exp(-1*sqrt(K)*t))+L/4;
         zr1 =Zo ;
         xrf =K ;
         yrf =0 + L/4 ;
         zrf =0 ;
         [te1,te2,te3,te4,te5]=TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
         xl1 =(K*(sin(2*pi*t/T1)-1));
         yl1 =((Const1*exp(sqrt(K)*t))+(Const2*exp(-1*sqrt(K)*t)))+L/4;
         zl1 =Zo ;
         xlf = - K ;
         ylf =((L/2)*(sin((2*pi*(t+T1/2)/T1)+pi/2))) +  L/4;
         zlf =(H *( 1 + (sin( 4 * pi *( t+(T1/2)/T1 ) - pi/2)))/2);
         [te6,te7,te8,te9,te10]=TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
         t = t+0.05;
        else
            if (t == 0.55)
                xr1 = K;
                yr1 = L/2;
                zr1 = Zo;
                xrf = K;
                yrf = L/4;
                zrf = 0;
                [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
                xl1 = -K;
                yl1 = L/2;
                zl1 = Zo;
                xlf = -K;
                ylf = 3*L/4;
                zlf = 0;
                [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
                t=0.6;
            else 
                xrf = K;
                yrf = L/4-(Py);
                zrf = 0;
                [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
                xlf = -K;
                ylf = 3*L/4 + Py;
                zlf = 0;
                [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
                t=1.5;
            end
        end  
    end
    % Walk forward 30mm and slip right 10mm
    if (t >= T1) && (t < (T2+T1))
       t2 = t-1;
      if( t2 >= T2/2)
        Const1 = (L2 * sech(sqrt(K) * T2 /2))/4;
        Const2 = (- L2 * sech(sqrt(K)* T2 /2))/4;
        xr1 =(K*(sin(2*pi*t2/T2)+1));
        yr1 =Const1*exp(sqrt(K)*(t2-T2/2))+Const2*exp(-1*sqrt(K)*(t2-T2/2))+ L/2;
        zr1 = Zo;
        xrf = K;
        yrf =((L2/2)*sin(2*pi*t2/T2 + pi/2))+ (L/4 + Py +L2/2);
        zrf =(H)*(1+sin(4*pi*t2/T2 - pi/2))/2;
        [te1,te2,te3,te4,te5]=TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
        xl1 =(K*(sin(2*pi*t2/T2)-1));
        yl1 =Const1*exp(sqrt(K)*(t2-T2/2))+Const2*exp(-1*sqrt(K)*(t2-T2/2))+ L/2;
        zl1 = Zo;
        xlf = - K;
        ylf = 3*L/4 - Py;
        zlf = 0;
        [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
        t =t +0.05;
      end
    end
    if( (t >=(T1+T2)) && (t < T))
           if (t < 2.5)
                xr1 = K;
                %yr1 = (L + L2)/2;
                zr1 = Zo;
                xrf = K;
                %yrf = L/4 + Py + L2;
                zrf = 0;
                [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
                xl1 = -K;
                %yl1 = (L + L2)/2;
                zl1 = Zo;
                xlf = -K;
                ylf = 3*L/4 - Py;
                zlf = 0;
                [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
                t = 2.6;
             else 
                xr1 = K;
                %yr1 = (L + L2)/2;
                zr1 = Zo;
                xrf = K;
                yrf = L/4 + Py + L2 + Py;
                zrf = 0;
                [te1,te2,te3,te4,te5] = TonyIK(xrf,yrf,zrf,xr1,yr1,zr1);
                xl1 = -K;
                %yl1 = (L + L2)/2;
                zl1 = Zo;
                xlf = -K;
                ylf = 3*L/4 ;
                zlf = 0;
                [te6,te7,te8,te9,te10] = TonyIK(xlf,ylf,zlf,xl1,yl1,zl1);
                t=3.05;
          end 
    end
   fprintf(" %f\t,%f\t,%f\t, %f\t,%f\t,%f\n ",xr1,yr1,zr1,xl1,yl1,zl1);
   fprintf(" %f\t,%f\t,%f\t, %f\t,%f\t,%f\n ",xrf,yrf,zrf,xlf,ylf,zlf);
   thetas = [te1 te2 te3 te4 te5 te6 te7 te8 te9 te10];
   fprintf(fileID,'%d\t',round(thetas));
   fprintf(fileID,'\n');
 end
  
fclose(fileID);

