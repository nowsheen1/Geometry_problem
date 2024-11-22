function f= Sys_obj(x)
global count_sys lambda2 rho2 lambda1 rho1;
count_sys=count_sys+1;


Sub_system_1_output=Sub_system_1_opt(x(1),x(2));
Sub_system_2_output=Sub_system_2_opt(x(1),x(2));
x11=Sub_system_1_output(1);
x12=Sub_system_1_output(2);

x21=Sub_system_2_output(1);
x22=Sub_system_2_output(2);
lambda1=Sub_system_1_output(3);
rho1=Sub_system_1_output(4);
lambda2=Sub_system_2_output(3);
rho2=Sub_system_2_output(4);

%ceq(1)=0.5*(((sigma1-x(1)))^2+((sigma1^2+2*x2-x3+2*sqrt(x(3)))-x(2))^2);% xs is x(1) and t1 is x(2) and t2 is x(3)
%ceq(2)=0.5*(((sigma2-x(2)))^2+((sigma2*x4+x4^2+x5+x(2))-x(3))^2);
%x2=Sub_system_1_output(1);
%lambda=Sub_system_1_output(2);
%rho=Sub_system_1_output(3);
%y1l=x(1)^2+x2+x(2)-0.2*x(4);
%ceq(1)=0.5*(((y1l-x(3))))^2;
f=(((x11+lambda1/rho1-x(1)))).^2+(((x12+lambda1/rho1-x(2)))).^2+(((x21+lambda2/rho2-x(1)))).^2+(((x22+lambda2/rho2-x(2)))).^2;



end