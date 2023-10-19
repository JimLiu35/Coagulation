

clear all;
close all;
clc;

format long e;

%%
%14492

originalII = 52;
originalV = 53;
originalVII = 46;
originalVIII = 32;
originalIX = 60;
originalX = 45;
originalATIII = 79;


%%
figure(1)
clf
hold on
grid on

IIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B2:H9');

IIpercentactivity = IIspikingDataValues(:,1);
VIIpercentactivity = IIspikingDataValues(:,2);
IXpercentactivity = IIspikingDataValues(:,3);
Xpercentactivity = IIspikingDataValues(:,4);
Vpercentactivity = IIspikingDataValues(:,5);
VIIIpercentactivity = IIspikingDataValues(:,6);
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
axis([30 200 30 120])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(2)
clf
hold on
grid on

VIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B11:H19');

IIpercentactivity = VIIIspikingDataValues(:,1);
VIIpercentactivity = VIIIspikingDataValues(:,2);
IXpercentactivity = VIIIspikingDataValues(:,3);
Xpercentactivity = VIIIspikingDataValues(:,4);
Vpercentactivity = VIIIspikingDataValues(:,5);
VIIIpercentactivity = VIIIspikingDataValues(:,6);
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
axis([30 700 30 120])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(3)
clf
hold on
grid on

IXspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B21:H27');

IIpercentactivity = IXspikingDataValues(:,1);
VIIpercentactivity = IXspikingDataValues(:,2);
IXpercentactivity = IXspikingDataValues(:,3);
Xpercentactivity = IXspikingDataValues(:,4);
Vpercentactivity = IXspikingDataValues(:,5);
VIIIpercentactivity = IXspikingDataValues(:,6);
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
axis([30 200 30 120])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(4)
clf
hold on
grid on

XspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B29:H34');

IIpercentactivity = XspikingDataValues(:,1);
VIIpercentactivity = XspikingDataValues(:,2);
IXpercentactivity = XspikingDataValues(:,3);
Xpercentactivity = XspikingDataValues(:,4);
Vpercentactivity = XspikingDataValues(:,5);
VIIIpercentactivity = XspikingDataValues(:,6);
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
axis([30 200 30 120])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(5)
clf
hold on
grid on

X_VIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B36:H41');

IIpercentactivity = X_VIIIspikingDataValues(:,1);
VIIpercentactivity = X_VIIIspikingDataValues(:,2);
IXpercentactivity = X_VIIIspikingDataValues(:,3);
Xpercentactivity = X_VIIIspikingDataValues(:,4);
Vpercentactivity = X_VIIIspikingDataValues(:,5);
VIIIpercentactivity = X_VIIIspikingDataValues(:,6);
ATIIIpercentactivity = X_VIIIspikingDataValues(:,7);

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

xlabel('Spiked VIII [%-activity] (along with X)')
ylabel('%-activity')
legend('II','VII','IX','X','V','ATIII')
axis([30 700 30 120])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)