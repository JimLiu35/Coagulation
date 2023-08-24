
function bvsa0_v2_Normal

clear all;
close all;
clc;

%% Load b and a0

%Normal Thrombograms
Normalb = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','E2:E21')/100;
Normala0 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','B2:B21');

NormalFita0 = min(Normala0):0.01:max(Normala0);
NormalFitb = 0.2288116658190270*NormalFita0;

%Trauma Thrombograms
Traumab = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','E2:E41')/100;
Traumaa0 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','B2:B41');

TraumaFita0 = min(Traumaa0):0.01:max(Traumaa0);
TraumaFitb = 0.2725060908156930*TraumaFita0;

figure
clf


subplot(2,2,2)
%h(1) = plot(Traumaa0,Traumab,'ro','MarkerSize',12);
%h(1) = plot(TraumaFita0,TraumaFitb,'r-.','LineWidth',6);
hold on
%scatter(Traumaa0,Traumab,150,'Red','filled','o','MarkerEdgeColor','Black');
box on
grid on


%h(2) = plot(Normala0,Normalb,'bx','MarkerSize',12);
h(2) = plot(NormalFita0,NormalFitb,'g--','LineWidth',6);
scatter(Normala0,Normalb,150,'Green','filled','d','MarkerEdgeColor','Black');


xlabel('{\ita_0}')
ylabel('{\itb}')
%legend([h(2) h(1)], {'Normal','Trauma'},4)
legend([h(2)], {'Normal'},4)
title('H')
%axis([0 1.75 0 0.45])

figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',30)
set(gca,'FontSize',30)



subplot(2,2,1)

%SampleTraumaCATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:A121');
%SampleTraumaCATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','B2:B121')/1000;
SampleNormalCATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:A121');
SampleNormalCATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','H2:H121')/1000;

%SampleTraumaa0 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','B2:B2');
%SampleTraumaa1 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','C2:C2');
%SampleTraumaa2 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','D2:D2');
%SampleTraumab = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','E2:E2')/100;
%SampleTraumaT = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','F2:F2');
SampleNormala0 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','B8:B8');
SampleNormala1 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','C8:C8');
SampleNormala2 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','D8:D8');
SampleNormalb = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','E8:E8')/100;
SampleNormalT = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','F8:F8');

s = tf('s');

%FittedSystem = SampleTraumab/(s^3 + SampleTraumaa2*s^2 + SampleTraumaa1*s + SampleTraumaa0) * exp(-SampleTraumaT*s);
FittedSystem = SampleNormalb/(s^3 + SampleNormala2*s^2 + SampleNormala1*s + SampleNormala0) * exp(-SampleNormalT*s);
T = linspace(0,45,451);
Y = 5*impulse(FittedSystem,T);

%FittedDataAtSampleTraumaCATTime = interp1(T,Y,SampleTraumaCATTime);
FittedDataAtSampleNormalCATTime = interp1(T,Y,SampleNormalCATTime);
%R2FittedData = DetermineModelR2(SampleTraumaCATData,FittedDataAtSampleTraumaCATTime)
R2FittedData = DetermineModelR2(SampleNormalCATData,FittedDataAtSampleNormalCATTime)

%plot(SampleTraumaCATTime,SampleTraumaCATData,'k*','LineWidth',6,'MarkerSize',12)
plot(SampleNormalCATTime,SampleNormalCATData,'k*','LineWidth',6,'MarkerSize',12)
hold on
grid on
box on
%plot(SampleTraumaCATTime,0.35*SampleTraumaCATTime.*exp(-0.26*SampleTraumaCATTime),'r-.','LineWidth',6);
%plot(SampleTraumaCATTime,0.22*SampleTraumaCATTime.^2.*exp(-0.50*SampleTraumaCATTime),'g--','LineWidth',6);
plot(SampleNormalCATTime,0.104*SampleNormalCATTime.*exp(-0.18*SampleNormalCATTime),'r-.','LineWidth',6);
plot(SampleNormalCATTime,0.048*SampleNormalCATTime.^2.*exp(-0.35*SampleNormalCATTime),'g--','LineWidth',6);
plot(T,Y,'b-','LineWidth',6);

xlabel('Time [min]')
ylabel('IIa [\muM]')
axis([0 45 -0.05 0.25])
%legend('Trauma CAT Data','0.35t exp(-0.26t)','0.22t^2 exp(-0.5t)','SDO Generated Fit',1)
legend('Normal CAT Data','0.104t exp(-0.18t)','0.048t^2 exp(-0.35t)','SDO Generated Fit',1)
title('G')

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)



% hfig = subplot(2,2,4);
% img = imread('Sample_Model_Order','png');
% %imgout = imresize(img,2);
% %imshow(imgout,'Border','tight','InitialMagnification',100)
% subimage(imgout)
% 
% % imshow('Sample_Model_Order.png','Border','tight','InitialMagnification',100)
% % 
% % %# handle figure resize events
% % hAx = gca;
% % set(hfig, 'ResizeFcn',{@onResize,hAx})
% % 
% % %# call it at least once
% % feval(@onResize,hfig,[],hAx);
% % 
% % 
% % return
% % 
% % 
% % function onResize(o,e,hAx)
% %     %# get axes limits in pixels
% %     oldUnits = get(hAx, 'Units');    %# backup normalized units
% %     set(hAx, 'Units','pixels')
% %     pos = get(hAx, 'Position');
% %     set(hAx, 'Units',oldUnits)       %# restore units (so it auto-resize)
% % 
% %     %# display the top left part of the image at magnification 100%
% %     xlim(hAx, [0 pos(3)]+0.5)
% %     ylim(hAx, [0 pos(4)]+0.5)
% % return

return


function R2ofEstimate = DetermineModelR2(Yactualdata,Ypredicteddata)


MeanYactualdata = mean(Yactualdata);
SStot_vec = (Yactualdata - MeanYactualdata).^2;
SStot = sum(SStot_vec);
SSres_vec = (Yactualdata - Ypredicteddata).^2;
SSres = sum(SSres_vec);
R2ofEstimate = 1 - SSres/SStot;


return
