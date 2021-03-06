clc
clear

syms x A E I

a = 90;
b = 45;
h1 = 3;
h2 = 4;
h3 = 4/sin(45);
x1 = 0;
x2 = 3;
x3 = 0;
x4 = 4;
x5 = 0;
x6 = 4/sin(45);
f_1 = 20000;
f_2 = 25000;
Tri1 = (x2-x)/h1;
Tri2 = (x-x1)/h1;
Tri1d = diff(Tri1,x);
Tri2d = diff(Tri2,x);
T2 = [cos(a) sin(a) 0 0 0 0;-sin(a) cos(a) 0 0 0 0;0 0 1 0 0 0;0 0 0 cos(a) sin(a) 0;0 0 0 -sin(a) cos(a) 0;0 0 0 0 0 1];
T3 = [cos(b) sin(b) 0 0 0 0;-sin(b) cos(b) 0 0 0 0;0 0 1 0 0 0;0 0 0 cos(b) sin(b) 0;0 0 0 -sin(b) cos(b) 0;0 0 0 0 0 1];
K_1 = [E*A*int(Tri1d*Tri1d,x1,x2) 0 0 E*A*int(Tri1d*Tri2d,x1,x2) 0 0;...
    0 12*E*I/(h1)^3 -6*E*I/(h1)^2 0 -12*E*I/(h1)^3 -6*E*I/(h1)^2;...
    0 -6*E*I/(h1)^2 4*E*I/(h1) 0 6*E*I/(h1)^2 2*E*I/(h1);...
    E*A*int(Tri1d*Tri2d,x1,x2) 0 0 E*A*int(Tri2d*Tri2d,x1,x2) 0 0;...
    0 -12*E*I/(h1)^3 6*E*I/(h1)^2 0 12*E*I/(h1)^3 6*E*I/(h1)^2;...
    0 -6*E*I/(h1)^2 2*E*I/(h1) 0 6*E*I/(h1)^2 4*E*I/(h1)];
K_2 = [E*A*int(Tri1d*Tri1d,x3,x4) 0 0 E*A*int(Tri1d*Tri2d,x3,x4) 0 0;...
    0 12*E*I/(h2)^3 -6*E*I/(h2)^2 0 -12*E*I/(h2)^3 -6*E*I/(h2)^2;...
    0 -6*E*I/(h2)^2 4*E*I/(h2) 0 6*E*I/(h2)^2 2*E*I/(h2);...
    E*A*int(Tri1d*Tri2d,x3,x4) 0 0 E*A*int(Tri2d*Tri2d,x3,x4) 0 0;...
    0 -12*E*I/(h2)^3 6*E*I/(h2)^2 0 12*E*I/(h2)^3 6*E*I/(h2)^2;...
    0 -6*E*I/(h2)^2 2*E*I/(h2) 0 6*E*I/(h2)^2 4*E*I/(h2)];
K_3 = [E*A*int(Tri1d*Tri1d,x5,x6) 0 0 E*A*int(Tri1d*Tri2d,x5,x6) 0 0;...
    0 12*E*I/(h3)^3 -6*E*I/(h3)^2 0 -12*E*I/(h3)^3 -6*E*I/(h3)^2;...
    0 -6*E*I/(h3)^2 4*E*I/(h3) 0 6*E*I/(h3)^2 2*E*I/(h3);...
    E*A*int(Tri1d*Tri2d,x5,x6) 0 0 E*A*int(Tri2d*Tri2d,x5,x6) 0 0;...
    0 -12*E*I/(h3)^3 6*E*I/(h3)^2 0 12*E*I/(h3)^3 6*E*I/(h3)^2;...
    0 -6*E*I/(h3)^2 2*E*I/(h3) 0 6*E*I/(h3)^2 4*E*I/(h3)];
K_2_t = K_2*T2;
K_3_t = K_3*T3;
K_global = [K_1(1,:) 0 0 0 0 0 0;...
    K_1(2,:) 0 0 0 0 0 0;...
    K_1(3,:) 0 0 0 0 0 0;...
    K_1(4,1) K_1(4,2) K_1(4,3) K_1(4,4)+K_2_t(1,1)+K_3_t(1,1) K_1(4,5)+K_2_t(1,2)+K_3_t(1,2) K_1(4,6)+K_2_t(1,3)+K_3_t(1,3) K_2_t(1,4) K_2_t(1,5) K_2_t(1,6) K_3_t(1,4) K_3_t(1,5) K_3_t(1,6);...
    K_1(5,1) K_1(5,2) K_1(5,3) K_1(5,4)+K_2_t(2,1)+K_3_t(2,1) K_1(5,5)+K_2_t(2,2)+K_3_t(2,2) K_1(5,6)+K_2_t(2,3)+K_3_t(2,3) K_2_t(2,4) K_2_t(2,5) K_2_t(2,6) K_3_t(2,4) K_3_t(2,5) K_3_t(2,6);...
    K_1(6,1) K_1(6,2) K_1(6,3) K_1(6,4)+K_2_t(3,1)+K_3_t(3,1) K_1(6,5)+K_2_t(3,2)+K_3_t(3,2) K_1(6,6)+K_2_t(3,3)+K_3_t(3,3) K_2_t(3,4) K_2_t(3,5) K_2_t(3,6) K_3_t(3,4) K_3_t(3,5) K_3_t(3,6);...
    0 0 0 K_2_t(4,:) 0 0 0;...
    0 0 0 K_2_t(5,:) 0 0 0;...
    0 0 0 K_2_t(6,:) 0 0 0;...
    0 0 0 K_3_t(4,1) K_3_t(4,2) K_3_t(4,3) 0 0 0 K_3_t(4,4) K_3_t(4,5) K_3_t(4,6);...
    0 0 0 K_3_t(5,1) K_3_t(5,2) K_3_t(5,3) 0 0 0 K_3_t(5,4) K_3_t(5,5) K_3_t(5,6);...
    0 0 0 K_3_t(6,1) K_3_t(6,2) K_3_t(6,3) 0 0 0 K_3_t(6,4) K_3_t(6,5) K_3_t(6,6)];
F1 = [f_1*cos(45)*(x2-2)/h1 f_1*cos(45)*(1-3*(2/3)^2+2*(2/3)^3) f_1*cos(45)*(-2*(1-(2/3))^2) f_1*cos(45)*(2)/h1 f_1*cos(45)*(3*(2/3)^2-2*(2/3)^3) f_1*cos(45)*(-2*((2/3)^2-(2/3)))];
F3 = [-f_2*cos(45)/2 -f_2*cos(45)*(1-3*(1/2)^2+2*(1/2)^3)+500*4/sin(45) -f_2*cos(45)*(-2*(1-(1/2))^2) -f_2*cos(45)/(2) -f_2*cos(45)*(3*(1/2)^2-2*(1/2)^3) -f_2*cos(45)*(-2*((1/2)^2-(1/2)))];
F3t = F3*T3;
Ft = F1+F3t



    