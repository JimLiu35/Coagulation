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

subplot(2,2,1)

rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpole = AverageLeftPairMagPoleValue;
kdpredict = AverageDelay;

sigma = leftpairmagpole*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole.^2 + 2*sigma.*abs(rightrealpole);
k0predict = abs(rightrealpole).*leftpairmagpole.^2;
knpredict = K*k0predict;

% referencek0 = k0predict;
% referencek1 = k1predict;

PredictedSystem = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
PredictedT = linspace(0,45,451);
Predicted1Y = 1*impulse(PredictedSystem,PredictedT);
Predicted5Y = 5*impulse(PredictedSystem,PredictedT);
Predicted10Y = 10*impulse(PredictedSystem,PredictedT);
Predicted15Y = 15*impulse(PredictedSystem,PredictedT);


hold on
grid on
plot(PredictedT,Predicted15Y,'m:','LineWidth',6)
plot(PredictedT,Predicted10Y,'r-.','LineWidth',6)
plot(PredictedT,Predicted5Y,'g--','LineWidth',6)
plot(PredictedT,Predicted1Y,'b-','LineWidth',6)
ylabel('IIa [\muM]')
xlabel('Time [min]')
axis([0 45 -0.05 0.45])
box on
tA = title('A');
legend('5{\ity}({\itt})+{\itz}({\itt}) =\newlineC(5{\itu}({\itt}) + {\itv}({\itt}))',...
    '{\itz}({\itt}) = C({\itv}({\itt})),\newlinewhere {\itv}({\itt}) = 10{\itu}({\itt})',...
    '5{\ity}({\itt}) = C(5{\itu}({\itt}))',...
    '{\ity}({\itt}) = C({\itu}({\itt}))')

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

subplot(2,2,2)

TFGradientTime = xlsread('../../Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
TFGradient = xlsread('../../Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','B18:K137')/1000;

%plot(TFGradientTime,TFGradient(:,1)) %0.25
hold on
%plot(TFGradientTime,TFGradient(:,2),'r-') %0.5
%plot(TFGradientTime,TFGradient(:,3),'g-') %0.75
%plot(TFGradientTime,TFGradient(:,5),'m-') %2.5
%plot(TFGradientTime,TFGradient(:,7),'y-') %7.5

plot(TFGradientTime,TFGradient(:,10),'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',12,'LineStyle','-.') %20
plot(TFGradientTime,TFGradient(:,9),'m:','LineWidth',6,'MarkerSize',12) %15
plot(TFGradientTime,TFGradient(:,8),'r-.','LineWidth',6,'MarkerSize',12) %10
plot(TFGradientTime,TFGradient(:,6),'g--','LineWidth',6,'MarkerSize',12) %5
plot(TFGradientTime,TFGradient(:,4),'b-','LineWidth',6,'MarkerSize',12) %1

grid on
ylabel('IIa [\muM]')
xlabel('Time [min]')
axis([0 45 -0.05 0.35])
box on
tB = title('B');
legend('20 pM Tissue Factor','15 pM Tissue Factor','10 pM Tissue Factor','5 pM Tissue Factor','1 pM Tissue Factor')


figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')