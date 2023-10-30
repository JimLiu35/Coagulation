

clear all;
close all;
clc;

format long e;

%%

%parameters to set

TF_init = 5; %units of pM
%Ts = 1e-2; %duration of impulse

VisualNum = 1; % 1--20 



%guesses
k0 = 1.25;
k1 = 3.75;
k2 = 2.5;
kn = 12;  %10 for VisualNum = 18
kd = 1.5;


%manual index calculations based on data structure

if VisualNum < 11
    TcheckColIndex = 1;
    CATColIndex = TcheckColIndex + VisualNum;
elseif VisualNum < 16
    TcheckColIndex = 13;
    CATColIndex = VisualNum - 10 + TcheckColIndex;
else
    TcheckColIndex = 20;
    CATColIndex = VisualNum - 15 + TcheckColIndex;
end


%obtain data

MCADataValues = xlsread('../../Data/Processed/CAT_Normals','Dynamic','A2:Y121');

MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
Tcheck = MCADataValues(:,TcheckColIndex);  %min
end_time = Tcheck(length(Tcheck));

