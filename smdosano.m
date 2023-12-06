%%
for k=[4,8,16]
    Machine_precision(k) 
end
%%
%%for matlab machine_precision
e=1/2;
while 1+e>1
    e=e*1/2;
end
e=2*e,
%%
% function [e]=Machine_precision(d)
% digits(d);
% e=vpa(1/2);
% while vpa(1)+e>vpa(1)
%     e=vpa(e)*vpa(1/2);
% end
% e=e*vpa(2);
% 
% end

%%

f= @(x) 1./(1+x)+x;

g=@(x) -1./(1+x)^2+1;
E=[];

deltx=logspace(0,-20);
for j=1:50
    fnum=(f(2+deltx(j))-f(2-deltx(j)))/(2*deltx(j));
    Er=(abs(g(2)-fnum)/abs(g(2)));
    E=[E,Er];
end
loglog(deltx,E),

