function [g_root] = FindRoots(f,grid,eps)

% FUNCTION : The function FindRoots returns the sign-changing roots (if there are any) of the
% function f on a given grid by applying Ridders' method

% INPUTS:
% f = function to be tested
% grid = simple grid on which we look for sign-changing roots
% eps = accuracy level for the searching-root algorithm

% OUTPUTS:
% g_root = sign-changing roots

% NOTES:
% 1) The function FindRoots performs Ridders' method only if
% the function f differs in sign at the endpoints

f = matlabFunction(f);

g_root = [];

signs = sign(f(grid));

for i = 1:length(grid)-1

    interv = [grid(i),grid(i+1)];

    if signs(i) ~= signs(i+1)

            root = Ridders(f,interv(1),interv(2),eps);

        g_root = unique([g_root root]);

    end

end

