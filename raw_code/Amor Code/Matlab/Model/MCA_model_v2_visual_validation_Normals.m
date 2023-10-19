function MCA_model_v2_visual_validation_Normals

clear all
close all
clc

format long e

%%

VisualNum = 14; %1--20...Good: 


%%
MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','B2:M21');

k0 = MCADataValues(VisualNum,1);
k1 = MCADataValues(VisualNum,2);
k2 = MCADataValues(VisualNum,3);
kn = MCADataValues(VisualNum,4);
kd = MCADataValues(VisualNum,5);

II_0 = MCADataValues(VisualNum,6);
V_0 = MCADataValues(VisualNum,7);
VII_0 = MCADataValues(VisualNum,8);
VIII_0 = MCADataValues(VisualNum,9);
IX_0 = MCADataValues(VisualNum,10);
X_0 = MCADataValues(VisualNum,11);
ATIII_0 = MCADataValues(VisualNum,12);

s = tf('s');


if VisualNum < 11
    TcheckColIndex = 1;
    CATColIndex = TcheckColIndex + VisualNum;
elseif VisualNum < 16
    TcheckColIndex = 13;
    CATColIndex = VisualNum - 10 + TcheckColIndex;
else
    TcheckColIndex = 20;
    CATColIndex = VisualNum - 15 + TcheckColIndex;
end


%obtain data

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:Y121');

MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
Tcheck = MCADataValues(:,TcheckColIndex);  %min


figure

%%
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

plot(T,Y,'r-.','LineWidth',6,'MarkerSize',12)
hold on;
grid on;

%%

%From Normals

AverageRightRealPoleValue = 2.318156549837209e-01;
AverageLeftPairMagPoleValue = 5.403446173651191e-01;
AverageLeftPairAnglePoleValue = -2.488325421384519e+00;
AverageDelay = 2.486724446978783e+00;
AverageK = 0.228811665819;

NormalSigma = AverageLeftPairMagPoleValue*cos(pi+AverageLeftPairAnglePoleValue);
Normalk2 = 2*NormalSigma+AverageRightRealPoleValue;
Normalk1 = AverageLeftPairMagPoleValue^2 + 2*NormalSigma*AverageRightRealPoleValue;
Normalk0 = AverageRightRealPoleValue*AverageLeftPairMagPoleValue^2;

Normalkn = AverageK*Normalk0;

NormalSystem = Normalkn/(s^3 + Normalk2*s^2 + Normalk1*s + Normalk0) * exp(-AverageDelay*s);
T = linspace(0,45,451);
NormalY = 5*impulse(NormalSystem,T);

plot(T,NormalY,'g--','LineWidth',6,'MarkerSize',12)

%%

%%

plot(Tcheck,MeasuredThrombin,'k-','LineWidth',6,'MarkerSize',12)


xlabel('Time [min]')
ylabel('IIa [\muM]')
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

legend('Predicted','Reference','Actual')

return