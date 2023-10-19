
clear all;
close all;
clc;

format long e;

% %%
% 
% %Spiked II
% 
% figure(1)
% clf
% hold on
% grid on
% 
% Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/Spiking_CAT_results_14504_1','Cohen_1','A18:A137');
% 
% CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/Spiking_CAT_results_14504_1','Cohen_1','?18:?137');
% 
% SpikedII183 = CATDataValues(:,1)./1000;
% SpikedII185 = CATDataValues(:,2)./1000;
% SpikedII244 = CATDataValues(:,3)./1000;
% SpikedII257 = CATDataValues(:,4)./1000;
% SpikedII298 = CATDataValues(:,5)./1000;
% 
% 
% plot(Time,SpikedII183,'r-','LineWidth',6,'MarkerSize',12)
% plot(Time,SpikedII185,'g-','LineWidth',6,'MarkerSize',12)
% plot(Time,SpikedII244,'b-','LineWidth',6,'MarkerSize',12)
% plot(Time,SpikedII257,'k-','LineWidth',6,'MarkerSize',12)
% plot(Time,SpikedII298,'m-','LineWidth',6,'MarkerSize',12)
% 
% xlabel('Time [min]')
% ylabel('IIa [\muM]')
% legend('II = 183','II = 185','II = 244','II = 257','II = 298')
% %axis([0 45 -0.06 0.47])
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)

%%

%Spiked IX

figure(2)
clf
hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','A18:A107');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','C18:G137');

SpikedIX135 = CATDataValues(:,1)./1000;
SpikedIX117 = CATDataValues(:,2)./1000;
SpikedIX209 = CATDataValues(:,3)./1000;
SpikedIX255 = CATDataValues(:,4)./1000;
SpikedIX323 = CATDataValues(:,5)./1000;


plot(Time,SpikedIX135,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX117,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX209,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX255,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedIX323,'m-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('IX = 135','IX = 117','IX = 209','IX = 255','IX = 323')
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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','A18:A107');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','H18:J107');

SpikedVIII220 = CATDataValues(:,1)./1000;  
SpikedVIII396 = CATDataValues(:,2)./1000;
SpikedVIII550 = CATDataValues(:,3)./1000;   


plot(Time,SpikedVIII220,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII396,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII550,'b-','LineWidth',6,'MarkerSize',12)



xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('VIII = 220','VIII = 396','VIII = 550')
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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','A18:A107');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','K18:P107');

SpikedX115 = CATDataValues(:,1)./1000;   
SpikedX133 = CATDataValues(:,2)./1000;
SpikedX178 = CATDataValues(:,3)./1000;
SpikedX215 = CATDataValues(:,4)./1000;
SpikedX280 = CATDataValues(:,5)./1000;
SpikedX317 = CATDataValues(:,6)./1000;

plot(Time,SpikedX115,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX133,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX178,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX215,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX280,'m-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX317,'c-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('X = 115','X = 133','X = 178','X = 215', 'X = 280', 'X = 317')
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

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_2','Cohen_2','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_2','Cohen_2','G18:I137');


SpikedVII350 = CATDataValues(:,1)./1000;
SpikedVII508 = CATDataValues(:,2)./1000;
SpikedVII628 = CATDataValues(:,3)./1000;


plot(Time,SpikedVII350,'r-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVII508,'g-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVII628,'b-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('VII = 350','VII = 508','VII = 628')
%axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

% %%
% 
% %Spiked ATIII
% 
% figure(6)
% clf
% hold on
% grid on
% 
% Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','A18:A137');
% 
% CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/Spiking_CAT_results_14500_2','Cohen_2','J18:M137');
% 
% 
% SpikedATIII166 = CATDataValues(:,1)./1000;
% SpikedATIII196 = CATDataValues(:,2)./1000;
% SpikedATIII276 = CATDataValues(:,3)./1000;
% SpikedATIII243 = CATDataValues(:,4)./1000;
% 
% 
% plot(Time,SpikedATIII166,'r-','LineWidth',6,'MarkerSize',12)
% plot(Time,SpikedATIII196,'g-','LineWidth',6,'MarkerSize',12)
% plot(Time,SpikedATIII276,'b-','LineWidth',6,'MarkerSize',12)
% plot(Time,SpikedATIII243,'k-','LineWidth',6,'MarkerSize',12)
% 
% 
% xlabel('Time [min]')
% ylabel('IIa [\muM]')
% legend('ATIII = 166','ATIII = 196','ATIII = 276','ATIII = 243')
% %axis([0 45 -0.06 0.47])
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)
% 
%%

%Controls

figure(7)
clf
hold on
grid on

OrigTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','T2:T121');
Orig14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','V2:V121')./1000;

Plate1Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','A18:A107');
Plate1First14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','B18:B107')./1000;

Plate2Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_2','Cohen_2','A18:A137');
Plate2First14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_2','Cohen_2','F18:F137')./1000;

plot(OrigTime,Orig14504,'r-','LineWidth',6,'MarkerSize',12)
plot(Plate1Time,Plate1First14504,'g-','LineWidth',6,'MarkerSize',12)
plot(Plate2Time,Plate2First14504,'b-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
legend('Original Unspiked 14504','Plate 1 Unspiked 14504','Plate 2 Unspiked 14504')
title('CAT Controls')
%axis([0 45 -0.06 0.47])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)
