function out=Sub_system_1_opt(x1s,x2s)
global count1;
rng default
X0 = [20;20]; % x(1)=xs,x(2)=t1,x(3)=t2
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;-100];
UB = [100;100];

%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
%options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,1000,'MaxIter' ,1000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
options=optimoptions('surrogateopt','MinSampleDistance',10^-3,'MaxFunctionEvaluations',400);
[X_Sub_sys_1,fval1,exitflag1,Output_sub_system_1] = surrogateopt(@(x)Sub_sys_1_obj(x,x1s,x2s),LB,UB,options);
out=[X_Sub_sys_1];
end
function f= Sub_sys_1_obj(x,x1s,x2s)
f.Fval=((x(1)-x1s)^2+(x(2)-x2s)^2);
f.Ineq(1)=x(2)-100*sin(0.1*x(1)-0.5);

end