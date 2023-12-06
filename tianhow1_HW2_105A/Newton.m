function [p,pvec] = Newton(f,fd,p0,TOL,N0)
i=1;

while i<=N0
    pvec(i)=p0;
    p = p0-f(p0)/fd(p0);
    if abs(p-p0)<TOL
        return
    end
    i=i+1;
    p_0=p0;
    p0=p;
    
end
if abs(p-p_0)>TOL
    output = sprintf('The method failed after N0 iterations, N0=%f',N0);
    disp(output);
end
end