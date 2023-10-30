function HockinMannModel_TraumaValidation

clear all;
close all;
clc;

format long e;


%MCADataValues = xlsread('C:\Users\amenezes\Documents\Work\Research\Projects\Coagulation\MCA Model\Data\MCA_obs','v2','A8:AL60');

%number between 1 and 40
for VisualNum = 1:40

    %StagoRowIndex = MCADataValues(VisualNum,2);
    %CATColIndex = MCADataValues(VisualNum,3);
    %DataSetNum = ['DATA SET ',num2str(MCADataValues(VisualNum,4))];

    StagoDataValues = xlsread('../../Data/Processed/CAT_Trauma','Fits','G2:M41');
    CATDataValues = xlsread('../../Data/Processed/CAT_Trauma','Dynamic','A2:AZ121');



    %Factors from data

    %Unit values
    %IIunitfactor = 1e-8;
    %IIunitfactor = 1.4E-6/82.44828;
    IIunitfactor = 1.4E-6/87;
    %Vunitfactor = 1e-9;
    %Vunitfactor = 2.0E-8/65.96667;
    Vunitfactor = 2.0E-8/80;
    %VIIunitfactor = 1e-9;
    %VIIunitfactor = 1.0E-8/104.1724;
    VIIunitfactor = 1.0E-8/87;
    %IXunitfactor = 1e-9;
    %IXunitfactor = 9.0E-8/125.7241;
    IXunitfactor = 9.0E-8/91;
    %Xunitfactor = 1e-9;
    %Xunitfactor = 1.6E-7/91.06897;
    Xunitfactor = 1.6E-7/90;
    %TFPIunitfactor = 1e-9;
    %TFPIunitfactor = 2.5E-9/13.78947;
    %VIIIunitfactor = 1e-12;
    %VIIIunitfactor = 7.0E-10/289.5667;
    VIIIunitfactor = 7.0E-10/92;
    %ATIIIunitfactor = 1e-7;
    %ATIIIunitfactor = 3.4E-6/85.8;
    ATIIIunitfactor = 3.4E-6/88;

    %if isnan(StagoDataValues(StagoRowIndex,14))
    %    II_0 = 1.4E-6; %default
    %else
        II_0 = StagoDataValues(VisualNum,1) * IIunitfactor;
    %end

    %if isnan(StagoDataValues(StagoRowIndex,2))
    %    V_0 = 2.0E-8; %default
    %else
        V_0 = StagoDataValues(VisualNum,2) * Vunitfactor;
    %end

    %if isnan(StagoDataValues(StagoRowIndex,15))
    %    VII_0 = 1.0E-8; %default
    %else
        VII_0 = StagoDataValues(VisualNum,3) * VIIunitfactor;
    %end

    %if isnan(StagoDataValues(StagoRowIndex,19))
    %    VIII_0 = 7.0E-10; %default
    %else
        VIII_0 = StagoDataValues(VisualNum,4) * VIIIunitfactor;
    %end
    
    %if isnan(StagoDataValues(StagoRowIndex,16))
    %    IX_0 = 9.0E-8; %default
    %else
        IX_0 = StagoDataValues(VisualNum,5) * IXunitfactor;
    %end

    %if isnan(StagoDataValues(StagoRowIndex,17))
    %    X_0 = 1.6E-7; %default
    %else
        X_0 = StagoDataValues(VisualNum,6) * Xunitfactor;
    %end

    %if isnan(StagoDataValues(StagoRowIndex,18))
        TFPI_0 = 2.5E-9; %default
    %else
    %   TFPI_0 = StagoDataValues(StagoRowIndex,18) * TFPIunitfactor;
    %end

    %if isnan(StagoDataValues(StagoRowIndex,20))
    %    ATIII_0 = 3.4E-6; %default
    %else
        ATIII_0 = StagoDataValues(VisualNum,7) * ATIIIunitfactor;
    %end


    %Remaining Initial Conditions

    TF_0 = 5.0E-12;
    %VII_0 = 1.0E-8;
    TF_VII_0 = 0.0;
    VIIa_0 = 1.0E-10;
    TF_VIIa_0 = 0.0;
    Xa_0 = 0.0;
    IIa_0 = 0.0;
    %X_0 = 1.6E-7;
    TF_VIIa_X_0 = 0.0;
    TF_VIIa_Xa_0 = 0.0;
    %IX_0 = 9.0E-8;
    TF_VIIa_IX_0 = 0.0;
    IXa_0 = 0.0;
    %II_0 = 1.4E-6;
    %VIII_0 = 7.0E-10;
    VIIIa_0 = 0.0;
    IXa_VIIIa_0 = 0.0;
    IXa_VIIIa_X_0 = 0.0;
    VIIIa1_L_0 = 0.0;
    VIIIa2_0 = 0.0;
    %V_0 = 2.0E-8;
    Va_0 = 0.0;
    Xa_Va_0 = 0.0;
    Xa_Va_II_0 = 0.0;
    mIIa_0 = 0.0;
    %TFPI_0 = 0;%2.5E-9;
    Xa_TFPI_0 = 0.0;
    TF_VIIa_Xa_TFPI_0 = 0.0;
    %ATIII_0 = 0;%3.4E-6;
    Xa_ATIII_0 = 0.0;
    mIIa_ATIII_0 = 0.0;
    IXa_ATIII_0 = 0.0;
    IIa_ATIII_0 = 0.0;
    TF_VIIa_ATIII_0 = 0.0;

    states0 = [TF_0 VII_0 TF_VII_0 VIIa_0 TF_VIIa_0 Xa_0 IIa_0 X_0 TF_VIIa_X_0 ...
               TF_VIIa_Xa_0 IX_0 TF_VIIa_IX_0 IXa_0 II_0 VIII_0 VIIIa_0 ...
               IXa_VIIIa_0 IXa_VIIIa_X_0 VIIIa1_L_0 ...
               VIIIa2_0 V_0 Va_0 Xa_Va_0 Xa_Va_II_0 mIIa_0 TFPI_0 Xa_TFPI_0 ...
               TF_VIIa_Xa_TFPI_0 ATIII_0 Xa_ATIII_0 mIIa_ATIII_0 IXa_ATIII_0 ...
               IIa_ATIII_0 TF_VIIa_ATIII_0];

    if VisualNum < 12
        t = CATDataValues(:,1)*60;
        CATColIndex = VisualNum + 1;
    elseif VisualNum < 33
        t = CATDataValues(:,14)*60;
        CATColIndex = VisualNum + 3;
    else
        t = CATDataValues(:,37)*60;
        CATColIndex = VisualNum + 5;
    end
    
    options = odeset('RelTol',1e-7,'AbsTol',1e-14);
    [T,stateevolution]=ode15s(@HockinMannRx,t,states0,options);

%     figure(1)
%     clf
%     subplot(2,1,1)
%     plot(T/60,stateevolution(:,7)/1e-9,'-')
%     xlabel('Time [min]')
%     ylabel('IIa [nM]')
%     grid on
%     subplot(2,1,2)
%     plot(T/60,stateevolution(:,7)/1e-9,'-',T/60,CATDataValues(:,CATColIndex),'k-*');
%     xlabel('Time [min]')
%     ylabel('IIa [nM]')
%     legend('Hockin-Mann Simulation','Data')
%     grid on

[MaxThrombinHM_nM(VisualNum),MaxThrombinHMIndex(VisualNum)] = max(stateevolution(:,7)/1e-9);
[MaxThrombinActual_nM(VisualNum),MaxThrombinActualIndex(VisualNum)] = max(CATDataValues(:,CATColIndex));
TimeMaxThrombinHM_min(VisualNum) = T(MaxThrombinHMIndex(VisualNum))/60;
TimeMaxThrombinActual_min(VisualNum) = T(MaxThrombinActualIndex(VisualNum))/60;

MaxThrombinPercentError(VisualNum) = abs(MaxThrombinHM_nM(VisualNum)-MaxThrombinActual_nM(VisualNum))/MaxThrombinActual_nM(VisualNum)*100;
TimeMaxThrombinPercentError(VisualNum) = abs(TimeMaxThrombinHM_min(VisualNum)-TimeMaxThrombinActual_min(VisualNum))/TimeMaxThrombinActual_min(VisualNum)*100;

ETP_nMmin(VisualNum) = trapz(T/60,stateevolution(:,7)/1e-9);



%determine the delay
MeasuredThrombin = stateevolution(:,7)/1e-9; %nM
Tcheck = T/60; %min
% %first, look for the first data point below half of the thrombin peak
% SlopeUpperValueIndex(VisualNum) = find(MeasuredThrombin<=0.5*MaxThrombinHM_nM(VisualNum) & Tcheck<=TimeMaxThrombinHM_min(VisualNum),1,'last');
% SlopeUpperValue(VisualNum) = MeasuredThrombin(SlopeUpperValueIndex(VisualNum));
% SlopeUpperTime(VisualNum) = Tcheck(SlopeUpperValueIndex(VisualNum));
% 
% %calculate the slope with the next lower data point
% SlopeLowerValue(VisualNum) = MeasuredThrombin(SlopeUpperValueIndex(VisualNum)-1);
% SlopeLowerTime(VisualNum) = Tcheck(SlopeUpperValueIndex(VisualNum)-1);
% Slope(VisualNum) = (SlopeUpperValue(VisualNum) - SlopeLowerValue(VisualNum))/(SlopeUpperTime(VisualNum)-SlopeLowerTime(VisualNum));
% 
% %calculate the x-intercept
% b(VisualNum) = SlopeLowerValue(VisualNum)-Slope(VisualNum)*SlopeLowerTime(VisualNum);
% xintercept(VisualNum) = -b(VisualNum)/Slope(VisualNum);
% 
% if xintercept(VisualNum) > 0
%     EstimatedThrombinAtIntercept(VisualNum) = interp1(Tcheck,MeasuredThrombin,xintercept(VisualNum));
% 
%     %calculate parameters for perpendicalar through this x-intercept
%     SlopePerp(VisualNum) = -1/Slope(VisualNum);
%     bPerp(VisualNum) = -SlopePerp(VisualNum)*xintercept(VisualNum);
% 
%     %find a pair of points backwards from the x-intercept that lie on either
%     %side of this perpendicular
%     found = 0;
%     CurrentIndex = find(MeasuredThrombin<=EstimatedThrombinAtIntercept(VisualNum) & Tcheck<=TimeMaxThrombinHM_min(VisualNum),1,'last');
%     while found == 0
%         CurrentThrombinValue=MeasuredThrombin(CurrentIndex);
%         CurrentPerpThrombinValue = SlopePerp(VisualNum)*Tcheck(CurrentIndex)+bPerp(VisualNum);
% 
%         if CurrentIndex > 1
%             NextThrombinValue = MeasuredThrombin(CurrentIndex-1);
%             NextPerpThrombinValue = SlopePerp(VisualNum)*Tcheck(CurrentIndex-1)+bPerp(VisualNum);
% 
%             if(CurrentThrombinValue <= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
%                 found = 1;
%                 Delay_min(VisualNum) = Tcheck(CurrentIndex);
%             elseif (CurrentThrombinValue >= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
%                 found = 1;
%                 Delay_min(VisualNum) = Tcheck(CurrentIndex-1);
%             else
%                 CurrentIndex = CurrentIndex-1;
%             end
%         else
%             found = 1;
%             Delay_min(VisualNum) = Tcheck(CurrentIndex);
%         end
%     end
% else
%     Delay_min(VisualNum) = Tcheck(1);
% end


VisualNum
end

AverageMaxThrombinHM_nM = mean(MaxThrombinHM_nM)
StdDevMaxThrombinHM_nM = std(MaxThrombinHM_nM)
AverageTimeMaxThrombinHM_min = mean(TimeMaxThrombinHM_min)
StdDevTimeMaxThrombinHM_min = std(TimeMaxThrombinHM_min)

AverageETP_nMmin = mean(ETP_nMmin)
StdDevETP_nMmin = std(ETP_nMmin)

AverageMaxThrombinPercentError = mean(MaxThrombinPercentError)
StdDevMaxThrombinPercentError = std(MaxThrombinPercentError)
AverageTimeMaxThrombinPercentError = mean(TimeMaxThrombinPercentError)
StdDevTimeMaxThrombinPercentError = std(TimeMaxThrombinPercentError)

%AverageDelay_min = mean(Delay_min([1:34,36:53]))
%StdDevDelay_min = std(Delay_min([1:34,36:53]))

figure(1)
clf
subplot(2,2,1)
%hist(MaxThrombinPercentError)
hist(MaxThrombinPercentError,5:10:115)
xlabel('Hockin-Mann {\itP} Percent Error')
ylabel('Frequency')
grid on
box on
set(gca,'XTick',0:20:120)
axis([0 120 0 15])
%title('G')

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

% figure(2)
% clf
subplot(2,2,2)
%hist(TimeMaxThrombinPercentError)
hist(TimeMaxThrombinPercentError,50:100:950)
xlabel('Hockin-Mann {\itT_P} Percent Error')
ylabel('Frequency')
grid on
box on
set(gca,'XTick',0:200:1000)
axis([0 1000 0 30])
%title('H')

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

return

function dstates = HockinMannRx(t,states)

dstates = zeros(34,1);

TF = states(1);
VII = states(2);
TF_VII = states(3);
VIIa = states(4);
TF_VIIa = states(5);
Xa = states(6);
IIa = states(7);
X = states(8);
TF_VIIa_X = states(9);
TF_VIIa_Xa = states(10);
IX = states(11);
TF_VIIa_IX = states(12);
IXa = states(13);
II = states(14);
VIII = states(15);
VIIIa = states(16);
IXa_VIIIa = states(17);
IXa_VIIIa_X = states(18);
VIIIa1_L = states(19);
VIIIa2 = states(20);
V = states(21);
Va = states(22);
Xa_Va = states(23);
Xa_Va_II = states(24);
mIIa = states(25);
TFPI = states(26);
Xa_TFPI = states(27);
TF_VIIa_Xa_TFPI = states(28);
ATIII = states(29);
Xa_ATIII = states(30);
mIIa_ATIII = states(31);
IXa_ATIII = states(32);
IIa_ATIII = states(33);
TF_VIIa_ATIII = states(34);

%%

k_on_TF_VII = 3200000.0;
k_off_TF_VII = 0.0031;
k_on_TF_VIIa = 2.3E7;
k_off_TF_VIIa = 0.0031;
k_cat_VII_TF_VIIa = 440000.0;
k_cat_VII_Xa = 1.3E7;
k_cat_VII_IIa = 23000.0;
k_on_X_TF_VIIa = 2.5E7;
k_off_X_TF_VIIa = 1.05;
k_cat_X_TF_VIIa = 6.0;
k_on_Xa_TF_VIIa = 2.2E7;
k_off_Xa_TF_VIIa = 19.0;
k_on_IX_TF_VIIa = 1.0E7;
k_off_IX_TF_VIIa = 2.4;
k_cat_IX_TF_VIIa = 1.8;
k_cat_II_Xa = 7500.0;
k_cat_VIII_IIa = 2.0E7;
k_on_IXa_VIIIa = 1.0E7;
k_off_IXa_VIIIa = 0.0050;
k_on_X_IXa_VIIIa = 1.0E8;
k_off_X_IXa_VIIIa = 1.0E-3;
k_cat_X_IXa_VIIIa = 8.2;
k_off_VIII_HC_LC = 0.0060;
k_on_VIII_HC_LC = 22000.0;
k_off_VIII_HC_LC_IXa_X = 0.0010;
k_off_VIII_HC_LC_IXa = 0.0010;
k_cat_V_IIa = 2.0E7;
k_on_Xa_Va = 4.0E8;
k_off_Xa_Va = 0.2;
k_on_II_Xa_Va = 1.0E8;
k_off_II_Xa_Va = 103.0;
k_cat_off_mIIa_Xa_Va = 63.5;
k_cat_mIIa_Xa_Va = 1.5E7;
k_on_Xa_TFPI = 900000.0;
k_off_Xa_TFPI = 3.6E-4;
k_on_TFPI_TF_VIIa_Xa = 3.2E8;
k_off_TFPI_TF_VIIa_Xa = 1.1E-4;
k_on_TF_VIIa_Xa_TFPI = 5.0E7;
k_on_Xa_ATIII = 1500.0;
k_on_mIIa_ATIII = 7100.0;
k_on_IXa_ATIII = 490.0;
k_on_IIa_ATIII = 7100.0;
k_on_TF_VIIa_ATIII = 230.0;

%%

Reaction_TF_VII_unbinding = k_off_TF_VII * TF_VII; 

Reaction_TF_VII_binding = k_on_TF_VII * TF * VII;

Reaction_TF_VIIa_unbinding = k_off_TF_VIIa * TF_VIIa; 

Reaction_TF_VIIa_binding = k_on_TF_VIIa* TF * VIIa;

Reaction_VII_Activation_by_TF_VIIa = k_cat_VII_TF_VIIa * VII* TF_VIIa;

Reaction_VII_Activation_by_Xa = k_cat_VII_Xa * VII* Xa;

Reaction_VII_Activation_by_IIa = k_cat_VII_IIa * VII * IIa;

Reaction_X_unbinding_TF_VIIa = k_off_X_TF_VIIa * TF_VIIa_X;

Reaction_X_binding_TF_VIIa = k_on_X_TF_VIIa * TF_VIIa * X;

Reaction_Xa_unbinding_TF_VIIa = k_off_Xa_TF_VIIa* TF_VIIa_Xa; 

Reaction_Xa_binding_TF_VIIa = k_on_Xa_TF_VIIa * TF_VIIa * Xa;

Reaction_IX_unbinding_TF_VIIa = k_off_IX_TF_VIIa * TF_VIIa_IX; 

Reaction_IX_binding_TF_VIIa = k_on_IX_TF_VIIa * TF_VIIa * IX;

Reaction_IX_activation_by_TF_VIIa = k_cat_IX_TF_VIIa * TF_VIIa_IX;

Reaction_Xa_TFPI_binding_TF_VIIa = k_on_TF_VIIa_Xa_TFPI * TF_VIIa * Xa_TFPI;

Reaction_TF_VIIa_binding_ATIII = k_on_TF_VIIa_ATIII * TF_VIIa * ATIII;

Reaction_X_activation_by_IXa_VIIIa = k_cat_X_IXa_VIIIa * IXa_VIIIa_X;

Reaction_Xa_unbinding_Va = k_off_Xa_Va * Xa_Va;

Reaction_Xa_binding_Va = k_on_Xa_Va * Xa * Va;

Reaction_Xa_unbinding_TFPI = k_off_Xa_TFPI * Xa_TFPI;

Reaction_Xa_binding_TFPI = k_on_Xa_TFPI * Xa * TFPI;

Reaction_Xa_binding_ATIII = k_on_Xa_ATIII * Xa * ATIII;

Reaction_II_activation_by_Xa = k_cat_II_Xa * II * Xa;

Reaction_mIIa_activation_by_Xa_Va = k_cat_mIIa_Xa_Va * mIIa * Xa_Va;

Reaction_IIa_binding_ATIII = k_on_IIa_ATIII * IIa * ATIII;

Reaction_X_unbinding_IXa_VIIIa = k_off_X_IXa_VIIIa * IXa_VIIIa_X;

Reaction_X_binding_IXa_VIIIa = k_on_X_IXa_VIIIa * X * IXa_VIIIa;

Reaction_X_activation_by_TF_VIIa = k_cat_X_TF_VIIa * TF_VIIa_X;

Reaction_TFPI_unbinding_TF_VIIa_Xa = k_off_TFPI_TF_VIIa_Xa * TF_VIIa_Xa_TFPI;

Reaction_TFPI_binding_TF_VIIa_Xa = k_on_TFPI_TF_VIIa_Xa * TF_VIIa_Xa * TFPI;

Reaction_IXa_unbinding_VIIIa = k_off_IXa_VIIIa * IXa_VIIIa;

Reaction_IXa_binding_VIIIa = k_on_IXa_VIIIa * IXa * VIIIa;

Reaction_VIIIa_chain_unbinding_IXa_X = k_off_VIII_HC_LC_IXa_X * IXa_VIIIa_X;

Reaction_VIIIa_chain_unbinding_IXa = k_off_VIII_HC_LC_IXa * IXa_VIIIa;

Reaction_IXa_binding_ATIII = k_on_IXa_ATIII * IXa * ATIII;

Reaction_II_unbinding_Xa_Va = k_off_II_Xa_Va *Xa_Va_II;

Reaction_II_binding_Xa_Va = k_on_II_Xa_Va * II * Xa_Va;

Reaction_VIII_Activation_by_IIa = k_cat_VIII_IIa * VIII * IIa;

Reaction_VIIIa_chain_rebinding = k_on_VIII_HC_LC * VIIIa1_L * VIIIa2;

Reaction_VIIIa_chain_unbinding = k_off_VIII_HC_LC * VIIIa;

Reaction_V_activation_by_IIa = k_cat_V_IIa * V * IIa;

Reaction_mIIa_dissociation_from_Xa_Va = k_cat_off_mIIa_Xa_Va * Xa_Va_II;

Reaction_mIIa_binding_ATIII = k_on_mIIa_ATIII * mIIa * ATIII;

%%

d_TF = Reaction_TF_VII_unbinding - Reaction_TF_VII_binding + Reaction_TF_VIIa_unbinding - Reaction_TF_VIIa_binding;

d_VII = Reaction_TF_VII_unbinding - Reaction_TF_VII_binding - Reaction_VII_Activation_by_TF_VIIa - Reaction_VII_Activation_by_Xa -Reaction_VII_Activation_by_IIa;

d_TF_VII = -Reaction_TF_VII_unbinding + Reaction_TF_VII_binding;

%d_VIIa = Reaction_TF_VIIa_unbinding -Reaction_TF_VIIa_binding + Reaction_VII_Activation_by_TF_VIIa + Reaction_VII_Activation_by_Xa + Reaction_VII_Activation_by_IIa - Reaction_X_binding_VIIa + Reaction_X_unbinding_VIIa + Reaction_Xa_production_by_VIIa_alone - Reaction_IX_binding_VIIa  + Reaction_IX_unbinding_VIIa + Reaction_IXa_production_by_VIIa_alone;
d_VIIa = Reaction_TF_VIIa_unbinding -Reaction_TF_VIIa_binding + Reaction_VII_Activation_by_TF_VIIa + Reaction_VII_Activation_by_Xa + Reaction_VII_Activation_by_IIa;

d_TF_VIIa = -Reaction_TF_VIIa_unbinding + Reaction_TF_VIIa_binding + Reaction_X_unbinding_TF_VIIa -Reaction_X_binding_TF_VIIa + Reaction_Xa_unbinding_TF_VIIa - Reaction_Xa_binding_TF_VIIa + Reaction_IX_unbinding_TF_VIIa - Reaction_IX_binding_TF_VIIa + Reaction_IX_activation_by_TF_VIIa - Reaction_Xa_TFPI_binding_TF_VIIa -Reaction_TF_VIIa_binding_ATIII;

%d_Xa = Reaction_Xa_unbinding_TF_VIIa - Reaction_Xa_binding_TF_VIIa + Reaction_X_activation_by_IXa_VIIIa + Reaction_Xa_unbinding_Va - Reaction_Xa_binding_Va + Reaction_Xa_unbinding_TFPI - Reaction_Xa_binding_TFPI - Reaction_Xa_binding_ATIII + Reaction_Xa_production_by_VIIa_alone + Reaction_Xa_production_by_IXa_alone - Reaction_VIII_binding_Xa +Reaction_VIII_unbinding_Xa +Reaction_VIIIa_production_by_Xa_alone;
d_Xa = Reaction_Xa_unbinding_TF_VIIa - Reaction_Xa_binding_TF_VIIa + Reaction_X_activation_by_IXa_VIIIa + Reaction_Xa_unbinding_Va - Reaction_Xa_binding_Va + Reaction_Xa_unbinding_TFPI - Reaction_Xa_binding_TFPI - Reaction_Xa_binding_ATIII;

%d_IIa = Reaction_Fbn2_IIa_dissociation - Reaction_Fbn2_IIa_association + Reaction_Fbn2_2_dimer_production + Reaction_Fbn1_2_dimer_unbinding_IIa -Reaction_Fbn1_2_dimer_binding_IIa +  Reaction_IIa_producing_Fbn2 + Reaction_Fbn1_unbinding_Fbn1_IIa -Reaction_Fbn1_binding_IIa + Reaction_IIa_producing_Fbn1 + Reaction_Fbg_unbinding_Fbg_IIa - Reaction_Fbg_binding_IIa -Reaction_Boc_VPR_AMC_IIa_binding + Reaction_Boc_VPR_AMC_IIa_unbinding + Reaction_AMC_generation + Reaction_II_activation_by_Xa + Reaction_mIIa_activation_by_Xa_Va -Reaction_IIa_binding_ATIII - Reaction_IIa_binding_XI + Reaction_IIa_unbinding_XI + Reaction_XIa_generation;
d_IIa = Reaction_II_activation_by_Xa + Reaction_mIIa_activation_by_Xa_Va -Reaction_IIa_binding_ATIII;

%d_X = Reaction_X_unbinding_TF_VIIa-Reaction_X_binding_TF_VIIa +Reaction_X_unbinding_IXa_VIIIa -Reaction_X_binding_IXa_VIIIa +Reaction_VIIIa_chain_unbinding_IXa_X -Reaction_X_binding_VIIa +Reaction_X_unbinding_VIIa - Reaction_X_binding_IXa +Reaction_X_unbinding_IXa;
d_X = Reaction_X_unbinding_TF_VIIa-Reaction_X_binding_TF_VIIa +Reaction_X_unbinding_IXa_VIIIa -Reaction_X_binding_IXa_VIIIa +Reaction_VIIIa_chain_unbinding_IXa_X;

d_TF_VIIa_X = -Reaction_X_unbinding_TF_VIIa + Reaction_X_binding_TF_VIIa - Reaction_X_activation_by_TF_VIIa;

d_TF_VIIa_Xa = Reaction_X_activation_by_TF_VIIa - Reaction_Xa_unbinding_TF_VIIa + Reaction_Xa_binding_TF_VIIa + Reaction_TFPI_unbinding_TF_VIIa_Xa - Reaction_TFPI_binding_TF_VIIa_Xa;

%d_IX = Reaction_IX_unbinding_TF_VIIa-Reaction_IX_binding_TF_VIIa-Reaction_XIa_binding_IX+Reaction_XIa_unbinding_IX-Reaction_IX_binding_VIIa +Reaction_IX_unbinding_VIIa;
d_IX = Reaction_IX_unbinding_TF_VIIa-Reaction_IX_binding_TF_VIIa;

d_TF_VIIa_IX = -Reaction_IX_unbinding_TF_VIIa + Reaction_IX_binding_TF_VIIa - Reaction_IX_activation_by_TF_VIIa;

%d_IXa = Reaction_IX_activation_by_TF_VIIa + Reaction_IXa_unbinding_VIIIa -Reaction_IXa_binding_VIIIa + Reaction_VIIIa_chain_unbinding_IXa_X+Reaction_VIIIa_chain_unbinding_IXa-Reaction_IXa_binding_ATIII + Reaction_XIa_generating_IXa + Reaction_IXa_production_by_VIIa_alone -Reaction_X_binding_IXa + Reaction_X_unbinding_IXa + Reaction_Xa_production_by_IXa_alone;
d_IXa = Reaction_IX_activation_by_TF_VIIa + Reaction_IXa_unbinding_VIIIa -Reaction_IXa_binding_VIIIa + Reaction_VIIIa_chain_unbinding_IXa_X+Reaction_VIIIa_chain_unbinding_IXa-Reaction_IXa_binding_ATIII;

d_II = -Reaction_II_activation_by_Xa+Reaction_II_unbinding_Xa_Va-Reaction_II_binding_Xa_Va;

%d_VIII = -Reaction_VIII_Activation_by_IIa-Reaction_VIII_binding_Xa + Reaction_VIII_unbinding_Xa;
d_VIII = -Reaction_VIII_Activation_by_IIa;

%d_VIIIa = Reaction_VIII_Activation_by_IIa + Reaction_IXa_unbinding_VIIIa - Reaction_IXa_binding_VIIIa + Reaction_VIIIa_chain_rebinding - Reaction_VIIIa_chain_unbinding + Reaction_VIIIa_production_by_Xa_alone;
d_VIIIa = Reaction_VIII_Activation_by_IIa + Reaction_IXa_unbinding_VIIIa - Reaction_IXa_binding_VIIIa + Reaction_VIIIa_chain_rebinding - Reaction_VIIIa_chain_unbinding;

d_IXa_VIIIa = -Reaction_IXa_unbinding_VIIIa + Reaction_IXa_binding_VIIIa + Reaction_X_unbinding_IXa_VIIIa -Reaction_X_binding_IXa_VIIIa + Reaction_X_activation_by_IXa_VIIIa -Reaction_VIIIa_chain_unbinding_IXa;

d_IXa_VIIIa_X = -Reaction_X_unbinding_IXa_VIIIa + Reaction_X_binding_IXa_VIIIa - Reaction_X_activation_by_IXa_VIIIa -Reaction_VIIIa_chain_unbinding_IXa_X;

d_VIIIa1_L = -Reaction_VIIIa_chain_rebinding + Reaction_VIIIa_chain_unbinding + Reaction_VIIIa_chain_unbinding_IXa_X + Reaction_VIIIa_chain_unbinding_IXa;

d_VIIIa2 = -Reaction_VIIIa_chain_rebinding + Reaction_VIIIa_chain_unbinding + Reaction_VIIIa_chain_unbinding_IXa_X + Reaction_VIIIa_chain_unbinding_IXa;

d_V = -Reaction_V_activation_by_IIa;

d_Va = Reaction_V_activation_by_IIa + Reaction_Xa_unbinding_Va -Reaction_Xa_binding_Va;

d_Xa_Va = -Reaction_Xa_unbinding_Va + Reaction_Xa_binding_Va + Reaction_II_unbinding_Xa_Va -Reaction_II_binding_Xa_Va + Reaction_mIIa_dissociation_from_Xa_Va;

d_Xa_Va_II = -Reaction_II_unbinding_Xa_Va + Reaction_II_binding_Xa_Va - Reaction_mIIa_dissociation_from_Xa_Va;

d_mIIa = Reaction_mIIa_dissociation_from_Xa_Va -Reaction_mIIa_activation_by_Xa_Va - Reaction_mIIa_binding_ATIII;

d_TFPI = Reaction_Xa_unbinding_TFPI -Reaction_Xa_binding_TFPI + Reaction_TFPI_unbinding_TF_VIIa_Xa - Reaction_TFPI_binding_TF_VIIa_Xa;

d_Xa_TFPI = -Reaction_Xa_unbinding_TFPI + Reaction_Xa_binding_TFPI -Reaction_Xa_TFPI_binding_TF_VIIa;

d_TF_VIIa_Xa_TFPI = -Reaction_TFPI_unbinding_TF_VIIa_Xa + Reaction_TFPI_binding_TF_VIIa_Xa + Reaction_Xa_TFPI_binding_TF_VIIa;

%d_ATIII = -Reaction_Fbn2_IIa_destruction_by_ATIII -Reaction_Fbn1_2_IIa_destruction_by_ATIII - Reaction_Fbn1_IIa_destruction_by_ATIII - Reaction_XIIa_destruction_by_ATIII - Reaction_Xa_binding_ATIII - Reaction_mIIa_binding_ATIII - Reaction_IXa_binding_ATIII - Reaction_IIa_binding_ATIII - Reaction_TF_VIIa_binding_ATIII - Reaction_XIa_destruction_by_ATIII;
d_ATIII = - Reaction_Xa_binding_ATIII - Reaction_mIIa_binding_ATIII - Reaction_IXa_binding_ATIII - Reaction_IIa_binding_ATIII - Reaction_TF_VIIa_binding_ATIII;

d_Xa_ATIII = Reaction_Xa_binding_ATIII;

d_mIIa_ATIII = Reaction_mIIa_binding_ATIII;

d_IXa_ATIII = Reaction_IXa_binding_ATIII;

d_IIa_ATIII = Reaction_IIa_binding_ATIII;

d_TF_VIIa_ATIII = Reaction_TF_VIIa_binding_ATIII;

%%

dstates = [d_TF;...
d_VII;...
d_TF_VII;...
d_VIIa;...
d_TF_VIIa;...
d_Xa;...
d_IIa;...
d_X;...
d_TF_VIIa_X;...
d_TF_VIIa_Xa;...
d_IX;...
d_TF_VIIa_IX;...
d_IXa;...
d_II;...
d_VIII;...
d_VIIIa;...
d_IXa_VIIIa;...
d_IXa_VIIIa_X;...
d_VIIIa1_L;...
d_VIIIa2;...
d_V;...
d_Va;...
d_Xa_Va;...
d_Xa_Va_II;...
d_mIIa;...
d_TFPI;...
d_Xa_TFPI;...
d_TF_VIIa_Xa_TFPI;...
d_ATIII;...
d_Xa_ATIII;...
d_mIIa_ATIII;...
d_IXa_ATIII;...
d_IIa_ATIII;...
d_TF_VIIa_ATIII;...
];

return