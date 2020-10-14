%----------------------------------------------------------------
% TAGA: Tabu Asexual Genetic Algorithm Embedded in a Filter/Filter Feature Selection Approach for High-dimensional Data
% by Sadegh Salesi, Georgina Cosma and Michalis Mavrovouniotis %
% Programmed by Dr Sadegh Salesi%
% Last revised:  October 2020     %
% Reference: Salesi, Cosma and Mavrovouniotis. TAGA: Tabu Asexual Genetic
% Algorithm Embedded in a Filter/Filter Feature Selection Approach for
% High-dimensional Data. Elsevier Information Sciences
% Copyright (c) 2020, Sadegh Salesi, Georgina Cosma and Michalis Mavrovouniotis. All rights reserved.
% ---------------------------------------------------------------

% Adapted from : Mikhail (2020). Kernel estimate for (Conditional) Mutual Information (https://www.mathworks.com/matlabcentral/fileexchange/30998-kernel-estimate-for-conditional-mutual-information), MATLAB Central File Exchange. Retrieved October 14, 2020.

function [ I,Km ] = kernelmi1( x, y,Km,no,no1)
% Kernel-based estimate for mutual information I(X, Y)
% h - kernel width; ind - subset of data on which to estimate MI
[~, Mx]=size(x);

alpha = 0.1;
h = (Mx + 1) / sqrt(4) / Mx ^ (1 + alpha);
% h=0.92;

ind = 1:Mx;

h2 = 2*h^2;

% Copula-transform variables

%% Pointwise values for kernels

% Km
if (Km(no).var(1,1)==0)
    x = ctransform(x);
    Kx = squareform(exp(-ssqd([x;x])/h2))+eye(Mx);
    Km(no).var=Kx;
else
    Kx=Km(no).var;
end

if (Km(no1).var(1,1)==0)
    y = ctransform(y);
    Ky = squareform(exp(-ssqd([y;y])/h2))+eye(Mx);
    Km(no1).var=Ky;
else
    Ky=Km(no1).var;
end

%Ky
% y = ctransform(y);
% Ky = squareform(exp(-ssqd([y;y])/h2))+eye(Mx);

%Kernel sums for marginal probabilities
Cx = sum(Kx);
Cy = sum(Ky);

% Kernel product for joint probabilities
Kxy = Kx.*Ky;

f = sum(Cx.*Cy)*sum(Kxy)./(Cx*Ky)./(Cy*Kx);
I = mean(log(f(ind)));

% end

