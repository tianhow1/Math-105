%test 1
f = @(x) 6*(exp(x)-x) - (7+3*x^2+2*x^3);
b=bisection(f,-1,1,1e-6,300),

