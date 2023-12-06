function [Rm] = Romberg_Integration(f,b,a,m)

h = b-a;
R = zeros(m,m);
R(1,1) = h*(f(a)+f(b))/2;
for i = 2:m
    x = a:h/2^(i-1):b;
    R(i,1) = h/2^(i)*(f(a)+2*sum(f(x(2:end-1)))+f(b));
    for j = 2:i
        R(i,j) = R(i,j-1)+(R(i,j-1)-R(i-1,j-1))/(4^(j-1)-1); 
    end
end

Rm = R(m,m);


end

