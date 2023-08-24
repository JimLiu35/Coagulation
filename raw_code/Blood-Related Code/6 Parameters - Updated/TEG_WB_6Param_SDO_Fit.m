% TEG_WB_6ParamSDO_Fit

TEG_WB_experiment_data=xlsread('Trauma_WholeBloodTEG_data',1,'B2:Y902') ;
TEG_WB_experiment_time_sec=xlsread('Trauma_WholeBloodTEG_data',1,'A2:A902') ;
TEG_WB_experiment_time_min = TEG_WB_experiment_time_sec ./ 60 ;
%%

TEG_exp=TEG_WB_experiment_data;
tissuefactor=zeros(901,1) ;
tissuefactor(2:8)=10e-9 ;
T = linspace(0,75,901)';
input=[T,tissuefactor];

%% Exp data select
i=2;
Y_exp = TEG_exp(:,i) ;
output=[T,Y_exp];

%% Model A - One piece Fit result
%Initial guess
K0=.0004373;
K1=0.155;
K2=0.9698;
K3=0.8828;
Kn=1.489e9;
Kd=5;

%% Update Set A
k_est_A=[K0 K1 K2 K3 Kn Kd];

%% Estimation / Model Evaluation 
WBTEG_sys_est= tf(k_est_A(5),[1 k_est_A(4) k_est_A(3) k_est_A(2) k_est_A(1)],'InputDelay',k_est_A(6));
Y_est_TEG=lsim(WBTEG_sys_est,tissuefactor,T) ;

plot(T,Y_exp,T,Y_est_TEG)

% R-squared 
RSquaredValue(Y_exp, Y_est_TEG)


%% Model B - two piece

Kp1 = 5  ;
Kn1= 2.5e10 ; 
Kd1 = 2  ; 
Kn2= 2.5e10 ;
Kp2= 5 ;
Kd2= 35 ;

%% Update Set B
k_est_B=[Kp1 Kn1 Kd1 Kp2 Kn2 Kd2];

%% Estimation / Model Evaluation  Model B

WBTEG_sys_est_B= tf(k_est_B(2),[k_est_B(1) 1 0],'InputDelay',k_est_B(3)) + tf(-k_est_B(5),[k_est_B(4) 1 0],'InputDelay',k_est_B(6));
Y_est_TEG_B=lsim(WBTEG_sys_est_B,tissuefactor,T) ;

plot(T,Y_exp,T,Y_est_TEG_B)

% R-squared 
RSquaredValue(Y_exp, Y_est_TEG_B)

%% Exp data select
i=6;
Y_exp = TEG_exp(:,i) ;
output=[T,Y_exp];

%%
k_est_B=[Kp1 Kn1 Kd1 Kp2 Kn2 Kd2];
TEG_Fit_ModelB(i,1)=i;
TEG_Fit_ModelB(i,2:7)=k_est_B;

%%
% %% Fit Data Save - 6 parameter A and B
% TEG_Fit_Data_AB=[TEG_Fit_Data_AB; i k_est_A k_est_B]
% 
% %% f
% for i=1:24
%     Y_exp = TEG_exp(:,i) ;
%     figure(1)
%     subplot(4,6,i)
%     plot(T,Y_exp)
% end
% 
        
        
        