function[c,ceq]= constraints_Sys(x)


c(1)=x(2)-100*sin(0.1*x(1)-0.5);
c(2)=0.1*((1.5*x(1)-20)^2)-70-x(2);
c(3)=(50/(x(1)+0.1))-40-x(2);
ceq=[];

end