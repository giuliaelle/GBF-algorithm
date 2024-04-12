function [] = GaussianPlots(f, grid, mu, xLow, xUpp)

% FUNCTION: Thie function GaussianPlots produces a plot of the function f on the interval
% [xLow, xUpp] along with the eventual sign-changing roots.
%
% INPUTS:
%   f = a function for a SISO function: y = f(x)
%   grid = sign-changing roots of the function f
%   xLow = the lower search bound
%   xUpp = the upper search bound
%   mu = % mu = means of the gaussians in the mixture

if isempty(grid)

    fprintf('The function has no sign-changing roots on the real line\n');

    hold on

    interv = double([min(mu)-4, max(mu)+4]);

    fplot(f, interv,'black','LineWidth',0.8);

    hline=refline(0,0);

    hline.Color = 'k';

    xline(interv,'-.b','LineWidth',0.8);

    title('Sign-Changing Roots of f');

    hold off

else

    interv = double([xLow xUpp]);

    fplot(f, interv,'black','LineWidth',0.8);

    grid = double(grid);

    hold on

    xline(interv ,'-.b','LineWidth',0.8);

    plot(grid,0,'ro');

    hline=refline(0,0);

    hline.Color = 'k';

    title('Sign-Changing Roots of f');

    fprintf('The function has %d sign-changing roots in [%e., %e.] \n',length(grid),xLow,xUpp);

    hold off

end

end