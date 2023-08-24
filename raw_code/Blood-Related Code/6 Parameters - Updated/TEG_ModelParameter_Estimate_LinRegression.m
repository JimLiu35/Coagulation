%Linear Regression WB TEG Parameter Estimation
%% Import Data 
% Model Fit Parameters: [Kp1, Kn1, Kd1, Kp2, Kn2, Kd2]
TEG_WB_6_parameters=xlsread('ModelFitParameters - 2Piece B',1,'C3:H26');

% Coagulation Measurements [II, V, VII, VIII, IX, X, ATIII, PC, Fibrinogen, ddimer, platelet]
TEG_24tra_CoagFac_data=xlsread('ModelFitParameters - 2Piece B',1,'I3:S26');

% Machine read TEG Parameters: [R, K, alpha, MA, Ly30]
TEG_24tra_MachProp=xlsread('ModelFitParameters - 2Piece B',1,'U3:Z26');

%% Linear Regression 
% yy=MA_CN; xx1=MA_FF; xx2=LAB_Platelet_Count./100;
% md1=fitlm([xx1, xx2],yy)
% plot(md1)

% Kp1 and Kd1 based on 8 coagulation factors 
XEstimateData=TEG_24tra_CoagFac_data(:,1:8);
YEstimateTarget=TEG_WB_6_parameters(:,1);
md1=fitlm(XEstimateData,YEstimateTarget)

Regression_weight=md1.Coefficients.Estimate;

eval=[ones(length(XEstimateData),1),XEstimateData]*Regression_weight
YEstimateTarget-eval