function ThrombogramPars_vs_Demographics

clear all;
close all;
clc;

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);

%% Read Data

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

    [MaxMeasuredThrombin(VisualNum),IndexMaxMeasuredThrombin(VisualNum)] = max(MeasuredThrombin);
    TimeatMaxMeasuredThrombin(VisualNum) = Tcheck(IndexMaxMeasuredThrombin(VisualNum));
    ETPMeasuredThrombin(VisualNum) = trapz(Tcheck,MeasuredThrombin);
    DelayMeasuredThrombin(VisualNum) = DetermineDelay(Tcheck,MeasuredThrombin);
    RiseTimeMeasuredThrombin(VisualNum) = TimeatMaxMeasuredThrombin(VisualNum) - DelayMeasuredThrombin(VisualNum);
    
end

% Read in age, ISS, PTT, INR

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','S2:V41');

Age = MCADataValues(:,1);
ISS = MCADataValues(:,2);
PTT = MCADataValues(:,3);
INR = MCADataValues(:,4);

figure(1)
clf
subplot(4,4,1)
scatter(Age,MaxMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 100 0 0.5])
%xlabel('Age [yrs]')
ylabel('{\itP} [\muM]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitPeakvsAgefactors,resfitPeakvsAge] = lsqcurvefit(@fitLinearModel,[1;1],Age,MaxMeasuredThrombin',[],[],options)
R2fitPeakvsAge = DetermineLinearModelR2(Age,MaxMeasuredThrombin',fitPeakvsAgefactors)


subplot(4,4,2)
scatter(ISS,MaxMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0 40 0 0.5])
%xlabel('ISS')
%ylabel('{\itP} [\muM]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitPeakvsISSfactors,resfitPeakvsISS] = lsqcurvefit(@fitLinearModel,[1;1],ISS(~any(isnan(ISS),2)),MaxMeasuredThrombin(~any(isnan(ISS),2))',[],[],options)
R2fitPeakvsISS = DetermineLinearModelR2(ISS(~any(isnan(ISS),2)),MaxMeasuredThrombin(~any(isnan(ISS),2))',fitPeakvsISSfactors)


subplot(4,4,3)
scatter(PTT,MaxMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 36 0 0.5])
%xlabel('PTT [s]')
%ylabel('{\itP} [\muM]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitPeakvsPTTfactors,resfitPeakvsPTT] = lsqcurvefit(@fitLinearModel,[1;1],PTT,MaxMeasuredThrombin',[],[],options)
R2fitPeakvsPTT = DetermineLinearModelR2(PTT,MaxMeasuredThrombin',fitPeakvsPTTfactors)


subplot(4,4,4)
scatter(INR,MaxMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0.8 1.75 0 0.5])
%xlabel('INR')
%ylabel('{\itP} [\muM]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitPeakvsINRfactors,resfitPeakvsINR] = lsqcurvefit(@fitLinearModel,[1;1],INR,MaxMeasuredThrombin',[],[],options)
R2fitPeakvsINR = DetermineLinearModelR2(INR,MaxMeasuredThrombin',fitPeakvsINRfactors)


subplot(4,4,5)
scatter(Age,RiseTimeMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 100 1.6 7])
%xlabel('Age [yrs]')
ylabel('{\itT_P-T} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitRiseTimevsAgefactors,resfitRiseTimevsAge] = lsqcurvefit(@fitLinearModel,[1;1],Age,RiseTimeMeasuredThrombin',[],[],options)
R2fitRiseTimevsAge = DetermineLinearModelR2(Age,RiseTimeMeasuredThrombin',fitRiseTimevsAgefactors)


subplot(4,4,6)
scatter(ISS,RiseTimeMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0 40 1.6 7])
%xlabel('ISS')
%ylabel('{\itT_P-T} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitRiseTimevsISSfactors,resfitRiseTimevsISS] = lsqcurvefit(@fitLinearModel,[1;1],ISS(~any(isnan(ISS),2)),RiseTimeMeasuredThrombin(~any(isnan(ISS),2))',[],[],options)
R2fitRiseTimevsISS = DetermineLinearModelR2(ISS(~any(isnan(ISS),2)),RiseTimeMeasuredThrombin(~any(isnan(ISS),2))',fitRiseTimevsISSfactors)


subplot(4,4,7)
scatter(PTT,RiseTimeMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 36 1.6 7])
%xlabel('PTT [s]')
%ylabel('{\itT_P-T} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitRiseTimevsPTTfactors,resfitRiseTimevsPTT] = lsqcurvefit(@fitLinearModel,[1;1],PTT,RiseTimeMeasuredThrombin',[],[],options)
R2fitRiseTimevsPTT = DetermineLinearModelR2(PTT,RiseTimeMeasuredThrombin',fitRiseTimevsPTTfactors)


subplot(4,4,8)
scatter(INR,RiseTimeMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0.8 1.75 1.6 7])
%xlabel('INR')
%ylabel('{\itT_P-T} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitRiseTimevsINRfactors,resfitRiseTimevsINR] = lsqcurvefit(@fitLinearModel,[1;1],INR,RiseTimeMeasuredThrombin',[],[],options)
R2fitRiseTimevsINR = DetermineLinearModelR2(INR,RiseTimeMeasuredThrombin',fitRiseTimevsINRfactors)


subplot(4,4,9)
scatter(Age,DelayMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 100 1.6 6])
%xlabel('Age [yrs]')
ylabel('{\itT} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitDelayvsAgefactors,resfitDelayvsAge] = lsqcurvefit(@fitLinearModel,[1;1],Age,DelayMeasuredThrombin',[],[],options)
R2fitDelayvsAge = DetermineLinearModelR2(Age,DelayMeasuredThrombin',fitDelayvsAgefactors)


subplot(4,4,10)
scatter(ISS,DelayMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0 40 1.6 6])
%xlabel('ISS')
%ylabel('{\itT} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitDelayvsISSfactors,resfitDelayvsISS] = lsqcurvefit(@fitLinearModel,[1;1],ISS(~any(isnan(ISS),2)),DelayMeasuredThrombin(~any(isnan(ISS),2))',[],[],options)
R2fitDelayvsISS = DetermineLinearModelR2(ISS(~any(isnan(ISS),2)),DelayMeasuredThrombin(~any(isnan(ISS),2))',fitDelayvsISSfactors)


subplot(4,4,11)
scatter(PTT,DelayMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 36 1.6 6])
%xlabel('PTT [s]')
%ylabel('{\itT} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitDelayvsPTTfactors,resfitDelayvsPTT] = lsqcurvefit(@fitLinearModel,[1;1],PTT,DelayMeasuredThrombin',[],[],options)
R2fitDelayvsPTT = DetermineLinearModelR2(PTT,DelayMeasuredThrombin',fitDelayvsPTTfactors)


subplot(4,4,12)
scatter(INR,DelayMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0.8 1.75 1.6 6])
%xlabel('INR')
%ylabel('{\itT} [min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitDelayvsINRfactors,resfitDelayvsINR] = lsqcurvefit(@fitLinearModel,[1;1],INR,DelayMeasuredThrombin',[],[],options)
R2fitDelayvsINR = DetermineLinearModelR2(INR,DelayMeasuredThrombin',fitDelayvsINRfactors)


subplot(4,4,13)
scatter(Age,ETPMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 100 0.8 3.5])
xlabel('Age [yrs]')
ylabel('IIa_{\ittot} [\muM min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitETPvsAgefactors,resfitETPvsAge] = lsqcurvefit(@fitLinearModel,[1;1],Age,ETPMeasuredThrombin',[],[],options)
R2fitETPvsAge = DetermineLinearModelR2(Age,ETPMeasuredThrombin',fitETPvsAgefactors)


subplot(4,4,14)
scatter(ISS,ETPMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0 40 0.8 3.5])
xlabel('ISS')
%ylabel('IIa_{\ittot} [\muM min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitETPvsISSfactors,resfitETPvsISS] = lsqcurvefit(@fitLinearModel,[1;1],ISS(~any(isnan(ISS),2)),ETPMeasuredThrombin(~any(isnan(ISS),2))',[],[],options)
R2fitETPvsISS = DetermineLinearModelR2(ISS(~any(isnan(ISS),2)),ETPMeasuredThrombin(~any(isnan(ISS),2))',fitETPvsISSfactors)


subplot(4,4,15)
scatter(PTT,ETPMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([20 36 0.8 3.5])
xlabel('PTT [s]')
%ylabel('IIa_{\ittot} [\muM min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitETPvsPTTfactors,resfitETPvsPTT] = lsqcurvefit(@fitLinearModel,[1;1],PTT,ETPMeasuredThrombin',[],[],options)
R2fitETPvsPTT = DetermineLinearModelR2(PTT,ETPMeasuredThrombin',fitETPvsPTTfactors)


subplot(4,4,16)
scatter(INR,ETPMeasuredThrombin,150,'Red','filled','o','MarkerEdgeColor','Black');
axis([0.8 1.75 0.8 3.5])
xlabel('INR')
%ylabel('IIa_{\ittot} [\muM min]')
grid on
box on
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)


[fitETPvsINRfactors,resfitETPvsINR] = lsqcurvefit(@fitLinearModel,[1;1],INR,ETPMeasuredThrombin',[],[],options)
R2fitETPvsINR = DetermineLinearModelR2(INR,ETPMeasuredThrombin',fitETPvsINRfactors)


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

function fitLinearEstimate = fitLinearModel(x,xdata)

fitLinearEstimate = x(1)*xdata + x(2);

return

function R2ofLinearEstimate = DetermineLinearModelR2(Xdata,Yactualdata,LinearCoeffs)

Ypredicteddata = LinearCoeffs(1)*Xdata + LinearCoeffs(2);

MeanYactualdata = mean(Yactualdata);
SStot_vec = (Yactualdata - MeanYactualdata).^2;
SStot = sum(SStot_vec);
SSres_vec = (Yactualdata - Ypredicteddata).^2;
SSres = sum(SSres_vec);
R2ofLinearEstimate = 1 - SSres/SStot;


return
