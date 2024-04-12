function [] = Control(n,lambda)

% FUNCTION: The function Control computes the sum of the lambda coefficients.
% If the sum is equal to 1 the integral over R of the resulting GGM in equal to 1.

% INPUTS:
% n = dimension of the mixture, number of gaussians
% lambda = array containing the mixing coefficients of the mixture

% NOTES: 
% There is no output because the function returns only a string with the
% result of the check.

sum=0;

for i=1:n
    
    sum = sum + lambda(i);
end

if  sum == 1
    
      disp('The integral is equal to 1');
      
else
    
      disp('The integral is not equal to 1');
    
end

end