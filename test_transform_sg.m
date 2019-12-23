p0=[0;0;0;1];
p01=tf00(0);
p02=p01*tf01(0);
[l1,l2,l3,l4,l5] = TonyIK(25,0,0,25,0,210);
[r1,r2,r3,r4,r5] = TonyIK(-25,0,0,-25,0,210);
for i = 1:5
%%% Choose Angles %%%
if  i==1
    %0 9 47 38 0 0 27 55 27 0 %
    right_angle_1 = r1 ;
    right_angle_2 = r2;
    right_angle_3 = r3;
    right_angle_4 = r4;
    right_angle_5= r5;
    left_angle_1= l1;
    left_angle_2= l2;
    left_angle_3= l3;
    left_angle_4= l4;
    left_angle_5= l5;
    xlab = 't=0';
end
if i==6
         %9 37 83 45 -9 9 22 51 29 -9 %
    right_angle_1 = 9 ;
    right_angle_2 = 37;
    right_angle_3 = -83;
    right_angle_4 = 45;
    right_angle_5= -9;
    left_angle_1= 9;
    left_angle_2= 22;
    left_angle_3= -51;
    left_angle_4= 29;
    left_angle_5= -9;
    xlab= 't=T/4';
end
if i==7
   % 0 27 55 27 0 0 9 47 38 0 %
    right_angle_1 = 0 ;
    right_angle_2 = 27;
    right_angle_3 = -55;
    right_angle_4 = 27;
    right_angle_5= 0;
    left_angle_1= 0;
    left_angle_2= 9;
    left_angle_3= -47;
    left_angle_4= 38;
    left_angle_5= 0;
    xlab= 't=T/2';
end

if i==8
   % -9 22 52 29 9 -9 37 83 45 9 %
    right_angle_1 = -9 ;
    right_angle_2 = 22;
    right_angle_3 = -52;
    right_angle_4 = 29;
    right_angle_5= 9;
    left_angle_1= -9;
    left_angle_2= 37;
    left_angle_3= -83;
    left_angle_4= 45;
    left_angle_5= 9;
    xlab= 't=3T/4';
end
if i==10
   %0 9 47 38 0 0 27 55 27 0 %
    right_angle_1 = 0 ;
    right_angle_2 = 9;
    right_angle_3 = -47;
    right_angle_4 = 38;
    right_angle_5= 0;
    left_angle_1= 0;
    left_angle_2= 27;
    left_angle_3= -55;
    left_angle_4= 27;
    left_angle_5= 0;
    xlab= 't=T';
end


%%% Main Solve  %%%
pr1=p02*tf1(right_angle_1 * pi/180 );
pr2=pr1*tf2(right_angle_2 *pi/180 );
pr3=pr2*tf3(right_angle_3*pi/180);
pr4=pr3*tf4(right_angle_4 *pi/180);
req1=[pr4(1,4) pr4(2,4) pr4(3,4)];
pr5=pr4*tf5(right_angle_5 *pi/180)

pl01=tf00(0);
pl02=pl01*tf02(0 *pi/180);
pl1=pl02*tf6(left_angle_1 *pi/180);
pl2=pl1*tf7(left_angle_2*pi/180);
pl3=pl2*tf8(left_angle_3*pi/180);
pl4=pl3*tf9(left_angle_4*pi/180);
req2=[pl4(1,4) pl4(2,4) pl4(3,4)];
pl5=pl4*tf10(left_angle_5*pi/180)

X_r=round([p0(1),p01(1,4),p02(1,4),pr1(1,4),pr2(1,4),pr3(1,4),pr4(1,4),pr5(1,4)],2);
Y_r=round([p0(2),p01(2,4),p02(2,4),pr1(2,4),pr2(2,4),pr3(2,4),pr4(2,4),pr5(2,4)],2);
Z_r=round([p0(3),p01(3,4),p02(3,4),pr1(3,4),pr2(3,4),pr3(3,4),pr4(3,4),pr5(3,4)],2);

X_l=round([p0(1),pl01(1,4),pl02(1,4),pl1(1,4),pl2(1,4),pl3(1,4),pl4(1,4),pl5(1,4)],2);
Y_l=round([p0(2),pl01(2,4),pl02(2,4),pl1(2,4),pl2(2,4),pl3(2,4),pl4(2,4),pl5(2,4)],2);
Z_l=round([p0(3),pl01(3,4),pl02(3,4),pl1(3,4),pl2(3,4),pl3(3,4),pl4(3,4),pl5(3,4)],2);

%%% PLOT %%%
subplot(2,5,i);
plot(X_r,Z_r,'-bo','LineWidth',3);
hold on
ax=gca;
ax.XDir = 'reverse';
xlim([-8 8])
ylim([-30 1])
xlabel(xlab)
grid on
set(gca,'xtick',[])
set(gca,'ytick',[])
ylabel('z axis')

foot_x_r = [X_r(8)+1.5 X_r(8)-1.5]
foot_y_r = [Y_r(8)+1.5 Y_r(8)-1.5]
foot_z_r = [Z_r(8) Z_r(8)]
plot(foot_x_r,foot_z_r,'b','LineWidth',3)

hold on

plot(X_l,Z_l,'--ko','LineWidth',3);
hold on
foot_x_l = [X_l(8)+1.5 X_l(8)-1.5]
foot_y_l = [Y_l(8)+1.5 Y_l(8)-1.5]
foot_z_l = [Z_l(8) Z_l(8)]
plot(foot_x_l,foot_z_l,'k','LineWidth',3)


subplot(2,5,i+5);
plot(Y_r,Z_r,'-bo','LineWidth',3);
hold on
ax=gca;
%ax.XDir = 'reverse';
xlim([-8 8])
ylim([-30 1])
xlabel(xlab)
grid on
set(gca,'xtick',[])
set(gca,'ytick',[])
ylabel('z axis')
plot(foot_y_r,foot_z_r,'b','LineWidth',3);
hold on
plot(Y_l,Z_l,'--ko','LineWidth',3);
hold on
plot(foot_y_l,foot_z_l,'k','LineWidth',3);
grid on
%%%% PLot complete %%%
end
