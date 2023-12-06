
% a=myfun(100),
% 
% 
% function v=myfun(n)
% v=zeros(1,n);
% if n==1
%     v(1)=1;
%     v(2)=1;
% end
% if n>=3
%     v(1)=1;
%     v(2)=1;
%     k=3;
%     
%     while k<=n
%         
%         v(k)=v(k-1)+v(k-2);
%         k=k+1;
%     end
% end
% end
n=10;

f= @(x) exp(-x.^2);
% devide [-10,10] into a subintervals with n+1 point
% the length of each subinterval is 20/n
%x0 = -10, x1 = -10+deltaX, x2 = -10 +2*deltaX
x=-10:20/n:10;
y=f(x);
plot(x,y,'-*')