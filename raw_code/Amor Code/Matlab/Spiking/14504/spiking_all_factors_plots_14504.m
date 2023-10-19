
clear all;
close all;
clc;

format long e;

%%
%14504

OriginalSpikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/STAGO_results_14504','Sheet1','B3:H3');


originalII = OriginalSpikingDataValues(1,1);
originalV = OriginalSpikingDataValues(1,2);
originalVII = OriginalSpikingDataValues(1,3);
originalVIII = OriginalSpikingDataValues(1,4);
originalIX = OriginalSpikingDataValues(1,5);
originalX = OriginalSpikingDataValues(1,6);
originalATIII = OriginalSpikingDataValues(1,7);


% %%
% figure(1)
% clf
% hold on
% grid on
% 
% IIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/STAGO_results_14504','Sheet1','B?:H?');
% 
% IIpercentactivity = IIspikingDataValues(:,1);
% Vpercentactivity = IIspikingDataValues(:,2);
% VIIpercentactivity = IIspikingDataValues(:,3);
% VIIIpercentactivity = IIspikingDataValues(:,4);
% IXpercentactivity = IIspikingDataValues(:,5);
% Xpercentactivity = IIspikingDataValues(:,6);
% ATIIIpercentactivity = IIspikingDataValues(:,7);
% 
% %plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
% %plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};
% 
% plot(IIpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
% plot(IIpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
% plot(IIpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
% plot(IIpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
% plot(IIpercentactivity,VIIIpercentactivity,'c*','LineWidth',6,'MarkerSize',12)
% plot(IIpercentactivity,ATIIIpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
% 
% plot(originalII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalX,'kx','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalV,'mo','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)
% 
% xlabel('Spiked II [%-activity]')
% ylabel('%-activity')
% legend('VII','IX','X','V','VIII','ATIII')
% axis([0 700 0 160])
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)

%%
figure(2)
clf
hold on
grid on

VIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/STAGO_results_14504','Sheet1','B9:H11');

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
axis([0 700 0 160])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(3)
clf
hold on
grid on

IXspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/STAGO_results_14504','Sheet1','B4:H8');

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
legend('II','VII','X','V','VIII','ATIII')
axis([0 700 0 160])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%
figure(4)
clf
hold on
grid on

XspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/STAGO_results_14504','Sheet1','B12:H17');

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
axis([0 700 0 160])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

% %%
% figure(5)
% clf
% hold on
% grid on
% 
% ATIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/STAGO_results_14504','Sheet1','B?:H?');
% 
% IIpercentactivity = ATIIIspikingDataValues(:,1);
% Vpercentactivity = ATIIIspikingDataValues(:,2);
% VIIpercentactivity = ATIIIspikingDataValues(:,3);
% VIIIpercentactivity = ATIIIspikingDataValues(:,4);
% IXpercentactivity = ATIIIspikingDataValues(:,5);
% Xpercentactivity = ATIIIspikingDataValues(:,6);
% ATIIIpercentactivity = ATIIIspikingDataValues(:,7);
% 
% %plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
% %plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};
% 
% plot(ATIIIpercentactivity,IIpercentactivity,'r^','LineWidth',6,'MarkerSize',12)
% plot(ATIIIpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
% plot(ATIIIpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
% plot(ATIIIpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
% plot(ATIIIpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
% plot(ATIIIpercentactivity,VIIIpercentactivity,'c*','LineWidth',6,'MarkerSize',12)
% 
% plot(originalATIII,originalII,'r^','LineWidth',3,'MarkerSize',6)
% plot(originalATIII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
% plot(originalATIII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
% plot(originalATIII,originalX,'kx','LineWidth',3,'MarkerSize',6)
% plot(originalATIII,originalV,'mo','LineWidth',3,'MarkerSize',6)
% plot(originalATIII,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
% 
% xlabel('Spiked ATIII [%-activity]')
% ylabel('%-activity')
% legend('II','VII','IX','X','V','VIII')
% axis([0 700 0 160])
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)

%%
figure(6)
clf
hold on
grid on

VIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/14504/STAGO_results_14504','Sheet1','B18:H20');

IIpercentactivity = VIIspikingDataValues(:,1);
Vpercentactivity = VIIspikingDataValues(:,2);
VIIpercentactivity = VIIspikingDataValues(:,3);
VIIIpercentactivity = VIIspikingDataValues(:,4);
IXpercentactivity = VIIspikingDataValues(:,5);
Xpercentactivity = VIIspikingDataValues(:,6);
ATIIIpercentactivity = VIIspikingDataValues(:,7);

%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

plot(VIIpercentactivity,IIpercentactivity,'r^','LineWidth',6,'MarkerSize',12)
plot(VIIpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
plot(VIIpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
plot(VIIpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
plot(VIIpercentactivity,VIIIpercentactivity,'c*','LineWidth',6,'MarkerSize',12)
plot(VIIpercentactivity,ATIIIpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

plot(originalVII,originalII,'r^','LineWidth',3,'MarkerSize',6)
plot(originalVII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
plot(originalVII,originalX,'kx','LineWidth',3,'MarkerSize',6)
plot(originalVII,originalV,'mo','LineWidth',3,'MarkerSize',6)
plot(originalVII,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
plot(originalVII,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)


xlabel('Spiked VII [%-activity]')
ylabel('%-activity')
legend('II','IX','X','V','VIII','ATIII',2)
axis([0 700 0 160])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)