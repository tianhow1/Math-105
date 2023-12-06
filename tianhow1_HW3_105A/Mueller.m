function p = Mueller(f,p0,p1,p2,Tol,Nmax)
h1=p1-p0;
h2=p2-p1;
del1=(f(p1)-f(p0))/h1;
del2=(f(p2)-f(p1))/h2;
d=(del2-del1)/(h2+h1);
for i=1:Nmax
    b=del2+h2*d;
    D=(b^2-4*f(p2)*d)^(1/2);
    if abs(b-D)<abs(b+D)
        E=b+D;
    else
        E=b-D;
    end
    h= -2*f(p2)/E;
    p=p2+h;
    if abs(h)<Tol
        return
    end
    p0=p1;
    p1=p2;
    p2=p;
    h1=p1-p0;
    h2=p2-p1;
    del1=(f(p1)-f(p0))/h1;
    del2=(f(p2)-f(p1))/h2;
    d=(del2-del1)/(h2+h1);
end
if i<Nmax
    p=p;
else
    disp('Method failed after Max Num Iterations');
    return
end
end


