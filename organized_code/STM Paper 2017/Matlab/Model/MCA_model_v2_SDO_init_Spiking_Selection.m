

clear all;
close all;
clc;

format long e;

%%

%parameters to set

TF_init = 5; %units of pM
%Ts = 1e-2; %duration of impulse

%VisualNum = 9; % 1--?? 



%guesses
k0 = 1.25;
k1 = 3.75;
k2 = 2.5;
kn = 12;  %10 for VisualNum = 5, 30 for VisualNum = 9
kd = 1.5;

TcheckColIndex = 1;
CATColIndex = 3;

% %manual index calculations based on data structure
% 
% if VisualNum < 7
%     TcheckColIndex = 1;
%     CATColIndex = TcheckColIndex + VisualNum;
% elseif VisualNum < 12
%     TcheckColIndex = 9;
%     CATColIndex = VisualNum - 6 + TcheckColIndex;
% %else
% %    TcheckColIndex = 18;
% %    CATColIndex = VisualNum - 13 + TcheckColIndex;
% end


%obtain data

MCADataValues = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic_Validation','G2:I121');  

MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
%Tcheck = MCADataValues(:,TcheckColIndex);  %min
Tcheck = MCADataValues(~isnan(MeasuredThrombin),TcheckColIndex); %min
MeasuredThrombin = MeasuredThrombin(~isnan(MeasuredThrombin));
end_time = Tcheck(length(Tcheck));

