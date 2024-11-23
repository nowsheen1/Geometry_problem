function[c,ceq]= constraints_Sys(x)
%newData = [x(1),x(2)];


load('optimal_solution_sub_1.mat', 'z1');
load('optimal_solution_sub_2.mat', 'z2');
load('surrogate_response_sub_1.mat', 'Mdl_obj_1');
load('surrogate_response_sub_2.mat', 'Mdl_obj_2');
sub_system_1_output=z1;
sub_system_2_output=z2;


x11=sub_system_1_output(1);
x12=sub_system_1_output(2);


x_new=[x11,x12,x(1),x(2)];
surr_response_1=predict(Mdl_obj_1,x_new);
surr_response_2=predict(Mdl_obj_2,x_new);
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
ceq(1)=surr_response_1;
ceq(2)=surr_response_2;

end