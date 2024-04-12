function [grid] = SimpleGrid(xLow,xUpp,num,mix,den,eps)

% FUNCTION: The function SimpleGrid computes the sign-changing roots of the
% function f (if there is any)

% INPUTS:
% xLow = left endpoint
% xUpp = right endpoint
% num = polynomial part of the last non-zero function in the GBF sequence
% mix = GBF sequence
% den = denominators of the functions in the GBF sequence
% eps = accuracy level for the searching-root algorithm

% OUTPUTS:
% grid = sign-changing roots of the function f

% NOTES:
% We start by computing the roots of the last non-zero GBF function on the
% interval [xLow xUpp]. Since by construction this function is a rational
% function multiplied by a gaussian, we only need to compute the roots of
% the numerator of that rational function, hence of a polynomial. Further
% to that, we compute the roots of the denominator and add them to the
% grid.

n = length(mix);

x = sym('x');

grid_step = [];

grid_step = solve(num==0,x>= xLow, x <=xUpp)';

cden = vpa(unique(solve(den(n)==0,x>= xLow, x <=xUpp)))';

grid_step=vpa(unique([xLow xUpp grid_step cden]));

% Here we apply the iterative procedure to compute the sign-changing roots
% of the function f

for j=n-1:-1:1

    cden = solve(den(j)==0,x>= xLow, x <=xUpp)';

    grid_step = vpa(unique([grid_step cden]));

    rr = Accuracy(vpa(unique(FindRoots(mix(j),grid_step,eps))),eps);

    % The function Accuracy is applied to be sure that all elements of rr
    % have a distance of at least eps

    grid_step = unique([grid_step rr]);

    if j == 1

        grid_step = rr;

    end

end

grid = unique(grid_step);

end
