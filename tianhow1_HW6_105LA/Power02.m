% function [x]=Power(n.TOL)
% 代码第二版，第三版会写一个function
clc
clear
n=20;
TOL=1e-7;
x(1:n,1)=1;
Main(1:n)=-2;
Other(1:n-1)=1;
D=diag(Main);
L=-diag(Other,-1);
U=-diag(Other,1);
%A=D-L-U;
%Omega=1.25;
err=10;
yp=[];
miu=0;
A=(D^-1)*(L+U);
norm(A);
k0=1;
Jcount=[];
while err>TOL
    y=A*x;
    miu=yp;
    for i=1:n
        if abs(y(i,1))==max(abs(y))
        yp=y(i,1);
        end
    end
    err=max(norm(x-(y/yp),2));
    x=y/yp;
    Jcount(k0)=err;
    k0=k0+1
    if k0>100
    break
    end
end
plot(Jcount)
hold on
abs(miu);
x(1:n,1)=1;
k1=1;
err=1000;
TGauss=((D-L)^-1)*U;
Gcount=[];
while err>TOL
    y=TGauss*x;
    miu=yp;
    for i=1:n
        if abs(y(i,1))==max(abs(y))
        yp=y(i,1);
        end
    end
    err=max(norm(x-(y/yp),2));
    x=y/yp;
    Gcount(k1)=err;
    k1=k1+1;
    if k1>100
    break
    end
end
plot(Gcount)
hold on
% N=0;
x(1:n,1)=1;
k2=1;
err=1000;
Scount=[];
omega=2/(1+sqrt(1-miu^2));
TSOR=((D-omega*L)^-1)*((1-omega)*D+omega*U);
while err>TOL
    y=TSOR*x;
    miu=yp;
    for i=1:n
        if abs(y(i,1))==max(abs(y))
        yp=y(i,1);
        end
    end
    err=max(norm(x-(y/yp),2));
    x=y/yp;
    Scount(k2)=err;
    k2=k2+1;
    if k2>100
    break
    end
end
plot(Scount)
legend("Jcount","Gcount","Scount")
hold off

%g=eig(TSOR);
% for i=1:n
%     N(i)=norm(g(i,1));
% end
% N
% omega-1;
% NSOR=norm(TSOR);
