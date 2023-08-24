% Fig 9
%Recovery recommendation for a trauma patient 

%% Finding the best fits of the CAT model with 8 factor concentrations 

DataSheet_Nor_Train=xlsread('NSamples_Factors_Fits_Therapy',1,'B2:O21');
DataSheet_Tra_Train=xlsread('TraumaSamples_Factors_Fits_Therapy',1,'B2:O36');
DataSheet_All=[DataSheet_Nor_Train;DataSheet_Tra_Train] ;

CAT_measurements_Nor=xlsread('CAT_Normals_Experiment_Therapy',1,'B2:AJ121');
CAT_measurements=xlsread('CAT_Trauma_Experiment_Therapy',1,'B2:AJ121');
CAT_measurements_time=xlsread('CAT_Trauma_Experiment_Therapy',1,'A2:A121');

k0=DataSheet_Tra_Train(:,10);
k1=DataSheet_Tra_Train(:,11);
k2=DataSheet_Tra_Train(:,12);
kn=DataSheet_Tra_Train(:,13);
kd=DataSheet_Tra_Train(:,14);

FactorData_Nor=DataSheet_Nor_Train(:,1:8); 
FactorData_Tra=DataSheet_Tra_Train(:,1:8); 
FactorData_All_Train=[FactorData_Nor; FactorData_Tra]; 

for k=1:5  
    
    param=DataSheet_All(:,k+9);
    [res,fit_param_factor_chosen,i_chosen, Factor_tag, fit_param_sorted] = CAT_Prediction_Therapy(FactorData_All_Train,param) ;
    const_All_Train(1,k)=fit_param_factor_chosen(1) ;
    factor_coeff_All_Train(:,k)=fit_param_sorted ;

end


%% Trauma Data
[Alldata, Header]=xlsread('ACIT_6Jan17_deidentified1_MitchData','A1:TJ1672');

allData_0h=[Alldata(:,1),Alldata(:,490), Alldata(:,17:20), Alldata(:,39:43), Alldata(:,45:49), Alldata(:,35:36), Alldata(:,50:54)]; %0hr
allData_0h_6h=[allData_0h, Alldata(:,189:192), Alldata(:,199:203), Alldata(:,205:216)]; %6h
allData_0h_6h_12h=[allData_0h_6h, Alldata(:,232:235), Alldata(:,242:246), Alldata(:,248:259)]; %12h
allData_0h_6h_12h_24h=[allData_0h_6h_12h, Alldata(:,275:278), Alldata(:,285:289), Alldata(:,291:302)]; %24h

Header_0h={Header{1,1}, Header{1,490}, Header{1,17:20}, Header{1,39:43}, Header{1,45:49}, Header{1,35:36}, Header{1,50:54}};
Header_0h_6h={Header_0h{1,:}, Header{1,189:192}, Header{1,199:203}, Header{1,205:216}};
Header_0h_6h_12h={Header_0h_6h{1,:}, Header{1,232:235}, Header{1,242:246}, Header{1,248:259}};
Header_0h_6h_12h_24h={Header_0h_6h_12h{1,:}, Header{1,275:278}, Header{1,285:289}, Header{1,291:302}};

% NaN Data_removal for time windows 
% 0 hour 
[row0, ~] = find(isnan(allData_0h(:,7:14)));
rowsToDelete0=unique(row0);
allData_0h_select=allData_0h;

for i=length(rowsToDelete0):-1:1
    allData_0h_select(rowsToDelete0(i),:)=[];
end

% 6 hour 
[row2, ~] = find(isnan([allData_0h_6h(:,7:14), allData_0h_6h(:,28:35)]));
rowsToDelete_6=unique(row2);
allData_0h_6h_select=allData_0h_6h;

for i=length(rowsToDelete_6):-1:1
    allData_0h_6h_select(rowsToDelete_6(i),:)=[];
end

% 12 hour 
[row3, ~] = find(isnan([allData_0h_6h_12h(:,7:14), allData_0h_6h_12h(:,28:35), allData_0h_6h_12h(:,49:56)]));
rowsToDelete_12=unique(row3);
allData_0h_6h_12h_select=allData_0h_6h_12h;

for i=length(rowsToDelete_12):-1:1
    allData_0h_6h_12h_select(rowsToDelete_12(i),:)=[];
end


% 24 hour 
[row4, ~] = find(isnan([allData_0h_6h_12h_24h(:,7:14), allData_0h_6h_12h_24h(:,28:35), allData_0h_6h_12h_24h(:,49:56), allData_0h_6h_12h_24h(:,70:77)]));
rowsToDelete_24=unique(row4);
allData_0h_6h_12h_24h_select=allData_0h_6h_12h_24h;

for i=length(rowsToDelete_24):-1:1
    allData_0h_6h_12h_24h_select(rowsToDelete_24(i),:)=[];
end



%% Forming the normal region 
% Mean of Parameters / Max and Min of Fit to Data

Max_ModelParameters_Nor=[0.1379 1.1568 2.1013 58.6692 1.6643];
Min_ModelParameters_Nor=[0.1448 0.8369 1.7329 14.4500 3.0283];
Mean_ModelParameters_Nor=[0.0649 0.5038 1.1728 14.8288 1.8556];

sys_est_Min_Nor=tf(Min_ModelParameters_Nor(4),[1 Min_ModelParameters_Nor(3) Min_ModelParameters_Nor(2) Min_ModelParameters_Nor(1)],'InputDelay',Min_ModelParameters_Nor(5));
sys_est_Max_Nor=tf(Max_ModelParameters_Nor(4),[1 Max_ModelParameters_Nor(3) Max_ModelParameters_Nor(2) Max_ModelParameters_Nor(1)],'InputDelay',Max_ModelParameters_Nor(5));
sys_est_Mean_Nor=tf(Mean_ModelParameters_Nor(4),[1 Mean_ModelParameters_Nor(3) Mean_ModelParameters_Nor(2) Mean_ModelParameters_Nor(1)],'InputDelay',Mean_ModelParameters_Nor(5));

T2 = linspace(0,42,124)';
% T2 = linspace(0,42,42001)';
Y_est_Min_Nor = 5*impulse(sys_est_Min_Nor,T2);
Y_est_Max_Nor = 5*impulse(sys_est_Max_Nor,T2);
Y_est_Mean_Nor = 5*impulse(sys_est_Mean_Nor,T2);

figure(1)
[hl, hp]=boundedline(T2, Y_est_Mean_Nor, [Y_est_Mean_Nor-Y_est_Min_Nor Y_est_Max_Nor-Y_est_Mean_Nor ], 'alpha');
outlinebounds(hl, hp)
box on
ylim([-25 250])
xlim([0 42])
ax = gca;
ax.FontSize = 20; 
ax.FontWeight = 'bold'; 
xlabel('Time [min]', 'FontSize', 20, 'FontWeight', 'bold')
ylabel('CAT', 'FontSize', 20, 'FontWeight', 'bold')
title('Normal Region', 'FontSize', 20, 'FontWeight', 'bold')

%Identify normal range 
[Range_peak_Min,i_m]=max(Y_est_Min_Nor);
Range_T_peak_Min= T2(i_m) ;
Range_Area_Min= trapz(T2,Y_est_Min_Nor ) ;
Range_Delay_Min=DetermineDelayTherapy(T2,Y_est_Min_Nor);

[Range_peak_Max,i_m]=max(Y_est_Max_Nor);
Range_T_peak_Max= T2(i_m) ;
Range_Area_Max= trapz(T2,Y_est_Max_Nor ) ;
Range_Delay_Max=DetermineDelayTherapy(T2,Y_est_Max_Nor);

[Range_peak_Mean,i_m]=max(Y_est_Mean_Nor);
Range_T_peak_Mean= T2(i_m) ;
Range_Area_Mean= trapz(T2,Y_est_Mean_Nor ) ;
Range_Delay_Mean=DetermineDelayTherapy(T2,Y_est_Mean_Nor);

Range_Peak=[Range_peak_Min Range_peak_Mean Range_peak_Max];
Range_T_Peak=[Range_T_peak_Max Range_T_peak_Mean Range_T_peak_Min];
Range_Area=[Range_Area_Min Range_Area_Mean Range_Area_Max];
Range_Delay=[Range_Delay_Max Range_Delay_Mean Range_Delay_Min];


%% CAT Variation with factor recommendation adjustments Sample by sample 
T3 = linspace(0,42,42001)';
Patients_withGoodDecreaseNearGoal=[14,20,111,115,120,133,149,161,181,188,191,207];

DoYouWantGraphs=0;   %set to 1 for graphs to show 

%which sample 
% for SampleCount=1:length(Patients_withGoodDecreaseNearGoal)
% sampleNum=Patients_withGoodDecreaseNearGoal(SampleCount);

sampleNum=Patients_withGoodDecreaseNearGoal(2);

Factor_rows_Time=[7:14; 28:35; 49:56; 70:77];
FactorConcentration_History_TraSample=[];

%Measuremeants at the specific time point for that sample 
factor_concen_Tra_sample=allData_0h_6h_12h_24h_select(sampleNum,Factor_rows_Time(1,:));
Factor_tag={'II', 'V', 'VII' , 'IX', 'X', 'VIII', 'ATIII', 'PC' ,'Fib'};

FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; factor_concen_Tra_sample];

if FactorConcentration_History_TraSample(1,6)>400
    FactorConcentration_History_TraSample(1,6)=FactorConcentration_History_TraSample(1,6)/2;
end

%STEP 1: adjusting factor II to correct peak 

j=1;
Factor_Tra_changes_treat={};

factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
Delta_parameter=factor_concen_Tra_sample(j)/10 ; 

Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));

Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
[Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
T_est_change_Tra_peak= T3(i_m) ;
AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);

Factor_Tra_changes_treat{1,j}=[factor_concen_Tra_sample(j) Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

%     if DoYouWantGraphs==1
%         figure(2)
%         subplot(3,3,j)
%         plot(T3, Y_est_change_Tra , 'k')
%     end
       
    for i=1:10
        factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
        FactorSelected=factor_concen_Tra_sample(j);
        change_parameter= ((-1)^i)*Delta_parameter*(ceil(i/2)) ;
        FactorSelected=FactorSelected+change_parameter ;
        factor_concen_Tra_sample(j)=FactorSelected;
        Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        
        [Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
        T_est_change_Tra_peak= T3(i_m) ;
        AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
        DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);
        
        Factor_Tra_changes_treat{i+1,j}=[FactorSelected Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];
        
    end

Factor_Tra_changes_treat_Mat=cell2mat(Factor_Tra_changes_treat);
factor_param_fit=polyfit(Factor_Tra_changes_treat_Mat(:,2),Factor_Tra_changes_treat_Mat(:,1),2); %a second order polynomial from peak to factor II
% recommend_factor_update=max(60, polyval(factor_param_fit, Range_Peak(2)));
recommend_factor_update=min(max(60, polyval(factor_param_fit, Range_Peak(2))),140);

FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; FactorConcentration_History_TraSample(end,:)];
FactorConcentration_History_TraSample(end,j)=recommend_factor_update;

%STEP 2: adding factor X to correct peak and peak time 

j=5;
Factor_Tra_changes_treat={};

factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
Delta_parameter=factor_concen_Tra_sample(j)/10 ; 

Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));

Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
[Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
T_est_change_Tra_peak= T3(i_m) ;
AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);

Factor_Tra_changes_treat{1,j}=[factor_concen_Tra_sample(j) Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    for i=1:10
        factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
        FactorSelected=factor_concen_Tra_sample(j);
        change_parameter= ((-1)^i)*Delta_parameter*(ceil(i/2)) ;
        FactorSelected=FactorSelected+change_parameter ;
        factor_concen_Tra_sample(j)=FactorSelected;
        Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        
        [Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
        T_est_change_Tra_peak= T3(i_m) ;
        AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
        DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);
        
        Factor_Tra_changes_treat{i+1,j}=[FactorSelected Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    end

Factor_Tra_changes_treat_Mat=cell2mat(Factor_Tra_changes_treat);
factor_param_fit=polyfit(Factor_Tra_changes_treat_Mat(:,2),Factor_Tra_changes_treat_Mat(:,1),2); %a second order polynomial from peak to factor X
% recommend_factor_update=min(140, polyval(factor_param_fit, mean(Range_Peak(2:3))));
% recommend_factor_update=max(min(140, polyval(factor_param_fit, mean(Range_Peak(2:3)))),60);
recommend_factor_update=max(min(140, polyval(factor_param_fit, Range_Peak(3))),60);

FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; FactorConcentration_History_TraSample(end,:)];
FactorConcentration_History_TraSample(end,j)=recommend_factor_update;


%STEP 3: adjusting either PC or IX for delay 
% j=8 %PC
j=4;  %IX
Factor_Tra_changes_treat={};

factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
Delta_parameter=factor_concen_Tra_sample(j)/10 ; 

Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));

Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
[Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
T_est_change_Tra_peak= T3(i_m) ;
AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);

Factor_Tra_changes_treat{1,j}=[factor_concen_Tra_sample(j) Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    for i=1:10
        factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
        FactorSelected=factor_concen_Tra_sample(j);
        change_parameter=((-1)^i)*Delta_parameter*(ceil(i/2)) ;
        FactorSelected=FactorSelected+change_parameter ;
        factor_concen_Tra_sample(j)=FactorSelected;
              
        Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        
        [Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
        T_est_change_Tra_peak= T3(i_m) ;
        AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
        DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);
        
        Factor_Tra_changes_treat{i+1,j}=[FactorSelected Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    end

Factor_Tra_changes_treat_Mat=cell2mat(Factor_Tra_changes_treat);
factor_param_fit=polyfit(Factor_Tra_changes_treat_Mat(:,5),Factor_Tra_changes_treat_Mat(:,1),2); %a second order polynomial from time delay to PC
recommend_factor_update=max(min(140, polyval(factor_param_fit, Range_Delay(3))),60);

FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; FactorConcentration_History_TraSample(end,:)];
FactorConcentration_History_TraSample(end,j)=recommend_factor_update;


%STEP 4: adjusting VIII  based on peak time 

j=6;
Factor_Tra_changes_treat={};

factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
Delta_parameter=factor_concen_Tra_sample(j)/10 ; 

Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));

Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
[Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
T_est_change_Tra_peak= T3(i_m) ;
AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);

Factor_Tra_changes_treat{1,j}=[factor_concen_Tra_sample(j) Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    for i=1:10
        factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
        FactorSelected=factor_concen_Tra_sample(j);
        change_parameter= ((-1)^i)*Delta_parameter*(ceil(i/2)) ;
        FactorSelected=FactorSelected+change_parameter ;
        factor_concen_Tra_sample(j)=FactorSelected;
        Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        
        if Trau_1_coeff(4)<0
            change_parameter=-change_parameter;
            FactorSelected=FactorSelected+change_parameter ;
            factor_concen_Tra_sample(j)=FactorSelected;
            Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        end
        
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        
        [Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
        T_est_change_Tra_peak= T3(i_m) ;
        AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
        DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);
        
        Factor_Tra_changes_treat{i+1,j}=[FactorSelected Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    end

Factor_Tra_changes_treat_Mat=cell2mat(Factor_Tra_changes_treat);
factor_param_fit=polyfit(Factor_Tra_changes_treat_Mat(:,3),Factor_Tra_changes_treat_Mat(:,1),2); %a second order polynomial from peak time to factor VIII
recommend_factor_update=max(min(140, polyval(factor_param_fit, mean(Range_T_Peak(1:2)))),60);

FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; FactorConcentration_History_TraSample(end,:)];
FactorConcentration_History_TraSample(end,j)=recommend_factor_update;


%STEP 5: adjusting II based on peak  

j=1;
Factor_Tra_changes_treat={};

factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
Delta_parameter=factor_concen_Tra_sample(j)/10 ; 

Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;

% Specificaly for third sample (111)
if Trau_1_coeff(4)<0
    FactorConcentration_History_TraSample(end,6)=mean(FactorConcentration_History_TraSample(end-1:end,6));
    factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
    Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
end
%end

sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));

Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
[Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
T_est_change_Tra_peak= T3(i_m) ;
AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);

Factor_Tra_changes_treat{1,j}=[factor_concen_Tra_sample(j) Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    for i=1:10
        factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
        FactorSelected=factor_concen_Tra_sample(j);
        change_parameter= ((-1)^i)*Delta_parameter*(ceil(i/2)) ;
        FactorSelected=FactorSelected+change_parameter ;
        factor_concen_Tra_sample(j)=FactorSelected;
        Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        
        [Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
        T_est_change_Tra_peak= T3(i_m) ;
        AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
        DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);
        
        Factor_Tra_changes_treat{i+1,j}=[FactorSelected Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    end

Factor_Tra_changes_treat_Mat=cell2mat(Factor_Tra_changes_treat);
factor_param_fit=polyfit(Factor_Tra_changes_treat_Mat(:,2),Factor_Tra_changes_treat_Mat(:,1),2); %a second order polynomial from peak  to factor II
recommend_factor_update=max(min(140, polyval(factor_param_fit, Range_Peak(2))),60);

FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; FactorConcentration_History_TraSample(end,:)];
FactorConcentration_History_TraSample(end,j)=recommend_factor_update;

% STEP 6 (IF NECESSARY)

Y_est_Min_Nor_Comparison = 5*impulse(sys_est_Min_Nor,T3);
Y_est_Max_Nor_Comparison = 5*impulse(sys_est_Max_Nor,T3);
Y_est_Mean_Nor_Comparison = 5*impulse(sys_est_Mean_Nor,T3);

%Identify normal range with T3 for comparison to understand where is the
%location of CAT 
Range_peak_Min_Comparison=max(Y_est_Min_Nor_Comparison);
Range_peak_Max_Comparison=max(Y_est_Max_Nor_Comparison);
Range_peak_Mean_Comparison=max(Y_est_Mean_Nor_Comparison);
Range_Peak=[Range_peak_Min_Comparison Range_peak_Mean_Comparison Range_peak_Max_Comparison];

%Current CAT after Step 5 adjustment 
Trau_1_coeff=FactorConcentration_History_TraSample(end,:)*factor_coeff_All_Train+const_All_Train;
sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_current_Tra= 5*impulse(sys_est_change_Tra1,T3);
Peak_current_Tra=max(Y_est_current_Tra);

% Identify if peak is in the range 
if Peak_current_Tra>Range_Peak(3)
    Current_CAT_Peak_Indicator=1;
elseif Range_Peak(1)>Peak_current_Tra
    Current_CAT_Peak_Indicator=-1;
else
    Current_CAT_Peak_Indicator=0;
end
% Identify if tail (between 10 and 20 minutes) is in the range 
if mean(Y_est_current_Tra(12500:22500)-Y_est_Max_Nor_Comparison(12500:22500))>0
    Current_CAT_Tail_Indicator=1;
elseif mean(Y_est_current_Tra(8000:18000)-Y_est_Min_Nor_Comparison(8000:18000))<0
    Current_CAT_Tail_Indicator=-1;
else
    Current_CAT_Tail_Indicator=0;
end

Current_CAT_Peak_Indicator
Current_CAT_Tail_Indicator

%CHoose what factor to change 
if Current_CAT_Peak_Indicator==1 && Current_CAT_Tail_Indicator~=-1
    j=8;
    Target_Peak_Value=mean(Range_Peak(2:3));
    NeedForStep6=1;
elseif Current_CAT_Peak_Indicator==1 && Current_CAT_Tail_Indicator==-1
    if FactorConcentration_History_TraSample(end,5)~=140
        j=5;
    else
        j=7;
    end
    Target_Peak_Value=mean(Range_Peak(2:3));
    NeedForStep6=1;
elseif Current_CAT_Peak_Indicator==-1 && Current_CAT_Tail_Indicator==-1
    j=7;
    Target_Peak_Value=mean(Range_Peak(2));
    NeedForStep6=1;
elseif Current_CAT_Peak_Indicator==0 && Current_CAT_Tail_Indicator==+1
    j=7;
    Target_Peak_Value=Range_Peak(2);
    NeedForStep6=1;
elseif Current_CAT_Peak_Indicator==0 && Current_CAT_Tail_Indicator==-1
    j=7;
    Target_Peak_Value=Range_Peak(2);
    NeedForStep6=1;
elseif Current_CAT_Peak_Indicator==-1 && Current_CAT_Tail_Indicator==0
    FactorConcentration_History_TraSample(end,6)=(FactorConcentration_History_TraSample(5,6)+FactorConcentration_History_TraSample(4,6))/9*5;
    NeedForStep6=0;
else
    NeedForStep6=0;
end


if NeedForStep6==1

Factor_Tra_changes_treat={};

factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
Delta_parameter=factor_concen_Tra_sample(j)/10 ; 

Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));

Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
[Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
T_est_change_Tra_peak= T3(i_m) ;
AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);

Factor_Tra_changes_treat{1,j}=[factor_concen_Tra_sample(j) Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    for i=1:10
        factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
        FactorSelected=factor_concen_Tra_sample(j);
        change_parameter= ((-1)^i)*Delta_parameter*(ceil(i/2)) ;
        FactorSelected=FactorSelected+change_parameter ;
        factor_concen_Tra_sample(j)=FactorSelected;
        Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        
        if Trau_1_coeff(4)<0
            change_parameter=-change_parameter;
            FactorSelected=FactorSelected+change_parameter ;
            factor_concen_Tra_sample(j)=FactorSelected;
            Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        end
        
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        
        [Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
        T_est_change_Tra_peak= T3(i_m) ;
        AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
        DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);
        
        Factor_Tra_changes_treat{i+1,j}=[FactorSelected Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];

    end

Factor_Tra_changes_treat_Mat=cell2mat(Factor_Tra_changes_treat);
factor_param_fit=polyfit(Factor_Tra_changes_treat_Mat(:,2),Factor_Tra_changes_treat_Mat(:,1),2); %a second order polynomial from peak to required factor 
recommend_factor_update=max(min(140, polyval(factor_param_fit, Target_Peak_Value)),60);

FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; FactorConcentration_History_TraSample(end,:)];
FactorConcentration_History_TraSample(end,j)=recommend_factor_update;

end





%Figure 
figure(5)
clf;
[hl, hp]=boundedline(T2, Y_est_Mean_Nor, [Y_est_Mean_Nor-Y_est_Min_Nor Y_est_Max_Nor-Y_est_Mean_Nor ], 'alpha');
outlinebounds(hl, hp)
box on
% ylim([-25 250])
xlim([0 42])
ax = gca;
ax.FontSize = 20; 
ax.FontWeight = 'bold'; 
xlabel('Time [min]', 'FontSize', 20, 'FontWeight', 'bold')
ylabel('CAT', 'FontSize', 20, 'FontWeight', 'bold')
title('Normal Region', 'FontSize', 20, 'FontWeight', 'bold')

    for i=1:size(FactorConcentration_History_TraSample,1)

        Trau_1_coeff=FactorConcentration_History_TraSample(i,:)*factor_coeff_All_Train+const_All_Train;
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));

        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        figure(5)
        hold on
        plot(T3,Y_est_change_Tra)

    end
legend
plot(T3,Y_est_change_Tra,'k','LineWidth',2)

% Factor_Recommend_ALL_Samples(SampleCount,:)=FactorConcentration_History_TraSample(end,:);

% end


%%
Factor_Recommend_ALL_Samples=[
    60.0000   44.0000   97.0000   60.0000  109.0129  140.0000  103.0000  100.0000
   74.6718   59.0000  123.0000   60.0000  104.6329   81.7372  105.0814  106.0000
   60.0000   43.0000   68.0000   60.0000  133.0565  191.0000   54.0000   59.0000
   60.0000   23.0000   52.0000   60.0000   91.6206  140.0000   60.0000   44.0000
   74.4396   64.0000  100.0000   60.0000  122.0875  140.0000  109.5579  113.0000
   60.0000   40.0000   75.0000   60.0000  116.2362  140.0000  130.4881  194.0000
   65.8558   67.0000   47.0000   60.0000   90.3974  132.7898   81.0000   65.0000
   60.0000   50.0000   31.0000   87.2770   72.1395  140.0000   59.0000  108.5663
   82.2417   42.0000   65.0000   60.0000  122.2780  140.0000   95.0000   94.0000
   60.0000   14.0000   75.0000   94.6870   60.0000  140.0000   25.0000  140.0000
   60.0000   55.0000   67.0000   60.0000  106.7371  210.0000   57.0000   52.0000
   60.0000   96.0000   56.0000  108.6926   88.5686  140.0000   80.0000   92.0000];


figure(7); clf
T1=linspace(0,42,421)';

for i=1:length(Patients_withGoodDecreaseNearGoal)

    sampleNum=Patients_withGoodDecreaseNearGoal(i);
    
factor_concen_Tra1=allData_0h_6h_12h_24h_select(sampleNum,7:14);
Trau_1_coeff=factor_concen_Tra1*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_1= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra2=allData_0h_6h_12h_24h_select(sampleNum,28:35);
Trau_1_coeff=factor_concen_Tra2*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_2= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra3=allData_0h_6h_12h_24h_select(sampleNum,49:56);
Trau_1_coeff=factor_concen_Tra3*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_3= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra4=allData_0h_6h_12h_24h_select(sampleNum,70:77);
Trau_1_coeff=factor_concen_Tra4*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_4= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra5=Factor_Recommend_ALL_Samples(i,:);
Trau_1_coeff=factor_concen_Tra5*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_recom= 5*impulse(sys_est_Tra1,T1);

figure(7)
subplot(3,4,i)
[hl, hp]=boundedline(T2, Y_est_Mean_Nor, [Y_est_Mean_Nor-Y_est_Min_Nor Y_est_Max_Nor-Y_est_Mean_Nor ], 'alpha');
outlinebounds(hl, hp)
hold on
box on
grid on
ylim([0 500]);
p1=plot(T1,Y_est_Tra_1,'Color',[0.6350 0.0780 0.1840],'LineWidth',3);
p2=plot(T1,Y_est_Tra_2,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
p3=plot(T1,Y_est_Tra_3,'Color',[0.8500 0.3250 0.0980],'LineWidth',3);
p4=plot(T1,Y_est_Tra_4,'Color',[0.4660 0.6740 0.1880],'LineWidth',3);
p5=plot(T1,Y_est_Tra_recom,'Color','k','LineWidth',3);
ax = gca;
ax.FontSize = 13; 
ax.FontWeight = 'bold'; 
xlabel('Time [min]', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('CAT', 'FontSize', 12, 'FontWeight', 'bold')


Chose_Sample_Coagulation_Factor_Chart((i-1)*5+1:i*5,:)=[factor_concen_Tra1;factor_concen_Tra2;factor_concen_Tra3;factor_concen_Tra4;factor_concen_Tra5];

end 
legend([hp p1 p2 p3 p4 p5],{'Normal Region','Trauma CAT 0h','Trauma CAT 6h','Trauma CAT 12h','Trauma CAT 24h','CAT Recommended Factors'})


%% CAT actual and recommended 8 out of 12

Factor_Recommend_ALL_Samples=[
    60.0000   44.0000   97.0000   60.0000  109.0129  140.0000  103.0000  100.0000
   74.6718   59.0000  123.0000   60.0000  104.6329   81.7372  105.0814  106.0000
   60.0000   43.0000   68.0000   60.0000  133.0565  191.0000   54.0000   59.0000
   60.0000   23.0000   52.0000   60.0000   91.6206  140.0000   60.0000   44.0000
   74.4396   64.0000  100.0000   60.0000  122.0875  140.0000  109.5579  113.0000
   60.0000   40.0000   75.0000   60.0000  116.2362  140.0000  130.4881  194.0000
   65.8558   67.0000   47.0000   60.0000   90.3974  132.7898   81.0000   65.0000
   60.0000   50.0000   31.0000   87.2770   72.1395  140.0000   59.0000  108.5663
   82.2417   42.0000   65.0000   60.0000  122.2780  140.0000   95.0000   94.0000
   60.0000   14.0000   75.0000   94.6870   60.0000  140.0000   25.0000  140.0000
   60.0000   55.0000   67.0000   60.0000  106.7371  210.0000   57.0000   52.0000
   60.0000   96.0000   56.0000  108.6926   88.5686  140.0000   80.0000   92.0000];

Factor_Recommend_ALL_Samples([3,4,10,11],:)=[];

figure(8); clf
T1=linspace(0,42,421)';
Patients_withGoodDecreaseNearGoal2=[14,20,111,115,120,133,149,161,181,188,191,207];
Patients_withGoodDecreaseNearGoal2([3,4,10,11])=[];

for i=1:length(Patients_withGoodDecreaseNearGoal2)

    sampleNum=Patients_withGoodDecreaseNearGoal2(i);
    
factor_concen_Tra1=allData_0h_6h_12h_24h_select(sampleNum,7:14);
Trau_1_coeff=factor_concen_Tra1*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_1= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra2=allData_0h_6h_12h_24h_select(sampleNum,28:35);
Trau_1_coeff=factor_concen_Tra2*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_2= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra3=allData_0h_6h_12h_24h_select(sampleNum,49:56);
Trau_1_coeff=factor_concen_Tra3*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_3= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra4=allData_0h_6h_12h_24h_select(sampleNum,70:77);
Trau_1_coeff=factor_concen_Tra4*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_4= 5*impulse(sys_est_Tra1,T1);

factor_concen_Tra5=Factor_Recommend_ALL_Samples(i,:);
Trau_1_coeff=factor_concen_Tra5*factor_coeff_All_Train+const_All_Train;
sys_est_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
Y_est_Tra_recom= 5*impulse(sys_est_Tra1,T1);

[Tra_graph_info_4(1),i_m]=max(Y_est_Tra_4);
Tra_graph_info_4(2)= T1(i_m) ;
Tra_graph_info_4(3)= trapz(T1,Y_est_Tra_4 ) ;
Tra_graph_info_4(4)=DetermineDelayTherapy(T1,Y_est_Tra_4);

[Tra_graph_info_recom(1),i_m]=max(Y_est_Tra_recom);
Tra_graph_info_recom(2)= T1(i_m) ;
Tra_graph_info_recom(3)= trapz(T1,Y_est_Tra_recom ) ;
Tra_graph_info_recom(4)=DetermineDelayTherapy(T1,Y_est_Tra_recom);

[Norm_graph_info(1),i_m]=max(Y_est_Mean_Nor);
Norm_graph_info(2)= T2(i_m) ;
Norm_graph_info(3)= trapz(T2,Y_est_Mean_Nor ) ;
Norm_graph_info(4)=DetermineDelayTherapy(T2,Y_est_Mean_Nor);

Healing_error_Table(i,:)=[((abs(Tra_graph_info_4-Norm_graph_info))./Norm_graph_info)*100, ((abs(Tra_graph_info_recom-Norm_graph_info))./Norm_graph_info)*100]; %4th CAT (24 h) and recom 

CurrenSample_Prop_Values=[Tra_graph_info_4 Tra_graph_info_recom];
Normal_Range_Values=[Range_Peak(1) Range_T_Peak(1) Range_Area(1) Range_Delay(1) Range_Peak(1) Range_T_Peak(1) Range_Area(1) Range_Delay(1)
    Range_Peak(3) Range_T_Peak(3) Range_Area(3) Range_Delay(3) Range_Peak(3) Range_T_Peak(3) Range_Area(3) Range_Delay(3)];
for jj=1:8
    if CurrenSample_Prop_Values(jj)>Normal_Range_Values(1,jj) && CurrenSample_Prop_Values(jj)<Normal_Range_Values(2,jj)
        RangeCheck(jj)=1;
    else
        RangeCheck(jj)=0;
    end
    
end
Healing_RangeCheck_Table(i,:)=RangeCheck;
Samples_Healing_Prop_Values(i,:)=CurrenSample_Prop_Values;

figure(8)
subplot(2,4,i)
[hl, hp]=boundedline(T2, Y_est_Mean_Nor, [Y_est_Mean_Nor-Y_est_Min_Nor Y_est_Max_Nor-Y_est_Mean_Nor ], 'alpha');
outlinebounds(hl, hp)
hold on
box on
grid on
if i==3
    ylim([0 500])
else
    ylim([0 400])
end
% ylim([0 500]);
p1=plot(T1,Y_est_Tra_1,'Color',[0.6350 0.0780 0.1840],'LineWidth',3);
p2=plot(T1,Y_est_Tra_2,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
p3=plot(T1,Y_est_Tra_3,'Color',[0.8500 0.3250 0.0980],'LineWidth',3);
p4=plot(T1,Y_est_Tra_4,'Color',[0.4660 0.6740 0.1880],'LineWidth',3);
p5=plot(T1,Y_est_Tra_recom,'Color','k','LineWidth',3);
ax = gca;
ax.FontName='Calibri';
ax.FontSize = 20; 
% ax.FontWeight = 'bold'; 
xlabel('Time [min]')
ylabel('Thrombin [nM]')
xlim([0 45])
% title(Fig_title{i},'fontweight','bold')

% Chose_Sample_Coagulation_Factor_Chart((i-1)*5+1:i*5,:)=[factor_concen_Tra1;factor_concen_Tra2;factor_concen_Tra3;factor_concen_Tra4;factor_concen_Tra5];

end 
legend([hp p1 p2 p3 p4 p5],{'Normal Region','CAT 0h','CAT 6h','CAT 12h','CAT 24h','CAT Recommended'})
