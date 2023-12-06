%Tianhong Wang 92807178
g = @(x) x/2+1/x;
f = @(x) x^2-6;
fd = @(x) 3*x^2;
N0=2;
secant_method(f, 3, 2, 2)

% [p1,pvec1]= fixedpoint(g,1,1e-5,N0),
% [p2,pvec2]= Newton(f,fd,2,1e-5,N0),
% plot(pvec1,'blue');
% hold on
% plot(pvec2,'red');

% They have similar speed when I check the result. 
% The plot shows that newton method approach it on the same side but FP in
% the opposite side with similar rate 