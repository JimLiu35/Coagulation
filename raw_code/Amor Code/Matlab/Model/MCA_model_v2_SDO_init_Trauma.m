

clear all;
close all;
clc;

format long e;

%%

%parameters to set

TF_init = 5; %units of pM
%Ts = 1e-2; %duration of impulse

VisualNum = 47; % 1--47 



%guesses
k0 = 1.25;
k1 = 3.75;
k2 = 2.5;
kn = 12;  %5 for VisualNum = 31
kd = 1.5;


%manual index calculations based on data structure

if VisualNum < 16
    TcheckColIndex = 1;
    CATColIndex = TcheckColIndex + VisualNum;
elseif VisualNum < 40
    TcheckColIndex = 18;
    CATColIndex = VisualNum - 15 + TcheckColIndex;
else
    TcheckColIndex = 44;
    CATColIndex = VisualNum - 39 + TcheckColIndex;
end


%obtain data

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:AZ121');

MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
Tcheck = MCADataValues(:,TcheckColIndex);  %min
end_time = Tcheck(length(Tcheck));

