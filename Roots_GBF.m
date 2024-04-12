function [grid_roots] = Roots_GBF(n,lambda,mu,s,eps)

% FUNCTION:
% The function Roots_GBF returns the sign-changing roots of the function f
% and provides a plot to visualize them

% INPUTS:
% n = dimension of the mixture, i.e. number of gaussians involved
% lambda = mixing coefficients or weights
% mu = means of the gaussians in the mixture
% s = variances of the gaussians in the mixture
% eps = accuracy level for the searching-root algorithm

% OUTPUTS:
%grid_roots = sign-changing roots of the function f

Control(n,lambda);

% The function SequenceGBFP returns the GBF sequence with the parameters
% chosen by the user.

[mix,num,den]= SequenceGBF(n,mu,s,lambda);

f=matlabFunction(mix(1)); % f is the GGM that we will test

[xLow,xUpp] = Interval(n,mu,s,lambda);

if isempty(xLow) || isempty(xUpp)

    grid_roots = [];

else

    xLow = vpa(xLow);

    xUpp = vpa(xUpp);

    % The function SimpleGrid returns the final output containing the eventual sign-changing roots

    [grid_roots]= SimpleGrid(xLow,xUpp,num,mix,den,eps);

end

% The function GaussianPlots returns the plot of the function f in [xLow, xUpp]
% along with the eventual sign-changing roots

GaussianPlots(f,grid_roots,mu,xLow,xUpp);

end

