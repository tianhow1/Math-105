function [y,v,N]=NM(f,x0,eps)
%% initial condition
n=length(x0);
x=zeros(n,n+1);
x(:,1)=x0;
lambda=0.3;
for k=2:n+1
    x(:,k)=x0;
    x(k-1,k)=x0(k-1)+lambda;
end
for KK=1:inf
%% Ordering
    F=zeros(1,n+1);
        for i=1:n+1
            F(i)=f(x(:,i));
        end
    [FMA,MA]=max(F);
    [FMI,MI]=min(F);
    xm=x(:,MA);
    xi=x(:,MI);
    for i=1:n+1
        if i~=MA & i~=MI
            xx=x(:,i);
        end
    end
    if FMA-FMI<eps
        y=xi;
        break
    end  
    %% compute centroid
    xg=zeros(n,1);
    for i=1:n+1
        if i~=MA
            xg=xg+x(:,i);
        end
    end
    xg=xg/n;
    %% reflection
    xr=xg+(xg-xm);
    if f(xi)<=f(xr) & f(xr)<f(xx)
        x(:,MA)=xr;
    end
    %% expension
    if f(xi)>f(xr)
        xe=xg+2.*(xr-xg);
        if f(xe)>=f(xr)
            x(:,MA)=xr;
        else
            x(:,MA)=xe;
        end
    end
    %% contraction
    xtt=0;
    if f(xr)>=f(xx) & f(xr)<f(xm)
        xc=xg+0.5.*(xr-xg);
        x(:,MA)=xc;
        xtt=1;
    end
    if f(xr)>=f(xm)
        xc=xg+0.5.*(xm-xg);
        x(:,MA)=xc;
        xtt=1;
    end
    %% shrinkage
    if xtt==1 & f(xc)>f(xm)
        x(:,1)=xi;
        x(:,2)=(xi+xx)./2;
        x(:,3)=(xi+xm)./2;
    end
end
v=f(y);
N=KK;
end






