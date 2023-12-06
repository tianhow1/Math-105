function [Hz] = Hermite_polynomial(b,x,z)
n = numel(x);
S = ones(size(z));
X = zeros(2*n,1);
X(1:2:end) = x; 
X(2:2:end) = x;
Hz = b(1)*S;
for i=2:2*n
    S=S.*(z-X(i-1));
    Hz=Hz+b(i).*S;
end


end

