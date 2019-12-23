T = importdata('angles_generated.txt'); 
for i=1:20
    p0=[0;0;210;1];
    p01=tf00(0);
    p02=p01*tf01(0);
    pr1=p02*tf1( T(i,1) * pi/180 );
    pr2=pr1*tf2(T(i,2) *pi/180 );
    pr3=pr2*tf3(T(i,3)*pi/180);
    pr4=pr3*tf4(T(i,4)*pi/180);
    req1=[pr4(1,4) pr4(2,4) pr4(3,4)].*10;
    pr5=pr4*tf5(T(i,5) *pi/180);

    pl01=tf00(0);
    pl02=pl01*tf02( 0*pi/180);
    pl1=pl02*tf6(T(i,6) *pi/180);
    pl2=pl1*tf7(T(i,7)*pi/180);
    pl3=pl2*tf8(T(i,8)*pi/180);
    pl4=pl3*tf9(T(i,9)*pi/180);
    req2=[pl4(1,4) pl4(2,4) pl4(3,4)].*10;
    pl5=pl4*tf10(T(i,10)*pi/180);
    
    X_r=round([p0(1),p01(1,4),p02(1,4),pr1(1,4),pr2(1,4),pr3(1,4),pr4(1,4),pr5(1,4)],2);
    Y_r=round([p0(2),p01(2,4),p02(2,4),pr1(2,4),pr2(2,4),pr3(2,4),pr4(2,4),pr5(2,4)],2);
    Z_r=round([p0(3),p01(3,4),p02(3,4),pr1(3,4),pr2(3,4),pr3(3,4),pr4(3,4),pr5(3,4)],2);
    
   % duuu= [X_r(8) Y_r(8) Z_r(8) X_l(8) Y_l(8) Z_l(8)];
   % disp(duuu);
plot(Y_r,Z_r,'-bo','LineWidth',3);
hold on
xlim([-70 40])
ylim([-300 10])
xlabel('t=0')
set(gca,'xtick',[])
set(gca,'ytick',[])
ylabel('z axis')
foot_x = [Y_r(8)+0.5 Y_r(8)-0.5];
foot_z = [Z_r(8) Z_r(8)];
plot(foot_x,foot_z,'b','LineWidth',3)
hold on
X_l=round([p0(1),pl01(1,4),pl02(1,4),pl1(1,4),pl2(1,4),pl3(1,4),pl4(1,4),pl5(1,4)],2);
Y_l=round([p0(2),pl01(2,4),pl02(2,4),pl1(2,4),pl2(2,4),pl3(2,4),pl4(2,4),pl5(2,4)],2);
Z_l=round([p0(3),pl01(3,4),pl02(3,4),pl1(3,4),pl2(3,4),pl3(3,4),pl4(3,4),pl5(3,4)],2);


plot(Y_l,Z_l,'--ko','LineWidth',3);
hold on
foot_x = [Y_l(8)+0.5 Y_l(8)-0.5];
foot_z = [Z_l(8) Z_l(8)];
plot(foot_x,foot_z,'k','LineWidth',3)

currkey=0;
    % do not move on until enter key is pressed
while currkey~=1
    pause; % wait for a keypress
    currkey=get(gcf,'CurrentKey'); 
    if currkey=='return'
          currkey=1;
    else
         currkey=0;
      
    end
end

    
end

