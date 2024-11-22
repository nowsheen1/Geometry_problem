function[c,ceq]= constraints_Sys(x)
load('gprModel_sub11.mat', 'model_frst_optimal_soln_sub1');
load('gprModel_sub12.mat', 'model_second_optimal_soln_sub1');

load('gprModel_sub21.mat', 'model_frst_optimal_soln_sub2');
load('gprModel_sub22.mat', 'model_second_optimal_soln_sub2');

newData = [x(1),x(2)];

% Make predictions using the loaded model
x11 = predict(model_frst_optimal_soln_sub1, newData);
x12=predict(model_second_optimal_soln_sub1, newData);


x21 = predict(model_frst_optimal_soln_sub2, newData);
x22=predict(model_second_optimal_soln_sub2, newData);


%Sub_system_1_output=Sub_system_1_opt(x(1),x(2));
%Sub_system_2_output=Sub_system_2_opt(x(1),x(2));
%x3=Sub_system_1_output(3);
%x4=Sub_system_2_output(3);

c=[];
ceq(1)=((x(1)-x11)^2+(x(2)-x12)^2);
ceq(2)=((x(1)-x21)^2+(x(2)-x22)^2);

end