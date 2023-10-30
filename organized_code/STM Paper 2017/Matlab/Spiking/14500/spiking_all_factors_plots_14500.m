
clear all;
close all;
clc;

format long e;

%%
%14500

OriginalSpikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/STAGO_results_14500','Sheet1','B3:H3');


originalII = OriginalSpikingDataValues(1,1);
originalV = OriginalSpikingDataValues(1,2);
originalVII = OriginalSpikingDataValues(1,3);
originalVIII = OriginalSpikingDataValues(1,4);
originalIX = OriginalSpikingDataValues(1,5);
originalX = OriginalSpikingDataValues(1,6);
originalATIII = OriginalSpikingDataValues(1,7);


%%
figure(1)
clf
hold on
grid on

IIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/STAGO_results_14500','Sheet1','B4:H9');

IIpercentactivity = IIspikingDataValues(:,1);
Vpercentactivity = IIspikingDataValues(:,2);
VIIpercentactivity = IIspikingDataValues(:,3);
VIIIpercentactivity = IIspikingDataValues(:,4);
IXpercentactivity = IIspikingDataValues(:,5);
Xpercentactivity = IIspikingDataValues(:,6);
ATIIIpercentactivity = IIspikingDataValues(:,7);

%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

plot(IIpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
plot(IIpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
plot(IIpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
plot(IIpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
plot(IIpercentactivity,VIIIpercentactivity,'c*','LineWidth',6,'MarkerSize',12)
plot(IIpercentactivity,ATIIIpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

plot(originalII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
plot(originalII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
plot(originalII,originalX,'kx','LineWidth',3,'MarkerSize',6)
plot(originalII,originalV,'mo','LineWidth',3,'MarkerSize',6)
plot(originalII,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
plot(originalII,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked II [%-activity]')
ylabel('%-activity')
legend('VII','IX','X','V','VIII','ATIII')
axis([60 400 40 250])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(2)
clf
hold on
grid on

VIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/STAGO_results_14500','Sheet1','B14:H17');

IIpercentactivity = VIIIspikingDataValues(:,1);
Vpercentactivity = VIIIspikingDataValues(:,2);
VIIpercentactivity = VIIIspikingDataValues(:,3);
VIIIpercentactivity = VIIIspikingDataValues(:,4);
IXpercentactivity = VIIIspikingDataValues(:,5);
Xpercentactivity = VIIIspikingDataValues(:,6);
ATIIIpercentactivity = VIIIspikingDataValues(:,7);

%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

plot(VIIIpercentactivity,IIpercentactivity,'r^','LineWidth',6,'MarkerSize',12)
plot(VIIIpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
plot(VIIIpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
plot(VIIIpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
plot(VIIIpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
plot(VIIIpercentactivity,ATIIIpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

plot(originalVIII,originalII,'r^','LineWidth',3,'MarkerSize',6)
plot(originalVIII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
plot(originalVIII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
plot(originalVIII,originalX,'kx','LineWidth',3,'MarkerSize',6)
plot(originalVIII,originalV,'mo','LineWidth',3,'MarkerSize',6)
plot(originalVIII,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked VIII [%-activity]')
ylabel('%-activity')
legend('II','VII','IX','X','V','ATIII')
axis([60 700 40 250])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(3)
clf
hold on
grid on

IXspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/STAGO_results_14500','Sheet1','B22:H25');

IIpercentactivity = IXspikingDataValues(:,1);
Vpercentactivity = IXspikingDataValues(:,2);
VIIpercentactivity = IXspikingDataValues(:,3);
VIIIpercentactivity = IXspikingDataValues(:,4);
IXpercentactivity = IXspikingDataValues(:,5);
Xpercentactivity = IXspikingDataValues(:,6);
ATIIIpercentactivity = IXspikingDataValues(:,7);

%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

plot(IXpercentactivity,IIpercentactivity,'r^','LineWidth',6,'MarkerSize',12)
plot(IXpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
plot(IXpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
plot(IXpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
plot(IXpercentactivity,VIIIpercentactivity,'c*','LineWidth',6,'MarkerSize',12)
plot(IXpercentactivity,ATIIIpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

plot(originalIX,originalII,'r^','LineWidth',3,'MarkerSize',6)
plot(originalIX,originalVII,'gs','LineWidth',3,'MarkerSize',6)
plot(originalIX,originalX,'kx','LineWidth',3,'MarkerSize',6)
plot(originalIX,originalV,'mo','LineWidth',3,'MarkerSize',6)
plot(originalIX,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
plot(originalIX,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked IX [%-activity]')
ylabel('%-activity')
legend('II','VII','X','V','VIII','ATIII',2)
axis([60 1600 40 250])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(4)
clf
hold on
grid on

XspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/STAGO_results_14500','Sheet1','B10:H13');

IIpercentactivity = XspikingDataValues(:,1);
Vpercentactivity = XspikingDataValues(:,2);
VIIpercentactivity = XspikingDataValues(:,3);
VIIIpercentactivity = XspikingDataValues(:,4);
IXpercentactivity = XspikingDataValues(:,5);
Xpercentactivity = XspikingDataValues(:,6);
ATIIIpercentactivity = XspikingDataValues(:,7);

%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

plot(Xpercentactivity,IIpercentactivity,'r^','LineWidth',6,'MarkerSize',12)
plot(Xpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
plot(Xpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
plot(Xpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
plot(Xpercentactivity,VIIIpercentactivity,'c*','LineWidth',6,'MarkerSize',12)
plot(Xpercentactivity,ATIIIpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

plot(originalX,originalII,'r^','LineWidth',3,'MarkerSize',6)
plot(originalX,originalVII,'gs','LineWidth',3,'MarkerSize',6)
plot(originalX,originalIX,'bd','LineWidth',3,'MarkerSize',6)
plot(originalX,originalV,'mo','LineWidth',3,'MarkerSize',6)
plot(originalX,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
plot(originalX,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked X [%-activity]')
ylabel('%-activity')
legend('II','VII','IX','V','VIII','ATIII')
axis([60 400 20 220])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(5)
clf
hold on
grid on

ATIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14500/STAGO_results_14500','Sheet1','B18:H21');

IIpercentactivity = ATIIIspikingDataValues(:,1);
Vpercentactivity = ATIIIspikingDataValues(:,2);
VIIpercentactivity = ATIIIspikingDataValues(:,3);
VIIIpercentactivity = ATIIIspikingDataValues(:,4);
IXpercentactivity = ATIIIspikingDataValues(:,5);
Xpercentactivity = ATIIIspikingDataValues(:,6);
ATIIIpercentactivity = ATIIIspikingDataValues(:,7);

%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

plot(ATIIIpercentactivity,IIpercentactivity,'r^','LineWidth',6,'MarkerSize',12)
plot(ATIIIpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
plot(ATIIIpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
plot(ATIIIpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
plot(ATIIIpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
plot(ATIIIpercentactivity,VIIIpercentactivity,'c*','LineWidth',6,'MarkerSize',12)

plot(originalATIII,originalII,'r^','LineWidth',3,'MarkerSize',6)
plot(originalATIII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
plot(originalATIII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
plot(originalATIII,originalX,'kx','LineWidth',3,'MarkerSize',6)
plot(originalATIII,originalV,'mo','LineWidth',3,'MarkerSize',6)
plot(originalATIII,originalVIII,'c*','LineWidth',3,'MarkerSize',6)

xlabel('Spiked ATIII [%-activity]')
ylabel('%-activity')
legend('II','VII','IX','X','V','VIII')
axis([60 400 40 250])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)
