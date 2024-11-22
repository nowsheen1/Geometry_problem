function[c,ceq]= constraints_Sys(x)
Sub_system_1_output=Sub_system_1_opt(x(1),x(2));
Sub_system_2_output=Sub_system_2_opt(x(1),x(2));
x3=Sub_system_1_output(3);
x4=Sub_system_2_output(3);

c=[];
ceq(1)=x3;
ceq(2)=x4;

end