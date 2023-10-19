function Thrombogram_Reviewer_Classification

clear all;
close all;
clc;

%% Read Data

% NORMALS

%obtain data
MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:Y121');


for VisualNum = 1:20
    
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

    
    MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
    Tcheck = MCADataValues(:,TcheckColIndex);  %min

    [MaxMeasuredThrombin(VisualNum),IndexMaxMeasuredThrombin(VisualNum)] = max(MeasuredThrombin);
    TimeatMaxMeasuredThrombin(VisualNum) = Tcheck(IndexMaxMeasuredThrombin(VisualNum));
    ETPMeasuredThrombin(VisualNum) = trapz(Tcheck,MeasuredThrombin);
    DelayMeasuredThrombin(VisualNum) = DetermineDelay(Tcheck,MeasuredThrombin);
    
    SlopeOn(VisualNum) = MaxMeasuredThrombin(VisualNum)/(TimeatMaxMeasuredThrombin(VisualNum) - DelayMeasuredThrombin(VisualNum));
    SlopeOff(VisualNum) = MaxMeasuredThrombin(VisualNum)/(2*ETPMeasuredThrombin(VisualNum)/MaxMeasuredThrombin(VisualNum) - (TimeatMaxMeasuredThrombin(VisualNum) - DelayMeasuredThrombin(VisualNum)));
    
    DerivativeBeforePeak(VisualNum) = (MaxMeasuredThrombin(VisualNum) - MeasuredThrombin(IndexMaxMeasuredThrombin(VisualNum)-1))/(TimeatMaxMeasuredThrombin(VisualNum) - Tcheck(IndexMaxMeasuredThrombin(VisualNum)-1));
    DerivativeAfterPeak(VisualNum) = (MeasuredThrombin(IndexMaxMeasuredThrombin(VisualNum)+1) - MaxMeasuredThrombin(VisualNum))/(Tcheck(IndexMaxMeasuredThrombin(VisualNum)+1) - TimeatMaxMeasuredThrombin(VisualNum));
    DenominatorSecondDerivativeAtPeak(VisualNum) = 0.5*(TimeatMaxMeasuredThrombin(VisualNum) - Tcheck(IndexMaxMeasuredThrombin(VisualNum)-1)) + 0.5*(Tcheck(IndexMaxMeasuredThrombin(VisualNum)+1) - TimeatMaxMeasuredThrombin(VisualNum));
    SecondDerivativeAtPeak(VisualNum) = (DerivativeAfterPeak(VisualNum) - DerivativeBeforePeak(VisualNum))/DenominatorSecondDerivativeAtPeak(VisualNum);
end


% TRAUMA

%obtain data
MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:AS121');


for VisualNum = 1:40
    
    if VisualNum < 12
        TcheckColIndex = 1;
        CATColIndex = TcheckColIndex + VisualNum;
    elseif VisualNum < 33
        TcheckColIndex = 14;
        CATColIndex = VisualNum - 11 + TcheckColIndex;
    else
        TcheckColIndex = 37;
        CATColIndex = VisualNum - 32 + TcheckColIndex;
    end

    
    MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
    Tcheck = MCADataValues(:,TcheckColIndex);  %min

    [MaxMeasuredThrombin(VisualNum+20),IndexMaxMeasuredThrombin(VisualNum+20)] = max(MeasuredThrombin);
    TimeatMaxMeasuredThrombin(VisualNum+20) = Tcheck(IndexMaxMeasuredThrombin(VisualNum+20));
    ETPMeasuredThrombin(VisualNum+20) = trapz(Tcheck,MeasuredThrombin);
    DelayMeasuredThrombin(VisualNum+20) = DetermineDelay(Tcheck,MeasuredThrombin);
    
    SlopeOn(VisualNum+20) = MaxMeasuredThrombin(VisualNum+20)/(TimeatMaxMeasuredThrombin(VisualNum+20) - DelayMeasuredThrombin(VisualNum+20));
    SlopeOff(VisualNum+20) = MaxMeasuredThrombin(VisualNum+20)/(2*ETPMeasuredThrombin(VisualNum+20)/MaxMeasuredThrombin(VisualNum+20) - (TimeatMaxMeasuredThrombin(VisualNum+20) - DelayMeasuredThrombin(VisualNum+20)));
    
    DerivativeBeforePeak(VisualNum+20) = (MaxMeasuredThrombin(VisualNum+20) - MeasuredThrombin(IndexMaxMeasuredThrombin(VisualNum+20)-1))/(TimeatMaxMeasuredThrombin(VisualNum+20) - Tcheck(IndexMaxMeasuredThrombin(VisualNum+20)-1));
    DerivativeAfterPeak(VisualNum+20) = (MeasuredThrombin(IndexMaxMeasuredThrombin(VisualNum+20)+1) - MaxMeasuredThrombin(VisualNum+20))/(Tcheck(IndexMaxMeasuredThrombin(VisualNum+20)+1) - TimeatMaxMeasuredThrombin(VisualNum+20));
    DenominatorSecondDerivativeAtPeak(VisualNum+20) = 0.5*(TimeatMaxMeasuredThrombin(VisualNum+20) - Tcheck(IndexMaxMeasuredThrombin(VisualNum+20)-1)) + 0.5*(Tcheck(IndexMaxMeasuredThrombin(VisualNum+20)+1) - TimeatMaxMeasuredThrombin(VisualNum+20));
    SecondDerivativeAtPeak(VisualNum+20) = (DerivativeAfterPeak(VisualNum+20) - DerivativeBeforePeak(VisualNum+20))/DenominatorSecondDerivativeAtPeak(VisualNum+20);
    
end

%% Perform Classification

NumKMeansIterations = 100;
opts = statset('Display','final');
NumClusters = 2; % Normal and Trauma

[IDX,kmeansCentroids] = kmeans([DelayMeasuredThrombin' SlopeOn' SlopeOff' SecondDerivativeAtPeak'],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);

IDX
return



function Delay = DetermineDelay(Tcheck,MeasuredThrombin)

%first, look for the first data point below half of the thrombin peak

[MaxThrombin,MaxThrombinIndex] = max(MeasuredThrombin);
TimeMaxThrombin = Tcheck(MaxThrombinIndex);

SlopeUpperValueIndex = find(MeasuredThrombin<=0.5*MaxThrombin & Tcheck<=TimeMaxThrombin,1,'last');
SlopeUpperValue = MeasuredThrombin(SlopeUpperValueIndex);
SlopeUpperTime = Tcheck(SlopeUpperValueIndex);

%calculate the slope with the next lower data point
SlopeLowerValue = MeasuredThrombin(SlopeUpperValueIndex-1);
SlopeLowerTime = Tcheck(SlopeUpperValueIndex-1);
Slope = (SlopeUpperValue - SlopeLowerValue)/(SlopeUpperTime-SlopeLowerTime);

%calculate the x-intercept
b = SlopeLowerValue-Slope*SlopeLowerTime;
xintercept = -b/Slope;

if xintercept > 0
    EstimatedThrombinAtIntercept = interp1(Tcheck,MeasuredThrombin,xintercept);

    %calculate parameters for perpendicalar through this x-intercept
    SlopePerp = -1/Slope;
    bPerp = -SlopePerp*xintercept;

    %find a pair of points backwards from the x-intercept that lie on either
    %side of this perpendicular
    found = 0;
    CurrentIndex = find(MeasuredThrombin<=EstimatedThrombinAtIntercept & Tcheck<=TimeMaxThrombin,1,'last');
    while found == 0
        CurrentThrombinValue=MeasuredThrombin(CurrentIndex);
        CurrentPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex)+bPerp;

        if CurrentIndex > 1
            NextThrombinValue = MeasuredThrombin(CurrentIndex-1);
            NextPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex-1)+bPerp;

            if(CurrentThrombinValue <= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex);
            elseif (CurrentThrombinValue >= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex-1);
            else
                CurrentIndex = CurrentIndex-1;
            end
        else
            found = 1;
            Delay = Tcheck(CurrentIndex);
        end
    end
else
    Delay = Tcheck(1);
end

return