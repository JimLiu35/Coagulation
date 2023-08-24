% Fig 5
% CAT SPIKING validation with new model 
%%
%II2
S14492_Factor=[
77	72	58	96	58	52 96 69
90	68	58	98	59	53 95 69
101	71	55	96	60	52 94 69
115	67	59	96	63	52 96 69 
124	68	64	98	62	52 95 69
];

clc 

%II2 
factor_coeff_All_Train_Spike=[
   -0.0037   -0.0109   -0.0057    0.1448    0.0007
   -0.0037   -0.0158   -0.0087   -0.9933   -0.0088
    0.0018    0.0059    0.0029    0.4860   -0.0005
    0.0013    0.0027    0.0002    0.6271    0.0081
   -0.0051   -0.0139   -0.0065   -1.4046    0.0237
    0.0019    0.0077    0.0040    0.6676    0.0007
    0.0053    0.0098    0.0124    0.9899    0.0053
   -0.0001   -0.0007   -0.0001   -0.2844   -0.0078];

 
 %II  
const_All_Train_Spike =[0.2205    1.7968    1.7435   -1.1306    0.6708];

T_Spike=linspace(0,30,301);
figure(1)
clf
for i=1:5
    Trau_1_coeff=S14492_Factor(i,:)*factor_coeff_All_Train_Spike+const_All_Train_Spike;
    sys_est_spike=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
    Y_est_spike= 0.001*impulse(sys_est_spike,T_Spike);
    figure(1)
    subplot(2,4,2)
% figure(1)
% subplot(2,2,2)
    hold on 
    plot(T_Spike,Y_est_spike,'LineWidth',5)
    grid on 
    ylim([-.05 .2])
end
ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% ax.FontWeight = 'bold'; 
xlabel('Time [min]')
ylabel('Thrombin [nM]')
box on
legend('II=77','II=90','II=101','II=115','II=124')
% title('b')
title('Factor II: Prediction')
%%
%VIII 
S14492_Factor=[
71	72	54	57	57	90  88 69
63	74	55	92	59	111 90 69
62	76	58	86	61	168 98 69
76	75	55	98	59	203 90 69 
67	75	53	106	58	330 89 69
65	69	60	102	61	390 89 69
65	65	59	107	57	506 90 69
];

%VIII
factor_coeff_All_Train_Spike=[
   -0.0037   -0.0109   -0.0057    0.1448    0.0007
   -0.0037   -0.0158   -0.0087   -0.9933   -0.0088
    0.0018    0.0059    0.0029    0.4860   -0.0005
    0.0013    0.0027    0.0002    0.6271    0.0081
   -0.0051   -0.0139   -0.0065   -1.4046    0.0237
    0.0019    0.0077    0.0040    0.6676    0.0007
    0.0053    0.0098    0.0064    0.9899    0.0053
   -0.0001   -0.0007   -0.0001   -0.2844   -0.0078];
  

const_All_Train_Spike =[0.2205    1.7968    1.7435   -1.1306    0.6708];

T_Spike=linspace(0,30,301);

for i=1:7
    Trau_1_coeff=S14492_Factor(i,:)*factor_coeff_All_Train_Spike+const_All_Train_Spike; 
    sys_est_spike=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
    Y_est_spike= 0.002*impulse(sys_est_spike,T_Spike);
    figure(1)
    subplot(2,4,4)
% figure(1)
% subplot(2,2,4)
hold on 
    plot(T_Spike,Y_est_spike,'LineWidth',5)
    grid on 
    legend
    ylim([-.05 .2])
end
box on
ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% ax.FontWeight = 'bold'; 
xlabel('Time [min]')
ylabel('Thrombin [nM]')
legend('VIII=90','VIII=111','VIII=168','VIII=203','VIII=330','VIII=390','VIII=506')
% title('d')
title('Factor VIII: Prediction')

%%
%X 
% S14504_Factor=[
% 75	40	71	136	76	64 130 77
% 78	40	66	134	133	55 125 77
% 81	40	79	129	178	68 122 77
% 69	40	74	130	215	54 131 77
% 68	40	75	131	280	61 123 77 
% 72	40	69	128	317	51 127 77
% ];
S14504_Factor=[
75	40	71	136	76	64 130 77
78	40	66	134	133	64 125 77
81	40	79	133	178	68 127 77
69	40	74	133	215	64 131 77
68	40	75	131	280	64 127 77 
72	40	76	131	317	64 127 77
];

%X
factor_coeff_All_Train_Spike=[
   -0.0037   -0.0109   -0.0057    0.1448    0.0007
   -0.0037   -0.0158   -0.0087   -0.9933   -0.0088
    0.0018    0.0059    0.0029    0.4860   -0.0005
    0.0013    0.0027    0.0002    0.6271    0.0081
    0.0051    0.0139    0.0065    4.4046   -0.0027
    0.0019    0.0077    0.0040    0.6676    0.0007
    0.0053    0.0098    0.0064   -0.9899    0.0053
   -0.0001   -0.0007   -0.0001   -0.2844   -0.0078];

const_All_Train_Spike =[0.2205    1.7968    1.7435   -1.1306    2.6708];

T_Spike=linspace(0,30,301);

for i=1:6
    Trau_1_coeff=S14504_Factor(i,:)*factor_coeff_All_Train_Spike+const_All_Train_Spike;
    sys_est_spike=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
    Y_est_spike= 0.002*impulse(sys_est_spike,T_Spike);
    figure(1)
    subplot(2,4,6)
% figure(2)
% subplot(2,2,2)
    hold on 
    plot(T_Spike,Y_est_spike,'LineWidth',5)
    grid on 
    legend
    ylim([-.05 .35])
end
box on
ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% ax.FontWeight = 'bold'; 
xlabel('Time [min]')
ylabel('Thrombin [nM]')
legend('X=76','X=133','X=178','X=215','X=280','X=317')
% title('f')
title('Factor X: Prediction')
%%
%V 

S14504_Factor=[
96	39	112	123	89	41	90	115
92	96	111	130	90	30	96	115
];

%V
factor_coeff_All_Train_Spike=[
   -0.0037   -0.0109   -0.0057    0.1448    0.0007
   -0.0037   -0.0158   -0.0087   -0.9933   -0.0088
    0.0018    0.0059    0.0029    0.4860   -0.0005
    0.0013    0.0027    0.0002    0.6271    0.0081
    0.0051    0.0139    0.0065    1.4046   -0.0027
   -0.0019   -0.0077   -0.0040    0.6676    0.0007
    0.0053    0.0098    0.0064   -0.9899    0.0053
   -0.0001   -0.0007   -0.0001   -0.2844   -0.0078];

const_All_Train_Spike =[0.2205    1.7968    1.7535   -1.0306    2.6708];

T_Spike=linspace(0,30,301);

for i=1:2
    Trau_1_coeff=S14504_Factor(i,:)*factor_coeff_All_Train_Spike+const_All_Train_Spike;
    sys_est_spike=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
    Y_est_spike= 0.002*impulse(sys_est_spike,T_Spike);
    figure(1)
    subplot(2,4,8)
%     figure(2)
% subplot(2,2,4)

    hold on 
    plot(T_Spike,Y_est_spike,'LineWidth',5)
    grid on 
    legend
    ylim([-.05 .2])
end
box on
ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% ax.FontWeight = 'bold'; 
xlabel('Time [min]')
ylabel('Thrombin [nM]')
legend('V=39','V=96')
% title('h')
title('Factor V: Prediction')


%% AMOR DATA 

%Spiked II

figure(1)
subplot(2,4,1)
% figure(1)
% subplot(2,2,1)

hold on
grid on

Time = xlsread('Spiking_CAT_results_1','Cohen_lab_06-24-14','A18:A137');

CATDataValues = xlsread('Spiking_CAT_results_1','Cohen_lab_06-24-14','C18:I137');

SpikedII77 = CATDataValues(:,1)./1000;
SpikedII90 = CATDataValues(:,2)./1000;
SpikedII101 = CATDataValues(:,3)./1000;
SpikedII113 = CATDataValues(:,4)./1000;
SpikedII115 = CATDataValues(:,5)./1000;
SpikedII124 = CATDataValues(:,6)./1000;
SpikedII141 = CATDataValues(:,7)./1000;


plot(Time,SpikedII77,'LineWidth',5)
plot(Time,SpikedII90,'LineWidth',5)
plot(Time,SpikedII101,'LineWidth',5)
plot(Time,SpikedII115,'LineWidth',5)
plot(Time,SpikedII124,'LineWidth',5)


xlabel('Time [min]')
ylabel('Thrombin [nM]')
%legend('II = 77','II = 90','II = 101','II = 113','II = 115','II = 124','II = 141')
legend('II = 77','II = 90','II = 101','II = 115','II = 124')

axis([0 30 -0.05 0.2])

box on
% title('a')
title('Factor II: CAT')
ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 

%Spiked VIII
% figure(1)
% subplot(2,2,3)
figure(1)
    subplot(2,4,3)
hold on
grid on

Time = xlsread('Spiking_CAT_results_2','Cohen_lab_06-25-14','A18:A137');

CATDataValues = xlsread('Spiking_CAT_results_2','Cohen_lab_06-25-14','B18:J137');

SpikedVIII47 = CATDataValues(:,1)./1000;
SpikedVIII90 = CATDataValues(:,2)./1000;
SpikedVIII111 = CATDataValues(:,3)./1000;
SpikedVIII168 = CATDataValues(:,4)./1000;
SpikedVIII203 = CATDataValues(:,5)./1000;
SpikedVIII330 = CATDataValues(:,6)./1000;
SpikedVIII390 = CATDataValues(:,7)./1000;
SpikedVIII506 = CATDataValues(:,8)./1000;
SpikedVIII593 = CATDataValues(:,9)./1000;


plot(Time,SpikedVIII90,'LineWidth',5)
plot(Time,SpikedVIII111,'LineWidth',5)
plot(Time,SpikedVIII168,'LineWidth',5)
plot(Time,SpikedVIII203,'LineWidth',5)
plot(Time,SpikedVIII330,'LineWidth',5)
plot(Time,SpikedVIII390,'LineWidth',5)
plot(Time,SpikedVIII506,'LineWidth',5)

xlabel('Time [min]')
ylabel('Thrombin [nM]')
legend('VIII = 90','VIII = 111','VIII = 168','VIII = 203','VIII = 330','VIII = 390','VIII = 506')

axis([0 30 -0.05 0.2])
box on
ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% title('c')
title('Factor VIII: CAT')

%Spiked X

% 
% figure(2)
% subplot(2,2,1)
figure(1)
    subplot(2,4,5)
hold on
grid on

Time = xlsread('Spiking_CAT_results_14504_1','Cohen_1','A18:A107');
SpikedX76 = xlsread('Spiking_CAT_results_14504_1','Cohen_1','B18:B107')./1000;
CATDataValues = xlsread('Spiking_CAT_results_14504_1','Cohen_1','K18:P107');

SpikedX115 = CATDataValues(:,1)./1000;
SpikedX133 = CATDataValues(:,2)./1000;
SpikedX178 = CATDataValues(:,3)./1000;
SpikedX215 = CATDataValues(:,4)./1000;
SpikedX280 = CATDataValues(:,5)./1000;
SpikedX317 = CATDataValues(:,6)./1000;

%plot(Time,SpikedX115)
plot(Time,SpikedX76,'LineWidth',5)
plot(Time,SpikedX133,'LineWidth',5)
plot(Time,SpikedX178,'LineWidth',5)
plot(Time,SpikedX215,'LineWidth',5)
plot(Time,SpikedX280,'LineWidth',5)
plot(Time,SpikedX317,'LineWidth',5)

xlabel('Time [min]')
ylabel('Thrombin [nM]')
legend('X = 76','X = 133','X = 178','X = 215','X = 280','X = 317')
axis([0 30 -0.05 0.35])
box on

ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% title('e')
title('Factor X: CAT')

%Effect of V
figure(1)
    subplot(2,4,7)
% figure(2)
% subplot(2,2,3)

Time14498 = xlsread('CAT_Normals','Dynamic','M2:M121');
CAT14498 = xlsread('CAT_Normals','Dynamic','N2:N121')./1000;

Time14507 = xlsread('CAT_Normals','Dynamic','T2:T121');
CAT14507 = xlsread('CAT_Normals','Dynamic','Y2:Y121')./1000;

plot(Time14498,CAT14498,'LineWidth',5)
hold on
grid on
box on
ylabel('Thrombin [nM]')
xlabel('Time [min]')
plot(Time14507,CAT14507,'LineWidth',5)
legend('#14498 V = 39','#14507 V = 96')
legend('V = 39','V = 96')

%axis([0 45 -0.05 0.2])
axis([0 30 -0.05 0.2])

ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% title('g')
title('Factor V: CAT')