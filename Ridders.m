function xZero = Ridders(f, xLow, xUpp, eps)
%
% FUNCTION: The function Ridders uses Ridders' Method to return a root, xZero,
%     of a function f on the interval [xLow,xUpp]
%
% INPUTS:
%   f = a function for a SISO function: y = f(x)
%   xLow = the lower search bound
%   xUpp = the upper search bound
%   eps = accuracy level for the searching-root algorithm
%
% OUTPUTS:
%   xZero = the root of the function on the domain [xLow, xUpp]
%
% NOTES:
%   1) The function must be smooth
%   2) sign(f(xLow)) ~= sign(f(xUpp))
%   3) This function will return a root if one exists. 
%      If there are multiple roots, it will return the first one
%      that it finds. This should not happen in our setting, but could be
%      useful for other applications.

maxIter = 100;

fLow = f(xLow);

fUpp = f(xUpp);

xZero = [];

for i=1:maxIter

    xMid = 0.5*(xLow+xUpp);

    fMid = f(xMid);

    s = sqrt(fMid*fMid - fLow*fUpp);

    if s==0.00, return; end

    xTmp = (xMid-xLow)*fMid/s;

    if fLow >= fUpp

        xNew = xMid + xTmp;

    else

        xNew = xMid - xTmp;

    end
    xZero = xNew;

    fNew = f(xZero);

    if sign(f(xZero-eps)) ~= sign(f(xZero+eps)), break;

    end

    %Update
    if sign(fMid) ~= sign(fNew)

        xLow = xMid;

        fLow = fMid;

        xUpp = xZero;

        fUpp = fNew;

    elseif sign(fLow) ~= sign(fNew)

        xUpp = xZero;

        fUpp = fNew;

    elseif sign(fUpp) ~= sign(fNew)

        xLow = xZero;

        fLow = fNew;

    else

        error('Something bad happened in Ridders'' Method!');
        
    end

end

end

