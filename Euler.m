function Y = Euler(F,t0,h,tfinal,y0)
      y = y0;
      Y = y;
      for t = t0 : h : tfinal-h
         s = F(t,y);
         y = y + h*s;
         Y = [Y; y];
      end
% reference 2014 - 2015 The MathWorks, Inc.