
% pc = CONF()
%   pc: Structured Data Containing Problem Configurations

function pc = conf()
% first two variable is sub system design variable. second two variable is shared
% system variable.

    pc.nvar = 4;                % Number of variables
    pc.lb = [0,-100,0,-100];           % Lower bounds
    pc.ub = [100,100,100,100];             % Upper bounds 
    pc.fs_g = 0.6;             % Shrink factor for global sample range
    %pc.xtrue = [0];           % True soltuion in x (for comparison)
    %pc.ftrue = 0;               % True solution in f (for comparison)
end