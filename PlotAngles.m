T = importdata('angles_generated.txt'); 
t=0:1:19;
t1 = T(:,1);
t2 = T(:,2);
t3 = T(:,3);
t4 = T(:,4);
t5 = T(:,5);
t6 = T(:,6);
t7 = T(:,7);
t8 = T(:,8);
t9 = T(:,9);
t10 = T(:,10);

subplot(1,2,1);
plot(t,t1,'-o');
hold on;
plot(t,t2,'-x');
hold on;
plot(t,t3,'-kx');
hold on;
plot(t,t4,'-rx');
hold on;
plot(t,t5,'-ko');
hold on;
subplot(1,2,2);
plot(t,t6,'-o');
hold on;
plot(t,t7,'-x');
hold on;
plot(t,t8,'-kx');
hold on;
plot(t,t9,'-rx');
hold on;
plot(t,t10,'-ko');
hold on;