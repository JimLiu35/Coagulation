function MCA_model_v2_visual_curve_selection

clear all
close all
clc

format long e

%Goal State

MoveRightRealPoleValue = 0.23;
MoveLeftPairMagPoleValue = 0.95;
MoveLeftPairAnglePoleValue = -2.369195447548727e+00;
MoveDelay = 1.65;
MoveK = 0.43;


%% plot the Normal

VisualNum = 1; %14488

CurveIndex = 1

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','B2:M21');

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

figure(1)
subplot(1,2,1)

plot(Tcheck,MeasuredThrombin,'rs','LineWidth',6,'MarkerSize',6)
hold on;
grid on;



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

h(CurveIndex) = plot(T,Y,'r-.','LineWidth',6,'MarkerSize',12);



%% 
%Determine Factor Deltas to Achieve Goal

options = optimset('MaxFunEvals',5e3,'MaxIter',5e3,'TolFun',1e-6,'TolX',1e-6);

delIIcorr_0 = 0;
delVIIIcorr_0 = 0;
delXcorr_0 = 0;

[fitdelcorrections,resfitdelcorrectionsnorm] = lsqcurvefit(@fitDelCorrectionsModel,[delIIcorr_0;delVIIIcorr_0;delXcorr_0],[II_0 V_0 VII_0 VIII_0 IX_0 X_0 ATIII_0],[MoveDelay;MoveRightRealPoleValue;MoveLeftPairMagPoleValue;MoveK],zeros(3,1),[],options)

II_0 = II_0 + round(fitdelcorrections(1))
VIII_0 = VIII_0 + round(fitdelcorrections(2))
X_0 = X_0 + round(fitdelcorrections(3))

subplot(1,2,2)

%determine new estimated CAT
    
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

j(CurveIndex) = plot(T,Y,'r-','LineWidth',6,'MarkerSize',12);
hold on;
grid on;


%% plot the Trauma

VisualNumIndices = [2;19;31;39;24;6;9;13;16;15];
ColorIndex = 0;
plotmkcolors = {'g' 'b' 'm'}; % fourth color is orange
plotmkstyles = {'--' '-' ':'};

for i = [4,8,10]
    
VisualNum = VisualNumIndices(i);
ColorIndex = ColorIndex+1;
CurveIndex = CurveIndex + 1

%%
MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','B2:M41');


II_0 = MCADataValues(VisualNum,6);
V_0 = MCADataValues(VisualNum,7);
VII_0 = MCADataValues(VisualNum,8);
VIII_0 = MCADataValues(VisualNum,9);
IX_0 = MCADataValues(VisualNum,10);
X_0 = MCADataValues(VisualNum,11);
ATIII_0 = MCADataValues(VisualNum,12);

s = tf('s');


if VisualNum < 12
    TcheckColIndex = 1;
    CATColIndex = TcheckColIndex + VisualNum;
elseif VisualNum < 33
    TcheckColIndex = 14;
    CATColIndex = VisualNum - 11 + TcheckColIndex;
else
    TcheckColIndex = 37;
    CATColIndex = VisualNum - 32 + TcheckColIndex;
end


%obtain data

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:AS121');

MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
Tcheck = MCADataValues(:,TcheckColIndex);  %min

subplot(1,2,1)

if ColorIndex < 4
    plot(Tcheck,MeasuredThrombin,[char(plotmkcolors(ColorIndex)),'s'],'LineWidth',6,'MarkerSize',6)
else
    plot(Tcheck,MeasuredThrombin,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',6,'Marker','s')
end

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

if ColorIndex < 4
    h(CurveIndex) = plot(T,Y,[char(plotmkcolors(ColorIndex)),char(plotmkstyles(ColorIndex))],'LineWidth',6,'MarkerSize',6);
else
    h(CurveIndex) = plot(T,Y,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',6,'LineStyle','-.');
end


%% 
%Determine Factor Deltas to Achieve Goal

options = optimset('MaxFunEvals',5e3,'MaxIter',5e3,'TolFun',1e-6,'TolX',1e-6);

delIIcorr_0 = 0;
delVIIIcorr_0 = 0;
delXcorr_0 = 0;

[fitdelcorrections,resfitdelcorrectionsnorm] = lsqcurvefit(@fitDelCorrectionsModel,[delIIcorr_0;delVIIIcorr_0;delXcorr_0],[II_0 V_0 VII_0 VIII_0 IX_0 X_0 ATIII_0],[MoveDelay;MoveRightRealPoleValue;MoveLeftPairMagPoleValue;MoveK],zeros(3,1),[],options)

II_0 = II_0 + round(fitdelcorrections(1))
VIII_0 = VIII_0 + round(fitdelcorrections(2))
X_0 = X_0 + round(fitdelcorrections(3))

subplot(1,2,2)

%determine new estimated CAT
    
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

if ColorIndex < 4
    j(CurveIndex) = plot(T,Y,[char(plotmkcolors(ColorIndex)),char(plotmkstyles(ColorIndex))],'LineWidth',6,'MarkerSize',6);
else
    j(CurveIndex) = plot(T,Y,'Color',[1 0.5 0],'LineWidth',6,'MarkerSize',6,'LineStyle','-.');
end

end

subplot(1,2,1)
axis([0 25 -0.05 0.4]);
box on

%Move Curve

% MoveRightRealPoleValue = 0.25;
% MoveLeftPairMagPoleValue = 1.25;
% MoveLeftPairAnglePoleValue = -2.369195447548727e+00;
% MoveDelay = 1.4;
% MoveK = 0.44;

MoveSigma = MoveLeftPairMagPoleValue*cos(pi+MoveLeftPairAnglePoleValue);
Movek2 = 2*MoveSigma+MoveRightRealPoleValue;
Movek1 = MoveLeftPairMagPoleValue^2 + 2*MoveSigma*MoveRightRealPoleValue;
Movek0 = MoveRightRealPoleValue*MoveLeftPairMagPoleValue^2;

Movekn = MoveK*Movek0;

MoveSystem = Movekn/(s^3 + Movek2*s^2 + Movek1*s + Movek0) * exp(-MoveDelay*s);
MoveT = linspace(0,45,451);
MoveY = 5*impulse(MoveSystem,MoveT);

CurveIndex = CurveIndex + 1;
h(CurveIndex) = plot(MoveT,MoveY,'k-','LineWidth',6,'MarkerSize',12);


xlabel('Time [min]')
ylabel('IIa [\muM]')
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

legend([h(1) h(2) h(3) h(4) h(5)], {'#14488, Normal','#2895, ISS 5-15','#2743, ISS > 25','#2771, TBI','Goal'})


subplot(1,2,2)
axis([0 25 -0.05 0.4]);
box on


j(CurveIndex) = plot(MoveT,MoveY,'k-','LineWidth',6,'MarkerSize',12);

xlabel('Time [min]')
ylabel('IIa [\muM]')
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

legend([j(1) j(2) j(3) j(4) j(5)], {'Post #14488, Normal','Post #2895, ISS 5-15','Post #2743, ISS > 25','Post #2771, TBI', 'Goal'})


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
