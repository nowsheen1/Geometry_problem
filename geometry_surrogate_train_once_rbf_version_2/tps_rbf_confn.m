%
% f = TPS_RBF_OBJFN(x,w,c)
%   f: Evaluated Objective Function Values
%   x: Evaluating Design Points
%   w: RBF Weights
%   c: RBF Centers

function [con,ceq] = tps_rbf_confn(x,w1,c1,w2,c2)
    
    nx = size(x,1);         % Number of evaluating design points
    nc = size(c1,1);         % Number of RBF centers (not equal to nx)
    phi = zeros(nx,nc);     % Allocate for Gram matrix
    for i = 1:nc
        % Radii (=distance) between i-th center and all evaluating points
        rad = sqrt(sum((repmat(c1(i,:),nx,1) - x(:,:)).^2,2));
        phi(:,i) = rad.^2.*log(rad);    % thin-plate spline function
        phi(rad<eps,i) = 0;             % rad<eps: 2 points are identical
    end
    % Prediction of objective function value using RBF surrogate model
    con1= phi*w1;
   
    con=[con1];
    ceq=[];
end
