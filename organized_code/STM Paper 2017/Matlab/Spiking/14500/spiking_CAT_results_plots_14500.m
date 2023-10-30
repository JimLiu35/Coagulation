
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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14500/Spiking_CAT_results_14500_1','Cohen_1','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14500/Spiking_CAT_results_14500_1','Cohen_1','G18:K137');

SpikedII183 = CATDataValues(:,1)./1000;
SpikedII185 = CATDataValues(:,2)./1000;
SpikedII244 = CATDataValues(:,3)./1000;
SpikedII257 = CATDataValues(:,4)./1000;
SpikedII298 = CATDataValues(:,5)./1000;


plot(Time,SpikedII183,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII185,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII244,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII257,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII298,'m-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('II = 183','II = 185','II = 244','II = 257','II = 298')
%axis([0 45 -0.06 0.47])

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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','F18:I137');

SpikedIX595 = CATDataValues(:,1)./1000;
SpikedIX868 = CATDataValues(:,2)./1000;
SpikedIX1163 = CATDataValues(:,3)./1000;
SpikedIX1515 = CATDataValues(:,4)./1000;



plot(Time,SpikedIX595,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX868,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX1163,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX1515,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('IX = 595','IX = 868','IX = 1163','IX = 1515')
%axis([0 45 -0.06 0.47])

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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_1','Cohen_1','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_1','Cohen_1','M18:P137');

SpikedVIII97 = CATDataValues(:,1)./1000;  
SpikedVIII282 = CATDataValues(:,2)./1000;
SpikedVIII513 = CATDataValues(:,3)./1000;   
SpikedVIII575 = CATDataValues(:,4)./1000;


plot(Time,SpikedVIII97,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII282,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII513,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII575,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('VIII = 97','VIII = 282','VIII = 513','VIII = 575')
%axis([0 45 -0.06 0.47])

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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_1','Cohen_1','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_1','Cohen_1','C18:F137');

SpikedX216 = CATDataValues(:,1)./1000;   
SpikedX251 = CATDataValues(:,2)./1000;
SpikedX294 = CATDataValues(:,3)./1000;
SpikedX348 = CATDataValues(:,4)./1000;


plot(Time,SpikedX216,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX251,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX294,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX348,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('X = 216','X = 251','X = 294','X = 348')
%axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Spiked VII

figure(5)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','C18:E137');

%nominal values
SpikedVII265 = CATDataValues(:,1)./1000;
SpikedVII440 = CATDataValues(:,2)./1000;
SpikedVII615 = CATDataValues(:,3)./1000;


plot(Time,SpikedVII265,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVII440,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVII615,'b-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('nominal VII = 265','nominal VII = 440','nominal VII = 615')
%axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Spiked ATIII

figure(6)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','J18:M137');


SpikedATIII166 = CATDataValues(:,1)./1000;
SpikedATIII196 = CATDataValues(:,2)./1000;
SpikedATIII276 = CATDataValues(:,3)./1000;
SpikedATIII243 = CATDataValues(:,4)./1000;


plot(Time,SpikedATIII166,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedATIII196,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedATIII276,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedATIII243,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('ATIII = 166','ATIII = 196','ATIII = 276','ATIII = 243')
%axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Controls

figure(7)
clf
hold on
grid on

OrigTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','M2:M121');
Orig14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','P2:P121')./1000;

Plate1Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_1','Cohen_1','A18:A137');
Plate1First14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_1','Cohen_1','B18:B137')./1000;

Plate2Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','A18:A137');
Plate2First14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','B18:B137')./1000;

plot(OrigTime,Orig14500,'r-','LineWidth',6,'MarkerSize',12)
plot(Plate1Time,Plate1First14500,'g-','LineWidth',6,'MarkerSize',12)
plot(Plate2Time,Plate2First14500,'b-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('Original Unspiked 14500','Plate 1 Unspiked 14500','Plate 2 Unspiked 14500')
title('CAT Controls')
%axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)
