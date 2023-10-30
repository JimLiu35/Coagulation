
clear all;
close all;
clc;

format long e;

%%

%Spiked II

figure(1)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_1','Cohen_1','A18:A107');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_1','Cohen_1','G18:L107');

SpikedII130 = CATDataValues(:,1)./1000;
SpikedII160 = CATDataValues(:,2)./1000;
SpikedII180 = CATDataValues(:,3)./1000;
SpikedII201 = CATDataValues(:,4)./1000;
SpikedII230 = CATDataValues(:,5)./1000;
SpikedII260 = CATDataValues(:,6)./1000;


plot(Time,SpikedII130,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII160,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII180,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII201,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII230,'m-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII260,'c-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('II = 130','II = 160','II = 180','II = 201','II = 230','II = 260')
axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Spiked IX

figure(2)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_1','Cohen_1','A18:A107');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_1','Cohen_1','C18:F137');

SpikedIX242 = CATDataValues(:,1)./1000;
SpikedIX336 = CATDataValues(:,2)./1000;
SpikedIX446 = CATDataValues(:,3)./1000;
SpikedIX469 = CATDataValues(:,4)./1000;



plot(Time,SpikedIX242,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX336,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX446,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX469,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('IX = 242','IX = 336','IX = 446','IX = 469')
axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Spiked VIII

figure(3)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_2','Cohen_2','A18:A107');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_2','Cohen_2','H18:K107');

SpikedVIII211 = CATDataValues(:,1)./1000;  
SpikedVIII402 = CATDataValues(:,2)./1000;
SpikedVIII450 = CATDataValues(:,3)./1000;   %actual VIII unknown
SpikedVIII820 = CATDataValues(:,4)./1000;


plot(Time,SpikedVIII211,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII402,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII450,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII820,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('VIII = 211','VIII = 402','VIII = 683','VIII = 820')
axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Spiked X

figure(4)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_2','Cohen_2','A18:A107');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_2','Cohen_2','C18:G107');

SpikedX150 = CATDataValues(:,1)./1000;   %actual X unknown
SpikedX210 = CATDataValues(:,2)./1000;
SpikedX246 = CATDataValues(:,3)./1000;
SpikedX310 = CATDataValues(:,4)./1000;
SpikedX346 = CATDataValues(:,5)./1000;


plot(Time,SpikedX150,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX210,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX246,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX310,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX346,'m-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('X = 163','X = 210','X = 246','X = 310','X = 346')
axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)



%%

%Controls

figure(5)
clf
hold on
grid on

OrigTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','M2:M121');
Orig14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','Q2:Q121')./1000;

Plate1Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_1','Cohen_1','A18:A107');
Plate1First14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_1','Cohen_1','B18:B107')./1000;

Plate2Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_2','Cohen_2','A18:A107');
Plate2First14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14501/Spiking_CAT_results_14501_2','Cohen_2','B18:B107')./1000;

plot(OrigTime,Orig14501,'r-','LineWidth',6,'MarkerSize',12)
plot(Plate1Time,Plate1First14501,'g-','LineWidth',6,'MarkerSize',12)
plot(Plate2Time,Plate2First14501,'b-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('Original Unspiked 14501','Plate 1 Unspiked 14501','Plate 2 Unspiked 14501')
title('CAT Controls')
axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)
