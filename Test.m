clear; clc; close('all');
F=@(t,y) y^2*(5-y)+1-t*y;; %ode function--dy/dt=t+2*y
t0=0; %value of t_initial
y0=0; %value of y_initial
tf=3; %value of t_final
h=0.001;
h2=0.01;%value of step size of each iteration
y=runge_kutta(F,t0,h,tf,y0); %run the runge_kutta method
t=t0:h:tf; %setting up x-axis
plot(t,y,'r.') %plot the graph
% hold on;
% tt=t0:h2:tf;
% yy=Euler(F,t0,h2,tf,y0);
% plot(tt,yy,'b.');
% hold on;
% 
% % exact solution :
% 
% t=t0:h:tf;
% yyy = (t.*2+1)/(-4)+(1/4)*exp(t.*2);
% plot(t,yyy,'r+');
% hold on;
% legend('Runge Kutta','Euler','Exact');








