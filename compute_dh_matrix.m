function  [A]  = compute_dh_matrix(r, alpha, d, theta)
A = eye(4);
% ROTATION FOR X
A(1,1) = cos((theta));
A(2,1) = sin((theta));
% ROTATION FOR Y 
A(1,2) = -(sin(theta))*(cos(alpha))*(1);
A(2,2) = (cos(theta))*(cos(alpha));
A(3,2) = (sin(alpha));
% ROTATION FOR Z
A(1,3) = (sin(theta))*(sin(alpha));
A(2,3) = -(cos(theta))*(sin(alpha))*(1);
A(3,3) = (cos(alpha));
% TRANSLATION VECTOR
A(1,4) = r*(cos(theta));
A(2,4) = r*(sin(theta));
A(3,4) = d;
end