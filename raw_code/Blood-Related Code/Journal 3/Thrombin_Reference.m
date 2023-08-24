%% Reference Signal 1st submission

%Sin
T_fin=120;
Ts=0.5;
time_thromb=[0:Ts:T_fin]';
ref_thromb=2e-7+0.5e-7*(sin(0.17*time_thromb));
% ref_thromb=ref_thromb*1e3;

%Constant 
ref_thromb_1=2e-7*((tanh(0.1*time_thromb)).^2);

%% Reference Signal 2nd submission

%Sin
T_fin=60;
Ts=1/3;
time_thromb=[0:Ts:T_fin]';
ref_thromb=2e-7+0.5e-7*(sin(0.17*time_thromb));
% ref_thromb=ref_thromb*1e3;

%Constant 
ref_thromb_1=1.25e-7*((tanh(0.1*time_thromb)).^2);