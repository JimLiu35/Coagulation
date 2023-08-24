
clear all;
close all;
clc;

LargeRangeTF = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','G2:G11');
LargeRangePeak = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','H2:H11');
LargeRangePeakStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','T2:T11');
LargeRangeUndelayedTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','H40:H49');
LargeRangeUndelayedTimeStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','T40:T49');
LargeRangeDelay = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','H27:H36');
LargeRangeDelayStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','T27:T36');
LargeRangeETP = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','H53:H62');
LargeRangeETPStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_020814','Sheet1','T53:T62');

%LargeRangePeakModel = 0.0084111416*LargeRangeTF + 0.1610858650;
LargeRangePeakModel = 0.0076620256*LargeRangeTF + 0.1642260069;
%LargeRangeUndelayedTimeModel = -0.1181946903*LargeRangeTF + 3.8582168142;
LargeRangeUndelayedTimeModel = -0.1065663717*LargeRangeTF + 3.8362064897;
LargeRangeTFFine = LargeRangeTF(1):0.1:LargeRangeTF(length(LargeRangeTF));
%LargeRangeDelayModel = 4.4945936729*LargeRangeTFFine.^(-0.3460904673);
LargeRangeDelayModel = 4.4805011550*LargeRangeTFFine.^(-0.3225130141);
LargeRangeETPModel = 2*(0.0076620256*LargeRangeTF + 0.1642260069).*(-0.1065663717*LargeRangeTF + 3.8362064897);

LargeNumberTF = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','A2:A4');
LargeNumberPeak = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','W2:W4');
LargeNumberPeakStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','Y2:Y4');
LargeNumberUndelayedTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','W44:W46');
LargeNumberUndelayedTimeStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','Y44:Y46');
LargeNumberETP = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','W107:W109');
LargeNumberETPStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','Y107:Y109');
LargeNumberDelay = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','W65:W67');
LargeNumberDelayStdDev = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/TF_gradient_Mar14','Sheet1','Y65:Y67');

LargeNumberPeakModel = 0.0133721636*LargeNumberTF + 0.0433734153;
LargeNumberUndelayedTimeModel = -0.1836503322*LargeNumberTF + 5.7131362126;
LargeNumberTFFine = LargeNumberTF(1):0.1:LargeNumberTF(length(LargeNumberTF));
LargeNumberDelayModel = 5.9508688036*LargeNumberTFFine.^(-0.4119533366);
LargeNumberETPModel = 2*(0.0133721636*LargeNumberTFFine + 0.0433734153).*(-0.1836503322*LargeNumberTFFine + 5.7131362126);


figure(1)
clf
subplot(2,2,1)
hold on
errorbar(LargeRangeTF,LargeRangePeak,LargeRangePeakStdDev,'bo','LineWidth',6,'MarkerSize',12)
LargeRangePeakBestFit = plot(LargeRangeTF,LargeRangePeakModel,'b-','LineWidth',6,'MarkerSize',12);
grid on
box on
axis([0 20.5 0 0.4])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. P [\muM]')
title('A')

errorbar(LargeNumberTF,LargeNumberPeak,LargeNumberPeakStdDev,'ro','LineWidth',6,'MarkerSize',12)
LargeNumberPeakBestFit = plot(LargeNumberTF,LargeNumberPeakModel,'r-.','LineWidth',6,'MarkerSize',12);

%legendlines = [LargeRangePeakBestFit(1) LargeNumberPeakBestFit(1)];

%legend(legendlines,'Avg. P best linear fit, 2 normals\newline10 TF concentrations','Avg. P best linear fit, 20 normals\newline3 TF concentrations',4)


figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)


subplot(2,2,2)
hold on
errorbar(LargeRangeTF,LargeRangeUndelayedTime,LargeRangeUndelayedTimeStdDev,'bo','LineWidth',6,'MarkerSize',12)
LargeRangeUndelayedTimeBestFit = plot(LargeRangeTF,LargeRangeUndelayedTimeModel,'b-','LineWidth',6,'MarkerSize',12);
grid on
box on
axis([0 20.5 0 8])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. (T_P - T) [min]')
title('B')

errorbar(LargeNumberTF,LargeNumberUndelayedTime,LargeNumberUndelayedTimeStdDev,'ro','LineWidth',6,'MarkerSize',12)
LargeNumberUndelayedTimeBestFit = plot(LargeNumberTF,LargeNumberUndelayedTimeModel,'r-.','LineWidth',6,'MarkerSize',12);

%legendlines = [LargeRangeUndelayedTimeBestFit(1) LargeNumberUndelayedTimeBestFit(1)];

%legend(legendlines,'Avg. (T_P - T) best linear fit, 2 normals\newline10 TF concentrations','Avg. (T_P - T) best linear fit, 20 normals\newline3 TF concentrations',1)


figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)



%figure(2)
%clf

subplot(2,2,3)
hold on
errorbar(LargeRangeTF,LargeRangeETP,LargeRangeETPStdDev,'bo','LineWidth',6,'MarkerSize',12)
LargeRangeETPBestFit = plot(LargeRangeTF,LargeRangeETPModel,'b-','LineWidth',6,'MarkerSize',12);
grid on
box on
axis([0 20.5 0 2])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. IIa_{tot} [\muM min]')
title('C')

errorbar(LargeNumberTF,LargeNumberETP,LargeNumberETPStdDev,'ro','LineWidth',6,'MarkerSize',12)
LargeNumberETPBestFit = plot(LargeNumberTFFine,LargeNumberETPModel,'r-.','LineWidth',6,'MarkerSize',12);

%legendlines = LargeNumberETPBestFit(1);

%legend(legendlines,'Avg. IIa_{tot} sample parabolic fit with scaled product of Avg. P and\newlineAvg. (T_P-T) linear fits, 20 normals 3 TF concentrations',4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)



subplot(2,2,4)
hold on
errorbar(LargeRangeTF,LargeRangeDelay,LargeRangeDelayStdDev,'bo','LineWidth',6,'MarkerSize',12)
LargeRangeDelayBestFit = plot(LargeRangeTFFine,LargeRangeDelayModel,'b-','LineWidth',6,'MarkerSize',12);
grid on
box on
axis([0 20.5 0 10])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. T [min]')
title('D')

errorbar(LargeNumberTF,LargeNumberDelay,LargeNumberDelayStdDev,'ro','LineWidth',6,'MarkerSize',12)
LargeNumberDelayBestFit = plot(LargeNumberTFFine,LargeNumberDelayModel,'r-.','LineWidth',6,'MarkerSize',12);

%legendlines = [LargeRangeDelayBestFit(1) LargeNumberDelayBestFit(1)];

%legend(legendlines,'Avg. T best power law fit, 2 normals\newline10 TF concentrations','Avg. T best power law fit, 20 normals\newline3 TF concentrations',1)


figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)