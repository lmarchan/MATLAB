f = [0;0;0;-1];
A = [];
b = [];
Aeq = [1 2 3 0;-2 -1 -5 0; 1 2 1 1];
beq = [15;-20;10];
lb = [0;0;0;0];
ub = [inf;inf;inf;inf];

[x,F] = linprog(f,A,b,Aeq,beq,lb,ub)
F=-F


