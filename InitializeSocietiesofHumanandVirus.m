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

function society=InitializeSocietiesofHumanandVirus()

    global ProblemSettings;
    global CSOSettings;
    
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    nPop=CSOSettings.nPop;
    nSoc=CSOSettings.nSoc;
    nHum=CSOSettings.nHum;
    SnHum=nHum*nSoc;
    EmptyHuman.Position=[];
    EmptyHuman.Cost=[];
    
    People=repmat(EmptyHuman,nPop,1);
    for k=1:nPop
        People(k).Position=unifrnd(VarMin,VarMax,[1 nVar]);
        People(k).Cost=CostFunction(People(k).Position);
    end

    [SortedCosts CostsSortOrder]=sort([People.Cost]);
    People=People(CostsSortOrder);
    
    EmptySocial.Position=[];
    EmptySocial.Cost=[];
     EmptySocial.nHum=[];
    EmptySocial.People=[];
    
  society=repmat(EmptySocial,nSoc,1);
    for i=1:nSoc
       society(i).Position=People(i).Position;
      society(i).Cost=People(i).Cost;
        
    end
    
    People=People(nSoc+1:end);
%     if isempty(People)
%         return;
%     end
    

    People=People(randperm(SnHum));
    
    for i=1:nSoc
        society(i).nHum=nHum;
        society(i).People=People(1:nHum);
        People=People(nHum+1:end);
    end
    
end