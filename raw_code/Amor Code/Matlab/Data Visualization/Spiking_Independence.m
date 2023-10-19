
function Spiking_Independence

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

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);

subplot(2,2,1)

hold on
grid on
box on

IIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B3:H9');

IIpercentactivity = IIspikingDataValues(:,1);
VIIpercentactivity = IIspikingDataValues(:,2);
IXpercentactivity = IIspikingDataValues(:,3);
Xpercentactivity = IIspikingDataValues(:,4);
Vpercentactivity = IIspikingDataValues(:,5);
VIIIpercentactivity = IIspikingDataValues(:,6);
ATIIIpercentactivity = IIspikingDataValues(:,7);

[fitVpercentactivityfromIIfactors,resfitVpercentactivityfromIInorm] = lsqcurvefit(@fitLinearModel,[1;1],IIpercentactivity,Vpercentactivity,[],[],options)
[fitVIIpercentactivityfromIIfactors,resfitVIIpercentactivityfromIInorm] = lsqcurvefit(@fitLinearModel,[1;1],IIpercentactivity,VIIpercentactivity,[],[],options)
[fitVIIIpercentactivityfromIIfactors,resfitVIIIpercentactivityfromIInorm] = lsqcurvefit(@fitLinearModel,[1;1],IIpercentactivity,VIIIpercentactivity,[],[],options)
[fitIXpercentactivityfromIIfactors,resfitIXpercentactivityfromIInorm] = lsqcurvefit(@fitLinearModel,[1;1],IIpercentactivity,IXpercentactivity,[],[],options)
[fitXpercentactivityfromIIfactors,resfitXpercentactivityfromIInorm] = lsqcurvefit(@fitLinearModel,[1;1],IIpercentactivity,Xpercentactivity,[],[],options)
[fitATIIIpercentactivityfromIIfactors,resfitATIIIpercentactivityfromIInorm] = lsqcurvefit(@fitLinearModel,[1;1],IIpercentactivity,ATIIIpercentactivity,[],[],options)


%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

h(2) = plot([0:100:1000],fitVpercentactivityfromIIfactors(1)*[0:100:1000]+fitVpercentactivityfromIIfactors(2),'g--','LineWidth',6)
plot(IIpercentactivity,Vpercentactivity,'gd','LineWidth',6,'MarkerSize',12)
h(3) = plot([0:100:1000],fitVIIpercentactivityfromIIfactors(1)*[0:100:1000]+fitVIIpercentactivityfromIIfactors(2),'b-','LineWidth',6)
plot(IIpercentactivity,VIIpercentactivity,'bs','LineWidth',6,'MarkerSize',12)
h(4) = plot([0:100:1000],fitVIIIpercentactivityfromIIfactors(1)*[0:100:1000]+fitVIIIpercentactivityfromIIfactors(2),'m:','LineWidth',6)
plot(IIpercentactivity,VIIIpercentactivity,'m^','LineWidth',6,'MarkerSize',12)
h(5) = plot([0:100:1000],fitIXpercentactivityfromIIfactors(1)*[0:100:1000]+fitIXpercentactivityfromIIfactors(2),'-.','Linewidth',6,'Color',[1 0.5 0])
plot(IIpercentactivity,IXpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'Linewidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitXpercentactivityfromIIfactors(1)*[0:100:1000]+fitXpercentactivityfromIIfactors(2),'c--','Linewidth',6)
plot(IIpercentactivity,Xpercentactivity,'c*','Linewidth',6,'MarkerSize',12)
h(7) = plot([0:100:1000],fitATIIIpercentactivityfromIIfactors(1)*[0:100:1000]+fitATIIIpercentactivityfromIIfactors(2),':','Linewidth',6,'Color',[0.5 0.5 0.5])
plot(IIpercentactivity,ATIIIpercentactivity,'x','MarkerEdgeColor',[0.5 0.5 0.5],'Linewidth',6,'MarkerSize',12)

% plot(originalII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalX,'kx','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalV,'mo','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
% plot(originalII,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked II Concentration [%-activity]')
ylabel('Concentration [%-activity]')
legend([h(2) h(3) h(4) h(5) h(6) h(7)],{'V','VII','VIII','IX','X','ATIII'})
axis([50 200 40 120])
tA = title('A');

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%
%figure(2)
%clf

subplot(2,2,2)

hold on
grid on
box on

VIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B11:H19');

IIpercentactivity = VIIIspikingDataValues(:,1);
VIIpercentactivity = VIIIspikingDataValues(:,2);
IXpercentactivity = VIIIspikingDataValues(:,3);
Xpercentactivity = VIIIspikingDataValues(:,4);
Vpercentactivity = VIIIspikingDataValues(:,5);
VIIIpercentactivity = VIIIspikingDataValues(:,6);
ATIIIpercentactivity = VIIIspikingDataValues(:,7);

[fitIIpercentactivityfromVIIIfactors,resfitIIpercentactivityfromVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],VIIIpercentactivity,IIpercentactivity,[],[],options)
[fitVpercentactivityfromVIIIfactors,resfitVpercentactivityfromVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],VIIIpercentactivity,Vpercentactivity,[],[],options)
[fitVIIpercentactivityfromVIIIfactors,resfitVIIpercentactivityfromVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],VIIIpercentactivity,VIIpercentactivity,[],[],options)
[fitIXpercentactivityfromVIIIfactors,resfitIXpercentactivityfromVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],VIIIpercentactivity,IXpercentactivity,[],[],options)
[fitXpercentactivityfromVIIIfactors,resfitXpercentactivityfromVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],VIIIpercentactivity,Xpercentactivity,[],[],options)
[fitATIIIpercentactivityfromVIIIfactors,resfitATIIIpercentactivityfromVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],VIIIpercentactivity,ATIIIpercentactivity,[],[],options)


%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

h(1) = plot([0:100:1000],fitIIpercentactivityfromVIIIfactors(1)*[0:100:1000]+fitIIpercentactivityfromVIIIfactors(2),'r-.','Linewidth',6)
plot(VIIIpercentactivity,IIpercentactivity,'ro','Linewidth',6,'MarkerSize',12)
h(2) = plot([0:100:1000],fitVpercentactivityfromVIIIfactors(1)*[0:100:1000]+fitVpercentactivityfromVIIIfactors(2),'g--','Linewidth',6)
plot(VIIIpercentactivity,Vpercentactivity,'gd','Linewidth',6,'MarkerSize',12)
h(3) = plot([0:100:1000],fitVIIpercentactivityfromVIIIfactors(1)*[0:100:1000]+fitVIIpercentactivityfromVIIIfactors(2),'b-','Linewidth',6)
plot(VIIIpercentactivity,VIIpercentactivity,'bs','Linewidth',6,'MarkerSize',12)
h(5) = plot([0:100:1000],fitIXpercentactivityfromVIIIfactors(1)*[0:100:1000]+fitIXpercentactivityfromVIIIfactors(2),'-.','Linewidth',6,'Color',[1 0.5 0])
plot(VIIIpercentactivity,IXpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'Linewidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitXpercentactivityfromVIIIfactors(1)*[0:100:1000]+fitXpercentactivityfromVIIIfactors(2),'c--','Linewidth',6)
plot(VIIIpercentactivity,Xpercentactivity,'c*','Linewidth',6,'MarkerSize',12)
h(7) = plot([0:100:1000],fitATIIIpercentactivityfromVIIIfactors(1)*[0:100:1000]+fitATIIIpercentactivityfromVIIIfactors(2),':','Linewidth',6,'Color',[0.5 0.5 0.5])
plot(VIIIpercentactivity,ATIIIpercentactivity,'x','MarkerEdgeColor',[0.5 0.5 0.5],'Linewidth',6,'MarkerSize',12)


% plot(originalVIII,originalII,'r^','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalX,'kx','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalV,'mo','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked VIII Concentration [%-activity]')
ylabel('Concentration [%-activity]')
legend([h(1) h(2) h(3) h(5) h(6) h(7)],{'II','V','VII','IX','X','ATIII'})
axis([30 800 40 120])
tB = title('B');

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%
%figure(3)
%clf

subplot(2,2,3)

hold on
grid on
box on

IXspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B21:H27');

IIpercentactivity = IXspikingDataValues(:,1);
VIIpercentactivity = IXspikingDataValues(:,2);
IXpercentactivity = IXspikingDataValues(:,3);
Xpercentactivity = IXspikingDataValues(:,4);
Vpercentactivity = IXspikingDataValues(:,5);
VIIIpercentactivity = IXspikingDataValues(:,6);
ATIIIpercentactivity = IXspikingDataValues(:,7);

[fitIIpercentactivityfromIXfactors,resfitIIpercentactivityfromIXnorm] = lsqcurvefit(@fitLinearModel,[1;1],IXpercentactivity,IIpercentactivity,[],[],options)
[fitVpercentactivityfromIXfactors,resfitVpercentactivityfromIXnorm] = lsqcurvefit(@fitLinearModel,[1;1],IXpercentactivity,Vpercentactivity,[],[],options)
[fitVIIpercentactivityfromIXfactors,resfitVIIpercentactivityfromIXnorm] = lsqcurvefit(@fitLinearModel,[1;1],IXpercentactivity,VIIpercentactivity,[],[],options)
[fitVIIIpercentactivityfromIXfactors,resfitVIIIpercentactivityfromIXnorm] = lsqcurvefit(@fitLinearModel,[1;1],IXpercentactivity,VIIIpercentactivity,[],[],options)
[fitXpercentactivityfromIXfactors,resfitXpercentactivityfromIXnorm] = lsqcurvefit(@fitLinearModel,[1;1],IXpercentactivity,Xpercentactivity,[],[],options)
[fitATIIIpercentactivityfromIXfactors,resfitATIIIpercentactivityfromIXnorm] = lsqcurvefit(@fitLinearModel,[1;1],IXpercentactivity,ATIIIpercentactivity,[],[],options)


%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

h(1) = plot([0:100:1000],fitIIpercentactivityfromIXfactors(1)*[0:100:1000]+fitIIpercentactivityfromIXfactors(2),'r-.','Linewidth',6)
plot(IXpercentactivity,IIpercentactivity,'ro','Linewidth',6,'MarkerSize',12)
h(2) = plot([0:100:1000],fitVpercentactivityfromIXfactors(1)*[0:100:1000]+fitVpercentactivityfromIXfactors(2),'g--','Linewidth',6)
plot(IXpercentactivity,Vpercentactivity,'gd','Linewidth',6,'MarkerSize',12)
h(3) = plot([0:100:1000],fitVIIpercentactivityfromIXfactors(1)*[0:100:1000]+fitVIIpercentactivityfromIXfactors(2),'b-','Linewidth',6)
plot(IXpercentactivity,VIIpercentactivity,'bs','Linewidth',6,'MarkerSize',12)
h(4) = plot([0:100:1000],fitVIIIpercentactivityfromIXfactors(1)*[0:100:1000]+fitVIIIpercentactivityfromIXfactors(2),'m:','Linewidth',6)
plot(IXpercentactivity,VIIIpercentactivity,'m^','Linewidth',6,'MarkerSize',12)
h(6) = plot([0:100:1000],fitXpercentactivityfromIXfactors(1)*[0:100:1000]+fitXpercentactivityfromIXfactors(2),'c--','Linewidth',6)
plot(IXpercentactivity,Xpercentactivity,'c*','Linewidth',6,'MarkerSize',12)
h(7) = plot([0:100:1000],fitATIIIpercentactivityfromIXfactors(1)*[0:100:1000]+fitATIIIpercentactivityfromIXfactors(2),':','Linewidth',6,'Color',[0.5 0.5 0.5])
plot(IXpercentactivity,ATIIIpercentactivity,'x','MarkerEdgeColor',[0.5 0.5 0.5],'Linewidth',6,'MarkerSize',12)

% plot(originalIX,originalII,'r^','LineWidth',3,'MarkerSize',6)
% plot(originalIX,originalVII,'gs','LineWidth',3,'MarkerSize',6)
% plot(originalIX,originalX,'kx','LineWidth',3,'MarkerSize',6)
% plot(originalIX,originalV,'mo','LineWidth',3,'MarkerSize',6)
% plot(originalIX,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
% plot(originalIX,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked IX Concentration [%-activity]')
ylabel('Concentration [%-activity]')
legend([h(1) h(2) h(3) h(4) h(6) h(7)],{'II','V','VII','VIII','X','ATIII'},2)
axis([50 200 40 120])
tC = title('C');

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%
%figure(4)
%clf

subplot(2,2,4)

hold on
grid on
box on

XspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B29:H34');

IIpercentactivity = XspikingDataValues(:,1);
VIIpercentactivity = XspikingDataValues(:,2);
IXpercentactivity = XspikingDataValues(:,3);
Xpercentactivity = XspikingDataValues(:,4);
Vpercentactivity = XspikingDataValues(:,5);
VIIIpercentactivity = XspikingDataValues(:,6);
ATIIIpercentactivity = XspikingDataValues(:,7);

[fitIIpercentactivityfromXfactors,resfitIIpercentactivityfromXnorm] = lsqcurvefit(@fitLinearModel,[1;1],Xpercentactivity,IIpercentactivity,[],[],options)
[fitVpercentactivityfromXfactors,resfitVpercentactivityfromXnorm] = lsqcurvefit(@fitLinearModel,[1;1],Xpercentactivity,Vpercentactivity,[],[],options)
[fitVIIpercentactivityfromXfactors,resfitVIIpercentactivityfromXnorm] = lsqcurvefit(@fitLinearModel,[1;1],Xpercentactivity,VIIpercentactivity,[],[],options)
[fitVIIIpercentactivityfromXfactors,resfitVIIIpercentactivityfromXnorm] = lsqcurvefit(@fitLinearModel,[1;1],Xpercentactivity,VIIIpercentactivity,[],[],options)
[fitIXpercentactivityfromXfactors,resfitIXpercentactivityfromXnorm] = lsqcurvefit(@fitLinearModel,[1;1],Xpercentactivity,IXpercentactivity,[],[],options)
[fitATIIIpercentactivityfromXfactors,resfitATIIIpercentactivityfromXnorm] = lsqcurvefit(@fitLinearModel,[1;1],Xpercentactivity,ATIIIpercentactivity,[],[],options)


%plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
%plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

h(1) = plot([0:100:1000],fitIIpercentactivityfromXfactors(1)*[0:100:1000]+fitIIpercentactivityfromXfactors(2),'r-.','Linewidth',6)
plot(Xpercentactivity,IIpercentactivity,'ro','Linewidth',6,'MarkerSize',12)
h(2) = plot([0:100:1000],fitVpercentactivityfromXfactors(1)*[0:100:1000]+fitVpercentactivityfromXfactors(2),'g--','Linewidth',6)
plot(Xpercentactivity,Vpercentactivity,'gd','Linewidth',6,'MarkerSize',12)
h(3) = plot([0:100:1000],fitVIIpercentactivityfromXfactors(1)*[0:100:1000]+fitVIIpercentactivityfromXfactors(2),'b-','Linewidth',6)
plot(Xpercentactivity,VIIpercentactivity,'bs','Linewidth',6,'MarkerSize',12)
h(4) = plot([0:100:1000],fitVIIIpercentactivityfromXfactors(1)*[0:100:1000]+fitVIIIpercentactivityfromXfactors(2),'m:','Linewidth',6)
plot(Xpercentactivity,VIIIpercentactivity,'m^','Linewidth',6,'MarkerSize',12)
h(5) = plot([0:100:1000],fitIXpercentactivityfromXfactors(1)*[0:100:1000]+fitIXpercentactivityfromXfactors(2),'-.','Linewidth',6,'Color',[1 0.5 0])
plot(Xpercentactivity,IXpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'Linewidth',6,'MarkerSize',12)
h(7) = plot([0:100:1000],fitATIIIpercentactivityfromXfactors(1)*[0:100:1000]+fitATIIIpercentactivityfromXfactors(2),':','Linewidth',6,'Color',[0.5 0.5 0.5])
plot(Xpercentactivity,ATIIIpercentactivity,'x','MarkerEdgeColor',[0.5 0.5 0.5],'Linewidth',6,'MarkerSize',12)

% plot(originalX,originalII,'r^','LineWidth',3,'MarkerSize',6)
% plot(originalX,originalVII,'gs','LineWidth',3,'MarkerSize',6)
% plot(originalX,originalIX,'bd','LineWidth',3,'MarkerSize',6)
% plot(originalX,originalV,'mo','LineWidth',3,'MarkerSize',6)
% plot(originalX,originalVIII,'c*','LineWidth',3,'MarkerSize',6)
% plot(originalX,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)

xlabel('Spiked X Concentration [%-activity]')
ylabel('Concentration [%-activity]')
legend([h(1) h(2) h(3) h(4) h(5) h(7)],{'II','V','VII','VIII','IX','ATIII'})
axis([50 200 40 120])
tD = title('D');

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')
set(tC, 'FontSize',31, 'FontWeight', 'bold')
set(tD, 'FontSize',31, 'FontWeight', 'bold')

%%
% figure(5)
% clf
% hold on
% grid on
% 
% X_VIIIspikingDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/spiking_all_factors','Sheet1','B36:H41');
% 
% IIpercentactivity = X_VIIIspikingDataValues(:,1);
% VIIpercentactivity = X_VIIIspikingDataValues(:,2);
% IXpercentactivity = X_VIIIspikingDataValues(:,3);
% Xpercentactivity = X_VIIIspikingDataValues(:,4);
% Vpercentactivity = X_VIIIspikingDataValues(:,5);
% VIIIpercentactivity = X_VIIIspikingDataValues(:,6);
% ATIIIpercentactivity = X_VIIIspikingDataValues(:,7);
% 
% %plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
% %plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};
% 
% plot(VIIIpercentactivity,IIpercentactivity,'r^','LineWidth',6,'MarkerSize',12)
% plot(VIIIpercentactivity,VIIpercentactivity,'gs','LineWidth',6,'MarkerSize',12)
% plot(VIIIpercentactivity,IXpercentactivity,'bd','LineWidth',6,'MarkerSize',12)
% plot(VIIIpercentactivity,Xpercentactivity,'kx','LineWidth',6,'MarkerSize',12)
% plot(VIIIpercentactivity,Vpercentactivity,'mo','LineWidth',6,'MarkerSize',12)
% plot(VIIIpercentactivity,ATIIIpercentactivity,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
% 
% plot(originalVIII,originalII,'r^','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalVII,'gs','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalIX,'bd','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalX,'kx','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalV,'mo','LineWidth',3,'MarkerSize',6)
% plot(originalVIII,originalATIII,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',3,'MarkerSize',6)
% 
% xlabel('Spiked VIII [%-activity] (along with X)')
% ylabel('%-activity')
% legend('II','VII','IX','X','V','ATIII')
% axis([30 700 30 120])
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)

return


function fitLinearEstimate = fitLinearModel(x,xdata)

fitLinearEstimate = x(1)*xdata + x(2);

return