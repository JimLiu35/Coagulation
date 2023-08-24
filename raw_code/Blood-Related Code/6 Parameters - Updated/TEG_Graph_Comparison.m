% Extracting TEG parameters MA, R, alpha, etc from TEG graph 

%% Data Import 

TEG_WB_experiment_data=xlsread('Trauma_WholeBloodTEG_data',1,'B2:Y902') ;
TEG_WB_experiment_time_sec=xlsread('Trauma_WholeBloodTEG_data',1,'A2:A902') ;
TEG_WB_experiment_time_min = TEG_WB_experiment_time_sec ./ 60 ;
TEG_WB_6_parameters=xlsread('ModelFitParameters - 2Piece B',1,'C3:H26');

%% Selecting a Data 
TEG_exp=TEG_WB_experiment_data;
tissuefactor=zeros(901,1) ;
tissuefactor(2:8)=10e-9 ;
T = linspace(0,75,901)';

% Y_exp = TEG_exp(:,i) ;

%% TEG Estimation
% k_est_B=[Kp1 Kn1 Kd1 Kp2 Kn2 Kd2];
% 
% WBTEG_sys_est_B= tf(k_est_B(2),[k_est_B(1) 1 0],'InputDelay',k_est_B(3)) + tf(-k_est_B(5),[k_est_B(4) 1 0],'InputDelay',k_est_B(6));
% Y_est_TEG_B=lsim(WBTEG_sys_est_B,tissuefactor,T) ;


%% Identifying Properties 
% Function output: [TEG_R,TEG_K,TEG_alpha,TEG_MA,TEG_Ly30,TEG_MAtime ]

clear TEG_exp_prop TEG_est_prop 
for count=1:24
    Y_exp = TEG_exp(:,count);
    TEG_exp_prop(count,:)=TEG_Graph_Property_Identifier(T,Y_exp,1);
%     
    k_est_B=TEG_WB_6_parameters(count,:);
    WBTEG_sys_est_B= tf(k_est_B(2),[k_est_B(1) 1 0],'InputDelay',k_est_B(3)) + tf(-k_est_B(5),[k_est_B(4) 1 0],'InputDelay',k_est_B(6));
    Y_est = lsim(WBTEG_sys_est_B,tissuefactor,T) ;
    TEG_est_prop(count,:)=TEG_Graph_Property_Identifier(T,Y_est,2);
    
%  
%     figure(1)
%     subplot(4,6,count)
%     plot(T,Y_exp/2,T,Y_est/2,'linewidth',3)
end
% 
Error_prop= abs(TEG_exp_prop-TEG_est_prop) ./ TEG_exp_prop*100;
Mean_error=mean(Error_prop,1);

%%
% Machine read TEG Parameters:
act_data=xlsread('ModelFitParameters - 2Piece B',1,'U3:Y26');

Error_prop_act_exp= abs(TEG_exp_prop(:,1:4)-act_data) ./ act_data*100;
Mean_error_act_exp=mean(Error_prop_act_exp,1)

Error_prop_act_est= abs(TEG_est_prop(:,1:4)-act_data) ./ act_data*100;
Mean_error_act_est=mean(Error_prop_act_est,1)
