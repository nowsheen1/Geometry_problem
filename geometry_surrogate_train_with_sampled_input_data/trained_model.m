
%Sub_system_1_output=Sub_system_1_opt(x(1),x(2),x(3));
%Sub_system_2_output=Sub_system_2_opt(x(1),x(2),x(3));
%x11=Sub_system_1_output(1);
%x12=Sub_system_1_output(2);
%x21=Sub_system_2_output(1);
%x23=Sub_system_2_output(2);
rng(1000)
num_points = 50;  % Number of design points for each subsystem
num_vars = 2;     % Number of design variables per subsystem (you can increase this)
design_points=zeros(num_points,num_vars);
% Subsystem 1: Generate design points using LHS
lhs_design1 = lhsdesign(num_points, num_vars);
lb1 = [0,-100];  % Lower bound for Subsystem 1
ub1 =  [100,100];  % Upper bound for Subsystem 1
for i=1:num_points
    design_points(i,:)=lb1+lhs_design1(i,:).*(ub1-lb1);

end

num_var_sub_system_1=2;
num_var_sub_system_2=2;
Sub_system_1_output=zeros(num_points,num_var_sub_system_1);
Sub_system_2_output=zeros(num_points,num_var_sub_system_2);

for i=1:num_points 
    Sub_system_1_output(i,:)=Sub_system_1_opt(design_points(i,1),design_points(i,2));
    Sub_system_2_output(i,:)=Sub_system_2_opt(design_points(i,1),design_points(i,2));
end

%f1=(Sub_system_1_output(:,1)-design_points(:,1)).^2+(Sub_system_1_output(:,2)-design_points(:,2)).^2;
%f2=(Sub_system_2_output(:,1)-design_points(:,1)).^2+(Sub_system_2_output(:,2)-design_points(:,2)).^2; % as x3 is substystem output x2

Mdl11=fitrgp(design_points,Sub_system_1_output(:,1));
Mdl12=fitrgp(design_points,Sub_system_1_output(:,2));

Mdl21=fitrgp(design_points,Sub_system_2_output(:,1));
Mdl22=fitrgp(design_points,Sub_system_2_output(:,2));

save('gprModel_sub11.mat', 'Mdl11');
save('gprModel_sub12.mat', 'Mdl12');

save('gprModel_sub21.mat', 'Mdl21');
save('gprModel_sub22.mat', 'Mdl22');

