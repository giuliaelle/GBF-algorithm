function [v] = Accuracy(v,eps)

% FUNCTION: The function Accuracy, given a sorted array of real numbers v, keeps
% only entries which are distant from each other at least eps

% INPUTS:
% v = array of real numbers
% eps = accuracy level, if two values are distant from each other less than
% eps, then the function deletes the bigger one

% OUTPUTS:
% v = array of real numbers distant from each other at least eps

l = length(v);

if l>1

    for i= l-1:1

        if vpa(v(i+1) - v(i)) < eps

            v(i+1) = [];

        end

    end

end

end
