function [Pz] = Newton_polynomial(b,x,z)
n = length(x);
S = ones(size(z));
Pz = b(1)*S;
for i=2:n
    S=S.*(z-x(i-1));
    Pz=Pz+b(i).*S;
end
end

