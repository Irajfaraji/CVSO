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

function society=SearchVirus(society, Iteration)
    global ProblemSettings;
    global CSOSettings;

    CostFunction=ProblemSettings.CostFunction;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    nVar=ProblemSettings.nVar;
    VarSize = [1 nVar];
    it=Iteration;
    Kd=CSOSettings.Kd;
    for i=1:numel(society)
        for j=1:society(i).nHum
            LLL=society(i).People(j).Cost;
            kk3=society(i).People(j).Position;
            Di=society(i).Position-society(i).People(j).Position;
            if society(i).People(j).Cost<(1+(abs(randn)^it))*society(i).Cost
                society(i).People(j).Position=society(i).People(j).Position+rand(size(Di)).*Di;
            else
                society(i).People(j).Position=society(i).Position+rand(size(Di)).*Di;
            end
            
           society(i).People(j).Position=min(max(society(i).People(j).Position,VarMin),VarMax);
           society(i).People(j).Cost=CostFunction(society(i).People(j).Position);

           if society(i).People(j).Cost>LLL
               if rand <Kd
                   society(i).People(j).Position=unifrnd(VarMin, VarMax, VarSize);
               else
                   society(i).People(j).Position=kk3;
                   society(i).People(j).Cost=LLL;
               end
           end
            
        end
    end
end