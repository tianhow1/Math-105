clc
clear
f = @(x) [(x(2)-x(1))^4+12*x(1)*x(2)-x(1)+x(2)-3];
x1=[0.55;0.7];
x2=[-0.9;-0.5];
[x,v,N]=NM(f,x1,0.00000001),
[y,w,M]=NM(f,x2,0.00000001),
%if we change NM method lambda to 1, which still satisfied the boundary condition
% for initial points of x2, then the minimum will be the same as the
% minimum start at x1.

