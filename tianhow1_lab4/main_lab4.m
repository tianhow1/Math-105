clear

close all

n = 10;

m = 100;  % number of evaluation points

f= @(x) abs(x-1); % define the function

 

x = 0:2/(n-1):2;

y = f(x);

z = 0:2/(m-1):2; % x location of evaluation points
Sz = zeros(size(z)); % initialize Sz

Pz = zeros(size(z)); % initialize Pz

 

[a,b,c,d] = natural_spline_coeff(x,y);

 

%% evaluate S(z), the polynomial at z

for j=1:length(z)
          Sz(j) =natural_spline_polynomial(a,b,c,d,x,z(j));
end

%% evaluate P(z), the polynomial at z

[e] = Divided_difference(x,y);
for i = 1:numel(z)
    [Pz(i)] = Newton_polynomial(e,x,z(i));
end

figure(3); 
plot(z,Pz);
hold on
plot(z,Sz);
plot(z,f(z));
legend('Newton','cubic','exact function','Location','northwest');

