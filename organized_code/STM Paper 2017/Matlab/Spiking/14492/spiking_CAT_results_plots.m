
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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','C18:I137');

SpikedII77 = CATDataValues(:,1)./1000;
SpikedII90 = CATDataValues(:,2)./1000;
SpikedII101 = CATDataValues(:,3)./1000;
SpikedII113 = CATDataValues(:,4)./1000;
SpikedII115 = CATDataValues(:,5)./1000;
SpikedII124 = CATDataValues(:,6)./1000;
SpikedII141 = CATDataValues(:,7)./1000;


plot(Time,SpikedII77,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII90,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII101,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII113,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII115,'m-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII124,'c-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII141,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('II = 77','II = 90','II = 101','II = 113','II = 115','II = 124','II = 141')
axis([0 45 -0.02 0.17])

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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','J18:P137');

SpikedIX110 = CATDataValues(:,1)./1000;
SpikedIX125 = CATDataValues(:,2)./1000;
SpikedIX139 = CATDataValues(:,3)./1000;
SpikedIX132 = CATDataValues(:,4)./1000;
SpikedIX160 = CATDataValues(:,5)./1000;
SpikedIX168 = CATDataValues(:,6)./1000;
SpikedIX179 = CATDataValues(:,7)./1000;


plot(Time,SpikedIX110,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX125,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX139,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX132,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX160,'m-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX168,'c-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX179,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('IX = 110','IX = 125','IX = 139','IX = 132','IX = 160','IX = 168','IX = 179')
axis([0 45 -0.02 0.17])

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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','B18:J137');

SpikedVIII47 = CATDataValues(:,1)./1000;
SpikedVIII90 = CATDataValues(:,2)./1000;
SpikedVIII111 = CATDataValues(:,3)./1000;
SpikedVIII168 = CATDataValues(:,4)./1000;
SpikedVIII203 = CATDataValues(:,5)./1000;
SpikedVIII330 = CATDataValues(:,6)./1000;
SpikedVIII390 = CATDataValues(:,7)./1000;
SpikedVIII506 = CATDataValues(:,8)./1000;
SpikedVIII593 = CATDataValues(:,9)./1000;

plot(Time,SpikedVIII47,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII90,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII111,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII168,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII203,'m-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII330,'c-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII390,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII506,'r^-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII593,'gs-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('VIII = 47','VIII = 90','VIII = 111','VIII = 168','VIII = 203','VIII = 330','VIII = 390','VIII = 506','VIII = 593')
axis([0 45 -0.02 0.17])

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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_3','Cohen_lab_06-30-14','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_3','Cohen_lab_06-30-14','C18:H137');

SpikedX69 = CATDataValues(:,1)./1000;
SpikedX77 = CATDataValues(:,2)./1000;
SpikedX93 = CATDataValues(:,3)./1000;
SpikedX112 = CATDataValues(:,4)./1000;
SpikedX120 = CATDataValues(:,5)./1000;
SpikedX130 = CATDataValues(:,6)./1000;

plot(Time,SpikedX69,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX77,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX93,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX112,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX120,'m-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX130,'c-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('X = 69','X = 77','X = 93','X = 112','X = 120','X = 130')
axis([0 45 -0.02 0.17])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)


%%

%Spiked VIII and X

figure(5)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','K18:O137');

SpikedVIII508X68 = CATDataValues(:,1)./1000;
SpikedVIII143X88 = CATDataValues(:,2)./1000;
SpikedVIII357X80 = CATDataValues(:,3)./1000;
SpikedVIII91X110 = CATDataValues(:,4)./1000;
SpikedVIII186X113 = CATDataValues(:,5)./1000;

plot(Time,SpikedVIII508X68,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII143X88,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII357X80,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII91X110,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII186X113,'m-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('VIII = 508, X = 68','VIII = 143, X = 88','VIII = 357, X = 80','VIII = 91, X = 110','VIII = 186, X = 113')
axis([0 45 -0.02 0.17])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)


%%

%Controls

figure(6)
clf
hold on
grid on

OrigTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:A121');
Orig14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','F2:F121')./1000;

Plate1Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','A18:A137');
Plate1First14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','B18:B137')./1000;
Plate1Second14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','Q18:Q137')./1000;

Plate2Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','A18:A137');
Plate2First14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','P18:P137')./1000;

Plate3Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_3','Cohen_lab_06-30-14','A18:A137');
Plate3First14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14492/Spiking_CAT_results_3','Cohen_lab_06-30-14','B18:B137')./1000;

plot(OrigTime,Orig14492,'r-','LineWidth',6,'MarkerSize',12)
plot(Plate1Time,Plate1First14492,'g-','LineWidth',6,'MarkerSize',12)
plot(Plate1Time,Plate1Second14492,'b-','LineWidth',6,'MarkerSize',12)
plot(Plate2Time,Plate2First14492,'k-','LineWidth',6,'MarkerSize',12)
plot(Plate3Time,Plate3First14492,'m-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('Original Unspiked 14492','Plate 1 First Unspiked 14492','Plate 1 Second Unspiked 14492','Plate 2 Unspiked 14492','Plate 3 Unspiked 14492')
title('CAT Controls')
axis([0 45 -0.02 0.17])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)


%%

%Spiked ATIII

figure(7)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','N18:Q137');

%nominal values
SpikedATIII115 = CATDataValues(:,1)./1000;
SpikedATIII130 = CATDataValues(:,2)./1000;
SpikedATIII145 = CATDataValues(:,3)./1000;
SpikedATIII165 = CATDataValues(:,4)./1000;


plot(Time,SpikedATIII115,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedATIII130,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedATIII145,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedATIII165,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('nominal ATIII = 115','nominal ATIII = 130','nominal ATIII = 145','nominal ATIII = 165')
%axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)
