
% f = OBJ(x)
%   f: Objective Function Value
%   x: Design Variables

function f = con1(x)

f=x(2)-100*sin(0.1*x(1)-0.5);


end