function [I] = Simpson(f,x0,h)
I=h/6*(1*f(x0)+4*f(x0+h/2)+1*f(x0+h));
end