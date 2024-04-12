function [mix,num,den,P] = SequenceGBF(n,mu,s,lambda)

% FUNCTION:

% The function SequenceGBF computes the GBF sequence

% INPUTS:
% n = dimension of the mixture, number of gaussians
% mu = array containing the means of the gaussians
% sigma2 = array containing the variances of the gaussians
% lambda = array containing the mixing coefficients of the mixture

% OUTPUTS:
% mix = GBF sequence
% num = polynomial part of the last non-zero function in the GBF sequence
% den = denominators of the functions in the GBF sequence

% NOTES:

% 1) The function computes the GBF sequence using the Wronskian approach.
% 2) The determinants are computed via gaussian elimination by relying on
%   the code developed by Sergey Kasyanov (2022).
% The function is available as GaussElimination at
% https://www.mathworks.com/matlabcentral/fileexchange/90661-gausselimination, MATLAB Central File Exchange.

x = sym('x','real');

g=sym('g',[1,n]);

h=sym('h',[1,n]);

gau=sym('gau',[1,n]);

mix = sym('mix',[1,n]);

num=sym('num',[1,1]);

den =sym('den',[1,n]);

P=sym('P',[n,n]);

mat = sym('mat',[n,n]);

coeff = sym('coeff',[n,n]);

C =  sym('coeff',[1,n]);


P(:,:)= 1;

mix(:,:) = 0;

coeff(:,:) = 0;

den(:,:) = 1;

C(:) = 1;

for i=1:n

    h(i)=lambda(i)/sqrt(2*pi*s(i));

    g(i)= exp(-(x-mu(i)).^2/(2*s(i)));

    gau(i)=h(i)*g(i);

    mix(1) = mix(1) + gau(i);

end

mat(1,:)=1;

% Here we create the matrix

for j = 2 : n

    for i = 1 : n

        mat(j,i) = collect(vpa(-1/(sqrt(2*s(i)))^(j-1)*hermiteH(j-1,(x-mu(i))/(sqrt(2*s(i))))),x);

    end

end

% Here we compute the determinants

for j = 2 : n

    P(j,j) = collect(vpa(prod(diag(GaussElimination(mat(1:j,1:j))))),x);

    coeff(j,j) = max(vpa(abs(coeffs(P(j,j),x))));

    for i = j+1 : n

        mpr = [mat(1:j,1:j-1) mat(1:j,i)];

        P(j,i) = collect(vpa(prod(diag(GaussElimination(mpr)))),x);

        coeff(j,i) = max(vpa(abs(coeffs(P(j,i),x))));


    end

    C(j) = max(coeff(j,:));

end

for j = 2 : n

    den(j) = P(j-1,j-1);

    for i = j : n

        mix(j) = mix(j) + gau(i)*simplify(P(j,i)/C(j));

    end

end

mix = vpa(mix);

den = vpa(den);

num = vpa(simplify(P(n,n)/C(n)));

end