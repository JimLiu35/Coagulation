
function Factor_Spiking_Supp_II


clear all;
close all;
clc;

figure(1)
clf

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);

DelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I2:I6');
a0DelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B2:B6');
a1DelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C2:C6');
a2DelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D2:D6');
bDelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E2:E6');
KDelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G2:G6');
pDelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K2:K6');
omeganDelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L2:L6');
TDelFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F2:F6');

[fita0DelFactorII14492factors,resfita0DelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,a0DelFactorII14492,[],[],options)
[fita1DelFactorII14492factors,resfita1DelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,a1DelFactorII14492,[],[],options)
[fita2DelFactorII14492factors,resfita2DelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,a2DelFactorII14492,[],[],options)
[fitbDelFactorII14492factors,resfitbDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,bDelFactorII14492,[],[],options)
[fitKDelFactorII14492factors,resfitkDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,KDelFactorII14492,[],[],options)
[fitpDelFactorII14492factors,resfitpDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,pDelFactorII14492,[],[],options)
[fitomeganDelFactorII14492factors,resfitomeganDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,omeganDelFactorII14492,[],[],options)
[fitTDelFactorII14492factors,resfitTDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,TDelFactorII14492,[],[],options)



DelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I9:I10');
a0DelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B9:B10');
a1DelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C9:C10');
a2DelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D9:D10');
bDelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E9:E10');
KDelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G9:G10');
pDelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K9:K10');
omeganDelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L9:L10');
TDelFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F9:F10');

[fita0DelFactorII14495factors,resfita0DelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,a0DelFactorII14495,[],[],options)
[fita1DelFactorII14495factors,resfita1DelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,a1DelFactorII14495,[],[],options)
[fita2DelFactorII14495factors,resfita2DelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,a2DelFactorII14495,[],[],options)
[fitbDelFactorII14495factors,resfitbDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,bDelFactorII14495,[],[],options)
[fitKDelFactorII14495factors,resfitkDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,KDelFactorII14495,[],[],options)
[fitpDelFactorII14495factors,resfitpDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,pDelFactorII14495,[],[],options)
[fitomeganDelFactorII14495factors,resfitomeganDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,omeganDelFactorII14495,[],[],options)
[fitTDelFactorII14495factors,resfitTDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,TDelFactorII14495,[],[],options)


DelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I12:I14');
a0DelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B12:B14');
a1DelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C12:C14');
a2DelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D12:D14');
bDelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E12:E14');
KDelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G12:G14');
pDelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K12:K14');
omeganDelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L12:L14');
TDelFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F12:F14');

[fita0DelFactorII14500factors,resfita0DelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,a0DelFactorII14500,[],[],options)
[fita1DelFactorII14500factors,resfita1DelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,a1DelFactorII14500,[],[],options)
[fita2DelFactorII14500factors,resfita2DelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,a2DelFactorII14500,[],[],options)
[fitbDelFactorII14500factors,resfitbDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,bDelFactorII14500,[],[],options)
[fitKDelFactorII14500factors,resfitkDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,KDelFactorII14500,[],[],options)
[fitpDelFactorII14500factors,resfitpDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,pDelFactorII14500,[],[],options)
[fitomeganDelFactorII14500factors,resfitomeganDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,omeganDelFactorII14500,[],[],options)
[fitTDelFactorII14500factors,resfitTDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,TDelFactorII14500,[],[],options)


DelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I16:I18');
a0DelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B16:B18');
a1DelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C16:C18');
a2DelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D16:D18');
bDelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E16:E18');
KDelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G16:G18');
pDelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K16:K18');
omeganDelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L16:L18');
TDelFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F16:F18');

[fita0DelFactorII14501factors,resfita0DelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,a0DelFactorII14501,[],[],options)
[fita1DelFactorII14501factors,resfita1DelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,a1DelFactorII14501,[],[],options)
[fita2DelFactorII14501factors,resfita2DelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,a2DelFactorII14501,[],[],options)
[fitbDelFactorII14501factors,resfitbDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,bDelFactorII14501,[],[],options)
[fitKDelFactorII14501factors,resfitkDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,KDelFactorII14501,[],[],options)
[fitpDelFactorII14501factors,resfitpDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,pDelFactorII14501,[],[],options)
[fitomeganDelFactorII14501factors,resfitomeganDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,omeganDelFactorII14501,[],[],options)
[fitTDelFactorII14501factors,resfitTDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,TDelFactorII14501,[],[],options)


DelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','I20:I21');
a0DelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','B20:B21');
a1DelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','C20:C21');
a2DelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','D20:D21');
bDelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','E20:E21');
KDelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','G20:G21');
pDelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','K20:K21');
omeganDelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','L20:L21');
TDelFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits','F20:F21');

[fita0DelFactorII14504factors,resfita0DelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,a0DelFactorII14504,[],[],options)
[fita1DelFactorII14504factors,resfita1DelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,a1DelFactorII14504,[],[],options)
[fita2DelFactorII14504factors,resfita2DelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,a2DelFactorII14504,[],[],options)
[fitbDelFactorII14504factors,resfitbDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,bDelFactorII14504,[],[],options)
[fitKDelFactorII14504factors,resfitkDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,KDelFactorII14504,[],[],options)
[fitpDelFactorII14504factors,resfitpDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,pDelFactorII14504,[],[],options)
[fitomeganDelFactorII14504factors,resfitomeganDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,omeganDelFactorII14504,[],[],options)
[fitTDelFactorII14504factors,resfitTDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,TDelFactorII14504,[],[],options)


%%

subplot(2,2,3)

h(1) = plot([0:100:1000],fita0DelFactorII14492factors(1)*[0:100:1000]+fita0DelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,a0DelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita0DelFactorII14495factors(1)*[0:100:1000]+fita0DelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,a0DelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita0DelFactorII14500factors(1)*[0:100:1000]+fita0DelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,a0DelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita0DelFactorII14501factors(1)*[0:100:1000]+fita0DelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,a0DelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita0DelFactorII14504factors(1)*[0:100:1000]+fita0DelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,a0DelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('a_0')
tG = title('G');
axis([0 175 0 0.155])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,2)

h(1) = plot([0:100:1000],fita1DelFactorII14492factors(1)*[0:100:1000]+fita1DelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,a1DelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita1DelFactorII14495factors(1)*[0:100:1000]+fita1DelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,a1DelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita1DelFactorII14500factors(1)*[0:100:1000]+fita1DelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,a1DelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita1DelFactorII14501factors(1)*[0:100:1000]+fita1DelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,a1DelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita1DelFactorII14504factors(1)*[0:100:1000]+fita1DelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,a1DelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('a_1')
tF = title('F');
axis([0 175 0.2 0.85])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,1)

h(1) = plot([0:100:1000],fita2DelFactorII14492factors(1)*[0:100:1000]+fita2DelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,a2DelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fita2DelFactorII14495factors(1)*[0:100:1000]+fita2DelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,a2DelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fita2DelFactorII14500factors(1)*[0:100:1000]+fita2DelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,a2DelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fita2DelFactorII14501factors(1)*[0:100:1000]+fita2DelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,a2DelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fita2DelFactorII14504factors(1)*[0:100:1000]+fita2DelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,a2DelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('a_2')
tE = title('E');
axis([0 175 0.7 1.3])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


subplot(2,2,4)

h(1) = plot([0:100:1000],fitbDelFactorII14492factors(1)*[0:100:1000]+fitbDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,bDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitbDelFactorII14495factors(1)*[0:100:1000]+fitbDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,bDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitbDelFactorII14500factors(1)*[0:100:1000]+fitbDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,bDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitbDelFactorII14501factors(1)*[0:100:1000]+fitbDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,bDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitbDelFactorII14504factors(1)*[0:100:1000]+fitbDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,bDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('b')
tH = title('H');
axis([0 175 0 8])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tE, 'FontSize',31, 'FontWeight', 'bold')
set(tF, 'FontSize',31, 'FontWeight', 'bold')
set(tG, 'FontSize',31, 'FontWeight', 'bold')
set(tH, 'FontSize',31, 'FontWeight', 'bold')
%%

figure(2)
clf


subplot(2,2,3)

h(1) = plot([0:100:1000],fitomeganDelFactorII14492factors(1)*[0:100:1000]+fitomeganDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,omeganDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitomeganDelFactorII14495factors(1)*[0:100:1000]+fitomeganDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,omeganDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitomeganDelFactorII14500factors(1)*[0:100:1000]+fitomeganDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,omeganDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitomeganDelFactorII14501factors(1)*[0:100:1000]+fitomeganDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,omeganDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitomeganDelFactorII14504factors(1)*[0:100:1000]+fitomeganDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,omeganDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('\omega_n')
tK = title('K');
axis([0 175 0.35 0.8])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)




subplot(2,2,2)

h(1) = plot([0:100:1000],fitpDelFactorII14492factors(1)*[0:100:1000]+fitpDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,pDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitpDelFactorII14495factors(1)*[0:100:1000]+fitpDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,pDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitpDelFactorII14500factors(1)*[0:100:1000]+fitpDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,pDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitpDelFactorII14501factors(1)*[0:100:1000]+fitpDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,pDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitpDelFactorII14504factors(1)*[0:100:1000]+fitpDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,pDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('p')
tJ = title('J');
axis([0 175 0.12 0.3])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)




subplot(2,2,1)

h(1) = plot([0:100:1000],fitKDelFactorII14492factors(1)*[0:100:1000]+fitKDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,KDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitKDelFactorII14495factors(1)*[0:100:1000]+fitKDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,KDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitKDelFactorII14500factors(1)*[0:100:1000]+fitKDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,KDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitKDelFactorII14501factors(1)*[0:100:1000]+fitKDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,KDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitKDelFactorII14504factors(1)*[0:100:1000]+fitKDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,KDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('K')
tI = title('I');
axis([0 175 0.1 0.65])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)




subplot(2,2,4)

h(1) = plot([0:100:1000],fitTDelFactorII14492factors(1)*[0:100:1000]+fitTDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,TDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitTDelFactorII14495factors(1)*[0:100:1000]+fitTDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,TDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitTDelFactorII14500factors(1)*[0:100:1000]+fitTDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,TDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitTDelFactorII14501factors(1)*[0:100:1000]+fitTDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,TDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitTDelFactorII14504factors(1)*[0:100:1000]+fitTDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,TDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('T')
tL = title('L');
axis([0 175 1.5 4.5])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tI, 'FontSize',31, 'FontWeight', 'bold')
set(tJ, 'FontSize',31, 'FontWeight', 'bold')
set(tK, 'FontSize',31, 'FontWeight', 'bold')
set(tL, 'FontSize',31, 'FontWeight', 'bold')
%%

figure(3)
clf


% 14492
CATDataFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','B2:F121')/1000;
CATTimeFactorII14492 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','A2:A121');
[PeakDelFactorII14492,PeakIndexDelFactorII14492] = max(CATDataFactorII14492);
PeakTimeDelFactorII14492 = CATTimeFactorII14492(PeakIndexDelFactorII14492);
ETPDelFactorII14492 = trapz(CATTimeFactorII14492,CATDataFactorII14492);
for counter = 1:length(CATDataFactorII14492(1,:))
    DelayDelFactorII14492(1,counter) = DetermineDelay(CATTimeFactorII14492,CATDataFactorII14492(:,counter));
end
RiseTimeDelFactorII14492 = PeakTimeDelFactorII14492'-DelayDelFactorII14492;

[fitPeakDelFactorII14492factors,resfitPeakDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,PeakDelFactorII14492',[],[],options)
R2fitPeakDelFactorII14492 = DetermineLinearModelR2(DelFactorII14492,PeakDelFactorII14492',fitPeakDelFactorII14492factors)
[fitRiseTimeDelFactorII14492factors,resfitRiseTimeDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,RiseTimeDelFactorII14492',[],[],options)
R2fitRiseTimeDelFactorII14492 = DetermineLinearModelR2(DelFactorII14492,RiseTimeDelFactorII14492',fitRiseTimeDelFactorII14492factors)
[fitDelayDelFactorII14492factors,resfitDelayDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,DelayDelFactorII14492',[],[],options)
R2fitDelayDelFactorII14492 = DetermineLinearModelR2(DelFactorII14492,DelayDelFactorII14492',fitDelayDelFactorII14492factors)
[fitETPDelFactorII14492factors,resfitETPDelFactorII14492norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14492,ETPDelFactorII14492',[],[],options)
R2fitETPDelFactorII14492 = DetermineLinearModelR2(DelFactorII14492,ETPDelFactorII14492',fitETPDelFactorII14492factors)
 



% 14495
CATDataFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DC2:DD121')/1000;
CATTimeFactorII14495 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DB2:DB121');
[PeakDelFactorII14495,PeakIndexDelFactorII14495] = max(CATDataFactorII14495);
PeakTimeDelFactorII14495 = CATTimeFactorII14495(PeakIndexDelFactorII14495);
ETPVectorLength = find(isnan(CATDataFactorII14495(:,1)),1)-1;
ETPDelFactorII14495 = trapz(CATTimeFactorII14495(1:ETPVectorLength),CATDataFactorII14495(1:ETPVectorLength,:));
for counter = 1:length(CATDataFactorII14495(1,:))
    DelayDelFactorII14495(1,counter) = DetermineDelay(CATTimeFactorII14495,CATDataFactorII14495(:,counter));
end
RiseTimeDelFactorII14495 = PeakTimeDelFactorII14495'-DelayDelFactorII14495;

[fitPeakDelFactorII14495factors,resfitPeakDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,PeakDelFactorII14495',[],[],options)
R2fitPeakDelFactorII14495 = DetermineLinearModelR2(DelFactorII14495,PeakDelFactorII14495',fitPeakDelFactorII14495factors)
[fitRiseTimeDelFactorII14495factors,resfitRiseTimeDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,RiseTimeDelFactorII14495',[],[],options)
R2fitRiseTimeDelFactorII14495 = DetermineLinearModelR2(DelFactorII14495,RiseTimeDelFactorII14495',fitRiseTimeDelFactorII14495factors)
[fitDelayDelFactorII14495factors,resfitDelayDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,DelayDelFactorII14495',[],[],options)
R2fitDelayDelFactorII14495 = DetermineLinearModelR2(DelFactorII14495,DelayDelFactorII14495',fitDelayDelFactorII14495factors)
[fitETPDelFactorII14495factors,resfitETPDelFactorII14495norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14495,ETPDelFactorII14495',[],[],options)
R2fitETPDelFactorII14495 = DetermineLinearModelR2(DelFactorII14495,ETPDelFactorII14495',fitETPDelFactorII14495factors)



% 14500
CATDataFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','L2:N121')/1000;
CATTimeFactorII14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','K2:K121');
[PeakDelFactorII14500,PeakIndexDelFactorII14500] = max(CATDataFactorII14500);
PeakTimeDelFactorII14500 = CATTimeFactorII14500(PeakIndexDelFactorII14500);
ETPDelFactorII14500 = trapz(CATTimeFactorII14500,CATDataFactorII14500);
for counter = 1:length(CATDataFactorII14500(1,:))
    DelayDelFactorII14500(1,counter) = DetermineDelay(CATTimeFactorII14500,CATDataFactorII14500(:,counter));
end
RiseTimeDelFactorII14500 = PeakTimeDelFactorII14500'-DelayDelFactorII14500;

[fitPeakDelFactorII14500factors,resfitPeakDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,PeakDelFactorII14500',[],[],options)
R2fitPeakDelFactorII14500 = DetermineLinearModelR2(DelFactorII14500,PeakDelFactorII14500',fitPeakDelFactorII14500factors)
[fitRiseTimeDelFactorII14500factors,resfitRiseTimeDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,RiseTimeDelFactorII14500',[],[],options)
R2fitRiseTimeDelFactorII14500 = DetermineLinearModelR2(DelFactorII14500,RiseTimeDelFactorII14500',fitRiseTimeDelFactorII14500factors)
[fitDelayDelFactorII14500factors,resfitDelayDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,DelayDelFactorII14500',[],[],options)
R2fitDelayDelFactorII14500 = DetermineLinearModelR2(DelFactorII14500,DelayDelFactorII14500',fitDelayDelFactorII14500factors)
[fitETPDelFactorII14500factors,resfitETPDelFactorII14500norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14500,ETPDelFactorII14500',[],[],options)
R2fitETPDelFactorII14500 = DetermineLinearModelR2(DelFactorII14500,ETPDelFactorII14500',fitETPDelFactorII14500factors)



% 14501
CATDataFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DG2:DH121')/1000;
CATDataFactorII14501 = [CATDataFactorII14501,xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DK2:DK121')/1000];
CATTimeFactorII14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DF2:DF121');
[PeakDelFactorII14501,PeakIndexDelFactorII14501] = max(CATDataFactorII14501);
PeakTimeDelFactorII14501 = CATTimeFactorII14501(PeakIndexDelFactorII14501);
ETPDelFactorII14501 = trapz(CATTimeFactorII14501,CATDataFactorII14501);
for counter = 1:length(CATDataFactorII14501(1,:))
    DelayDelFactorII14501(1,counter) = DetermineDelay(CATTimeFactorII14501,CATDataFactorII14501(:,counter));
end
RiseTimeDelFactorII14501 = PeakTimeDelFactorII14501'-DelayDelFactorII14501;

[fitPeakDelFactorII14501factors,resfitPeakDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,PeakDelFactorII14501',[],[],options)
R2fitPeakDelFactorII14501 = DetermineLinearModelR2(DelFactorII14501,PeakDelFactorII14501',fitPeakDelFactorII14501factors)
[fitRiseTimeDelFactorII14501factors,resfitRiseTimeDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,RiseTimeDelFactorII14501',[],[],options)
R2fitRiseTimeDelFactorII14501 = DetermineLinearModelR2(DelFactorII14501,RiseTimeDelFactorII14501',fitRiseTimeDelFactorII14501factors)
[fitDelayDelFactorII14501factors,resfitDelayDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,DelayDelFactorII14501',[],[],options)
R2fitDelayDelFactorII14501 = DetermineLinearModelR2(DelFactorII14501,DelayDelFactorII14501',fitDelayDelFactorII14501factors)
[fitETPDelFactorII14501factors,resfitETPDelFactorII14501norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14501,ETPDelFactorII14501',[],[],options)
R2fitETPDelFactorII14501 = DetermineLinearModelR2(DelFactorII14501,ETPDelFactorII14501',fitETPDelFactorII14501factors)


% 14504
CATDataFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DN2:DO121')/1000;
CATTimeFactorII14504 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Dynamic','DM2:DM121');
[PeakDelFactorII14504,PeakIndexDelFactorII14504] = max(CATDataFactorII14504);
PeakTimeDelFactorII14504 = CATTimeFactorII14504(PeakIndexDelFactorII14504);
ETPDelFactorII14504 = trapz(CATTimeFactorII14504,CATDataFactorII14504);
for counter = 1:length(CATDataFactorII14504(1,:))
    DelayDelFactorII14504(1,counter) = DetermineDelay(CATTimeFactorII14504,CATDataFactorII14504(:,counter));
end
RiseTimeDelFactorII14504 = PeakTimeDelFactorII14504'-DelayDelFactorII14504;

[fitPeakDelFactorII14504factors,resfitPeakDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,PeakDelFactorII14504',[],[],options)
R2fitPeakDelFactorII14504 = DetermineLinearModelR2(DelFactorII14504,PeakDelFactorII14504',fitPeakDelFactorII14504factors)
[fitRiseTimeDelFactorII14504factors,resfitRiseTimeDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,RiseTimeDelFactorII14504',[],[],options)
R2fitRiseTimeDelFactorII14504 = DetermineLinearModelR2(DelFactorII14504,RiseTimeDelFactorII14504',fitRiseTimeDelFactorII14504factors)
[fitDelayDelFactorII14504factors,resfitDelayDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,DelayDelFactorII14504',[],[],options)
R2fitDelayDelFactorII14504 = DetermineLinearModelR2(DelFactorII14504,DelayDelFactorII14504',fitDelayDelFactorII14504factors)
[fitETPDelFactorII14504factors,resfitETPDelFactorII14504norm] = lsqcurvefit(@fitLinearModel,[1;1],DelFactorII14504,ETPDelFactorII14504',[],[],options)
R2fitETPDelFactorII14504 = DetermineLinearModelR2(DelFactorII14504,ETPDelFactorII14504',fitETPDelFactorII14504factors)






subplot(2,2,1)

h(1) = plot([0:100:1000],fitPeakDelFactorII14492factors(1)*[0:100:1000]+fitPeakDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,PeakDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitPeakDelFactorII14495factors(1)*[0:100:1000]+fitPeakDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,PeakDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitPeakDelFactorII14500factors(1)*[0:100:1000]+fitPeakDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,PeakDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitPeakDelFactorII14501factors(1)*[0:100:1000]+fitPeakDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,PeakDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitPeakDelFactorII14504factors(1)*[0:100:1000]+fitPeakDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,PeakDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)


xlabel('II Concentration Increase [%-activity]')
ylabel('{\itP} [\muM]')
tA = title('A');
axis([0 175 0.05 0.4])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)




subplot(2,2,2)
 
h(1) = plot([0:100:1000],fitRiseTimeDelFactorII14492factors(1)*[0:100:1000]+fitRiseTimeDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,RiseTimeDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitRiseTimeDelFactorII14495factors(1)*[0:100:1000]+fitRiseTimeDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,RiseTimeDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitRiseTimeDelFactorII14500factors(1)*[0:100:1000]+fitRiseTimeDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,RiseTimeDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitRiseTimeDelFactorII14501factors(1)*[0:100:1000]+fitRiseTimeDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,RiseTimeDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitRiseTimeDelFactorII14504factors(1)*[0:100:1000]+fitRiseTimeDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,RiseTimeDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('{\itT_P-T} [min]')
tB = title('B');
axis([0 175 3 6.1])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,3)

h(1) = plot([0:100:1000],fitDelayDelFactorII14492factors(1)*[0:100:1000]+fitDelayDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,DelayDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitDelayDelFactorII14495factors(1)*[0:100:1000]+fitDelayDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,DelayDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitDelayDelFactorII14500factors(1)*[0:100:1000]+fitDelayDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,DelayDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitDelayDelFactorII14501factors(1)*[0:100:1000]+fitDelayDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,DelayDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitDelayDelFactorII14504factors(1)*[0:100:1000]+fitDelayDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,DelayDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)
 
xlabel('II Concentration Increase [%-activity]')
ylabel('{\itT} [min]')
tC = title('C');
axis([0 175 2 4.5])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'})

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



subplot(2,2,4)

h(1) = plot([0:100:1000],fitETPDelFactorII14492factors(1)*[0:100:1000]+fitETPDelFactorII14492factors(2),'r-.','LineWidth',6)
hold on
plot(DelFactorII14492,ETPDelFactorII14492,'ro','LineWidth',6,'MarkerSize',12);
grid on
box on
h(2) = plot([0:100:1000],fitETPDelFactorII14495factors(1)*[0:100:1000]+fitETPDelFactorII14495factors(2),'g--','LineWidth',6)
plot(DelFactorII14495,ETPDelFactorII14495,'gd','LineWidth',6,'MarkerSize',12);
h(3) = plot([0:100:1000],fitETPDelFactorII14500factors(1)*[0:100:1000]+fitETPDelFactorII14500factors(2),'b-','LineWidth',6)
plot(DelFactorII14500,ETPDelFactorII14500,'bs','LineWidth',6,'MarkerSize',12);
h(4) = plot([0:100:1000],fitETPDelFactorII14501factors(1)*[0:100:1000]+fitETPDelFactorII14501factors(2),'m:','LineWidth',6)
plot(DelFactorII14501,ETPDelFactorII14501,'m^','LineWidth',6,'MarkerSize',12);
h(5) = plot([0:100:1000],fitETPDelFactorII14504factors(1)*[0:100:1000]+fitETPDelFactorII14504factors(2),'-.','LineWidth',6,'Color',[1 0.5 0])
plot(DelFactorII14504,ETPDelFactorII14504,'+','MarkerEdgeColor',[1 0.5 0],'LineWidth',6,'MarkerSize',12)

xlabel('II Concentration Increase [%-activity]')
ylabel('IIa_{tot} [\muM min]')
tD = title('D');
axis([0 175 0.5 3.5])
legend([h(1) h(2) h(3) h(4) h(5)],{'#14492','#14495','#14500','#14501','#14504'},4)

figureHandle = gcf;
%# make all text in the figure to size 20 %and bold
set(findall(figureHandle,'type','text'),'FontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')
set(tC, 'FontSize',31, 'FontWeight', 'bold')
set(tD, 'FontSize',31, 'FontWeight', 'bold')
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
