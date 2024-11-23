function out=Sub_system_2_opt(x1s,x2s)
global count;
rng default
FUN = @Sub_sys_2_obj;
X0 = [20;20]; % x(1)=xs,x(2)=t1,x(3)=t2
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;-100];
UB = [100;100];
NONLCON = @constraints_Sub_sys_2;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
options=optimoptions('surrogateopt','MinSampleDistance',10^-3,'MaxFunctionEvaluations',400);
[X_Sub_sys_2,fval2,exitflag2,Output_sub_system_2] = surrogateopt(@(x)Sub_sys_2_obj(x,x1s,x2s),LB,UB,options);
out=[X_Sub_sys_2];
end
function f= Sub_sys_2_obj(x,x1s,x2s)
f.Fval=((x(1)-x1s)^2+(x(2)-x2s)^2);


f.Ineq(1)=0.1*((1.5*x(1)-20)^2)-70-x(2);
f.Ineq(2)=(50/(x(1)+0.1))-40-x(2);

end
