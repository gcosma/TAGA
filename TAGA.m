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

clc
clear
close all
format shortG
close all
format shortG

%% Load dataset
dataset_name= 'GLI_85';
load(dataset_name)
X_original = X;



%% filtering out elite features through fisher score
N_filter=100;  %number of elite features to be filtered out
rank=fsFisher(X_original,Y); %rank features
X=(X_original(:,rank(1:N_filter))); %reduce dataset to cintain elite features

%% mutual information parameters
[Mx,nvar]=size(X);

MIxx=zeros(nvar,nvar); %mutual information matrix between pairs of features
MIxy=zeros(1,nvar); %mutual information matrix between features and target

% Kx

mat.var=zeros(size(X,1),size(X,1));
Km=repmat(mat,size(X,2),1);

% Ky

alpha = 0.1;
h = (Mx +1) / sqrt(4) / Mx ^ (1 + alpha);
y = ctransform(Y');
h2 = 2*h^2;
Ky = squareform(exp(-ssqd([y;y])/h2))+eye(Mx);


%% GA parameters
popsize=100;
nfeat= 10; %number of features in the final subset 1 <= nfeat < N_filter 
maxiter=200; %number of iteration to evolve initial population

if (nfeat==1)
    pm=1;
else
    pm=0.02;
end

nmut=round(popsize*pm*nfeat); %number of mutate chromosomes



%% initial population algorithm
emp.var=[];
emp.sel=[];
emp.fit=[];
 
pop=repmat(emp,popsize,1);

for i=1:popsize
    pop(i).var=randperm(nvar);
    pop(i).sel=pop(i).var(1:nfeat);
   [pop(i).fit,MIxy,MIxx,Km]=mRMR(X,Y,pop(i).sel,MIxy,MIxx,Km,Ky);
    tabu{i}=sprintf('%d',sort(pop(i).sel));
end

[~,index]=min([pop.fit]);
gpop=pop(index);
ini=gpop.fit;

%% main loop algorithm
b=0;
BEST=zeros(maxiter,1);

for iter=1:maxiter
 
  
   % mutation
   mutpop=repmat(emp,nmut,1);   
  [mutpop,MIxy,MIxx,Km,tabu,b]=mutation(mutpop,pop,nvar,X,Y,nmut,popsize,nfeat,MIxy,MIxx,Km,Ky,tabu,b);
   
  [pop]=[pop;mutpop];
  [~,index]=sort([pop.fit]); 
   pop=pop(index);
   gpop=pop(1);
   pop=pop(1:popsize); 
       
BEST(iter)=gpop.fit;

disp([' Iter = ' num2str(iter)  ' BEST = ' num2str(BEST(iter)) ])

end
disp([' Selected features are = ' num2str(rank([gpop.sel]))])
Reduced_dataset=X(:,[gpop.sel]); %the reduced dataset (the last column is the target)
Reduced_dataset=[Reduced_dataset,Y];
 

