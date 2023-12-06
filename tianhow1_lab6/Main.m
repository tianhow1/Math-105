clear

close all

f = @(x) 2*x./(x.^2+1);% define the function
I_f = @(x) log(x.^2+1);% define the integration of the function

 

n = [2,4,8,16,32,64,128];% number of sub-intervals

h = 1./n; % size of the sub-intervals
error_t = zeros(numel(n),1);
error_s = zeros(numel(n),1);

 

%% evaluate Trapezoidal rule and Simpson's Rule with varying h.

for i = 1:numel(n)
    x = (0:n(i)-1)/n(i);
    I_t = Trapezoidal(f,x,h(i));
    I_s = Simpson(f,x,h(i));
    I_e = I_f(x+h(i))-I_f(x);
    error_t(i) = max(abs(I_t-I_e));
    error_s(i) = max(abs(I_s-I_e));
end

%% plotting the error figure and checking the convergence rate
figure(1);loglog(n,error_t);
figure(2);loglog(n,error_s);
(log(error_t(end))-log(error_t(1)))/(log(n(end))-log(n(1)))
(log(error_s(end))-log(error_s(1)))/(log(n(end))-log(n(1)))




