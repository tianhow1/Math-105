clear

close all


f= @(x) exp(-1./(x+1)); % define the function

df= @(x) exp(-1./(x+1))./(x+1).^2; % define the first derivative of function

d2f= @(x) -(2*x+1).*exp(-1./(x+1))./(x+1).^4; % define the second derivative of function

d3f = @(x) (6*exp(-1./(x + 1)))./(x + 1).^4 - (6*exp(-1./(x + 1)))./(x + 1).^5 + exp(-1./(x + 1))./(x + 1).^6; % define the third derivative of function

d4f = @(x) (36*exp(-1./(x + 1)))./(x + 1).^6 - (24*exp(-1./(x + 1)))./(x + 1).^5 - (12*exp(-1./(x + 1)))./(x + 1).^7 + exp(-1./(x + 1))./(x + 1).^8; % define the fourth derivative of function


%% evaluate forward difference and central(mid-point) difference with varying x.
h = 0.1;
x = 0:2/(20-1):2;

dfx = df(x);
d2fx = d2f(x);
d3fx = d3f(x);
d4fx = d4f(x);
fdfx = (f(x+h)-f(x))./h;  % using forward difference to approximate the first derivative of f at all x
cdfx = (f(x+h)-f(x-h))./(2*h);  % using central(mid-point) difference to approximate the first derivative of f at all x

cd2fx = (f(x-h)+f(x+h)-2*f(x))./(h^2);  % using central(mid-point) difference to approximate the second derivative of f at all x

figure(1);plot(x,dfx-fdfx)
hold on
figure(1);plot(x,-h*d2fx/2)

figure(2);plot(x,dfx-cdfx)
hold on
figure(2);plot(x,-h^2*d3fx/6)

figure(3);plot(x,d2fx-cd2fx)
hold on
figure(3);plot(x,-h^2*d4fx/12)


%% evaluate forward difference and central(mid-point) difference with varying x.

h = 0.01:0.01:0.2;
x = 0;

dfx = df(x);
d2fx = d2f(x);
d3fx = d3f(x);
d4fx = d4f(x);
fdfx = (f(x+h)-f(x))./h;  % using forward difference to approximate the first derivative of f with varying  h
cdfx = (f(x+h)-f(x-h))./(2*h); % using central(mid-point) difference to approximate the first derivative of f with varying  h
cd2fx =(f(x-h)+f(x+h)-2*f(x))./(h.^2) ; % using central(mid-point) difference to approximate the second derivative with varying  h

figure(4);loglog(h,abs(dfx-fdfx))
figure(5);loglog(h,abs(dfx-cdfx))
figure(6);loglog(h,abs(d2fx-cd2fx))