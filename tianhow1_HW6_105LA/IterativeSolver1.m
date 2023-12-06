function [x,count] = IterativeSolver1(A,b,tol,maxtime,x0,choice)
%choice=J : Jacobi method
%choice=GS: Gauss-Seidel method
n=length(A);
k=1;
count=[];
x=x0;
count(1)=max(norm(x0,2));
if choice == 'J'
    while max(norm(x0,2))>tol
        for i=1:n
        x(i,1)=(b(i)-A(i,1:i-1)*x0(1:i-1,1)-A(i,i+1:n)*x0(i+1:n,1))/A(i,i);
        end
        k=k+1;
        x0=x;
        count(k)=max(norm(x0,2));
        if k>maxtime
            return
        end
    end
    disp('Max number of iterations exceeded')
    

elseif choice =='GS'
    while 
        x(1,1)=(b(1,1)-A(1,1+1:n)*x0(1+1:n,1))/A(1,1);
        for i=2:n-1
            x(i,1)=(b(i,1)-A(i,1:i-1)*x(1:i-1,1)-A(i,i+1:n)*x0(i+1:n,1))/A(i,i);
        end
        x(n,1)=(b(n,1)-A(n,1:n-1)*(x(1:n-1,1)))/A(n,n);
        k=k+1;
        x0=x;
        count(k)=err;
    end
    disp('Max number of iterations exceeded')
else
    error('check choice: J-- Jacobi method or GS-- Gauss-Seidel method')
end
end