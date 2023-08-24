% non-mechanistic approach for COVID-19 code

function COVID19_NonMech
close all; clear all; clc; 
% clear all; clc; 
format long e 

% Global variables 
global UIL6 TIL6 UTF TTF n 
global Kp_TF_IL6 Kd3_D beta_D
global K1p_D Kd2_D
global K2_D Kd4_D 
global gamma_D Kd1_D
global K_IIa_XaVa Kd_IIa 
global Kd_Va_APC Kd_Va Kp_Va_IIa
global Kp_APC_IIa Kd_APC 
global Kp_PAI1_IL6 Kd_PAI1_APC Kd_PAI1
global Kd_tPA_PAI1 Kd_tPA Kp_tPA 
global Khc_plg_f k2f_f Kmf_f G_plg 
global Khc_pls_f 
global Kia 
global Kcat_Fbn Km_Fbn 
global severity 

% Pick severity and treatment type 
severity = input('Put disease severity: 1 = healthy, 2 = mild, 3 = severe '); % define the condition of the patient 
% addAPC = input('Do you want to add APC? 1 = yes, 0 = no '); 
% if addAPC == 1 % only asks for input type if you are adding APC 
%     typeAPC = input('What APC input do you want? 1 = pulse, 2 = step, 3 = p-ramp, 4 = n-ramp 5 = long pulse ') ;
% end 

% Initial Conditions (nM) 
TF_0   = 0; 
VII_0  = 1e-8 * 1e9; % nM  
Xa_0   = 0; 
IIa_0  = 0; 
Va_0   = 1e-9; 
APC_0  = 0; 
PAI1_0 = 4.0e-10 * 1e9; % nM - Mitrophanov paper 
tPA_0  = 0.07e-3 * 1e3; % nM 
PLG_0  = 2 * 1e-3; % nM 
PLS_0  = 0; 
Fbn_0  = 0; 
D_0    = 0; 

% Parameters 
Kd1_D   = 5.343E-3 * 60; % 1 / min
Kd2_D   = 3.02E-5 * 60;  % 1 / min
Kd3_D   = 8.86E-5 * 60;  % 1 / min
beta_D  = 4894030 * 60 * 1e-9; % 1 / nM min
gamma_D = 1181.5 * 2.5E6 * 60 * 1e-9;  % 1 / nM min
K1p_D   = VII_0 * Kd2_D ; % nM / min

K2_D    = (7578473 / 0.24E8) * 60; % 1 / nM min
Kd4_D   = 5.362E-2 * 60; % 1 / min

Kd_IIa = 0.35; % 1/min 

Kp_TF_IL6 = 0.5; % 1/min ---  GUESS 
K_IIa_XaVa = 2.5 * 1e7 * 1e-9 * 60; % 1/nM min 
Kd_Va_APC = 0.5; % 1/min --- from APC model --- MOD 
Kd_Va = 0.4 ; % 1/min --- from APC model 
Kp_Va_IIa = 2.6; % 1/min --- from APC model 
Kp_APC_IIa = 0.87; % 1/min --- from APC model 
Kd_APC = 0.34; % 1/min --- from APC model 
Kp_PAI1_IL6 = 0.5; % 1/min --- GUESS 
Kd_PAI1_APC = 5.7 * 1E2 * 60 * 1e-9; % 1 / nM min (note: 5.7 +/- 0.5 * 10^2 1/M*s)  
Kd_PAI1 = log(2)/30; % half life of 30 minutes
Kd_tPA_PAI1 = 4.0 * 1e7 * 60 * 1e-9; % 1 / nM min ; % was K58
Kd_tPA = log(2) / 4; % 1/min 
Kp_tPA = Kd_tPA * 0.07e-3 * 1e3 + Kd_tPA_PAI1 * 0.07e-3 * 1e3 * 4.0e-10 * 1e9 ; % nM/min --- based off SS analysis 
Khc_plg_f = log(2) / 2.2 * 24 * 60; % 1/min 
k2f_f = 0.3 * 60; % 1 / min 
Kmf_f = 28 * 1e3; % nM 
G_plg = Khc_plg_f * (2e-6 * 1e9) + (k2f_f * (0.07e-9 * 1e9) * (2e-6 * 1e9))/(Kmf_f + (2e-6 * 1e9));
Khc_pls_f = log(2) / (0.1 / 60); % 1/min 
Kia = 11.14; % 1/min - integrator constant for TF from thrombin to fibrin - we developed  
Kcat_Fbn = 28 ; % 1 / min (note: 28 +/- 2 1/min) 
Km_Fbn = 1.1 * 1e3; % nM  (note: 1.1 +/- 0.6 uM) 

% Initial Coniditons Vector 
states_0 = [TF_0, VII_0, Xa_0, IIa_0, Va_0, APC_0, PAI1_0, tPA_0, PLG_0, PLS_0, Fbn_0, D_0]; 
n = length(states_0); % number of states 

% Time Vector 
time_min = [0:0.1:60]; 

% Solver Settings 
options = odeset('RelTol',1e-9,'AbsTol',1e-9, 'MaxStep',1e-1); % Damon's settings 
%options = odeset('RelTol',5e-14,'AbsTol',1e-14); % my settings 
% options = odeset('RelTol',1e-15,'AbsTol',1e-15); % APC settings 

% Solve System of ODEs 
[tout,yout] = ode15s(@Dynamics, time_min, states_0, options);

% Graph Results 

color1 = 'k'; 
color2 = 'k'; 

figure(1)
subplot(4,4,1)
hold on 
plot(TIL6, UIL6,color1,'Linewidth',4)
grid on 
title('IL6 Input') 
xlabel('Time [min]') 
ylabel('Conc [nM]') 

subplot(4,4,2)
hold on 
plot(TTF, UTF,color1,'Linewidth',4)
grid on 
title('TF Input') 
xlabel('Time [min]') 
ylabel('Conc [nM]') 

subplot(4,4,5)
hold on
plot(tout,yout(:,1),color2,'Linewidth',4);
grid on
title('TF')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,6)
hold on
plot(tout,yout(:,2),color2,'Linewidth',4);
grid on
title('VII')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,7)
hold on
plot(tout,yout(:,3),color2,'Linewidth',4);
grid on
title('Xa')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,8)
hold on
plot(tout,yout(:,4),color2,'Linewidth',4);
grid on
title('IIa')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,9)
hold on
plot(tout,yout(:,5),color2,'Linewidth',4);
grid on
title('Va')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,10)
hold on
plot(tout,yout(:,6),color2,'Linewidth',4);
grid on
title('APC')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,11)
hold on
plot(tout,yout(:,7),color2,'Linewidth',4);
grid on
title('PAI-1')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,12)
hold on
plot(tout,yout(:,8),color2,'Linewidth',4);
grid on
title('tPA')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,13)
hold on
plot(tout,yout(:,9),color2,'Linewidth',4);
grid on
title('PLG')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,14)
hold on
plot(tout,yout(:,10),color2,'Linewidth',4);
grid on
title('PLS')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,15)
hold on
plot(tout,yout(:,11),color2,'Linewidth',4);
grid on
title('Fbn')
xlabel('Time [min]')
ylabel('Conc [nM]')

subplot(4,4,16)
hold on
plot(tout,yout(:,12),color2,'Linewidth',4);
grid on
title('D-Dimer')
xlabel('Time [min]')
ylabel('Conc [nM]')


return 

function dstatedt = Dynamics(t,states)
global n UIL6 TIL6 UTF TTF 
global Kp_TF_IL6 Kd3_D beta_D
global K1p_D Kd2_D
global gamma_D Kd1_D
global K2_D Kd4_D
global Kd_Va_APC Kd_Va Kp_Va_IIa
global Kp_APC_IIa Kd_APC 
global Kp_PAI1_IL6 Kd_PAI1_APC Kd_PAI1
global Kd_tPA_PAI1 Kd_tPA Kp_tPA 
global Khc_plg_f k2f_f Kmf_f G_plg 
global Kia 
global Kcat_Fbn Km_Fbn 

dstatedt = zeros(n,1); 

TF  = states(1); 
VII = states(2); 
Xa  = states(3); 
IIa = states(4); 
Va  = states(5); 
APC = states(6); 
PAI1 = states(7); 
tPA = states(8); 
PLG = states(9); 
PLS = states(10);
Fbn = states(11);
D   = states(12);

% inputs 
uIL6 = getIL6(t); 
% uIL6 = 0; 
uTF = getTF(t); 

UIL6 = [UIL6; uIL6]; % input IL6 to trigger the cascade 
TIL6 = [TIL6; t]; 

UTF = [UTF; uTF]; 
TTF = [TTF; t];

Khc_pls_f = 4.158883083359672e+02; 

d_TF = Kp_TF_IL6 * uIL6 - Kd3_D * TF - beta_D * VII * TF + uTF; % Damon 
d_VII =  K1p_D - Kd2_D * VII - beta_D * VII * TF ; % Damon 
d_Xa  = gamma_D * VII * TF - Kd1_D * Xa ; % Damon 
d_IIa = K2_D * Xa * Va - Kd4_D * IIa; % mod Damon 
d_Va = -Kd_Va_APC * Va * APC - Kd_Va * Va + Kp_Va_IIa * IIa; % mod HM 
d_APC = Kp_APC_IIa * IIa - Kd_APC * APC; 
d_PAI1 = Kp_PAI1_IL6 * uIL6 - Kd_PAI1_APC * PAI1 * APC - Kd_PAI1 * PAI1 - Kd_tPA_PAI1 * tPA * PAI1; 
d_tPA = -Kd_tPA_PAI1 * tPA * PAI1 - Kd_tPA * tPA + Kp_tPA;
d_PLG = -Khc_plg_f * PLG - (k2f_f * tPA * PLG)/(Kmf_f + PLG) + G_plg;
d_PLS = (k2f_f * tPA * PLG)/(Kmf_f + PLG) - Khc_pls_f * PLS;
d_Fbn = (Kia) * IIa - (Kcat_Fbn * PLS * Fbn) / (Km_Fbn + Fbn);  
d_D = (Kcat_Fbn * PLS * Fbn) / (Km_Fbn + Fbn); 

dstatedt = [d_TF; d_VII; d_Xa; d_IIa; d_Va; d_APC; d_PAI1; d_tPA; d_PLG; d_PLS; d_Fbn; d_D];
return 

function IL6output = getIL6(currenttime)
global severity 
% IL6 MW = 21kDa
% IL6 values from:
% https://www.sciencedirect.com/science/article/pii/S0306987720310653,
% converted from pg/mL to mol/L 

if severity == 1
    if currenttime >= 0 
       IL6output = 0;
    else 
       IL6output = 0; 
    end 
    
elseif severity == 2
    if currenttime >= 0   
       IL6output = 3; % 0.286; % 0.286; %nM
    else 
       IL6output = 0; 
    end 

elseif severity == 3
    if currenttime >= 1 && currenttime < 10 % min
       IL6output = 6; % 6.1905; % 4.762; %nM 
    else 
       IL6output = 0; 
    end  
else 
    disp('Not a valid entry')
end 

% IL6output = 0; 

return 

function TFoutput = getTF(currenttime)
%     if currenttime > 0 && currenttime < 1 % Produces impulse input 
%         TFoutput = 5e-3; % nM
%     else 
%         TFoutput = 0; 
%     end
    
    TFoutput = 0; 
return 