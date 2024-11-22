function X_Sub_sys_1=Sub_system_1_opt(x1s,x2s)
global count1;
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
options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,1000,'MaxIter' ,1000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
[X_Sub_sys_1,fval1,exitflag1,Output1] = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,options);
function f= Sub_sys_1_obj(x)
f=((x(1)-x1s)^2+(x(2)-x2s)^2);
end
function [c,ceq]=constraints_Sub_sys_1(x)
c(1)=x(2)-100*sin(0.1*x(1)-0.5);

ceq=[];
end

end