function b = Divided_difference_Hermite(x,y,dy)
n = numel(x);
F = zeros(2*n,2*n);
F(1:2:end,1) = y; 
F(2:2:end,1) = y;  
F(2:2:end,2) = dy;
X = zeros(2*n,1);
X(1:2:end) = x;
X(2:2:end) = x;
for j = 1:n-1
        F(2*j+1 , 2) = (F(2*j+1,1) - F(2*j,1))/(x(j+1)-x(j));
end

for i=3:2*n
    for j = 2:i-1
        F(i , j+1) = (F(i,j) - F(i-1,j))/(X(i)-X(i-j));
    end
end
b = diag(F);
end

