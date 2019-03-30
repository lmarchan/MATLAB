% 
% clc
% 
% clear
% 
% syms h u1 u2 x
% x1 = 0;
% x2 = h;
% Ax = 2 + 3*x^2;
% Cx = 0;
% Fx = x^2 + 2*x;
% Tri1 = (x2-x)/h;
% Tri2 = (x-x1)/h;
% 
% Tri1d = diff(Tri1,x);
% Tri2d = diff(Tri2,x);
% K = [int(Ax*Tri1d*Tri1d+Cx*Tri1*Tri1,x1,x2),int(Ax*Tri1d*Tri2d+Cx*Tri1*Tri2,x1,x2);...
%     int(Ax*Tri1d*Tri2d+Cx*Tri1*Tri2,x1,x2),int(Ax*Tri2d*Tri2d+Cx*Tri2*Tri2,x1,x2)]
% Fall = [int(Fx*Tri1,x1,x2);int(Fx*Tri2,x1,x2)]
% 
% x3 = h;
% x4 = 2*h;
% 
% Tri3 = (x4-x)/h;
% Tri4 = (x-x3)/h;
% 
% Tri3d = diff(Tri3,x);
% Tri4d = diff(Tri4,x);
% K2 = [int(Ax*Tri3d*Tri3d+Cx*Tri3*Tri3,x3,x4),int(Ax*Tri3d*Tri4d+Cx*Tri3*Tri4,x3,x4);...
%     int(Ax*Tri3d*Tri4d+Cx*Tri3*Tri4,x3,x4),int(Ax*Tri4d*Tri4d+Cx*Tri4*Tri4,x3,x4)]
% Fall2 = [int(Fx*Tri3,x3,x4);int(Fx*Tri4,x3,x4)]

clc

clear

syms u1 u2 u3 Q4 x 
h1 = 0.75;
h2 = 1;
h3 = 0.5;
x1 = 0;
x2 = .75;
x3 = 0;
x4 = 1;
x5 = 0;
x6 = .5;
A1 = 200000000000*.0025/0.75;
A2 = 70000000000*.005/1;
A3 = (((.0018-.005)/.5)*x+.005)*200000000000*2;
Cx = 0;
Fx = 0;
Tri1 = (x2-x)/h1;
Tri2 = (x-x1)/h1;

Tri1d = diff(Tri1,x);
Tri2d = diff(Tri2,x);
K = [double(int(A1*Tri1d*Tri1d+Cx*Tri1*Tri1,x1,x2)),double(int(A1*Tri1d*Tri2d+Cx*Tri1*Tri2,x1,x2));...
    double(int(A1*Tri1d*Tri2d+Cx*Tri1*Tri2,x1,x2)),double(int(A1*Tri2d*Tri2d+Cx*Tri2*Tri2,x1,x2))];
Fall = [int(Fx*Tri1,x1,x2);int(Fx*Tri2,x1,x2)];

Tri3 = (x4-x)/h2;
Tri4 = (x-x3)/h2;
Tri3d = diff(Tri3,x);
Tri4d = diff(Tri4,x);
K2 = [double(int(A2*Tri3d*Tri3d+Cx*Tri3*Tri3,x3,x4)),double(int(A2*Tri3d*Tri4d+Cx*Tri3*Tri4,x3,x4));...
    double(int(A2*Tri3d*Tri4d+Cx*Tri3*Tri4,x3,x4)),double(int(A2*Tri4d*Tri4d+Cx*Tri4*Tri4,x3,x4))];
Fall2 = [int(Fx*Tri3,x3,x4);int(Fx*Tri4,x3,x4)];

Tri5 = (x6-x)/h3;
Tri6 = (x-x5)/h3;
Tri5d = diff(Tri5,x);
Tri6d = diff(Tri6,x);
K3 = [double(int(A3*Tri5d*Tri5d+Cx*Tri5*Tri5,x5,x6)),double(int(A3*Tri5d*Tri6d+Cx*Tri5*Tri6,x5,x6));...
    double(int(A3*Tri5d*Tri6d+Cx*Tri5*Tri6,x5,x6)),double(int(A3*Tri6d*Tri6d+Cx*Tri6*Tri6,x5,x6))];
Fall3 = [int(Fx*Tri5,x5,x6);int(Fx*Tri6,x5,x6)];
Kall = [K(1,1),K(1,2),0,0;K(2,1),K(2,2)+K2(1,1),K2(1,2),0;0,K2(2,1),K2(2,2)+K3(1,1),K3(1,2);0,0,K3(2,1),K3(2,2)];
ks = 1000000000;
P = 10000000;

Kallf = [K(1,1)+1000000000,K(1,2),0,0;K(2,1),K(2,2)+K2(1,1),K2(1,2),0;0,K2(2,1),K2(2,2)+K3(1,1),K3(1,2);0,0,K3(2,1),K3(2,2)];

u = solve(Kallf*[u1;u2;u3;0] == [0;P;0;Q4]);
u1 = double(u.u1);
u2 = double(u.u2);
u3 = double(u.u3);
Q4 = double(u.Q4);