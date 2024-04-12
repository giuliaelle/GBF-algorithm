function [L,R] = Interval(n,mu,sigma2,lambda)

% FUNCTION: The function Interval determines the finite interval on which we
% will test our GGM. The idea is to find a finite closed interval that
% excludes the tails of the GGM. This is due for computational purposes in
% order to
% 1) reduce the computational cost of the searching algorithm along the
%    tails of the GGM;
% 2) avoid to run the searching algorithm where the GGM is flattened on the
%    x axis and takes values very close to zero.

% INPUTS:

% n = dimension of the mixture, number of gaussians
% mu = array containing the means of the gaussians
% sigma2 = array containing the variances of the gaussians
% lambda = array containing the mixing coefficients of the mixture

% OUTPUTS:

% L = left endpoint
% R = right endpoint

% NOTES:

% 1) If both L and R are empty then there is no sign-changing root and we
% don't need to run the whole algorithm


x = sym('x');

g=sym('g',[1,n]);

h=sym('h',[1,n]);

gau=sym('gau',[1,n]);

mix = sym('mix',[1,n]);

mix = 0;


for i=1:n

    h(i)=vpa(abs(lambda(i))/sqrt(2*pi*sigma2(i)));

    g(i)= vpa(exp(-(x-mu(i)).^2/(2*sigma2(i))));

    gau(i)=h(i)*g(i);

    mix = mix + gau(i);

end

param = sym('param',[3,n]);

param(1,:) = vpa(mu);

param(2,:) = vpa(sigma2);

param(3,:) = vpa(lambda);

sigmamax = max(sigma2);

% index of the largest variance

index = find( param(2,:) == max (param(2,:), [],'all') );

mumax = param(1,index);

lambdamax = param(3,index);

% Left tail

muL = min(mumax);

indexL = find (mu == muL);

lambdaL = lambda(indexL);

if lambdaL > 0

    set = find( param(3,:) < 0 );

else

    set = find( param(3,:) > 0 );

end

lset = length(set);

% Left tail

rrL = [];

for i = 1 : lset

    gdiv(i) = gau(set(i))/gau(indexL);

    rrL = [ rrL min(solve(gdiv(i) == 1/(lset+1))) ];

end

L = min(rrL);

% Right tail

muR = max(mumax);

indexR = find (mu == muR);

lambdaR = lambda(indexR);

if lambdaR > 0

    set = find( param(3,:) < 0 );

else

    set = find( param(3,:) > 0 );

end

lset = length(set);

% Right tail

rrR = [];

for i = 1 : lset

    gdiv(i) = gau(set(i))/gau(indexR);
    
    rrR = [ rrR max(solve(gdiv(i) == 1/(lset+1))) ];

end


R = max(rrR);

end