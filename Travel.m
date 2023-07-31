%--------------------------------------------------------------------------
%% Corona Virus Search Optimizer (CVSO) V1.0
% Developed in MATLAB R2021b
% The code is based on the following paper:
% "The corona virus search optimizer for solving global and engineering optimization problems "  
% Keyvan Golalipour, Iraj Faraji Davoudkhani, Shohreh Nasri, Amirreza Naderipour, 
% Seyedali Mirjalili,Almoataz Y.Abdelaziz, Adel El-Shahat.
% Alexandria Engineering Journal, ISSN: 1110-0168,
% https://doi.org/.
% e-mail : faraji.iraj@gmail.com
%--------------------------------------------------------------------------

function society=Travel(society)

    global ProblemSettings;
    global CSOSettings;
    
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    nPop=CSOSettings.nPop;
    nSoc=CSOSettings.nSoc;
    nHum=CSOSettings.nHum;
    
    %Travel
    VS = [1 numel(society)];
KK=rand(1,numel(society)).*(1-rand(1,numel(society)));
KK=sort([KK]);
BB=[];

for i=1:numel(society)
  KK(i)=  round(KK(i)*society(i).nHum);
society(i).nHum=society(i).nHum-KK(i);
BB (i)=society(i).nHum;
end
 WW=randperm(numel(society));
    for jj=1:numel(society)
     society(WW(jj)).nHum=society(WW(jj)).nHum+KK(jj);
      te=1;
        for j2=BB (WW(jj))+1:society(WW(jj)).nHum
        society(WW(jj)).People(j2).Position=society((jj)).People(te).Position;
       society(WW(jj)).People(j2).Cost=society(jj).People(te).Cost;
       te=te+1;
            
        end
    end
    
       
end
