
% Determine if trauma patient factor levels are
% a) less than, within, or greater than control plasma factor levels +/- 10%
% b) less than, within, or greater than 20 normals factor levels +/- 10% 

clear all;
close all;
clc;

% Control Plasma Percentage
Control(1) = 87; %II
Control(2) = 80; %V
Control(3) = 87; %VII
Control(4) = 92; %VIII
Control(5) = 91; %IX
Control(6) = 90; %X
Control(7) = 88; %ATIII

% Read in trauma concentrations
MCADataValues = xlsread('../../Data/Processed/CAT_Trauma','Fits','G2:M41');

% Create an array, rows are trauma patient, cols are factors
% -1 if below range, 0 if within range, +1 if above range

% Initialize
TraumaPatientWithinControlRange = zeros(40,7);

for TraumaPatientNum = 1:40
    for FactorNum = 1:7
        if MCADataValues(TraumaPatientNum,FactorNum) < 0.9*Control(FactorNum)
            TraumaPatientWithinControlRange(TraumaPatientNum,FactorNum) = -1;
        elseif MCADataValues(TraumaPatientNum,FactorNum) > 1.1*Control(FactorNum)
            TraumaPatientWithinControlRange(TraumaPatientNum,FactorNum) = 1;
        end
    end
end

TraumaPatientWithinControlRangeMin = min(TraumaPatientWithinControlRange,[],2)
%37/40 have a factor deficiency this way

TraumaPatientWithinControlRangeMax = max(TraumaPatientWithinControlRange,[],2)
%31/40 have a factor excess this way

% Read in normal concentrations
NormalConc = xlsread('../../Data/Processed/CAT_Normals','Fits','G2:M21');

MeanNormalConc = mean(NormalConc);
StdDevNormalConc = std(NormalConc);

% Create an array, rows are trauma patient, cols are factors
% -1 if below range, 0 if within range, +1 if above range

% Initialize
TraumaPatientWithinNormalsRange = zeros(40,7);

for TraumaPatientNum = 1:40
    for FactorNum = 1:7
        if MCADataValues(TraumaPatientNum,FactorNum) < (MeanNormalConc(FactorNum)-StdDevNormalConc(FactorNum))
            TraumaPatientWithinNormalsRange(TraumaPatientNum,FactorNum) = -1;
        elseif MCADataValues(TraumaPatientNum,FactorNum) > (MeanNormalConc(FactorNum)+StdDevNormalConc(FactorNum))
            TraumaPatientWithinNormalsRange(TraumaPatientNum,FactorNum) = 1;
        end
    end
end

TraumaPatientWithinNormalsRangeMin = min(TraumaPatientWithinNormalsRange,[],2)
%32/40 have a factor deficiency this way

TraumaPatientWithinNormalsRangeMax = max(TraumaPatientWithinNormalsRange,[],2)
%39/40 have a factor excess this way
