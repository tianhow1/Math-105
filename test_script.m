clear;
clc;
%initial value problem be specified as follows:
%dy/dt=f(t,y), y(t0)=y0
%% Example 1
F=@(t,y) t-y^2; %ode function--dy/dt=xxx
t0=-1; %value of t_initial
y0=0; %value of y_initial
tf=3; %value of t_final
h=0.001; %value of step size of each iteration
y=runge_kutta(F,t0,h,tf,y0); %run the runge_kutta method
t=t0:h:tf; %setting up x-axis
plot(t,y,'.') %plot the graph
%https://www.dam.brown.edu/people/spsmith/amsc460spring18/files/15-ode460part123.pdf
%% Example 2 
F=@(t,y) y^2-t; %ode function--dy/dt=xxx
t0=-2; %value of t_initial
y0=-4; %value of y_initial
tf=10; %value of t_final
h=0.001; %value of step size of each iteration
y=runge_kutta(F,t0,h,tf,y0); %run the runge_kutta method
t=t0:h:tf; %setting up x-axis
plot(t,y,'.') %plot the graph
%https://ximera.osu.edu/laode/linearAlgebra/solvingOrdinaryDifferentialEquations/graphingSolutionsToDifferentialEquations
%% Example 3
F=@(t,y) y^2-y^3; %ode function--dy/dt=xxx
t0=0; %value of t_initial
y0=0.01; %value of y_initial
tf=2/y0; %value of t_final
h=0.001; %value of step size of each iteration
y=runge_kutta(F,t0,h,tf,y0); %run the runge_kutta method
t=t0:h:tf; %setting up x-axis
plot(t,y,'.') %plot the graph
%https://blogs.mathworks.com/cleve/2014/06/09/ordinary-differential-equations-stiffness/#1aac84a3-f82d-4514-a587-b944035e571e