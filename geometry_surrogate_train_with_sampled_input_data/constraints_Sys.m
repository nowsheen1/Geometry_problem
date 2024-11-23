function[c,ceq]= constraints_Sys(x)


load('gprModel_sub11.mat', 'Mdl11');
load('gprModel_sub12.mat', 'Mdl12');

load('gprModel_sub21.mat', 'Mdl21');
load('gprModel_sub22.mat', 'Mdl22');

pred_point=[x(1),x(2)];
Sub_system_1_output(1)=predict(Mdl11,pred_point);
Sub_system_1_output(2)=predict(Mdl12,pred_point);

Sub_system_2_output(1)=predict(Mdl21,pred_point);
Sub_system_2_output(2)=predict(Mdl22,pred_point);

x11=Sub_system_1_output(1);
x12=Sub_system_1_output(2);
x21=Sub_system_2_output(1);
x22=Sub_system_2_output(2);

c=[];
ceq(1)=((x(1)-x11)^2+(x(2)-x12)^2);
ceq(2)=((x(1)-x21)^2+(x(2)-x22)^2);

end