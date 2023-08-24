
clear all;
close all;
clc;

%format long e;

%%

%Spiked II

figure(1)
clf

subplot(2,2,1)

hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/Spiking_CAT_results_1','Cohen_lab_06-24-14','C18:I137');

SpikedII77 = CATDataValues(:,1)./1000;
SpikedII90 = CATDataValues(:,2)./1000;
SpikedII101 = CATDataValues(:,3)./1000;
SpikedII113 = CATDataValues(:,4)./1000;
SpikedII115 = CATDataValues(:,5)./1000;
SpikedII124 = CATDataValues(:,6)./1000;
SpikedII141 = CATDataValues(:,7)./1000;


plot(Time,SpikedII77,'r-.','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII90,'g--','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII101,'b-','LineWidth',6,'MarkerSize',12)
%plot(Time,SpikedII113,'k-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII115,'m:','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedII124,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12,'LineStyle','-.')
%plot(Time,SpikedII141,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
%legend('II = 77','II = 90','II = 101','II = 113','II = 115','II = 124','II = 141')
legend('II = 77','II = 90','II = 101','II = 115','II = 124')
%axis([0 45 -0.02 0.12])
axis([0 45 -0.05 0.2])
box on

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)


%%

subplot(2,2,2)

s = tf('s');

%From Normals

AverageRightRealPoleValue = -2.318156549837209e-01;
AverageLeftPairMagPoleValue = 5.403446173651191e-01;
AverageLeftPairAnglePoleValue = -2.488325421384519e+00;
AverageDelay = 2.486724446978783e+00;
K = 0.228811665819;

rightrealpole = -0.232;%AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = 0.540; %AverageLeftPairMagPoleValue;
kdpredict = AverageDelay;
K = 0.229;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpole.^2;
knpredict = K*k0predict;

PredictedSystem = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedT = linspace(0,45,451);
PredictedY = 5*impulse(PredictedSystem,PredictedT);

rightrealpoleminus = -0.257;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleminus = 0.619;
kdpredict = AverageDelay;
Kminus = 0.159;

sigma = leftpairmagpoleminus*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpoleminus);
k1predict = leftpairmagpoleminus.^2 + 2*sigma.*abs(rightrealpoleminus);
k0predict = abs(rightrealpoleminus).*leftpairmagpoleminus.^2;
knpredict = Kminus*k0predict;
    
PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

rightrealpoleplus = -0.201;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleplus = 0.443;
kdpredict = AverageDelay;
Kplus = 0.311;

sigma = leftpairmagpoleplus*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpoleplus);
k1predict = leftpairmagpoleplus.^2 + 2*sigma.*abs(rightrealpoleplus);
k0predict = abs(rightrealpoleplus).*leftpairmagpoleplus.^2;
knpredict = Kplus*k0predict;
    
PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);

plot(PredictedTminus,PredictedYminus,'r-.','LineWidth',6,'MarkerSize',12)
hold on
grid on
ylabel('IIa [\muM]')
xlabel('Time [min]')
%axis([0 20 -0.05 0.35])
axis([0 45 -0.05 0.2])
box on

plot(PredictedT,PredictedY,'g--','LineWidth',6,'MarkerSize',12)

plot(PredictedTplus,PredictedYplus,'b-','LineWidth',6,'MarkerSize',12)
%legend(['a_1 =  ', num2str(k1predictminus),',\newlinea_0 =  ', num2str(k0predictminus)], ['a_1 =  ', num2str(k1predict),',\newlinea_0 =  ', num2str(k0predict)], ['a_1 =  ', num2str(k1predictplus),',\newlinea_0 =  ', num2str(k0predictplus)])
%legend(['K   = ', num2str(Kminus), ', p = ', num2str(abs(rightrealpoleminus)),',\newline\omega_n = ', num2str(leftpairmagpoleminus)], ['K   = ', num2str(K), ', p = ', num2str(abs(rightrealpole)),',\newline\omega_n = ', num2str(leftpairmagpole)], ['K   = ', num2str(Kplus), ', p = ', num2str(abs(rightrealpoleplus)),',\newline\omega_n = ', num2str(leftpairmagpoleplus)])
legend('K   = 0.16, p = 0.26,\newline\omega_n = 0.62', 'K   = 0.23, p = 0.23,\newline\omega_n = 0.54', 'K   = 0.31, p = 0.20,\newline\omega_n = 0.44')

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Spiked VIII

subplot(2,2,3)

hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','A18:A137');

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14492/Spiking_CAT_results_2','Cohen_lab_06-25-14','B18:J137');

SpikedVIII47 = CATDataValues(:,1)./1000;
SpikedVIII90 = CATDataValues(:,2)./1000;
SpikedVIII111 = CATDataValues(:,3)./1000;
SpikedVIII168 = CATDataValues(:,4)./1000;
SpikedVIII203 = CATDataValues(:,5)./1000;
SpikedVIII330 = CATDataValues(:,6)./1000;
SpikedVIII390 = CATDataValues(:,7)./1000;
SpikedVIII506 = CATDataValues(:,8)./1000;
SpikedVIII593 = CATDataValues(:,9)./1000;

%plot(Time,SpikedVIII47,'r-.','LineWidth',6,'MarkerSize',12)
%plot(Time,SpikedVIII90,'g--','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII90,'r-.','LineWidth',6,'MarkerSize',12)
%plot(Time,SpikedVIII111,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII111,'g--','LineWidth',6,'MarkerSize',12)
%plot(Time,SpikedVIII168,'m:','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII168,'b-','LineWidth',6,'MarkerSize',12)
%plot(Time,SpikedVIII203,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12,'LineStyle','-.')
plot(Time,SpikedVIII203,'m:','LineWidth',6,'MarkerSize',12)
%plot(Time,SpikedVIII330,'c--','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII330,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12,'LineStyle','-.')
%plot(Time,SpikedVIII390,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII390,'c--','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedVIII506,'Color',[0.5 0.5 0.5],'LineWidth',6,'MarkerSize',12,'LineStyle',':')
%plot(Time,SpikedVIII593,'gs-','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
%legend('VIII = 47','VIII = 90','VIII = 111','VIII = 168','VIII = 203','VIII = 330','VIII = 390','VIII = 506','VIII = 593')
legend('VIII = 90','VIII = 111','VIII = 168','VIII = 203','VIII = 330','VIII = 390','VIII = 506')
%axis([0 45 -0.02 0.17])
axis([0 45 -0.05 0.2])
box on

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%


subplot(2,2,4)

%From Normals

AverageRightRealPoleValue = -2.318156549837209e-01;
AverageLeftPairMagPoleValue = 5.403446173651191e-01;
AverageLeftPairAnglePoleValue = -2.488325421384519e+00;
AverageDelay = 2.486724446978783e+00;
K = 0.228811665819;

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleminus = 0.39;
kdpredict = AverageDelay;

sigma = leftpairmagpoleminus*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpoleminus.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpoleminus.^2;
knpredict = K*k0predict;
    
PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleplus = 0.79;
kdpredict = AverageDelay;

sigma = leftpairmagpoleplus*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpoleplus.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpoleplus.^2;
knpredict = K*k0predict;
    
PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);

plot(PredictedTminus,PredictedYminus,'r-.','LineWidth',6,'MarkerSize',12)
hold on
grid on
ylabel('IIa [\muM]')
xlabel('Time [min]')
%axis([0 20 -0.05 0.35])
axis([0 45 -0.05 0.2])
box on

plot(PredictedT,PredictedY,'g--','LineWidth',6,'MarkerSize',12)

plot(PredictedTplus,PredictedYplus,'b-','LineWidth',6,'MarkerSize',12)
legend(['\omega_n =  ', num2str(leftpairmagpoleminus)], ['\omega_n =  ', num2str(leftpairmagpole)], ['\omega_n =  ', num2str(leftpairmagpoleplus)])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

%%

%Spiked X

figure(2)
clf
subplot(2,2,1)

hold on
grid on

Time = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','A18:A107');

SpikedX76 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','B18:B107')./1000;

CATDataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/14504/Spiking_CAT_results_14504_1','Cohen_1','K18:P107');

SpikedX115 = CATDataValues(:,1)./1000;
SpikedX133 = CATDataValues(:,2)./1000;
SpikedX178 = CATDataValues(:,3)./1000;
SpikedX215 = CATDataValues(:,4)./1000;
SpikedX280 = CATDataValues(:,5)./1000;
SpikedX317 = CATDataValues(:,6)./1000;

%plot(Time,SpikedX115)
plot(Time,SpikedX76,'r-.','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX133,'g--','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX178,'b-','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX215,'m:','LineWidth',6,'MarkerSize',12)
plot(Time,SpikedX280,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12,'LineStyle','-.')
plot(Time,SpikedX317,'c--','LineWidth',6,'MarkerSize',12)

xlabel('Time [min]')
ylabel('IIa [\muM]')
%legend('X = 115','X = 133','X = 178','X = 215','X = 280','X = 317')
legend('X=76','X = 133','X = 178','X = 215','X = 280','X = 317')
axis([0 45 -0.05 0.35])
box on

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)


%%

subplot(2,2,2)

%From Normals

AverageRightRealPoleValue = -2.318156549837209e-01;
AverageLeftPairMagPoleValue = 5.403446173651191e-01;
AverageLeftPairAnglePoleValue = -2.488325421384519e+00;
AverageDelay = 2.486724446978783e+00;
K = 0.228811665819;

rightrealpole = -0.232;%AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = 0.540; %AverageLeftPairMagPoleValue;
kdpredict = AverageDelay;
K = 0.229;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpole.^2;
knpredict = K*k0predict;

PredictedSystem = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedT = linspace(0,45,451);
PredictedY = 5*impulse(PredictedSystem,PredictedT);

rightrealpoleminus = -0.202;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleminus = 0.251;
kdpredict = AverageDelay;
Kminus = 0.209;

sigma = leftpairmagpoleminus*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpoleminus);
k1predict = leftpairmagpoleminus.^2 + 2*sigma.*abs(rightrealpoleminus);
k0predict = abs(rightrealpoleminus).*leftpairmagpoleminus.^2;
knpredict = Kminus*k0predict;
    
PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

rightrealpoleplus = -0.262;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleplus = 0.831;
kdpredict = AverageDelay;
Kplus = 0.249;

sigma = leftpairmagpoleplus*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpoleplus);
k1predict = leftpairmagpoleplus.^2 + 2*sigma.*abs(rightrealpoleplus);
k0predict = abs(rightrealpoleplus).*leftpairmagpoleplus.^2;
knpredict = Kplus*k0predict;
    
PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);

plot(PredictedTminus,PredictedYminus,'r-.','LineWidth',6,'MarkerSize',12)
hold on
grid on
ylabel('IIa [\muM]')
xlabel('Time [min]')
%axis([0 20 -0.05 0.35])
axis([0 45 -0.05 0.2])
box on

plot(PredictedT,PredictedY,'g--','LineWidth',6,'MarkerSize',12)

plot(PredictedTplus,PredictedYplus,'b-','LineWidth',6,'MarkerSize',12)
%legend(['a_1 =  ', num2str(k1predictminus),',\newlinea_0 =  ', num2str(k0predictminus)], ['a_1 =  ', num2str(k1predict),',\newlinea_0 =  ', num2str(k0predict)], ['a_1 =  ', num2str(k1predictplus),',\newlinea_0 =  ', num2str(k0predictplus)])
%legend(['K   = ', num2str(Kminus), ', p = ', num2str(abs(rightrealpoleminus)),',\newline\omega_n = ', num2str(leftpairmagpoleminus)], ['K   = ', num2str(K), ', p = ', num2str(abs(rightrealpole)),',\newline\omega_n = ', num2str(leftpairmagpole)], ['K   = ', num2str(Kplus), ', p = ', num2str(abs(rightrealpoleplus)),',\newline\omega_n = ', num2str(leftpairmagpoleplus)])
legend('K   = 0.21, p = 0.20,\newline\omega_n = 0.25', 'K   = 0.23, p = 0.23,\newline\omega_n = 0.54', 'K   = 0.25, p = 0.26,\newline\omega_n = 0.83')

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)