function [e]=Machine_precision(d)
digits(d);
e=1/2;
while vpa(1+e)>vpa(1)
    e=vpa(e*1/2);
end
e=e*2;

end