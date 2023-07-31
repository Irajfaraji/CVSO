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

function society=ExchangeVirusWithBestHuman(society)

    for i=1:numel(society)
        
        cc=[society(i).People.Cost];
        [min_cc min_cc_index]=min(cc);
        
        if min_cc<=society(i).Cost
            
            BestHuman=society(i).People(min_cc_index);
            
            society(i).People(min_cc_index).Position=society(i).Position;
            society(i).People(min_cc_index).Cost=society(i).Cost;
            
            society(i).Position=BestHuman.Position;
            society(i).Cost=BestHuman.Cost;
            
        end
        
    end

end