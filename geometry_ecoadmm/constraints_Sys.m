function[c,ceq]= constraints_Sys(x)
Sub_system_1_output=Sub_system_1_opt(x(1),x(2));
Sub_system_2_output=Sub_system_2_opt(x(1),x(2));
x11=Sub_system_1_output(1);
x12=Sub_system_1_output(2);
x21=Sub_system_2_output(1);
x22=Sub_system_2_output(2);
c=[];
ceq(1)=((x11-x(1))^2+(x12-x(2))^2);
ceq(2)=((x21-x(1))^2+(x22-x(2))^2);

end