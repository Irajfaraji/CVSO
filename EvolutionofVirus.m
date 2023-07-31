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

function society=EvolutionofVirus(society, Iteration)


    global ProblemSettings;
    global CSOSettings;
        
    CostFunction=ProblemSettings.CostFunction;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    nVar=ProblemSettings.nVar;
    VarSize = [1 nVar];
    Ne=CSOSettings.Ne;
    it=Iteration;
    for i=1:numel(society)
        for jj=1:Ne
            newsol.Position =[];
            newsol.Cost =[];
            newsol.Position = society(i).Position + (rand/it) * randn(VarSize);
            newsol.Position=min(max(newsol.Position,VarMin),VarMax);
            newsol.Cost=feval(CostFunction,newsol.Position);
    
            if newsol.Cost<society(i).Cost
                society(i).Position=newsol.Position;
                society(i).Cost=newsol.Cost;   
            end
        end
    end

end

