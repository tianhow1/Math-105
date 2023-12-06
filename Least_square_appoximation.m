function [Pm]=Least_square_appoximation(m,T,t)
n=length(t);
X=zeros(n,m+1);
X(:,1)=1;
for i=2:m+1
    X(:,i)=t.^(i-1);
end
M=X'*X;
b=X'*(T');
a=M^(-1)*b;
p=[];
for j=1:m+1
    p(1,j)=x^(j-1);
end
Pm= @(x)[sum(a.*p)];