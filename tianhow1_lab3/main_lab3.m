clear

close all

syms f_sym(x); % initialize a symbolic function




m = 100; % number of evaluation points

f_sym(x) = sin(pi*x)+exp(x^2+2); % define the symbolic function

df_sym(x) = diff(f_sym); % compute the derivative of the symbolic function




f = @(x) double(f_sym(x)); % change the function f_sym to a double value function

df = @(x) double(df_sym(x)); % change the function df_sym to a double value function




z = 0:2/(m-1):2; % x location of evaluation points
Hz = zeros(size(z)); % initialize Hz (which is the vector of H(z))
error = zeros(1,4); % initialize the error vector

figure(1); hold on
i = 1;
for n = [2,4,8,16] % using increasing number of data points
    
    x = 0:2/(n-1):2; % x location of data points
    
    y = f(x); % f(x) values
    
    dy = df(x); % f(x) values
    
    %% compute the coefficient of Hermite polynomial by divided difference
    
    b= Divided_difference_Hermite(x,y,dy);
    
    
    
    
    %% evaluate H(z), the polynomial at z
    
    
    for j=1:length(z)
    Hz(j) = Hermite_polynomial(b,x,z(j));
    end
    
    
    
    
    %% compute the abs error of the interpolation at z
    
    
    
    
    figure(1);plot(z,Hz,'.-')
    
    error(i)= norm(Hz-f(z))/sqrt(m);
    i = i+1;
end


    figure(1);plot(z,f(z),'.','Markersize', 10)
    legend('n=2','n=4','n=8','n=16','exact function','Location','northwest');

figure(2); plot([2,4,8,16].*log([2,4,8,16]),log(error))