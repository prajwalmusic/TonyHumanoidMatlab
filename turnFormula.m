Py = 1:25;
Px = 47;
lx = 120;
ly = 77;
for i = 1:25
tant(i) = (3*Px*Py(i))/(lx^2+ly^2+(3*(Py(i)^2)));
theta(i) = atanh(tant(i));
end
t = 1:25;
theta = theta .* (180/pi);
plot(theta,t);