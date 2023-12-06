clear

close all
N_max = 50; %max depth
a = 0.01; b = 1; %a:left end point, b:right end point
eps0 = [1e-3,1e-4,1e-5,1e-6,1e-7,1e-8,1e-9];
f = @(x) 1/x^(1/2);
for i = 1:numel(eps0)
    d = 1; %depth
    [S(i)] = Adaptive_quad(f,a,b,d,N_max,eps0(i));
end

plot(eps0,abs(S-1.8))