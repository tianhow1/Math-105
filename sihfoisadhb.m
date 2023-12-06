% for x=[10,20,30]
%     a=[];
%     y=0;
%     for i=1:x
%         y=y+1/i;
%     end
%     y=y-log(x+0);
%     a=[a,double(eulergamma)-y],
% y=0;
% for i=1:30
%         y=y+1/i;
%     end
%     y=y-log(30+0.5);
%     c=double(eulergamma)-y,
dx=logspace(0,-20);
f =@(x) 1./(1+x)+x;
f_p = @(x) -1./(1+x)^2+1;
f_num=(f(2+dx)-f(2-dx))./(2.*dx);
error=(abs(f_p(2)-f_num))./abs(f_p(2));
loglog(dx,error)