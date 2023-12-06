function [y]=apprx_polynomial_solver(a,x)
p=[];
n=length(a);
for j=1:n
    p(j,1)=x^(j-1);
end
y=[sum(a.*p)];% sum to the polynomial