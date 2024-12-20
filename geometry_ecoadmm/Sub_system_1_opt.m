function [z]=Sub_system_1_opt(x1s,x2s)
global count1 lambda1 rho1;
lambda1=0;
rho1=.10;
FUN = @Sub_sys_1_obj;
X0 = [35;-65]; % x(1)=xs,x(2)=t1,x(3)=t2
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;-100];
UB = [100;100];
NONLCON = @constraints_Sub_sys_1;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-16,'TolFun',1e-16,'TolCon',10^-16,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
[X_Sub_sys_1,fval1,exitflag1,Output1] = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,options,x1s,x2s);

z=[X_Sub_sys_1',lambda1,rho1];
end
function f= Sub_sys_1_obj(x,x1s,x2s)

global rho1  lambda1;
%wf=2; % wf is highest than lambda and rho. highest penalty

f1=x1s



f=f1+lambda1*((x(1)-x1s)+(x(2)-x2s))+0.5*rho1*((x(1)-x1s).^2+(x(2)-x2s).^2) %x2 is sj . if there was more than one constraint then it could become x(2)+x(3)+....for one dimensioal variable
%%x2 is xs and x1, a2 is x2, x3 is x3
%gradf=[0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*2*x1s; 0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*1;0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*(-1);0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*(-0.2)];
%derivative wrt x1s, x2s y1s y3s.
lambda1=lambda1+rho1*((x(1)-x1s)+(x(2)-x2s));
rho1=rho1*1.1;
%rho1=rho1^0.5;

end
function [c,ceq]=constraints_Sub_sys_1(x,x1s,x2s)
c(1)=x(2)-100*sin(0.1*x(1)-0.5)

ceq=[];
end

