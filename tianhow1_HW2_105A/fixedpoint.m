function [p,pvec] = fixedpoint(g,p0,TOL,N0)
i=1;

while i<=N0
    pvec(i)=p0;
    p = g(p0);
    if abs(p-p0)<TOL
        return
    end
    i=i+1;
    a=p0;
    p0=p;
    
end

if abs(p-a)>TOL
    output = sprintf('The method failed after N0 iterations, N0=%f',N0);
    disp(output);

end

end



