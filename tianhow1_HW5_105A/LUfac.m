function [L,U]=LUfac(n,A,choice)
% determine if A is a square matrix

sz=size(A);
if sz(1)~=sz(2)
    error('this is not a square matrix,please try another one')
end


% choice
if choice == 'Doolittle'
    U=zeros(n,n);
    U(1,1)=A(1,1);
    L=eye(n);
elseif choice == 'Crout'
    L=zeros(n,n);
    L(1,1)=A(1,1);
    U=eye(n);
else
    error('wrong method choice, select either Crout or Doolittle')
end

if A(1,1)==0
    error('factorization impossible')
end

for j=2:n
    U(1,j)=A(1,j)/L(1,1);
    L(j,1)=A(j,1)/U(1,1);
end
for i=2:n-1
    s=L(i,1:(i-1))*U(1:(i-1),i);
    if choice == 'Doolittle'
        U(i,i)=(A(i,i)-s);
    else
        L(i,i)=(A(i,i)-s);
    end
    if L(i,i)*U(i,i)==0
        error('factorization impossible')
    end
    for j=i+1:n
        U(i,j)=(A(i,j)-L(i,1:(i-1))*U(1:(i-1),j))/L(i,i);
        L(j,i)=(A(j,i)-L(j,1:(i-1))*U(1:(i-1),i))/U(i,i);
    end
end

if choice == 'Doolittle'
    U(n,n)=(A(n,n)-L(n,1:(n-1))*U(1:(n-1),n));
else
    L(n,n)=(A(n,n)-L(n,1:(n-1))*U(1:(n-1),n));
end
end
