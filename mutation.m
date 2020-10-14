%----------------------------------------------------------------
% TAGA: Tabu Asexual Genetic Algorithm Embedded in a Filter/Filter Feature Selection Approach for High-dimensional Data
% by Sadegh Salesi, Georgina Cosma and Michalis Mavrovouniotis %
% Programmed by Dr Sadegh Salesi%
% Last revised:  October 2020     %
% Reference: Salesi, Cosma and Mavrovouniotis. TAGA: Tabu Asexual Genetic
% Algorithm Embedded in a Filter/Filter Feature Selection Approach for
% High-dimensional Data. Elsevier Information Sciences
% Copyright (c) 2020, Sadegh Salesi, Georgina Cosma and Michalis Mavrovouniotis. All rights reserved.
% -----------------------------------------------------------------


function  [mutpop,MIxy,MIxx,Km,tabu,b]=mutation(mutpop,pop,nvar,X,Y,nmut,popsize,nsel_feat,MIxy,MIxx,Km,Ky,tabu,b)

k=1;
for n=1:nmut
i=randi([1 popsize]);  

p=pop(i).var;

j1=randi([1 nsel_feat]);
j2=randi([nsel_feat+1 nvar]);

nj1=p(j1);
nj2=p(j2);

p(j1)=nj2;
p(j2)=nj1;

pval=sprintf('%d',sort(p(1:nsel_feat)));

if (sum(strcmp(pval,tabu))>0)
    b=b+1;
else
    mutpop(k).var=p;
    mutpop(k).sel=mutpop(k).var(1:nsel_feat);
   [mutpop(k).fit,MIxy,MIxx,Km]=mRMR(X,Y,mutpop(k).sel,MIxy,MIxx,Km,Ky);
    k=k+1;
    cont=numel(tabu)+1;
    tabu{cont}=pval;
end


end
mutpop(k:end)=[];

end