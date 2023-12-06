
A = 1;
B = 2;
tspan = [0 5];
y0 = [0 0.01];
[t,y] = ode45(@(t,y) odefcn(t,y,0,0.1), tspan, y0);
function dydt = odefun(t,y)
dydt = zeros(2,1);
dydt(1) = 0.1*y(1)+y(2);
dydt(2) = -y(1)+0.1*y(2)-y(1)^2*y(2);
end