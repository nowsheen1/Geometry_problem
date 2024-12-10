function[c,ceq]= constraints_Sys(x)
%newData = [x(1),x(2)];


load('optimal_solution_sub_1.mat', 'z1');
load('optimal_solution_sub_2.mat', 'z2');

load('weight_sub_1.mat', 'weight');
load('center_sub_1.mat', 'center');

load('weight_sub_2.mat', 'weight_2');
load('center_sub_2.mat', 'center_2');

sub_system_1_output=z1;
sub_system_2_output=z2;


x11=sub_system_1_output(1);
x12=sub_system_1_output(2);

func=@tps_rbf_objfn;
x_new=[x11,x12,x(1),x(2)];
function surr_response_1 = applyFunction(func, x_new,weight,center)
    surr_response_1 = func(x_new,weight,center); % Call the passed function handle with the input
 end

x21=sub_system_2_output(1);
x22=sub_system_2_output(2);

func2=@tps_rbf_objfn;
x_new_2=[x21,x22,x(1),x(2)];
    function surr_response_2 = applyFunction_2(func2, x_new_2,weight_2,center_2)
    surr_response_2 = func2(x_new_2,weight_2,center_2); % Call the passed function handle with the input
    end
% Make predictions using the loaded model
%x11 = predict(model_frst_optimal_soln_sub1, newData);
%x12=predict(model_second_optimal_soln_sub1, newData);


%x21 = predict(model_frst_optimal_soln_sub2, newData);
%x22=predict(model_second_optimal_soln_sub2, newData);


%Sub_system_1_output=Sub_system_1_opt(x(1),x(2));
%Sub_system_2_output=Sub_system_2_opt(x(1),x(2));
%x3=Sub_system_1_output(3);
%x4=Sub_system_2_output(3);

c=[];
ceq(1)=applyFunction(func, x_new,weight,center);
ceq(2)=applyFunction_2(func2, x_new_2,weight_2,center_2);

end