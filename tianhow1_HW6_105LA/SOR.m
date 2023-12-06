function [x,count]=SOR(A,omega,b,tol,x0,maxtime)
n=length(A);
k=1;
count=[];
x=x0;
count(1)=max(norm(x0,2));
    while max(norm(x0,2))>tol
        x(1,1)=(1-omega)*x0(1,1)+(b(1,1)-A(1,1+1:n)*x0(1+1:n,1))*(omega/A(1,1));
        for i=2:n-1
            x(i,1)=(1-omega)*x0(i,1)+(b(i,1)-A(i,1:i-1)*x(1:i-1,1)-A(i,i+1:n)*x0(i+1:n,1))*(omega/A(i,i));
        end
        x(n,1)=(1-omega)*x0(n,1)+(b(n,1)-A(n,1:n-1)*(x(1:n-1,1)))*(omega/A(n,n));
        k=k+1;
        x0=x;
        count(k)=max(norm(x0,2));
        if k>maxtime
            return
        end
    end
end
