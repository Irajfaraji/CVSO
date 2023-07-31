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


clear all 
close all
clc

disp('Mountaineering Team-Based Optimization ');

Function_name='F2';    % the number of function
Max_iteration=1000;      % Maximum numbef of iterations
nPop = 100;             % the number of population

% Load details of the selected benchmark function
[VarMin,VarMax,nVar,CostFunction]=Get_Functions_details(Function_name);

[BestSol,BestCost] = CVSO(nPop,Max_iteration,VarMin,VarMax,nVar,CostFunction);

Best_score = BestSol.Cost;
Best_pos = BestSol.Position;

figure(1)
subplot(1,2,1);
func_plot(Function_name);
title('Test function')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
grid off
subplot(1,2,2);
semilogy(BestCost,'Color','b')
title('Convergence curve')
xlabel('Iteration');
ylabel('Best flame (score) obtained so far');
axis tight
grid on
box on
legend('CVSO')
set(gcf,'position',[250,160,900,400])  


display(['The best solution obtained by CVSO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by MTBO is : ', num2str(Best_score)]);

