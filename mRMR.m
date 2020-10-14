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


function [fitness,MIxy,MIxx,Km]=mRMR(X,Y,pop,MIxy,MIxx,Km,Ky)
FeatIndex=pop;
X = X(:,[FeatIndex]);
y=Y';
X=X';
[n_feat,~]=size(X);
MIxy_avg=0;
MIxx_avg=0;
count=0;
for i = 1:n_feat
    
    if (MIxy(FeatIndex(i))==0)
        [MIxy(FeatIndex(i)),Km]=kernelmi(X(i,:),y,Km,FeatIndex(i),Ky);

    end
    MIxy_avg=MIxy_avg+MIxy(FeatIndex(i));
    for j = i+1:n_feat
            count=count+1;
            if (MIxx(FeatIndex(i),FeatIndex(j))==0)
                [MIxx(FeatIndex(i),FeatIndex(j)),Km]=kernelmi1(X(i,:),X(j,:),Km,FeatIndex(i),FeatIndex(j));               
                MIxx(FeatIndex(j),FeatIndex(i))=MIxx(FeatIndex(i),FeatIndex(j));
            end
            MIxx_avg=MIxx_avg+MIxx(FeatIndex(i),FeatIndex(j));
    end
end

MIxy_avg=MIxy_avg/n_feat;

if count>0
   MIxx_avg=MIxx_avg/count;
else
    MIxx_avg=0;    
end


fitness=-(MIxy_avg-MIxx_avg);


            
    