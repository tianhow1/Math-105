function x = GaussElimation(n,A)

x = zeros(n,1);

for i=1:n-1
    for p=i:n
        if A(p,i)~=0
            break
        end
    end
    if A[p,i]==0;
        error("no unique solution")
        return 
    end
    if p ~= i
        c = A(i,:);
        A(i,:) = A(p,:);
        A(p,:) = c;
    end
    for j= i+1 : n
        m_ji=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-m_ji*A(i,:);
    end
end
if A(n,n)==0
    if A(n,n+1)~=0
        disp("no solution exist")
        return
    else
        disp("no unique solution exists")
        return
    end
end
%solve x
x(n) = A(n,n+1)/A(n,n);
for i0 = 1:n-1
    i = n-i0;
    sum = 0;
    for j = i+1:n
        sum = sum+A(i,j)*x(j);
    end
    x(i)=(A(i,n+1)-sum)/A(i,i);
end
end