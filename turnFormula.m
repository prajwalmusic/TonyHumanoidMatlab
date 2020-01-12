XB = [5,10,15,20,25];
YB = [43,43,43,43,43];
t = [0.5 0.5 0.5 0.5 0.5];
lx =120;
ly = 77;
for i =1:5
    omega(i) = (-12 * YB(i) * (XB(i)/t(i)))/((12 * (XB(i)^2 + YB(i)^2))+ lx^2 + ly^2);
    theta(i) = omega(i) * t(i) * 180 /pi ;
end
disp(theta)
plot(XB, theta);