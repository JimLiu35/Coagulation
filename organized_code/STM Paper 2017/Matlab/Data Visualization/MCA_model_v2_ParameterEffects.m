clear all
close all
clc

s = tf('s');

figure(1)
clf

%From Normals

AverageRightRealPoleValue = -2.318156549837209e-01;
AverageLeftPairMagPoleValue = 5.403446173651191e-01;
AverageLeftPairAnglePoleValue = -2.488325421384519e+00;
AverageDelay = 2.486724446978783e+00;
K = 0.228811665819;

AverageSigma = AverageLeftPairMagPoleValue*cos(pi+AverageLeftPairAnglePoleValue);
AverageZeta = AverageSigma/AverageLeftPairMagPoleValue;
%%

% subplot(2,2,1)

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = AverageLeftPairMagPoleValue;
kdpredict = AverageDelay;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpole.^2;
knpredict = K*k0predict;

referencek0 = k0predict;
referencek1 = k1predict;

PredictedSystem = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedT = linspace(0,45,451);
PredictedY = 5*impulse(PredictedSystem,PredictedT);



% plot(PredictedT,PredictedY,'g--','LineWidth',6,'MarkerSize',12)
% hold on
% grid on
% ylabel('IIa [\muM]')
% xlabel('Time [min]')
% %axis([0 20 -0.05 0.35])
% axis([0 45 -0.05 0.2])
% box on
% plot(-10,-10,'w')
% plot(-10,-10,'w')
% legend(['p_{  } = ', num2str(rightrealpole)], ['\omega_n =  ', num2str(leftpairmagpole)], ['T_{  } =  ', num2str(kdpredict)])
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
% set(gca,'FontSize',27)

%%
subplot(2,2,1)

Kminus = K - 0.05;
 
knpredictminus = Kminus*k0predict;

PredictedSystemminus = knpredictminus/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

Kplus = K + 0.05;

knpredictplus = Kplus*k0predict;

PredictedSystemplus = knpredictplus/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
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
legend(['K = ', num2str(Kminus)], ['K = ', num2str(K)], ['K = ', num2str(Kplus)])
tA = title('A');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


%%
subplot(2,2,2)

rightrealpoleminus = AverageRightRealPoleValue + 0.1;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = AverageLeftPairMagPoleValue;
kdpredict = AverageDelay;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpoleminus);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpoleminus);
k0predict = abs(rightrealpoleminus).*leftpairmagpole.^2;
knpredict = K*k0predict;
    
PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

rightrealpoleplus = AverageRightRealPoleValue - 0.1;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = AverageLeftPairMagPoleValue;
kdpredict = AverageDelay;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpoleplus);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpoleplus);
k0predict = abs(rightrealpoleplus).*leftpairmagpole.^2;
knpredict = K*k0predict;
    
PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);


%plot(PredictedTminus,PredictedYminus,'r-.','LineWidth',6,'MarkerSize',12)
plot(PredictedTplus,PredictedYplus,'r-.','LineWidth',6,'MarkerSize',12)
hold on
grid on
ylabel('IIa [\muM]')
xlabel('Time [min]')
%axis([0 20 -0.05 0.35])
axis([0 45 -0.05 0.2])
box on

plot(PredictedT,PredictedY,'g--','LineWidth',6,'MarkerSize',12)

%plot(PredictedTplus,PredictedYplus,'b-','LineWidth',6,'MarkerSize',12)
plot(PredictedTminus,PredictedYminus,'b-','LineWidth',6,'MarkerSize',12)
legend(['p = ', num2str(abs(rightrealpoleminus))], ['p = ', num2str(abs(rightrealpole))], ['p = ', num2str(abs(rightrealpoleplus))])
tB = title('B');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%

subplot(2,2,3)

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleminus = AverageLeftPairMagPoleValue-0.3;
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
leftpairmagpoleplus = AverageLeftPairMagPoleValue+0.3;
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
legend(['\omega_n = ', num2str(leftpairmagpoleminus)], ['\omega_n = ', num2str(leftpairmagpole)], ['\omega_n = ', num2str(leftpairmagpoleplus)])
tC = title('C');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%
% 
% subplot(2,2,3)
% 
% rightrealpoleminus = AverageRightRealPoleValue + 0.1;
% avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
% %leftpairmagpoleminus = (referencek0/abs(rightrealpoleminus))^0.5;
% %leftpairmagpoleminus = (referencek1*rightrealpoleminus-referencek0)/2/AverageZeta/(rightrealpoleminus^2);
% leftpairmagpoleminus = AverageLeftPairMagPoleValue-0.3;
% kdpredict = AverageDelay;
% 
% sigma = leftpairmagpoleminus*cos(pi+avg_leftpairanglepolevalue);
% k2predict = 2*sigma+abs(rightrealpoleminus);
% k1predict = leftpairmagpoleminus.^2 + 2*sigma.*abs(rightrealpoleminus);
% k0predict = abs(rightrealpoleminus).*leftpairmagpoleminus.^2;
% knpredict = K*k0predict;
%     
% PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
% PredictedTminus = linspace(0,45,451);
% PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);
% 
% rightrealpoleplus = AverageRightRealPoleValue - 0.1;
% avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
% %leftpairmagpoleplus = (referencek0/abs(rightrealpoleplus))^0.5;
% %leftpairmagpoleplus = (referencek1*rightrealpoleplus-referencek0)/2/AverageZeta/(rightrealpoleplus^2);
% leftpairmagpoleplus = AverageLeftPairMagPoleValue+0.3;
% kdpredict = AverageDelay;
% 
% sigma = leftpairmagpoleplus*cos(pi+avg_leftpairanglepolevalue);
% k2predict = 2*sigma+abs(rightrealpoleplus);
% k1predict = leftpairmagpoleplus.^2 + 2*sigma.*abs(rightrealpoleplus);
% k0predict = abs(rightrealpoleplus).*leftpairmagpoleplus.^2;
% knpredict = K*k0predict;
%     
% PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
% PredictedTplus = linspace(0,45,451);
% PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);
% 
% 
% %plot(PredictedTminus,PredictedYminus,'r-.','LineWidth',6,'MarkerSize',12)
% plot(PredictedTplus,PredictedYplus,'r-.','LineWidth',6,'MarkerSize',12)
% hold on
% grid on
% ylabel('IIa [\muM]')
% xlabel('Time [min]')
% %axis([0 20 -0.05 0.35])
% axis([0 45 -0.05 0.2])
% box on
% 
% plot(PredictedT,PredictedY,'g--','LineWidth',6,'MarkerSize',12)
% 
% %plot(PredictedTplus,PredictedYplus,'b-','LineWidth',6,'MarkerSize',12)
% plot(PredictedTminus,PredictedYminus,'b-','LineWidth',6,'MarkerSize',12)
% %legend(['p_{  } = ', num2str(abs(rightrealpoleminus))], ['p_{  } = ', num2str(abs(rightrealpole))], ['p_{  } = ', num2str(abs(rightrealpoleplus))])
% legend(['p   = ', num2str(abs(rightrealpoleminus)),',\newline\omega_n = ', num2str(leftpairmagpoleminus)], ['p   = ', num2str(abs(rightrealpole)),',\newline\omega_n = ', num2str(leftpairmagpole)], ['p   = ', num2str(abs(rightrealpoleplus)),',\newline\omega_n = ', num2str(leftpairmagpoleplus)])
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
% set(gca,'FontSize',27)

%%

subplot(2,2,4)

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = AverageLeftPairMagPoleValue;
kdpredictminus = AverageDelay-2;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpole.^2;
knpredict = K*k0predict;
    
PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredictminus*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = AverageLeftPairMagPoleValue;
kdpredictplus = AverageDelay+2;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpole.^2;
knpredict = K*k0predict;
    
PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredictplus*s);
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
legend(['T = ', num2str(kdpredictminus)], ['T = ', num2str(kdpredict)], ['T = ', num2str(kdpredictplus)])
tD = title('D');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')
set(tC, 'FontSize',31, 'FontWeight', 'bold')
set(tD, 'FontSize',31, 'FontWeight', 'bold')
%%

figure(2)
clf

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = AverageLeftPairMagPoleValue;
kdpredict = AverageDelay;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpole.^2;
knpredict = K*k0predict;

%%

subplot(2,2,1)

k2predictplus = k2predict+0.3;
k2predictminus = k2predict-0.3;

PredictedSystemplus = knpredict/(s^3 + k2predictplus*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);

PredictedSystemminus = knpredict/(s^3 + k2predictminus*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

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
legend(['a_2 =  ', num2str(k2predictminus)], ['a_2 =  ', num2str(k2predict)], ['a_2 =  ', num2str(k2predictplus)])
tE = title('E');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


%%

subplot(2,2,2)

k1predictplus = k1predict+0.1;
k1predictminus = k1predict-0.1;

PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predictplus*s + k0predict) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);

PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predictminus*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

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
legend(['a_1 =  ', num2str(k1predictminus)], ['a_1 =  ', num2str(k1predict)], ['a_1 =  ', num2str(k1predictplus)])
tF = title('F');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%

subplot(2,2,3)

k0predictplus = k0predict+0.03;
k0predictminus = k0predict-0.03;

PredictedSystemplus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predictplus) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);

PredictedSystemminus = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predictminus) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

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
legend(['a_0 =  ', num2str(k0predictminus)], ['a_0 =  ', num2str(k0predict)], ['a_0 =  ', num2str(k0predictplus)])
tG = title('G');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%

subplot(2,2,4)

knpredictplus = knpredict+0.005;
knpredictminus = knpredict-0.005;

PredictedSystemplus = knpredictplus/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTplus = linspace(0,45,451);
PredictedYplus = 5*impulse(PredictedSystemplus,PredictedTplus);

PredictedSystemminus = knpredictminus/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedTminus = linspace(0,45,451);
PredictedYminus = 5*impulse(PredictedSystemminus,PredictedTminus);

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
legend(['b =  ', num2str(knpredictminus)], ['b =  ', num2str(knpredict)], ['b =  ', num2str(knpredictplus)])
tH = title('H');

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tE, 'FontSize',31, 'FontWeight', 'bold')
set(tF, 'FontSize',31, 'FontWeight', 'bold')
set(tG, 'FontSize',31, 'FontWeight', 'bold')
set(tH, 'FontSize',31, 'FontWeight', 'bold')