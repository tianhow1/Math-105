clear

close all

f = @(x) 2*x./(x.^2+1);% define the function
I_f = @(x) log(x.^2+1);% define the integration of the function

 

n = [2,4,8,16,32,64,128];% number of sub-intervals

m = 1:6;

h = 1./n; % size of the sub-intervals
error_t = zeros(numel(n),1);
error_s = zeros(numel(n),1);

I = zeros(numel(n),numel(m));
for i = 1:numel(n)
    x = 0:1/n(i):1;
    for j = 1:n(i)
        for k = 1:numel(m)
            I(i,k) = I(i,k)+Romberg_Integration(f,x(j+1),x(j),m(k));
        end
    end
end

error = abs(I-(I_f(1)-I_f(0)));

%% plotting the error figure and checking the convergence rate
figure(1);loglog(h,error(:,1));
figure(2);loglog(h,error(:,2));
figure(3);loglog(h,error(:,3));
figure(4);loglog(h,error(:,4));
(log(error(end,1))-log(error(1,1)))/(log(h(end))-log(h(1)))
(log(error(end,2))-log(error(1,2)))/(log(h(end))-log(h(1)))
(log(error(end,3))-log(error(1,3)))/(log(h(end))-log(h(1)))
(log(error(end,4))-log(error(1,4)))/(log(h(end))-log(h(1)))