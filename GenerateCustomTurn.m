lx = 12;
ly = 8;
Px = 4.5;
Py = 8.5/2;
tant = (- 3 * Px * Py)/(lx^2+ly^2+(3*Py^2));
t = atand(tant);

t = 0:0.05:0.5;
T=1;
L=60;
val = (L/2)*sin((2*pi*(t+T/2)/T)+(pi/2))+L/4;
plot(t,val);
