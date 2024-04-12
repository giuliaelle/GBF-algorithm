function [mix] = GGM(n,mu,s,lambda)

% FUNCTION: The function GGM returns a MatlabFunction object representing
% the gaussian mixture we want to analyze

% INPUTS:
% n = dimension of the mixture, i.e. number of gaussians involved
% lambda = mixing coefficients or weights
% mu = means of the gaussians in the mixture
% s = variances of the gaussians in the mixture

% OUTPUTS:
% mix = gaussian mixture

gau=sym('gau',[1,n]);
mix = sym('mix',[1,1]);
x = sym('x');
mix=0;

for i=1:n
    gau(i)= (lambda(i)/sqrt(2*pi*s(i)))*exp(-(x-mu(i)).^2/(2*s(i)));
    mix = mix + gau(i);
end
mix=matlabFunction(vpa(mix));
end