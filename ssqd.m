% Coppied from: Mikhail (2020). Kernel estimate for (Conditional) Mutual Information 
%(https://www.mathworks.com/matlabcentral/fileexchange/30998-kernel-estimate-for-conditional-mutual-information), MATLAB Central File Exchange. Retrieved October 14, 2020.

function d = ssqd(X)
% Taken from Matlab pdist.m
% Computes pairwise sum of squared differences between rows of X
% Use squareform(.) to convert to square symmetric distance matrix
    [p,n] = size(X);
    d = zeros(1,n*(n-1)./2);
    k = 1;
    for i = 1:n-1
            ssq = zeros(1, n-i);
            for q = 1:p
                ssq = ssq + (X(q, i) - X(q,(i+1):n)).^2;
            end
            d(k:(k+n-i-1)) = ssq;
            k = k + (n-i);
    end
end