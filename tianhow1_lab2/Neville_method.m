function Pz= Neville_method(x,y,z)
n = length(x);
Q=zeros(n,n);
Q(:,1) = y; 
for i=2:n
    for j=1:i-1
        Q(i,j+1)=((z-x(i-j))*Q(i,j)-(z-x(i))*Q(i-1,j))/(x(i)-x(i-j));
    end
end
Pz = Q(n,n);

end

