function [x,miu,count]=Power03(A,n,TOL,maxtime,normP)
% 代码第三版,function版
err=10;% set error be any num>0.1
yp=[];
miu=0;
x(1:n,1)=1;
k=1;
count=[];
while err>TOL
    y=A*x;
    miu=yp;
    for i=1:n
        if abs(y(i,1))==norm(y,inf)
        yp=y(i,1);
        end
    end
    err=max(norm(x-(y/yp),normP));
    x=y/yp;
    count(k)=err;
    k=k+1;
    if k>maxtime
    return
    end
end