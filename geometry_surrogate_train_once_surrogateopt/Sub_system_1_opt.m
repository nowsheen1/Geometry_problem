function out=Sub_system_1_opt()
global count1 evalHistory;
evalHistory=[];
rng default
X0 = [20;20;20;20]; % x(1)=xs,x(2)=t1,x(3)=t2
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;-100;0;-100];
UB = [100;100;100;100];

%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
%options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,1000,'MaxIter' ,1000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
options=optimoptions('surrogateopt','MinSampleDistance',10^-3,'MaxFunctionEvaluations',400);
[X_Sub_sys_1,fval1,exitflag1,Output_sub_system_1] = surrogateopt(@(x)Sub_sys_1_obj(x),LB,UB,options);
out=[X_Sub_sys_1];
X = [evalHistory(:, 1),evalHistory(:, 2),evalHistory(:, 3),evalHistory(:, 4)] % Inputs
Y = evalHistory(:, 5) % Objective values
% Fit a Gaussian process to visualize the surrogate
gpModel1 = fitrgp(X, Y);

% Predict across the domain
save('gp_model_1.mat', 'gpModel1', '-v7.3');
save('optimal_solution_1.mat', 'X_Sub_sys_1', '-v7.3');
end
function f= Sub_sys_1_obj(x)
global evalHistory    
f.Fval=((x(1)-x(3))^2+(x(2)-x(4))^2); %x1s is x(3), x2s is x(4)
f.Ineq(1)=x(2)-100*sin(0.1*x(1)-0.5);

evalHistory = [evalHistory; x, f.Fval]; % Log evaluation
end
