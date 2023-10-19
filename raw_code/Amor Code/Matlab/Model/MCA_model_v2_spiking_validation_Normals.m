function MCA_model_v2_spiking_validation_Normals

clear all
close all
clc

%14501 - determine missing Stago factors to exactly match CAT

global II_14501 VIII_14501 X_14501  %factors we know for sure

II_14501 = 110;
VIII_14501 = 166;
X_14501 = 120;

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-9,'TolX',1e-9);

%guess other factors starting from measurements from another sample in same lot

V_14501_0 = 64;
VII_14501_0 = 76;
IX_14501_0 = 114;
ATIII_14501_0 = 83;

fitProtein0 = [V_14501_0; VII_14501_0; IX_14501_0; ATIII_14501_0];

Time_14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','A18:A137');
CAT_14501 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','B18:B137')/1000;

[fitProteinfactors,resfitProteinnorm] = lsqcurvefit(@fitProteinModel_14501,fitProtein0,Time_14501,CAT_14501,[],[],options)


V_14501 = 64;%round(fitProteinfactors(1));
VII_14501 = 76;%round(fitProteinfactors(2));
IX_14501 = 114;%round(fitProteinfactors(3));
ATIII_14501 = 83;%round(fitProteinfactors(4));

s = tf('s');

%% check if the CAT matches

figure
clf
plot(Time_14501,CAT_14501)
hold on
grid on

Kpredict = -3.726657338358752e-04*ATIII_14501 - 1.061876341163392e-03*V_14501 + 0.0038739537*II_14501 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14501 + 1.385914324921744e-04*VII_14501 + 2.071935991073470e-03*ATIII_14501 + 0.0002706628*X_14501 + 0.0002468253*VIII_14501 - 0.0013723897*II_14501 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14501 + 1.550401894224618e-03*VII_14501 + 0.0018702987*X_14501 + 0.0018263832*VIII_14501 - 0.0043593893*II_14501 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14501 + 1.354060297626436e-02*IX_14501 - 0.0033648432*X_14501 - 0.0115383188*II_14501 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14501 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14501,T);

plot(T,Y,'r-')


%% 14501 LLL

figure
clf

Time_14501_LLL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','A18:A137');
CAT_14501_LLL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','J18:J137')/1000;

plot(Time_14501_LLL,CAT_14501_LLL)
hold on
grid on

%update the spiked values for the LLL case
II_14501 = 179;
VIII_14501 = 255;
X_14501 = 230;

Kpredict = -3.726657338358752e-04*ATIII_14501 - 1.061876341163392e-03*V_14501 + 0.0038739537*II_14501 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14501 + 1.385914324921744e-04*VII_14501 + 2.071935991073470e-03*ATIII_14501 + 0.0002706628*X_14501 + 0.0002468253*VIII_14501 - 0.0013723897*II_14501 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14501 + 1.550401894224618e-03*VII_14501 + 0.0018702987*X_14501 + 0.0018263832*VIII_14501 - 0.0043593893*II_14501 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14501 + 1.354060297626436e-02*IX_14501 - 0.0033648432*X_14501 - 0.0115383188*II_14501 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14501 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14501,T);

plot(T,Y,'r-')

%% 14501 LLH

figure
clf

Time_14501_LLH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','A18:A65');
CAT_14501_LLH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','I18:I65')/1000;

plot(Time_14501_LLH,CAT_14501_LLH)
hold on
grid on

%update the spiked values for the LLH case
II_14501 = 184;
VIII_14501 = 270;
X_14501 = 271;

Kpredict = -3.726657338358752e-04*ATIII_14501 - 1.061876341163392e-03*V_14501 + 0.0038739537*II_14501 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14501 + 1.385914324921744e-04*VII_14501 + 2.071935991073470e-03*ATIII_14501 + 0.0002706628*X_14501 + 0.0002468253*VIII_14501 - 0.0013723897*II_14501 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14501 + 1.550401894224618e-03*VII_14501 + 0.0018702987*X_14501 + 0.0018263832*VIII_14501 - 0.0043593893*II_14501 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14501 + 1.354060297626436e-02*IX_14501 - 0.0033648432*X_14501 - 0.0115383188*II_14501 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14501 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14501,T);

plot(T,Y,'r-')


%% 14501 LHL

figure
clf

Time_14501_LHL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','A18:A54');
CAT_14501_LHL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','H18:H54')/1000;

plot(Time_14501_LHL,CAT_14501_LHL)
hold on
grid on

%update the spiked values for the LHL case
II_14501 = 175;
VIII_14501 = 520;
X_14501 = 215;

Kpredict = -3.726657338358752e-04*ATIII_14501 - 1.061876341163392e-03*V_14501 + 0.0038739537*II_14501 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14501 + 1.385914324921744e-04*VII_14501 + 2.071935991073470e-03*ATIII_14501 + 0.0002706628*X_14501 + 0.0002468253*VIII_14501 - 0.0013723897*II_14501 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14501 + 1.550401894224618e-03*VII_14501 + 0.0018702987*X_14501 + 0.0018263832*VIII_14501 - 0.0043593893*II_14501 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14501 + 1.354060297626436e-02*IX_14501 - 0.0033648432*X_14501 - 0.0115383188*II_14501 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14501 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14501,T);

plot(T,Y,'r-')

%% 14501 LHH

figure
clf

Time_14501_LHH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','A18:A51');
CAT_14501_LHH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-23-14','Cohen_lab_10-23-14','G18:G51')/1000;

plot(Time_14501_LHH,CAT_14501_LHH)
hold on
grid on

%update the spiked values for the LHH case
II_14501 = 201;
VIII_14501 = 560;
X_14501 = 271;

Kpredict = -3.726657338358752e-04*ATIII_14501 - 1.061876341163392e-03*V_14501 + 0.0038739537*II_14501 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14501 + 1.385914324921744e-04*VII_14501 + 2.071935991073470e-03*ATIII_14501 + 0.0002706628*X_14501 + 0.0002468253*VIII_14501 - 0.0013723897*II_14501 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14501 + 1.550401894224618e-03*VII_14501 + 0.0018702987*X_14501 + 0.0018263832*VIII_14501 - 0.0043593893*II_14501 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14501 + 1.354060297626436e-02*IX_14501 - 0.0033648432*X_14501 - 0.0115383188*II_14501 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14501 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14501,T);

plot(T,Y,'r-')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 14500 - determine missing Stago factors to exactly match CAT

global II_14500 VIII_14500 X_14500  %factors we know for sure

II_14500 = 97;
VIII_14500 = 70;
X_14500 = 149;

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-9,'TolX',1e-9);

%guess other factors starting from measurements from another sample in same lot

V_14500_0 = 75;
VII_14500_0 = 96;
IX_14500_0 = 134;
ATIII_14500_0 = 96;

fitProtein0 = [V_14500_0; VII_14500_0; IX_14500_0; ATIII_14500_0];

Time_14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','A18:A137');
CAT_14500 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','B18:B137')/1000;

[fitProteinfactors,resfitProteinnorm] = lsqcurvefit(@fitProteinModel_14500,fitProtein0,Time_14500,CAT_14500,[],[],options)


V_14500 = 75;%round(fitProteinfactors(1));
VII_14500 = 96;%round(fitProteinfactors(2));
IX_14500 = 134;%round(fitProteinfactors(3));
ATIII_14500 = 96;%round(fitProteinfactors(4));

s = tf('s');

%% check if the CAT matches

figure
clf
plot(Time_14500,CAT_14500)
hold on
grid on

Kpredict = -3.726657338358752e-04*ATIII_14500 - 1.061876341163392e-03*V_14500 + 0.0038739537*II_14500 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14500 + 1.385914324921744e-04*VII_14500 + 2.071935991073470e-03*ATIII_14500 + 0.0002706628*X_14500 + 0.0002468253*VIII_14500 - 0.0013723897*II_14500 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14501 + 1.550401894224618e-03*VII_14500 + 0.0018702987*X_14500 + 0.0018263832*VIII_14500 - 0.0043593893*II_14500 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14500 + 1.354060297626436e-02*IX_14500 - 0.0033648432*X_14500 - 0.0115383188*II_14500 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14500 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14500,T);

plot(T,Y,'r-')

%% 14500 LLL

figure
clf

Time_14500_LLL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','A18:A137');
CAT_14500_LLL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','G18:G137')/1000;

plot(Time_14500_LLL,CAT_14500_LLL)
hold on
grid on

%update the spiked values for the LLL case
II_14500 = 168;
VIII_14500 = 155;
X_14500 = 230;

Kpredict = -3.726657338358752e-04*ATIII_14500 - 1.061876341163392e-03*V_14500 + 0.0038739537*II_14500 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14500 + 1.385914324921744e-04*VII_14500 + 2.071935991073470e-03*ATIII_14500 + 0.0002706628*X_14500 + 0.0002468253*VIII_14500 - 0.0013723897*II_14500 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14500 + 1.550401894224618e-03*VII_14500 + 0.0018702987*X_14500 + 0.0018263832*VIII_14500 - 0.0043593893*II_14500 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14500 + 1.354060297626436e-02*IX_14500 - 0.0033648432*X_14500 - 0.0115383188*II_14500 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14500 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14500,T);

plot(T,Y,'r-')

%% 14500 LLH

figure
clf

Time_14500_LLH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','A18:A137');
CAT_14500_LLH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','E18:E137')/1000;

plot(Time_14500_LLH,CAT_14500_LLH)
hold on
grid on

%update the spiked values for the LLH case
II_14500 = 175;
VIII_14500 = 149;
X_14500 = 301;

Kpredict = -3.726657338358752e-04*ATIII_14500 - 1.061876341163392e-03*V_14500 + 0.0038739537*II_14500 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14500 + 1.385914324921744e-04*VII_14500 + 2.071935991073470e-03*ATIII_14500 + 0.0002706628*X_14500 + 0.0002468253*VIII_14500 - 0.0013723897*II_14500 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14500 + 1.550401894224618e-03*VII_14500 + 0.0018702987*X_14500 + 0.0018263832*VIII_14500 - 0.0043593893*II_14500 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14500 + 1.354060297626436e-02*IX_14500 - 0.0033648432*X_14500 - 0.0115383188*II_14500 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14500 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14500,T);

plot(T,Y,'r-')

%% 14500 LHL

figure
clf

Time_14500_LHL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','A18:A137');
CAT_14500_LHL = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','D18:D137')/1000;

plot(Time_14500_LHL,CAT_14500_LHL)
hold on
grid on

%update the spiked values for the LLH case
II_14500 = 153;
VIII_14500 = 374;
X_14500 = 232;

Kpredict = -3.726657338358752e-04*ATIII_14500 - 1.061876341163392e-03*V_14500 + 0.0038739537*II_14500 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14500 + 1.385914324921744e-04*VII_14500 + 2.071935991073470e-03*ATIII_14500 + 0.0002706628*X_14500 + 0.0002468253*VIII_14500 - 0.0013723897*II_14500 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14500 + 1.550401894224618e-03*VII_14500 + 0.0018702987*X_14500 + 0.0018263832*VIII_14500 - 0.0043593893*II_14500 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14500 + 1.354060297626436e-02*IX_14500 - 0.0033648432*X_14500 - 0.0115383188*II_14500 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14500 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14500,T);

plot(T,Y,'r-')

%% 14500 LHH

figure
clf

Time_14500_LHH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','A18:A137');
CAT_14500_LHH = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Spiking/Misc_Plasma/Combo/CAT_10-21-14','Cohen_lab_10-21-14','F18:F137')/1000;

plot(Time_14500_LHH,CAT_14500_LHH)
hold on
grid on

%update the spiked values for the LLH case
II_14500 = 171;
VIII_14500 = 382;
X_14500 = 301;

Kpredict = -3.726657338358752e-04*ATIII_14500 - 1.061876341163392e-03*V_14500 + 0.0038739537*II_14500 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14500 + 1.385914324921744e-04*VII_14500 + 2.071935991073470e-03*ATIII_14500 + 0.0002706628*X_14500 + 0.0002468253*VIII_14500 - 0.0013723897*II_14500 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14500 + 1.550401894224618e-03*VII_14500 + 0.0018702987*X_14500 + 0.0018263832*VIII_14500 - 0.0043593893*II_14500 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14500 + 1.354060297626436e-02*IX_14500 - 0.0033648432*X_14500 - 0.0115383188*II_14500 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14500 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14500,T);

plot(T,Y,'r-')

return


function fitProteinEstimate14501 = fitProteinModel_14501(x,xdata)

global II_14501 VIII_14501 X_14501  %factors we know for sure

V_14501 = x(1);
VII_14501 = x(2);
IX_14501 = x(3);
ATIII_14501 = x(4);

T_14501 = xdata;

s = tf('s');

%determine estimated CAT
    
Kpredict = -3.726657338358752e-04*ATIII_14501 - 1.061876341163392e-03*V_14501 + 0.0038739537*II_14501 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14501 + 1.385914324921744e-04*VII_14501 + 2.071935991073470e-03*ATIII_14501 + 0.0002706628*X_14501 + 0.0002468253*VIII_14501 - 0.0013723897*II_14501 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14501 + 1.550401894224618e-03*VII_14501 + 0.0018702987*X_14501 + 0.0018263832*VIII_14501 - 0.0043593893*II_14501 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14501 + 1.354060297626436e-02*IX_14501 - 0.0033648432*X_14501 - 0.0115383188*II_14501 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14501 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14501,T);

fitProteinEstimate14501 = interp1(T,Y,T_14501);

return

function fitProteinEstimate14500 = fitProteinModel_14500(x,xdata)

global II_14500 VIII_14500 X_14500  %factors we know for sure

V_14500 = x(1);
VII_14500 = x(2);
IX_14500 = x(3);
ATIII_14500 = x(4);

T_14500 = xdata;

s = tf('s');

%determine estimated CAT
    
Kpredict = -3.726657338358752e-04*ATIII_14500 - 1.061876341163392e-03*V_14500 + 0.0038739537*II_14500 + 4.668543644101519e-02;    

rightrealpolepredict = -1.987587485978715e-04*V_14500 + 1.385914324921744e-04*VII_14500 + 2.071935991073470e-03*ATIII_14500 + 0.0002706628*X_14500 + 0.0002468253*VIII_14500 - 0.0013723897*II_14500 + 1.422904983400402e-01;    
negrightrealpolepredict = -rightrealpolepredict;

avg_leftpairanglepolevalue = -2.369195447548727e+00;

leftpairmagpolepredict = -2.538758094605242e-03*V_14500 + 1.550401894224618e-03*VII_14500 + 0.0018702987*X_14500 + 0.0018263832*VIII_14500 - 0.0043593893*II_14500 + 9.406358444664269e-01;

kdpredict = -4.562037133152064e-03*V_14500 + 1.354060297626436e-02*IX_14500 - 0.0033648432*X_14500 - 0.0115383188*II_14500 + 2.588242055716696e+00;   

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+rightrealpolepredict;
k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

knpredict = Kpredict*k0predict;

PredictedSystem_14500 = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
T = linspace(0,45,451);

Y = 5*impulse(PredictedSystem_14500,T);

fitProteinEstimate14500 = interp1(T,Y,T_14500);

return