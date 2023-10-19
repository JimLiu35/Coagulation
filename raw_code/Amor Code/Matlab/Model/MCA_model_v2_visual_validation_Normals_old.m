
function MCA_model_v2_visual_validation_Normals_old

clear all
close all
clc

format long e

%%

VisualNum = 17; % 1--20

%%
MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','A2:M21');

Normalnum = MCADataValues(:,1);
k0 = MCADataValues(:,2);
k1 = MCADataValues(:,3);
k2 = MCADataValues(:,4);
kn = MCADataValues(:,5)/100; %factor of a 100 to correct for SDO model
kd = MCADataValues(:,6);

II_0 = MCADataValues(:,7);
V_0 = MCADataValues(:,8);
VII_0 = MCADataValues(:,9);
VIII_0 = MCADataValues(:,10);
IX_0 = MCADataValues(:,11);
X_0 = MCADataValues(:,12);
ATIII_0 = MCADataValues(:,13);

s = tf('s');

fitrightrealpolefactors = [-2.242881399985681e-01;8.606993511794947e-04;-1.550519474967871e-03;9.915671555574823e-04];
rightrealpolepredict = fitrightrealpolefactors(4)*II_0 + fitrightrealpolefactors(3)*ATIII_0 + fitrightrealpolefactors(2)*V_0 + fitrightrealpolefactors(1);

avg_leftpairanglepolevalue = -2.488325421384519e+00;

fitleftpairmagpolefactors = [1.218497388549337e+00;-7.374403310198563e-03;-5.222827889515003e-04;-1.044334717419804e-02;8.361271283499394e-03;4.945514851568356e-03];
leftpairmagpolepredict = fitleftpairmagpolefactors(6)*VIII_0 + fitleftpairmagpolefactors(5)*X_0 + fitleftpairmagpolefactors(4)*II_0 + fitleftpairmagpolefactors(3)*V_0 + fitleftpairmagpolefactors(2)*ATIII_0 + fitleftpairmagpolefactors(1);

sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpolepredict);
k1predict = leftpairmagpolepredict.^2 + 2*sigma.*abs(rightrealpolepredict);
k0predict = abs(rightrealpolepredict).*leftpairmagpolepredict.^2;

fitkdfactors = [5.216353723577423e-01;5.603399546169485e-02;-6.824667486273150e-02;1.656135702710415e-02;9.050824105675592e-03];
kdpredict = fitkdfactors(5)*VII_0 + fitkdfactors(4)*IX_0 + fitkdfactors(3)*X_0 + fitkdfactors(2)*II_0 + fitkdfactors(1);

fitknfactors = 2.344423274091946e+01;
knpredict = fitknfactors*k0predict;
knpredict = knpredict/100; %correction for SDO imperfect impulse

%%

%manual index calculations based on data structure

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


%%

figure(1)
clf

plot(Tcheck,MeasuredThrombin,'k-')
hold on
grid on

FittedSystem = kn(VisualNum)/(s^3 + k2(VisualNum)*s^2 + k1(VisualNum)*s + k0(VisualNum)) * exp(-kd(VisualNum)*s);
T = linspace(0,45,451);
FittedThrombin = 5*impulse(FittedSystem,T);

plot(T,FittedThrombin,'b-')

PredictedSystem = knpredict(VisualNum)/(s^3 + k2predict(VisualNum)*s^2 + k1predict(VisualNum)*s + k0predict(VisualNum)) * exp(-kdpredict(VisualNum)*s);
PredictedThrombin = 5*impulse(PredictedSystem,T);

plot(T,PredictedThrombin,'r-')

xlabel('Time [min]')
ylabel('Thrombin [\muM]')

legend('Thrombogram','SDO Fit','Prediction')

return