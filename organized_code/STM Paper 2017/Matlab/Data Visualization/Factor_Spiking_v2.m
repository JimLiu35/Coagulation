
function Factor_Spiking_v2


clear all;
close all;
clc;

figure(1)
clf

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);

DelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I2:I6');
a0DelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B2:B6');
a1DelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C2:C6');
a2DelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D2:D6');
bDelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E2:E6');
KDelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G2:G6');
pDelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K2:K6');
omeganDelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L2:L6');
TDelFactorII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F2:F6');

[fita0DelFactorII14492factors,resfita0DelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,a0DelFactorII14492,[],[],options)
[fita1DelFactorII14492factors,resfita1DelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,a1DelFactorII14492,[],[],options)
[fita2DelFactorII14492factors,resfita2DelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,a2DelFactorII14492,[],[],options)
[fitbDelFactorII14492factors,resfitbDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,bDelFactorII14492,[],[],options)
[fitKDelFactorII14492factors,resfitkDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,KDelFactorII14492,[],[],options)
[fitpDelFactorII14492factors,resfitpDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,pDelFactorII14492,[],[],options)
[fitomeganDelFactorII14492factors,resfitomeganDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,omeganDelFactorII14492,[],[],options)
[fitTDelFactorII14492factors,resfitTDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,TDelFactorII14492,[],[],options)

DelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I48:I54');
a0DelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B48:B54');
a1DelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C48:C54');
a2DelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D48:D54');
bDelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E48:E54');
KDelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G48:G54');
pDelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K48:K54');
omeganDelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L48:L54');
TDelFactorVIII14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F48:F54');

[fita0DelFactorVIII14492factors,resfita0DelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,a0DelFactorVIII14492,[],[],options)
[fita1DelFactorVIII14492factors,resfita1DelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,a1DelFactorVIII14492,[],[],options)
[fita2DelFactorVIII14492factors,resfita2DelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,a2DelFactorVIII14492,[],[],options)
[fitbDelFactorVIII14492factors,resfitbDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,bDelFactorVIII14492,[],[],options)
[fitKDelFactorVIII14492factors,resfitkDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,KDelFactorVIII14492,[],[],options)
[fitpDelFactorVIII14492factors,resfitpDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,pDelFactorVIII14492,[],[],options)
[fitomeganDelFactorVIII14492factors,resfitomeganDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,omeganDelFactorVIII14492,[],[],options)
[fitTDelFactorVIII14492factors,resfitTDelFactorVIII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,TDelFactorVIII14492,[],[],options)

% DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I111:I117');
% a0DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B111:B117');
% a1DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C111:C117');
% a2DelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D111:D117');
% bDelFactorX14492 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E111:E117');
% 
% [fita0DelFactorX14492factors,resfita0DelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,a0DelFactorX14492,[],[],options)
% [fita1DelFactorX14492factors,resfita1DelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,a1DelFactorX14492,[],[],options)
% [fita2DelFactorX14492factors,resfita2DelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,a2DelFactorX14492,[],[],options)
% [fitbDelFactorX14492factors,resfitbDelFactorX14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14492,bDelFactorX14492,[],[],options)

DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','I146:I151');
a0DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','B146:B151');
a1DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','C146:C151');
a2DelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','D146:D151');
bDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','E146:E151');
KDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','G146:G151');
pDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','K146:K151');
omeganDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','L146:L151');
TDelFactorX14504 = xlsread('../../Data/Processed/CAT_Spiking_Selection','Fits','F146:F151');

[fita0DelFactorX14504factors,resfita0DelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,a0DelFactorX14504,[],[],options)
[fita1DelFactorX14504factors,resfita1DelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,a1DelFactorX14504,[],[],options)
[fita2DelFactorX14504factors,resfita2DelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,a2DelFactorX14504,[],[],options)
[fitbDelFactorX14504factors,resfitbDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,bDelFactorX14504,[],[],options)
[fitKDelFactorX14504factors,resfitkDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,KDelFactorX14504,[],[],options)
[fitpDelFactorX14504factors,resfitpDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,pDelFactorX14504,[],[],options)
[fitomeganDelFactorX14504factors,resfitomeganDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,omeganDelFactorX14504,[],[],options)
[fitTDelFactorX14504factors,resfitTDelFactorX14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,TDelFactorX14504,[],[],options)

%%

subplot(3,4,7)

h(1) = plot([0:50:200],fita0DelFactorII14492factors(1)*[0:50:200]+fita0DelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,a0DelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fita0DelFactorVIII14492factors(1)*[0:100:1000]+fita0DelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,a0DelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
%h(3) = scatter(DelFactorX14492,a0DelFactorX14492,150,'Blue','filled','s','MarkerEdgeColor','Black');
%h(4) = scatter(DelFactorX14504,a0DelFactorX14504,150,'Magenta','filled','^','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fita0DelFactorX14504factors(1)*[0:100:500]+fita0DelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,a0DelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('a_0')
tG = title('G');
axis([0 500 0 0.55])
%legend([h(1) h(2) h(3) h(4)],{'II, #14492','VIII, #14492','X, #14492','X, #14504'},4)
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,6)

h(1) = plot([0:50:200],fita1DelFactorII14492factors(1)*[0:50:200]+fita1DelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,a1DelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fita1DelFactorVIII14492factors(1)*[0:100:1000]+fita1DelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,a1DelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
%h(3) = scatter(DelFactorX14492,a1DelFactorX14492,150,'Blue','filled','s','MarkerEdgeColor','Black');
%h(4) = scatter(DelFactorX14504,a1DelFactorX14504,150,'Magenta','filled','^','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fita1DelFactorX14504factors(1)*[0:100:500]+fita1DelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,a1DelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('a_1')
tF = title('F');
axis([0 500 0 2.5])
%legend([h(1) h(2) h(3) h(4)],{'II, #14492','VIII, #14492','X, #14492','X, #14504'},4)
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,5)

h(1) = plot([0:50:200],fita2DelFactorII14492factors(1)*[0:50:200]+fita2DelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,a2DelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fita2DelFactorVIII14492factors(1)*[0:100:1000]+fita2DelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,a2DelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
%h(3) = scatter(DelFactorX14492,a2DelFactorX14492,150,'Blue','filled','s','MarkerEdgeColor','Black');
%h(4) = scatter(DelFactorX14504,a2DelFactorX14504,150,'Magenta','filled','^','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fita2DelFactorX14504factors(1)*[0:100:500]+fita2DelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,a2DelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('a_2')
tE = title('E');
axis([0 500 0 2.5])
%legend([h(1) h(2) h(3) h(4)],{'II, #14492','VIII, #14492','X, #14492','X, #14504'},4)
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,8)

h(1) = plot([0:50:200],fitbDelFactorII14492factors(1)*[0:50:200]+fitbDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,bDelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fitbDelFactorVIII14492factors(1)*[0:100:1000]+fitbDelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,bDelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
%h(3) = scatter(DelFactorX14492,bDelFactorX14492,150,'Blue','filled','s','MarkerEdgeColor','Black');
%h(4) = scatter(DelFactorX14504,bDelFactorX14504,150,'Magenta','filled','^','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitbDelFactorX14504factors(1)*[0:100:500]+fitbDelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,bDelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('b')
tH = title('H');
axis([0 500 0 18])
%legend([h(1) h(2) h(3) h(4)],{'II, #14492','VIII, #14492','X, #14492','X, #14504'},4)
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},1)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


%%

%figure(2)
%clf

subplot(3,4,9)

h(1) = plot([0:50:200],fitKDelFactorII14492factors(1)*[0:50:200]+fitKDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,KDelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fitKDelFactorVIII14492factors(1)*[0:100:1000]+fitKDelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,KDelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitKDelFactorX14504factors(1)*[0:100:500]+fitKDelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,KDelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

xlabel('Conc. Increase [%-activity]; ')
ylabel('K')
tI = title('I');
axis([0 500 0 0.4])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},1)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,10)

h(1) = plot([0:50:200],fitpDelFactorII14492factors(1)*[0:50:200]+fitpDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,pDelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fitpDelFactorVIII14492factors(1)*[0:100:1000]+fitpDelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,pDelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitpDelFactorX14504factors(1)*[0:100:500]+fitpDelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,pDelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

xlabel(' Red -. II #14492;')
ylabel('p')
tJ = title('J');
axis([0 500 0 0.4])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,11)

h(1) = plot([0:50:200],fitomeganDelFactorII14492factors(1)*[0:50:200]+fitomeganDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,omeganDelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fitomeganDelFactorVIII14492factors(1)*[0:100:1000]+fitomeganDelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,omeganDelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitomeganDelFactorX14504factors(1)*[0:100:500]+fitomeganDelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,omeganDelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

xlabel('Green -- VIII #14492;      ')
ylabel('\omega_n')
tK = title('K');
axis([0 500 0 1.5])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,12)

h(1) = plot([0:50:300],fitTDelFactorII14492factors(1)*[0:50:300]+fitTDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,TDelFactorII14492,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:1000],fitTDelFactorVIII14492factors(1)*[0:100:1000]+fitTDelFactorVIII14492factors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,TDelFactorVIII14492,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitTDelFactorX14504factors(1)*[0:100:500]+fitTDelFactorX14504factors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,TDelFactorX14504,150,'Blue','filled','s','MarkerEdgeColor','Black');

xlabel('Blue Solid Line X #14504')
ylabel('T')
tL = title('L');
axis([0 500 0 3])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


%%

%figure(3)
%clf

% 14492
CATDataII = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','B2:F121')/1000;
CATTimeII = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','A2:A121');
[DelIIPeak,DelIIPeakIndex] = max(CATDataII);
DelIIPeakTime = CATTimeII(DelIIPeakIndex);
DelIIETP = trapz(CATTimeII,CATDataII);
for counter = 1:length(CATDataII(1,:))
    DelIIDelay(1,counter) = DetermineDelay(CATTimeII,CATDataII(:,counter));
end
DelIIRiseTime = DelIIPeakTime'-DelIIDelay;

[fitPeakDelIIfactors,resfitPeakDelIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,DelIIPeak',[],[],options)
R2fitPeakDelII = DetermineLinearModelR2(DelFactorII14492,DelIIPeak',fitPeakDelIIfactors)
[fitRiseTimeDelIIfactors,resfitRiseTimeDelIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,DelIIRiseTime',[],[],options)
R2fitRiseTimeDelII = DetermineLinearModelR2(DelFactorII14492,DelIIRiseTime',fitRiseTimeDelIIfactors)
[fitDelayDelIIfactors,resfitDelayDelIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,DelIIDelay',[],[],options)
R2fitDelayDelII = DetermineLinearModelR2(DelFactorII14492,DelIIDelay',fitDelayDelIIfactors)
[fitETPDelIIfactors,resfitETPDelIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,DelIIETP',[],[],options)
R2fitETPDelII = DetermineLinearModelR2(DelFactorII14492,DelIIETP',fitETPDelIIfactors)

% 14492
CATDataVIII = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','R2:X121')/1000;
CATTimeVIII = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','P2:P121');
[DelVIIIPeak,DelVIIIPeakIndex] = max(CATDataVIII);
DelVIIIPeakTime = CATTimeVIII(DelVIIIPeakIndex);
DelVIIIETP = trapz(CATTimeVIII,CATDataVIII);
for counter = 1:length(CATDataVIII(1,:))
    DelVIIIDelay(1,counter) = DetermineDelay(CATTimeVIII,CATDataVIII(:,counter));
end
DelVIIIRiseTime = DelVIIIPeakTime'-DelVIIIDelay;

[fitPeakDelVIIIfactors,resfitPeakDelVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,DelVIIIPeak',[],[],options)
R2fitPeakDelVIII = DetermineLinearModelR2(DelFactorVIII14492,DelVIIIPeak',fitPeakDelVIIIfactors)
[fitRiseTimeDelVIIIfactors,resfitRiseTimeDelVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,DelVIIIRiseTime',[],[],options)
R2fitRiseTimeDelVIII = DetermineLinearModelR2(DelFactorVIII14492,DelVIIIRiseTime',fitRiseTimeDelVIIIfactors)
[fitDelayDelVIIIfactors,resfitDelayDelVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,DelVIIIDelay',[],[],options)
R2fitDelayDelVIII = DetermineLinearModelR2(DelFactorVIII14492,DelVIIIDelay',fitDelayDelVIIIfactors)
[fitETPDelVIIIfactors,resfitETPDelVIIInorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorVIII14492,DelVIIIETP',[],[],options)
R2fitETPDelVIII = DetermineLinearModelR2(DelFactorVIII14492,DelVIIIETP',fitETPDelVIIIfactors)

% 14504
CATDataX = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','AA2:AF121')/1000;
CATTimeX = xlsread('../../Data/Processed/CAT_Spiking_Selection','Dynamic','Z2:Z121');
[DelXPeak,DelXPeakIndex] = max(CATDataX);
DelXPeakTime = CATTimeX(DelXPeakIndex);
DelXETP = trapz(CATTimeX,CATDataX);
for counter = 1:length(CATDataX(1,:))
    DelXDelay(1,counter) = DetermineDelay(CATTimeX,CATDataX(:,counter));
end
DelXRiseTime = DelXPeakTime'-DelXDelay;

[fitPeakDelXfactors,resfitPeakDelXnorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,DelXPeak',[],[],options)
R2fitPeakDelX = DetermineLinearModelR2(DelFactorX14504,DelXPeak',fitPeakDelXfactors)
[fitRiseTimeDelXfactors,resfitRiseTimeDelXnorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,DelXRiseTime',[],[],options)
R2fitRiseTimeDelX = DetermineLinearModelR2(DelFactorX14504,DelXRiseTime',fitRiseTimeDelXfactors)
[fitDelayDelXfactors,resfitDelayDelXnorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,DelXDelay',[],[],options)
R2fitDelayDelX = DetermineLinearModelR2(DelFactorX14504,DelXDelay',fitDelayDelXfactors)
[fitETPDelXfactors,resfitETPDelXnorm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorX14504,DelXETP',[],[],options)
R2fitETPDelX = DetermineLinearModelR2(DelFactorX14504,DelXETP',fitETPDelXfactors)


subplot(3,4,1)

h(1) = plot([0:50:500],fitPeakDelIIfactors(1)*[0:50:500]+fitPeakDelIIfactors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,DelIIPeak,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:500],fitPeakDelVIIIfactors(1)*[0:100:500]+fitPeakDelVIIIfactors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,DelVIIIPeak,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitPeakDelXfactors(1)*[0:100:500]+fitPeakDelXfactors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,DelXPeak,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('{\itP} [\muM]')
tA = title('A');
axis([0 500 0 0.4])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},1)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,2)

h(1) = plot([0:50:200],fitRiseTimeDelIIfactors(1)*[0:50:200]+fitRiseTimeDelIIfactors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,DelIIRiseTime,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:500],fitRiseTimeDelVIIIfactors(1)*[0:100:500]+fitRiseTimeDelVIIIfactors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,DelVIIIRiseTime,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitRiseTimeDelXfactors(1)*[0:100:500]+fitRiseTimeDelXfactors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,DelXRiseTime,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('{\itT_p-T} [min]')
tB = title('B');
axis([0 500 0 6.25])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},1)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,3)

h(1) = plot([0:50:500],fitDelayDelIIfactors(1)*[0:50:500]+fitDelayDelIIfactors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,DelIIDelay,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:500],fitDelayDelVIIIfactors(1)*[0:100:500]+fitDelayDelVIIIfactors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,DelVIIIDelay,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitDelayDelXfactors(1)*[0:100:500]+fitDelayDelXfactors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,DelXDelay,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('{\itT} [min]')
tC = title('C');
axis([0 500 0 3.75])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(3,4,4)

h(1) = plot([0:50:200],fitETPDelIIfactors(1)*[0:50:200]+fitETPDelIIfactors(2),'r-.','LineWidth',6)
hold on
scatter(DelFactorII14492,DelIIETP,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
h(2) = plot([0:100:500],fitETPDelVIIIfactors(1)*[0:100:500]+fitETPDelVIIIfactors(2),'g--','LineWidth',6)
scatter(DelFactorVIII14492,DelVIIIETP,150,'Green','filled','d','MarkerEdgeColor','Black');
h(3) = plot([0:100:500],fitETPDelXfactors(1)*[0:100:500]+fitETPDelXfactors(2),'b-','LineWidth',6)
scatter(DelFactorX14504,DelXETP,150,'Blue','filled','s','MarkerEdgeColor','Black');

%xlabel('Concentration Increase [%-activity]')
ylabel('IIa_{\ittot} [\muM min]')
tD = title('D');
axis([0 500 0 2])
%legend([h(1) h(2) h(3)],{'II, #14492','VIII, #14492','X, #14504'},1)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')
set(tC, 'FontSize',31, 'FontWeight', 'bold')
set(tD, 'FontSize',31, 'FontWeight', 'bold')
set(tE, 'FontSize',31, 'FontWeight', 'bold')
set(tF, 'FontSize',31, 'FontWeight', 'bold')
set(tG, 'FontSize',31, 'FontWeight', 'bold')
set(tH, 'FontSize',31, 'FontWeight', 'bold')
set(tI, 'FontSize',31, 'FontWeight', 'bold')
set(tJ, 'FontSize',31, 'FontWeight', 'bold')
set(tK, 'FontSize',31, 'FontWeight', 'bold')
set(tL, 'FontSize',31, 'FontWeight', 'bold')

return


function fitLinearEstimate = fitLinearModel(x,xdata)

fitLinearEstimate = x(1)*xdata + x(2);

return

function Delay = DetermineDelay(Tcheck,MeasuredThrombin)

%first, look for the first data point below half of the thrombin peak

[MaxThrombin,MaxThrombinIndex] = max(MeasuredThrombin);
TimeMaxThrombin = Tcheck(MaxThrombinIndex);

SlopeUpperValueIndex = find(MeasuredThrombin<=0.5*MaxThrombin & Tcheck<=TimeMaxThrombin,1,'last');
SlopeUpperValue = MeasuredThrombin(SlopeUpperValueIndex);
SlopeUpperTime = Tcheck(SlopeUpperValueIndex);

%calculate the slope with the next lower data point
SlopeLowerValue = MeasuredThrombin(SlopeUpperValueIndex-1);
SlopeLowerTime = Tcheck(SlopeUpperValueIndex-1);
Slope = (SlopeUpperValue - SlopeLowerValue)/(SlopeUpperTime-SlopeLowerTime);

%calculate the x-intercept
b = SlopeLowerValue-Slope*SlopeLowerTime;
xintercept = -b/Slope;

if xintercept > 0
    EstimatedThrombinAtIntercept = interp1(Tcheck,MeasuredThrombin,xintercept);

    %calculate parameters for perpendicalar through this x-intercept
    SlopePerp = -1/Slope;
    bPerp = -SlopePerp*xintercept;

    %find a pair of points backwards from the x-intercept that lie on either
    %side of this perpendicular
    found = 0;
    CurrentIndex = find(MeasuredThrombin<=EstimatedThrombinAtIntercept & Tcheck<=TimeMaxThrombin,1,'last');
    while found == 0
        CurrentThrombinValue=MeasuredThrombin(CurrentIndex);
        CurrentPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex)+bPerp;

        if CurrentIndex > 1
            NextThrombinValue = MeasuredThrombin(CurrentIndex-1);
            NextPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex-1)+bPerp;

            if(CurrentThrombinValue <= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex);
            elseif (CurrentThrombinValue >= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex-1);
            else
                CurrentIndex = CurrentIndex-1;
            end
        else
            found = 1;
            Delay = Tcheck(CurrentIndex);
        end
    end
else
    Delay = Tcheck(1);
end

return

function R2ofLinearEstimate = DetermineLinearModelR2(Xdata,Yactualdata,LinearCoeffs)

Ypredicteddata = LinearCoeffs(1)*Xdata + LinearCoeffs(2);

MeanYactualdata = mean(Yactualdata);
SStot_vec = (Yactualdata - MeanYactualdata).^2;
SStot = sum(SStot_vec);
SSres_vec = (Yactualdata - Ypredicteddata).^2;
SSres = sum(SSres_vec);
R2ofLinearEstimate = 1 - SSres/SStot;


return
