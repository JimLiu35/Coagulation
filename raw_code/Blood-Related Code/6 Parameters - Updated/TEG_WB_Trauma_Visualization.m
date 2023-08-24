% TEG Whole blood fits reconstruction 

%% DATA Importation 
% clear 
% clc

TEG_WB_experiment_data=xlsread('Trauma_WholeBloodTEG_data',1,'B2:Y902') ;
TEG_WB_experiment_time_sec=xlsread('Trauma_WholeBloodTEG_data',1,'A2:A902') ;
TEG_WB_experiment_time_min = TEG_WB_experiment_time_sec ./ 60 ;

TEG_WB_Fit_Parameters=xlsread('Trauma_WholeBloodTEG_3piece_Fits_Parameters',1,'B2:I25') ;
TEG_WB_Fit_Parameters4=xlsread('TEG_ModelFits4',1,'A1:F24') ;
TEG_WB_Factor_Concentration=xlsread('Trauma_WholeBloodTEG_3piece_Fits_Parameters',1,'J2:S25') ;


WB_Fit_Par=TEG_WB_Fit_Parameters([1:2,5:6,8:13,15,18:24],:) ;
WB_Factors=TEG_WB_Factor_Concentration([1:2,5:6,8:13,15,18:24],:) ;

TEG_exp = TEG_WB_experiment_data(:,[1:2,5:6,8:13,15,18:24]) ;

%% Sample TEGS 1, 11

figure(1)
plot(TEG_WB_experiment_time_min,TEG_exp(:,1),TEG_WB_experiment_time_min,TEG_exp(:,11),'LineWidth',3)
legend('Trauma sample 1','Trauma sample 2');
ax = gca;
ax.FontSize = 20; 
grid on
box on
xlabel('Time [min]')
ylabel('Amplitude [mm]')
% subplot(1,2,1)
% plot(TEG_WB_experiment_time_min,TEG_exp(:,1),TEG_WB_experiment_time_min,TEG_exp(:,11))
% 
% subplot(1,2,2)
% plot(TEG_WB_experiment_time_min,TEG_exp(:,11))

%% Comparing Experimetns Vs. Fits 
tissuefactor=zeros(901,1) ;
tissuefactor(2:8)=10e-9 ;
FontSizeNum=20;
Trauma_Sample={'Trauma sample 1','Trauma sample 2','Trauma sample 3','Trauma sample 4'};
% tissuefactor2=zeros(901,1) ;
% tissuefactor2(1:13)=5e-9 ;
j=1;
for i=1:18 %24
    
    Kn1=WB_Fit_Par(i,1) ;
    Kp1=WB_Fit_Par(i,2) ;
    Kd1=WB_Fit_Par(i,3) ;
    Kn2=WB_Fit_Par(i,4) ;
    Kd2=WB_Fit_Par(i,5) ;
    Kn3=WB_Fit_Par(i,6) ;
    Kp3=WB_Fit_Par(i,7) ;
    Kd3=WB_Fit_Par(i,8) ;
    
    sys_fit= tf(Kn1,[Kp1 1 0],'InputDelay',Kd1) + tf(-Kn2,[1 0 0],'InputDelay',Kd2) + tf(-Kn3,[Kp3 1 0],'InputDelay',Kd3) ;
    
%     Kn1=TEG_WB_Fit_Parameters4(i,1) ;
%     Kp1=TEG_WB_Fit_Parameters4(i,2) ;
%     Kd1=TEG_WB_Fit_Parameters4(i,3) ;
%     Kn3=TEG_WB_Fit_Parameters4(i,4) ;
%     Kp3=TEG_WB_Fit_Parameters4(i,5) ;
%     Kd3=TEG_WB_Fit_Parameters4(i,6) ;
%    
%     sys_fit2= tf(Kn1/7.25,[1 Kp1 0],'InputDelay',Kd1) + tf(-Kn3/7.25,[1 Kp3 0],'InputDelay',Kd3) ;

    T = linspace(0,75,901)';
    
    Y_exp=TEG_exp(:,i) ;
    
%     Y_fit=5e-9*impulse(sys_fit,T) ;
    
    Y_fit=lsim(sys_fit,tissuefactor,T) ;
%     Y_fit2=lsim(sys_fit2,tissuefactor2,T) ;

%     figure (1) 
%     subplot(3,6,i)
%     plot(TEG_WB_experiment_time_min,Y_exp,'k',T,Y_fit,'r','LineWidth',5)
%     grid on 
%     box on
%     legend('Experiment','SDO Fit','location','southeast')
%     xlabel('Time [min]')
%     ylabel('Amplitude [mm]')
%     ylim([0 160])
% if i==2 || i==4 || i==9 || i==10
    figure (2) 
%     subplot(2,2,j)
    subplot(3,6,i)
    plot(TEG_WB_experiment_time_min,Y_exp,'k',T,Y_fit,'r','LineWidth',3)
    grid on 
    box on
%     legend('Experiment','SDO Fit','location','southeast')
    xlabel('Time [min]')
    ylabel('Amplitude [mm]')
    title(['Trauma Sample ',num2str(i)])
%     title(Trauma_Sample{j})
    ylim([0 160])
%     ax = gca;
%     ax.FontSize = 16; 
    grid on
    box on
    figureHandle = gcf;
    set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',FontSizeNum)
%     j=j+1;
% end
%     figureHandle = gcf;
%     set(findall(figureHandle,'type','text'),'fontSize',20)
%     set(gca,'FontSize',15)
    
%     R(i)=RSquaredValue(Y_exp, Y_fit) ;
    
end
mean(R)
legend('Experiment','Estimation','location','southeast','Orientation','Horizontal')
%% potential relationships between the graphs 


parameters={'Kn1','Kp1','Kd1','Kn2','Kd2','Kn3','Kp3','Kd3'} ;
WB_Fit_Par=TEG_WB_Fit_Parameters([1:2,5:6,8:13,17:24],:) ;
for i=1:8 
    figure(i)
    for j=1:8  
        subplot(3,3,j)
        plot(WB_Fit_Par(:,i),WB_Fit_Par(:,j),'o','MarkerSize',5,'MarkerFaceColor','b')
        % s = strcat(parameters(i) , parameters)
        xlabel(parameters(i))
        ylabel(parameters(j))
        hold on
        grid on
        box on
    end
end

WB_Factor=TEG_WB_Factor_Concentration([1:2,5:6,8:13,17:24],:) ;
factors={'II','V','VII','VIII','IX','X','ATIII','PC','Fibrinogen','D-dimer'} ;
for i=1:8 
    figure(i+8)
    for j=1:10  
        subplot(2,5,j)
        plot(WB_Fit_Par(:,i),WB_Factor(:,j),'o','MarkerSize',5,'MarkerFaceColor','b')
        % s = strcat(parameters(i) , parameters)
        xlabel(parameters(i))
        ylabel(factors(j))
        hold on
        grid on
        box on
    end
end