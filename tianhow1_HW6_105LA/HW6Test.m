
% Q1
% (a)x1=1;x2=2;x3=-1
% (b)lambda1=2;lambda2=2+sqrt(5)*i,lamda3=2-sqrt(5)*i
% v1=[1,-1,-1];v2=[2-sqrt(5)*i, -2-2*sqrt(5)*i,3];v3=[2+sqrt(5)*i, -2+2*sqrt(5)*i,3]
% (c)Gauss T has the spectral radius is 0.5(the largest eigenvalue), which less than 1. So it
% converges. Jacobi has spectral radius sqrt(5)/2

% Q2
% (a)x1=1;x2=2;x3=-1
% (b)lambda1=lambda2=lamda3=1
% v1=[1,-1,-1]
% % (c)Jacobian has spectral radius 0, Gauss spectral radius is 2.
% A=[1 2 -2; 1 1 1; 2 2 1];
% L=[0,0,0;-1 0 0;-2 -2 0];
% U=[0,-2,2;0 0 -1;0 0 0];
% D=[1 0 0;0 1 0; 0 0 1];
% T=D^(-1)*(L+U),
% [m,n]=eig(T)
% Q3 Gauss Seidel for question 1 has spectral radius less than 1, so it is
% converges. Thus we can find the answer



clc
clear

A=[5,-1;5,3];
b=[4;0];
x0=[1;1];
tol=0.000001;
N0=1;

% 
% choice: J for Jacobian Method, GS for Gauss Seidel Method
% %Q3 Gauss Seidel for question 1 has spectral radius less than 1, so it is
% % converges. Thus we can find the answer. And the Jacobian method has
% radius of sqrt(5)/2, and we can't state it is converges. So we might get the
% answer in lucky.
[X1]=IterativeSolver(A,b,tol,N0,x0,'GS'),
% [X2]=IterativeSolver(A,b,tol,N0,x0,'GS'),
% % Gauss Seidel for question 2 has spectral radius 2, so it is not
% converges. Thus we can't find the answer. And the Jacobian method has
% % radius of 0, and we can't state it is converges.
% [X3]=IterativeSolver(A2,b2,tol,N0,x0,'J'),
% [X4]=IterativeSolver(A2,b2,tol,N0,x0,'GS'),
% % 
% 
