%% Corona Virus Search Optimizer (CVSO)
% 
% Developed in MATLAB R2021b
% The code is based on the following paper:
% "The corona virus search optimizer for solving global and engineering optimization problems "  
% Keyvan Golalipour, Iraj Faraji Davoudkhani, Shohreh Nasri, Amirreza Naderipour, 
% Seyedali Mirjalili,Almoataz Y.Abdelaziz, Adel El-Shahat.
% Alexandria Engineering Journal, ISSN: 1110-0168,
% https://doi.org/.
% e-mail : faraji.iraj@gmail.com


function [BestSol,BestCost] = CVSO(nPop,Max_iteration,VarMin,VarMax,nVar,CostFunction)
%% Problem Definition

Ne=20;                     % Number of Evolution of any Virus
nSoc=2;                    % Number of Socities
nHum=20;                   % Number of People in a Society
Kd = 0.1;

% CostFunction=@(x) Function(x);
% nVar=30;                 % Number of Problem Variables
% VarMin=-2.048;           % Lower Bound of Problem Variables
% VarMax= -VarMin;         % Upper Bound of Problem Variables
% nPop=(nHum*nSoc)+nSoc;   % Number of population of Algorithm
% Max_iteration=5000;      % Number of Maximum Max_iterationation

%% CSO Settings
global CSOSettings ProblemSettings;
CSOSettings.nPop=nPop;
CSOSettings.nSoc=nSoc;
CSOSettings.nHum=nHum;
CSOSettings.Iter=Max_iteration;
CSOSettings.Ne=Ne;
CSOSettings.Kd=Kd;

ProblemSettings.CostFunction=CostFunction;
ProblemSettings.nVar=nVar;
ProblemSettings.VarMin=VarMin;
ProblemSettings.VarMax=VarMax;

%% Initialization

society=InitializeSocietiesofHumanandVirus();

BestSol.Position=[];
BestSol.Cost=[];

BestCost=zeros(CSOSettings.Iter,1);



for Iteration=1:Max_iteration
    
    society=SearchVirus(society,Iteration);
    

    
   society=ExchangeVirusWithBestHuman(society);
    
    society=EvolutionofVirus(society,Iteration);
    
    society=Travel(society);

    VirusCost=[society.Cost];
    [BestVirusCost BestVirusIndex]=min(VirusCost);
    BestVirus=society(BestVirusIndex);
    
    BestSol.Position=BestVirus.Position;
    BestSol.Cost=BestVirus.Cost;
    
    BestCost(Iteration)=BestVirusCost;
  
    
    disp(['Iteration =  ' num2str(Iteration) ...
          ': Best Cost = ' num2str(BestCost(Iteration))]);
     
end

%%

end

