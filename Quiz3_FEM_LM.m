clc

syms x 

Ax = 2 + x;
phi_0 = 2 + 5*x;
phi_1 = x - x^2;
phi_2 = x^2 - x^3;
phi_3 = x^3 - x^4;

phi_0d = diff(phi_0);
phi_1d = diff(phi_1);
phi_2d = diff(phi_2);
phi_3d = diff(phi_3);

K = [int(phi_1d*phi_1d*Ax,0,1),int(phi_1d*phi_2d*Ax,0,1),int(phi_1d*phi_3d*Ax,0,1);...
int(phi_1d*phi_2d*Ax,0,1),int(phi_2d*phi_2d*Ax,0,1),int(phi_2d*phi_3d*Ax,0,1);...
int(phi_1d*phi_3d*Ax,0,1),int(phi_3d*phi_2d*Ax,0,1),int(phi_3d*phi_3d*Ax,0,1)];
C_all = K\[5/6;5/12;1/4]



syms c1 c2 c3

I = int((1/2)*(phi_0d+c1*phi_1d+c2*phi_2d+c3*phi_3d)^2*Ax,0,1);
Idc1 = diff(I,c1);
Idc2 = diff(I,c2);
Idc3 = diff(I,c3);

solution = solve([Idc1,Idc2,Idc3],[c1,c2,c3]);
c1k = solution.c1
c2k = solution.c2
c3k = solution.c3