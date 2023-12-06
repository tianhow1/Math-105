%{
Name(ID):	Anhong Yang(41845042), Tianhong Wang(92807178) Yiyang Zhang
Date:       2021-12-1
Assignment: Final Project
%}
clc
clear
TOL=1e-4;
maxtime=2000000;
normP=2; % either 2 or inf
n=20;% 4,10, or 20
x(1:n,1)=1;
Main(1:n)=-2;
Other(1:n-1)=-1;
D=diag(Main);
L=diag(Other,-1);
U=diag(Other,1);
A=D-L-U;
x0(1:n,1)=1;
h=pi/21;
for i=1:20
    b(i,1)=sin(i*h);
end
b=h^2*b(:,1);
TJacobian=(D^-1)*(L+U);
TGauss=((D-L)^-1)*U;
[xG,countG] = IterativeSolver1(A,b,TOL,x0,'GS');
plot(countG)
hold on
[xJ,countJ] = IterativeSolver1(A,b,TOL,x0,'J');
plot(countJ)
hold on
[Jx,miuJ,Gcount]=Power03(TJacobian,n,1e-7,maxtime,normP);
omega=2/(1+sqrt(1-miuJ^2));
[xR,countR]=SOR(A,omega,b,TOL,x0);
plot(countR)
legend("countG","countJ","countR")
hold off
% sp=0:pi/20:pi-pi/20;
% plot(sp,xR)
% [xG,miuG,Gcount]=Power03(TGauss,n,TOL,maxtime,normP);
% omega=2/(1+sqrt(1-miuJ^2));
% TSOR=((D-omega*L)^-1)*((1-omega)*D+omega*U);
% [xS,miuS,Scount]=Power03(TSOR,n,TOL,maxtime,normP);
% plot(Jcount)
% hold on 
% plot(Gcount)
% 
% plot(Rcount)
% legend("Jcount","Gcount","Scount")
% hold off
% xR=[0;xR;0];
% xre=[0:pi/21:pi];
% plot(xre,xR)

