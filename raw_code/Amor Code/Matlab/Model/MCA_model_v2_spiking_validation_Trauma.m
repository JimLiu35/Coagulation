function MCA_model_v2_spiking_validation_Trauma

clear all
close all
clc




Tcheck = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','A18:A137'); %min

figure(1)
clf

for VisualNum = 1:4
    
if VisualNum == 1 %14488
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','C18:C137')/1000; %microM 
    II_0 = 196;
    V_0 = 46;
    VII_0 = 76;
    VIII_0 = 160;
    IX_0 = 99;
    X_0 = 300;
    ATIII_0 = 72;
    ColorString1 = 'rs';
    ColorString2 = 'r-';
elseif VisualNum == 2 %2895
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','D18:D137')/1000; %microM  
    II_0 = 146;
    V_0 = 38;
    VII_0 = 120;
    VIII_0 = 291;
    IX_0 = 80;
    X_0 = 165;
    ATIII_0 = 93;
    ColorString1 = 'gs';
    ColorString2 = 'g-';    
elseif VisualNum == 3 %2743
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','E18:E137')/1000; %microM  
    II_0 = 146;
    V_0 = 37;
    VII_0 = 374;
    VIII_0 = 426;
    IX_0 = 77;
    X_0 = 87;
    ATIII_0 = 77;
    ColorString1 = 'bs';
    ColorString2 = 'b-';
elseif VisualNum == 4 %2741
    MeasuredThrombin = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Validation_Spiked','CAT_spiked','F18:F137')/1000; %microM  
    II_0 = 103;
    V_0 = 52;
    VII_0 = 135;
    VIII_0 = 307;
    IX_0 = 61;
    X_0 = 87;
    ATIII_0 = 97;
    ColorString1 = 'ms';
    ColorString2 = 'm-';
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





plot(Tcheck(1:length(MeasuredThrombin)),MeasuredThrombin,ColorString1,'LineWidth',6,'MarkerSize',12);
hold on
h(VisualNum) = plot(T,Y,ColorString2,'LineWidth',6,'MarkerSize',12);

end

grid on
box on

xlabel('Time [min]')
ylabel('IIa [\muM]')
legend([h(1) h(2) h(3) h(4)], {'#14488, Normal','#2895, ISS 5-15','#2743, ISS > 25','#2771, TBI'})

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)

return
