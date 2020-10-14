% Author: Mikhail (2020). Kernel estimate for (Conditional) Mutual Information 
%(https://www.mathworks.com/matlabcentral/fileexchange/30998-kernel-estimate-for-conditional-mutual-information), 
%MATLAB Central File Exchange. Retrieved October 14, 2020.

function [ ar ] = ctransform(a)
% Copula-transform array - rank and scale to [0, 1]
    [~, ai] = sort(a, 2);
    [~, ar] = sort(ai, 2);
    ar = (ar - 1) / (size(ar, 2) - 1);
end

