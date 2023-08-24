%TEG Estimate 5 fold cross validation 
%% DATA Importation 
TEG_WB_experiment_data=xlsread('Trauma_WholeBloodTEG_data',1,'B2:Y902') ;
TEG_WB_experiment_time_sec=xlsread('Trauma_WholeBloodTEG_data',1,'A2:A902') ;
TEG_WB_experiment_time_min = TEG_WB_experiment_time_sec ./ 60 ;

TEG_WB_Fit_Parameters=xlsread('ModelFitParameters - 2Piece B',1,'C3:H26');
TEG_WB_Factor_Concentration=xlsread('ModelFitParameters - 2Piece B',1,'I3:S26');

WB_Fit_Par=TEG_WB_Fit_Parameters([1:5,7,11,13:15,20:24],:) ;   %Unreasonable Ly30, d-dimer
WB_Factors=TEG_WB_Factor_Concentration([1:5,7,11,13:15,20:24],:) ;
TEG_exp = TEG_WB_experiment_data(:,[1:5,7,11,13:15,20:24]) ;


%%
TEG_EXP_5fold=TEG_exp;%magnitude of 1e-9
% RandomShuffle=[20,7,15,3,14,8,11,16,17,9,18,2,6,19,10,12,13,4,1,5];%randperm(20);
RandomShuffle=randperm(15);
TEG_EXP_5fold=TEG_EXP_5fold(:,RandomShuffle);
% u_arx=zeros(121,1) ;
% u_arx(1:3,1)=6*1e-12 ;
% T_arx = linspace(0,40,121)';
elem=size(TEG_EXP_5fold,2)/5; %number of elements in each fold

tissuefactor=zeros(901,1) ;
tissuefactor(2:8)=10e-9 ;
T = linspace(0,75,901)';
clear Prop_Fold_Error_TABLE

for q=2
    clear TrainCAT_data ARX_sys ParamTable_est ParamTable_exp
    if q==1
        Train_WB_Fit_Par=WB_Fit_Par([q*elem+1:end],:);
        Val_WB_Fit_Par=WB_Fit_Par([1:q*elem],:);
        Train_WB_Factors=WB_Factors([q*elem+1:end],:);
        Val_WB_Factors=WB_Factors([1:q*elem],:);
        Train_EXP=TEG_EXP_5fold([q*elem+1:end],:);
        Val_EXP=TEG_EXP_5fold(:,[1:q*elem]);
    elseif q==5 
        Train_WB_Fit_Par=WB_Fit_Par([1:(q-1)*elem],:);
        Val_WB_Fit_Par=WB_Fit_Par([(q-1)*elem+1:end],:);
        Train_WB_Factors=WB_Factors([1:(q-1)*elem],:);
        Val_WB_Factors=WB_Factors([(q-1)*elem+1:end],:);
        Train_EXP=TEG_EXP_5fold([1:(q-1)*elem],:);
        Val_EXP=TEG_EXP_5fold(:,[(q-1)*elem+1:end]);
    else
        Train_WB_Fit_Par=WB_Fit_Par([1:elem*(q-1),elem*q+1:end],:);
        Val_WB_Fit_Par=WB_Fit_Par([elem*(q-1)+1:elem*q],:);
        Train_WB_Factors=WB_Factors([1:elem*(q-1),elem*q+1:end],:);
        Val_WB_Factors=WB_Factors([elem*(q-1)+1:elem*q],:);
        Train_EXP=TEG_EXP_5fold([1:elem*(q-1),elem*q+1:end],:);
        Val_EXP=TEG_EXP_5fold(:,[elem*(q-1)+1:elem*q]);
    end
    
    Regression_weight=zeros(12,6);
    % Kp1 
    md1=fitlm(Train_WB_Factors(:,1:8),Train_WB_Fit_Par(:,1));
    Regression_weight(1:9,1)=md1.Coefficients.Estimate;
    eval1=[ones(3,1),Val_WB_Factors(:,1:8)]*Regression_weight(1:9,1);
    Kp1_eval=eval1;

    %Kn1
    md1=fitlm(Train_WB_Factors(:,[1:9,11]),Train_WB_Fit_Par(:,2));
    Regression_weight(1:11,2)=md1.Coefficients.Estimate;
    eval1=[ones(3,1),Val_WB_Factors(:,[1:9,11])]*Regression_weight(1:11,2);
    Kn1_eval=eval1;

    %Kd1
    md1=fitlm(Train_WB_Factors(:,1:8),Train_WB_Fit_Par(:,3));
    Regression_weight(1:9,3)=md1.Coefficients.Estimate;
    eval1=[ones(3,1),Val_WB_Factors(:,1:8)]*Regression_weight(1:9,3);
    Kd1_eval=eval1;

    %Kp2
    md1=fitlm(Train_WB_Factors(:,:),Train_WB_Fit_Par(:,4));
    Regression_weight(1:12,4)=md1.Coefficients.Estimate;
    eval1=[ones(3,1),Val_WB_Factors(:,:)]*Regression_weight(1:12,4);
    Kp2_eval=eval1;

    %Kn2
    md1=fitlm(Train_WB_Factors(:,:),Train_WB_Fit_Par(:,5));
    Regression_weight(1:12,5)=md1.Coefficients.Estimate;
    eval1=[ones(3,1),Val_WB_Factors(:,:)]*Regression_weight(1:12,5);
    Kn2_eval=eval1;

    %Kd2
    md1=fitlm(Train_WB_Factors(:,:),Train_WB_Fit_Par(:,6));
    Regression_weight(1:12,6)=md1.Coefficients.Estimate;
    eval1=[ones(3,1),Val_WB_Factors(:,:)]*Regression_weight(1:12,6);
    Kd2_eval=eval1;

    TEG_model_eval_Param=[Kp1_eval, Kn1_eval, Kd1_eval, Kp2_eval, Kn2_eval, Kd2_eval];
    
    Param_Fold_error(q,:)=mean(((abs(TEG_model_eval_Param-Val_WB_Fit_Par))./(Val_WB_Fit_Par))*100,1);
    
    for count=1:3 

        k_est_B=TEG_model_eval_Param(count,:);
        WBTEG_sys_est_B= tf(k_est_B(2),[k_est_B(1) 1 0],'InputDelay',max(k_est_B(3),0)) + tf(-abs(k_est_B(5)),[k_est_B(4) 1 0],'InputDelay',max(0,k_est_B(6)));
        Y_est_TEG=lsim(WBTEG_sys_est_B,tissuefactor,T) ;
        [Y_est_peak,i_m]=max(Y_est_TEG./2);
        AUC_est=trapz(T,Y_est_TEG./2);

        Y_exp = Val_EXP(:,count) ;
        [Y_exp_peak,i_m]=max(Y_exp./2);
        T_exp_peak= TEG_WB_experiment_time_min(i_m) ;
        AUC_exp=trapz(T,Y_exp./2);

        %Func_out=[TEG_R,TEG_K,TEG_alpha,TEG_MA,TEG_Ly30,TEG_MAtime]
        Func_out=TEG_Graph_Property_Identifier(T,Y_est_TEG,2);
        ParamTable_est(count,:)=[Y_est_peak,AUC_est,Func_out];
        Func_out=TEG_Graph_Property_Identifier(TEG_WB_experiment_time_min,Y_exp,1);
        ParamTable_exp(count,:)=[Y_exp_peak,AUC_exp,Func_out];
    end
    
    Prop_Fold_Error_TABLE(q,:)=mean(((abs(ParamTable_est-ParamTable_exp))./ParamTable_exp)*100,1);
end

Param_Fold_error
mean(Param_Fold_error)

% Five_fold_results=[18.9219   35.5211   61.2566   27.6190    7.8964   18.9055
%    10.2916    8.6132   48.8606   25.0000    5.0286    4.9216
%    15.3919   17.7187   61.6809   37.6389    1.4715   15.8893
%    13.6630    7.9085   66.9144   21.6667   21.3386   13.7495
%     4.4194    5.4021   23.3333    6.5640   12.9568    4.1643]