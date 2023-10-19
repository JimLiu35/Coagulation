function Model_Validation

clear all
close all
clc





figure
clf
%subplot(1,2,1)

for VisualNum = 1:6
    
if VisualNum == 1 %14488
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:A121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','B2:B121')/1000; %microM    
    II_0 = 71;
    V_0 = 46;
    VII_0 = 76;
    VIII_0 = 28;
    IX_0 = 99;
    X_0 = 72;
    ATIII_0 = 72;
    ColorString1 = 'r';
    ColorString2 = '^';
    ColorString3 = '-';
    LegendString = '#14488\newlineNormal';
    %LegendStringNew = '#14488, Normal';
    TitleString = '#14488, Normal';
elseif VisualNum == 2 %2797
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','N2:N121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','U2:U121')/1000; %microM    
    II_0 = 94;
    V_0 = 85;
    VII_0 = 597;
    VIII_0 = 104;
    IX_0 = 182;
    X_0 = 118;
    ATIII_0 = 150;
    ColorString1 = 'g';
    ColorString2 = 's';
    ColorString3 = '-';
    LegendString = '#2797\newlineISS = 1';
    %LegendStringNew = '#2797, ISS = 1';
    TitleString = '#2797, ISS = 1';
elseif VisualNum == 3 %2885
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','N2:N121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','AG2:AG121')/1000; %microM    
    II_0 = 74;
    V_0 = 24;
    VII_0 = 59;
    VIII_0 = 78;
    IX_0 = 73;
    X_0 = 79;
    ATIII_0 = 74;
    ColorString1 = 'b';
    ColorString2 = 'd';
    ColorString3 = '-';
    LegendString = '#2885\newlineISS = 5';
    %LegendStringNew = '#2885, ISS = 5';
    TitleString = '#2885, ISS = 5';
elseif VisualNum == 4 %2895
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','AK2:AK121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','AR2:AR121')/1000; %microM    
    II_0 = 77;
    V_0 = 38;
    VII_0 = 120;
    VIII_0 = 97;
    IX_0 = 80;
    X_0 = 74;
    ATIII_0 = 93;
    ColorString1 = 'm';
    ColorString2 = 'x';
    ColorString3 = '-';
    LegendString = '#2895\newlineISS = 10';
    %LegendStringNew = '#2895, 5-15';
    TitleString = '#2895, ISS = 10';
elseif VisualNum == 5 %2675
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:A121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','J2:J121')/1000; %microM    
    II_0 = 46;
    V_0 = 1;
    VII_0 = 98;
    VIII_0 = 64;
    IX_0 = 66;
    X_0 = 55;
    ATIII_0 = 61;
    ColorString1 = [1 0.5 0];
    ColorString2 = 'o';
    ColorString3 = '-';
    LegendString = '#2675\newlineISS > 25';
    %LegendStringNew = '#2675, ISS > 25';
    TitleString = '#2675, ISS = 29';
elseif VisualNum == 6 %2771
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','N2:N121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','R2:R121')/1000; %microM    
    II_0 = 86;
    V_0 = 52;
    VII_0 = 135;
    VIII_0 = 88;
    IX_0 = 61;
    X_0 = 85;
    ATIII_0 = 97;
    ColorString1 = 'c';
    ColorString2 = '*';
    ColorString3 = '-';
    LegendString = '#2771\newlineTBI';
    %LegendStringNew = '#2771, TBI';
    TitleString = '#2771, ISS = 30, TBI';
end


s = tf('s');

%determine estimated CAT
    
Kpredict = -3.726657338358752e-04*ATIII_0 - 1.061876341163392e-03*V_0 + 0.0038739537*II_0 + 4.668543644101519e-02;    

%rightrealpolepredict = 1.464358064964255e-04*VII_0 + 1.882345949984154e-03*ATIII_0 + 0.0002706628*X_0 + 0.0002468253*VIII_0 - 0.0013723897*II_0 + 1.480117692280488e-01;
rightrealpolepredict = -1.987587485978715e-04*V_0 + 1.385914324921744e-04*VII_0 + 2.071935991073470e-03*ATIII_0 + 0.0002706628*X_0 + 0.0002468253*VIII_0 - 0.0013723897*II_0 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

%leftpairmagpolepredict = 1.492872113008525e-03*VII_0 + 0.0018702987*X_0 + 0.0018263832*VIII_0 - 0.0043593893*II_0 + 8.223302745491907e-01;
leftpairmagpolepredict = -2.538758094605242e-03*V_0 + 1.550401894224618e-03*VII_0 + 0.0018702987*X_0 + 0.0018263832*VIII_0 - 0.0043593893*II_0 + 9.406358444664269e-01;

%kdpredict = 1.222090629892936e-02*IX_0 - 0.0033648432*X_0 - 0.0115383188*II_0 + 2.507103197800389e+00;
kdpredict = -4.562037133152064e-03*V_0 + 1.354060297626436e-02*IX_0 - 0.0033648432*X_0 - 0.0115383188*II_0 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);
Y = 5*impulse(PredictedSystem,T);



subplot(2,3,VisualNum)

%plot(Tcheck,MeasuredThrombin,'Color',ColorString1,'LineStyle',ColorString2,'LineWidth',6,'MarkerSize',12);
h1(VisualNum) = plot(Tcheck,MeasuredThrombin,'k-','LineWidth',6,'MarkerSize',12);
hold on
%h(VisualNum) = plot(T,Y,'Color',ColorString1,'LineStyle',ColorString3,'LineWidth',6,'MarkerSize',12);
h2(VisualNum) = plot(T,Y,'r-.','LineWidth',6,'MarkerSize',12);

grid on
box on

xlabel('Time [min]')
ylabel('IIa [\muM]')
%legend([h(1) h(2) h(3) h(4) h(5) h(6)], {'#14488, Normal','#2797, ISS = 1','#2885, ISS = 5','#2895, ISS 5-15','#2675, ISS > 25','#2771, TBI'})
%legend([h(VisualNum)],{LegendString},1)
legend([h1(VisualNum) h2(VisualNum)],{'Measured','Predicted'},1)
axis([0 20 -0.05 0.425]);
title(TitleString)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

end




%%
figure
%subplot(1,2,2)
for VisualNum = 1:8
    
if VisualNum == 1 %14500 Pre-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','A18:A137'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','B18:B137')/1000; %microM    
    II_0 = 97;
    V_0 = 75;
    VII_0 = 96;
    VIII_0 = 70;
    IX_0 = 134;
    X_0 = 149;
    ATIII_0 = 96;
    %ColorString1 = 'r';
    %ColorString2 = '^';
    %ColorString3 = '-';
    %LegendString = '#14500\newlineNormal\newlinePre-Spike';
    LegendString1 = 'Measured Pre-Spike';
    LegendString2 = 'Predicted Pre-Spike';
    TitleString = '#14500, Normal';
elseif VisualNum == 2 %14500 Post-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','A18:A137'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','E18:E137')/1000; %microM    
    II_0 = 175;
    V_0 = 75;
    VII_0 = 96;
    VIII_0 = 149;
    IX_0 = 134;
    X_0 = 301;
    ATIII_0 = 96;
    %ColorString1 = 'g';
    %ColorString2 = 's';
    %ColorString3 = '-';
    %LegendString = '#14500\newlineNormal\newlinePost-Spike';
    LegendString3 = 'Measured Post-Spike';
    LegendString4 = 'Predicted Post-Spike';
    %TitleString = 'B: #14500, Normal';
    
%Determine Factor Deltas to Achieve Goal from Fit

MoveRightRealPoleValue = 0.245790422219787;
MoveLeftPairMagPoleValue = 0.757635779343266;
MoveLeftPairAnglePoleValue = -2.2801275162631;
MoveDelay = 2.24077699928137;
MoveK = 0.547691078567485;

options = optimset('MaxFunEvals',5e3,'MaxIter',5e3,'TolFun',1e-6,'TolX',1e-6);

oldII_0 = 97;
oldVIII_0 = 70;
oldX_0 = 149;

delIIcorr_0 = II_0 - oldII_0;
delVIIIcorr_0 = VIII_0 - oldVIII_0;
delXcorr_0 = X_0 - oldX_0;

[fitdelcorrections,resfitdelcorrectionsnorm] = lsqcurvefit(@fitDelCorrectionsModel,[delIIcorr_0;delVIIIcorr_0;delXcorr_0],[oldII_0 V_0 VII_0 oldVIII_0 IX_0 oldX_0 ATIII_0],[MoveDelay;MoveRightRealPoleValue;MoveLeftPairMagPoleValue;MoveK],zeros(3,1),[],options)

VisualNum
predII_0 = oldII_0 + round(fitdelcorrections(1))
predVIII_0 = oldVIII_0 + round(fitdelcorrections(2))
predX_0 = oldX_0 + round(fitdelcorrections(3))    
    
AbsPercentErrorII_0 = abs(predII_0 - II_0)/II_0 * 100
AbsPercentErrorVIII_0 = abs(predVIII_0 - VIII_0)/VIII_0 * 100
AbsPercentErrorX_0 = abs(predX_0 - X_0)/X_0 * 100



elseif VisualNum == 3 %14501 Pre-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','A18:A137'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','B18:B137')/1000; %microM    
    II_0 = 110;
    V_0 = 64;
    VII_0 = 76;
    VIII_0 = 166;
    IX_0 = 114;
    X_0 = 120;
    ATIII_0 = 83;
    %ColorString1 = 'b';
    %ColorString2 = 'd';
    %ColorString3 = '-';
    %LegendString = '#14501\newlineNormal\newlinePre-Spike';
    LegendString1 = 'Measured Pre-Spike';
    LegendString2 = 'Predicted Pre-Spike';
    TitleString = '#14501, Normal';
elseif VisualNum == 4 %14501 Post-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','A18:A137'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','J18:J137')/1000; %microM    
    II_0 = 179;
    V_0 = 64;
    VII_0 = 76;
    VIII_0 = 255;
    IX_0 = 114;
    X_0 = 230;
    ATIII_0 = 83;
    %ColorString1 = 'm';
    %ColorString2 = 'x';
    %ColorString3 = '-';
    %LegendString = '#14501\newlineNormal\newlinePost-Spike';
    LegendString3 = 'Measured Post-Spike';
    LegendString4 = 'Predicted Post-Spike';
    %TitleString = 'D: #14501, Normal';
    
 %Determine Factor Deltas to Achieve Goal from Fit

MoveRightRealPoleValue = 0.146131961842897;
MoveLeftPairMagPoleValue = 0.947806027404008;
MoveLeftPairAnglePoleValue = -2.22926881110953;
MoveDelay = 2.81514260933413;
MoveK = 0.760834018628549;

options = optimset('MaxFunEvals',5e3,'MaxIter',5e3,'TolFun',1e-6,'TolX',1e-6);

oldII_0 = 110;
oldVIII_0 = 166;
oldX_0 = 120;

delIIcorr_0 = II_0 - oldII_0;
delVIIIcorr_0 = VIII_0 - oldVIII_0;
delXcorr_0 = X_0 - oldX_0;

[fitdelcorrections,resfitdelcorrectionsnorm] = lsqcurvefit(@fitDelCorrectionsModel,[delIIcorr_0;delVIIIcorr_0;delXcorr_0],[oldII_0 V_0 VII_0 oldVIII_0 IX_0 oldX_0 ATIII_0],[MoveDelay;MoveRightRealPoleValue;MoveLeftPairMagPoleValue;MoveK],zeros(3,1),[],options)

VisualNum
predII_0 = oldII_0 + round(fitdelcorrections(1))
predVIII_0 = oldVIII_0 + round(fitdelcorrections(2))
predX_0 = oldX_0 + round(fitdelcorrections(3))    
    
AbsPercentErrorII_0 = abs(predII_0 - II_0)/II_0 * 100
AbsPercentErrorVIII_0 = abs(predVIII_0 - VIII_0)/VIII_0 * 100
AbsPercentErrorX_0 = abs(predX_0 - X_0)/X_0 * 100   


elseif VisualNum == 5 %2895 Pre-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','AK2:AK121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','AR2:AR121')/1000; %microM    
    II_0 = 77;
    V_0 = 38;
    VII_0 = 120;
    VIII_0 = 97;
    IX_0 = 80;
    X_0 = 74;
    ATIII_0 = 93;
    %ColorString1 = 'm';
    %ColorString2 = 'x';
    %ColorString3 = '-';
    %LegendString = '#2895\newlineISS = 10';
    %LegendStringNew = '#2895, 5-15';
    LegendString1 = 'Measured Pre-Spike';
    LegendString2 = 'Predicted Pre-Spike';
    TitleString = '#2895, ISS = 10';

elseif VisualNum == 6 %2895 Post-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','A18:A137'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','D18:D137')/1000; %microM  
    II_0 = 146;
    V_0 = 38;
    VII_0 = 120;
    VIII_0 = 291;
    IX_0 = 80;
    X_0 = 165;
    ATIII_0 = 93;
    %ColorString1 = [1 0.5 0];
    %ColorString2 = 'o';
    %ColorString3 = '-';
    %LegendString = '#2895\newlineISS = 10\newlinePost-Spike';
    LegendString3 = 'Measured Post-Spike';
    LegendString4 = 'Predicted Post-Spike';
    %TitleString = 'E: #2895, ISS = 10';
    
 %Determine Factor Deltas to Achieve Goal from Fit

MoveRightRealPoleValue = 0.235966489565216;
MoveLeftPairMagPoleValue = 1.24520157392337;
MoveLeftPairAnglePoleValue = -2.31870641428793;
MoveDelay = 2.08581352283497;
MoveK = 0.576861267834177;

options = optimset('MaxFunEvals',5e3,'MaxIter',5e3,'TolFun',1e-6,'TolX',1e-6);

oldII_0 = 77;
oldVIII_0 = 97;
oldX_0 = 74;

delIIcorr_0 = II_0 - oldII_0;
delVIIIcorr_0 = VIII_0 - oldVIII_0;
delXcorr_0 = X_0 - oldX_0;

[fitdelcorrections,resfitdelcorrectionsnorm] = lsqcurvefit(@fitDelCorrectionsModel,[delIIcorr_0;delVIIIcorr_0;delXcorr_0],[oldII_0 V_0 VII_0 oldVIII_0 IX_0 oldX_0 ATIII_0],[MoveDelay;MoveRightRealPoleValue;MoveLeftPairMagPoleValue;MoveK],zeros(3,1),[],options)

VisualNum
predII_0 = oldII_0 + round(fitdelcorrections(1))
predVIII_0 = oldVIII_0 + round(fitdelcorrections(2))
predX_0 = oldX_0 + round(fitdelcorrections(3))    
    
AbsPercentErrorII_0 = abs(predII_0 - II_0)/II_0 * 100
AbsPercentErrorVIII_0 = abs(predVIII_0 - VIII_0)/VIII_0 * 100
AbsPercentErrorX_0 = abs(predX_0 - X_0)/X_0 * 100   


elseif VisualNum == 7 %2771 Pre-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','N2:N121'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','R2:R121')/1000; %microM    
    II_0 = 86;
    V_0 = 52;
    VII_0 = 135;
    VIII_0 = 88;
    IX_0 = 61;
    X_0 = 85;
    ATIII_0 = 97;
    %ColorString1 = 'c';
    %ColorString2 = '*';
    %ColorString3 = '-';
    %LegendString = '#2771\newlineTBI';
    %LegendStringNew = '#2771, TBI';
    LegendString1 = 'Measured Pre-Spike';
    LegendString2 = 'Predicted Pre-Spike';
    TitleString = '#2771, ISS = 30, TBI';
    
elseif VisualNum == 8 %2771 Post-Spike
    Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','A18:A137'); %min
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','F18:F137')/1000; %microM  
    II_0 = 103;
    V_0 = 52;
    VII_0 = 135;
    VIII_0 = 307;
    IX_0 = 61;
    X_0 = 87;
    ATIII_0 = 97;
    %ColorString1 = 'c';
    %ColorString2 = '*';
    %ColorString3 = '-';
    %LegendString = '#2771\newlineTBI\newlinePost-Spike';
    LegendString3 = 'Measured Post-Spike';
    LegendString4 = 'Predicted Post-Spike';
    %TitleString = 'F: #2771, TBI';
    
 %Determine Factor Deltas to Achieve Goal from Fit

MoveRightRealPoleValue = 0.214465468051363;
MoveLeftPairMagPoleValue = 0.805023142586227;
MoveLeftPairAnglePoleValue = -2.26755232051333;
MoveDelay = 2.22018720507193;
MoveK = 0.545195075474225;

options = optimset('MaxFunEvals',5e3,'MaxIter',5e3,'TolFun',1e-6,'TolX',1e-6);

oldII_0 = 86;
oldVIII_0 = 88;
oldX_0 = 85;

delIIcorr_0 = II_0 - oldII_0;
delVIIIcorr_0 = VIII_0 - oldVIII_0;
delXcorr_0 = X_0 - oldX_0;

[fitdelcorrections,resfitdelcorrectionsnorm] = lsqcurvefit(@fitDelCorrectionsModel,[delIIcorr_0;delVIIIcorr_0;delXcorr_0],[oldII_0 V_0 VII_0 oldVIII_0 IX_0 oldX_0 ATIII_0],[MoveDelay;MoveRightRealPoleValue;MoveLeftPairMagPoleValue;MoveK],zeros(3,1),[],options)

VisualNum
predII_0 = oldII_0 + round(fitdelcorrections(1))
predVIII_0 = oldVIII_0 + round(fitdelcorrections(2))
predX_0 = oldX_0 + round(fitdelcorrections(3))    
    
AbsPercentErrorII_0 = abs(predII_0 - II_0)/II_0 * 100
AbsPercentErrorVIII_0 = abs(predVIII_0 - VIII_0)/VIII_0 * 100
AbsPercentErrorX_0 = abs(predX_0 - X_0)/X_0 * 100


    
end


s = tf('s');

%determine estimated CAT
    
Kpredict = -3.726657338358752e-04*ATIII_0 - 1.061876341163392e-03*V_0 + 0.0038739537*II_0 + 4.668543644101519e-02;    

%rightrealpolepredict = 1.464358064964255e-04*VII_0 + 1.882345949984154e-03*ATIII_0 + 0.0002706628*X_0 + 0.0002468253*VIII_0 - 0.0013723897*II_0 + 1.480117692280488e-01;
rightrealpolepredict = -1.987587485978715e-04*V_0 + 1.385914324921744e-04*VII_0 + 2.071935991073470e-03*ATIII_0 + 0.0002706628*X_0 + 0.0002468253*VIII_0 - 0.0013723897*II_0 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

%leftpairmagpolepredict = 1.492872113008525e-03*VII_0 + 0.0018702987*X_0 + 0.0018263832*VIII_0 - 0.0043593893*II_0 + 8.223302745491907e-01;
leftpairmagpolepredict = -2.538758094605242e-03*V_0 + 1.550401894224618e-03*VII_0 + 0.0018702987*X_0 + 0.0018263832*VIII_0 - 0.0043593893*II_0 + 9.406358444664269e-01;

%kdpredict = 1.222090629892936e-02*IX_0 - 0.0033648432*X_0 - 0.0115383188*II_0 + 2.507103197800389e+00;
kdpredict = -4.562037133152064e-03*V_0 + 1.354060297626436e-02*IX_0 - 0.0033648432*X_0 - 0.0115383188*II_0 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);
Y = 5*impulse(PredictedSystem,T);


if VisualNum == 1
    
    subplot(2,2,1)

    %plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'Color',ColorString1,'LineStyle',ColorString2,'LineWidth',6,'MarkerSize',12);
    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'k-','LineWidth',6,'MarkerSize',12);
    hold on
    %i(VisualNum) = plot(T,Y,'Color',ColorString1,'LineStyle',ColorString3,'LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'r-.','LineWidth',6,'MarkerSize',12);

elseif VisualNum == 2

    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'g--','LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'b-','LineWidth',6,'MarkerSize',12);
   
    grid on
    box on

    xlabel('Time [min]')
    ylabel('IIa [\muM]')
    %legend([i(1) i(2) i(3) i(4) i(5) i(6)], {'#Normal1, Pre-Spike','#Normal1, Post-Spike','Normal2, Pre-Spike','Normal2, Post-Spike','#2895, Post-Spike','#2771, Post-Spike'})
    legend([i1(VisualNum-1) i2(VisualNum-1) i1(VisualNum) i2(VisualNum)],{LegendString1,LegendString2,LegendString3,LegendString4})
    axis([0 30 -0.05 0.525]);
    title(TitleString)

    figureHandle = gcf;
    %# make all text in the figure to size 30 and bold
    set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
    set(gca,'FontSize',27)

elseif VisualNum == 3
    
    subplot(2,2,2)

    %plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'Color',ColorString1,'LineStyle',ColorString2,'LineWidth',6,'MarkerSize',12);
    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'k-','LineWidth',6,'MarkerSize',12);
    hold on
    %i(VisualNum) = plot(T,Y,'Color',ColorString1,'LineStyle',ColorString3,'LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'r-.','LineWidth',6,'MarkerSize',12);

elseif VisualNum == 4

    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'g--','LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'b-','LineWidth',6,'MarkerSize',12);
   
    grid on
    box on

    xlabel('Time [min]')
    ylabel('IIa [\muM]')
    %legend([i(1) i(2) i(3) i(4) i(5) i(6)], {'#Normal1, Pre-Spike','#Normal1, Post-Spike','Normal2, Pre-Spike','Normal2, Post-Spike','#2895, Post-Spike','#2771, Post-Spike'})
    legend([i1(VisualNum-1) i2(VisualNum-1) i1(VisualNum) i2(VisualNum)],{LegendString1,LegendString2,LegendString3,LegendString4})
    axis([0 30 -0.05 0.525]);
    title(TitleString)

    figureHandle = gcf;
    %# make all text in the figure to size 30 and bold
    set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
    set(gca,'FontSize',27)

elseif VisualNum == 5
    
    subplot(2,2,3)

    %plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'Color',ColorString1,'LineStyle',ColorString2,'LineWidth',6,'MarkerSize',12);
    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'k-','LineWidth',6,'MarkerSize',12);
    hold on
    %i(VisualNum) = plot(T,Y,'Color',ColorString1,'LineStyle',ColorString3,'LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'r-.','LineWidth',6,'MarkerSize',12);

elseif VisualNum == 6

    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'g--','LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'b-','LineWidth',6,'MarkerSize',12);
   
    grid on
    box on

    xlabel('Time [min]')
    ylabel('IIa [\muM]')
    %legend([i(1) i(2) i(3) i(4) i(5) i(6)], {'#Normal1, Pre-Spike','#Normal1, Post-Spike','Normal2, Pre-Spike','Normal2, Post-Spike','#2895, Post-Spike','#2771, Post-Spike'})
    legend([i1(VisualNum-1) i2(VisualNum-1) i1(VisualNum) i2(VisualNum)],{LegendString1,LegendString2,LegendString3,LegendString4})
    axis([0 30 -0.05 0.525]);
    title(TitleString)

    figureHandle = gcf;
    %# make all text in the figure to size 30 and bold
    set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
    set(gca,'FontSize',27)

elseif VisualNum == 7
    
    subplot(2,2,4)

    %plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'Color',ColorString1,'LineStyle',ColorString2,'LineWidth',6,'MarkerSize',12);
    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'k-','LineWidth',6,'MarkerSize',12);
    hold on
    %i(VisualNum) = plot(T,Y,'Color',ColorString1,'LineStyle',ColorString3,'LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'r-.','LineWidth',6,'MarkerSize',12);

elseif VisualNum == 8

    i1(VisualNum) = plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,'g--','LineWidth',6,'MarkerSize',12);
    i2(VisualNum) = plot(T,Y,'b-','LineWidth',6,'MarkerSize',12);
   
    grid on
    box on

    xlabel('Time [min]')
    ylabel('IIa [\muM]')
    %legend([i(1) i(2) i(3) i(4) i(5) i(6)], {'#Normal1, Pre-Spike','#Normal1, Post-Spike','Normal2, Pre-Spike','Normal2, Post-Spike','#2895, Post-Spike','#2771, Post-Spike'})
    legend([i1(VisualNum-1) i2(VisualNum-1) i1(VisualNum) i2(VisualNum)],{LegendString1,LegendString2,LegendString3,LegendString4})
    axis([0 30 -0.05 0.525]);
    title(TitleString)

    figureHandle = gcf;
    %# make all text in the figure to size 30 and bold
    set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
    set(gca,'FontSize',27)
    
end    

end



return


function output = fitDelCorrectionsModel(x,xdata)


delIIcorr = x(1);
delVIIIcorr = x(2);
delXcorr = x(3);


II_0 = xdata(1);
V_0 = xdata(2);
VII_0 = xdata(3);
VIII_0 = xdata(4);
IX_0 = xdata(5);
X_0 = xdata(6);
ATIII_0 = xdata(7);

II = II_0 + delIIcorr;
V = V_0;
VII = VII_0;
VIII = VIII_0 + delVIIIcorr;
IX = IX_0;
X = X_0 + delXcorr;
ATIII = ATIII_0;

kd = -4.562037133152064e-03*V + 1.354060297626436e-02*IX - 0.0033648432*X - 0.0115383188*II + 2.588242055716696e+00;   

rightrealpole = -1.987587485978715e-04*V + 1.385914324921744e-04*VII + 2.071935991073470e-03*ATIII + 0.0002706628*X + 0.0002468253*VIII - 0.0013723897*II + 1.422904983400402e-01;    

leftpairmagpole = -2.538758094605242e-03*V + 1.550401894224618e-03*VII + 0.0018702987*X + 0.0018263832*VIII - 0.0043593893*II + 9.406358444664269e-01;

K = -3.726657338358752e-04*ATIII - 1.061876341163392e-03*V + 0.0038739537*II + 4.668543644101519e-02;    

output = [kd;rightrealpole;leftpairmagpole;K];

return
