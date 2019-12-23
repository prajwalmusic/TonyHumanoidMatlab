function [R] = calc_rpy(roll,pitch,yaw)
    R11 = cos(pitch)*cos(yaw)- sin(pitch)*sin(roll)*sin(yaw);
    R12 = - sin(pitch)*cos(roll);
    R13 = cos(pitch)*sin(yaw)+ sin(pitch)*sin(roll)*cos(yaw);
    R21 = sin(pitch)*cos(yaw)+ cos(pitch)*sin(roll)*sin(yaw);
    R22 = cos(pitch)*cos(roll);
    R23 = sin(pitch)*sin(yaw)- cos(pitch)*sin(roll)*cos(yaw);
    R31 = -cos(roll)*sin(yaw);
    R33 = cos(roll)*cos(yaw);
    R32 = sin(roll);
    R = [ R11 R12 R13;
         R21 R22 R23;
         R31 R32 R33];  
end