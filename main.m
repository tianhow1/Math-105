clear
clc
%%  Plot graph with m=1,m=2,m=3,m=6
load('Data_project_2022.mat')
T_test=T(1:2:900);
t_test=t(1:2:900);
[a1]=Least_square_appoximation(1,T_test,t_test);
y1=[];y3=[];y6=[];y2=[];
for x=1:900
    yy=apprx_polynomial_solver(a1,t(x));
    y1=[y1,yy];
end
plot(t,y1,LineStyle="-",Color="R",LineWidth=2)
hold on
[a2]=Least_square_appoximation(2,T_test,t_test);
for x=1:900
    yy=apprx_polynomial_solver(a2,t(x));
    y2=[y2,yy];
end
plot(t,y2,LineStyle="-",Color="G",LineWidth=2)
hold on
[a3]=Least_square_appoximation(3,T_test,t_test);
for x=1:900
    yy=apprx_polynomial_solver(a3 ,t(x));
    y3=[y3,yy];
end
plot(t,y3,LineStyle="-",Color="B",LineWidth=2)
hold on
[a6]=Least_square_appoximation(6,T_test,t_test);
for x=1:900
    yy=apprx_polynomial_solver(a6,t(x));
    y6=[y6,yy];
end
plot(t,y6,LineStyle="-",Color="y",LineWidth=2)
legend('m=1','m=2','m=3','m=6')
%% COMPUTE error
Error=[];
error1=0;
for i=1:450
    error1=error1+(T_test(i)-apprx_polynomial_solver(a1,t_test(i)))^2;
end
Error=[error1];
error2=0;
for i=1:450
    error2=error2+(T_test(i)-apprx_polynomial_solver(a2,t_test(i)))^2;
end
Error=[Error,error2];
error3=0;
for i=1:450
    error3=error3+(T_test(i)-apprx_polynomial_solver(a3,t_test(i)))^2;
end
Error=[Error,error3];
error6=0;
for i=1:450
    error6=error6+(T_test(i)-apprx_polynomial_solver(a6,t_test(i)))^2;
end
Error=[Error,error6];
%% COMPUTE validation error
T_val=T(2:2:900);
t_val=t(2:2:900);
Error_val=[];
error_1=0;
for i=1:450
    error_1=error_1+(T_val(i)-apprx_polynomial_solver(a1,t_val(i)))^2;
end
Error2=[error_1];
error_2=0;
for i=1:450
    error_2=error_2+(T_val(i)-apprx_polynomial_solver(a2,t_val(i)))^2;
end
Error2=[Error2,error_2];
error_3=0;
for i=1:450
    error_3=error_3+(T_val(i)-apprx_polynomial_solver(a3,t_val(i)))^2;
end
Error2=[Error2,error_3];
error_6=0;
for i=1:450
    error_6=error_6+(T_val(i)-apprx_polynomial_solver(a6,t_val(i)))^2;
end
Error2=[Error2,error_6];
