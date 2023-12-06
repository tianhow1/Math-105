function [I] = Trapezoidal(f,x0,h)
I=h/2*(f(x0)+f(x0+h));
end