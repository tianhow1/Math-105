clear

n = 15; % number of data points

m = 100; % number of evaluation points

f = @(x) sin(pi*x)+exp(x.^2+2); % the function f

x = 0:2/(n-1):2; % x location of data points

y = f(x); % f(x) values

z = 0:2/(m-1):2; % x location of evaluation points
Pz_Nev = zeros(size(z)); % initialize Pz_Nev (which is the vector of using Neville_method to evaluate P(z))
Pz_New = zeros(size(z)); % initialize Pz_New (which is the vector of using Newton polynomial to evaluate P(z))


tic
for j = 1:length(z)
    Pz_Nev(j)= Neville_method(x,y,z(j));
end

t_Nev=toc;



tic
[b] = Divided_difference(x,y);
% for j = 1:length(z)
%     Pz_New(j) = 
Pz_New= Newton_polynomial(b,x,z);
t_New=toc;

norm(Pz_Nev-Pz_New)



