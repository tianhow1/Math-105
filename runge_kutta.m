function Y=runge_kutta(F,t0,h,tf,y0)
y=y0;
Y=y;
for t=t0:h:tf-h
         k1 = F(t,y);
         k2 = F(t+h/2, y+h*k1/2);
         k3 = F(t+h/2, y+h*k2/2);
         k4 = F(t+h, y+h*k3);
         y = y + h*(k1 + 2*k2 + 2*k3 + k4)/6;
         Y=[Y;y];
end
end
% reference 2014 - 2015 The MathWorks, Inc.