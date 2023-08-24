% TEG Whole blood curve estimation  

%% DATA Importation 
% clear 
% clc
tic
TEG_WB_experiment_data=xlsread('Trauma_WholeBloodTEG_data',1,'B2:Y902') ;
TEG_WB_experiment_time_sec=xlsread('Trauma_WholeBloodTEG_data',1,'A2:A902') ;
TEG_WB_experiment_time_min = TEG_WB_experiment_time_sec ./ 60 ;

TEG_WB_Fit_Parameters=xlsread('Trauma_WholeBloodTEG_3piece_Fits_Parameters',1,'B2:I25') ;
TEG_WB_Factor_Concentration=xlsread('Trauma_WholeBloodTEG_3piece_Fits_Parameters',1,'J2:S25') ;

WB_Fit_Par=TEG_WB_Fit_Parameters([1:2,5:6,8:13,15,18:24],:) ;
WB_Factors=TEG_WB_Factor_Concentration([1:2,5:6,8:13,15,18:24],:) ;
TEG_exp = TEG_WB_experiment_data(:,[1:2,5:6,8:13,15,18:24]) ;

% WB_Fit_Par=TEG_WB_Fit_Parameters ;
% WB_Factors=TEG_WB_Factor_Concentration;
% TEG_exp = TEG_WB_experiment_data ;

for k=1:8  
    param=WB_Fit_Par(:,k);
    
    if k==1
        param=param./1e10;
    elseif k==4
        param=param./1e7 ;
    elseif k==6
        param=param./1e9 ;
    end
    
%         %NON-GREEDY Method
%     fit_param_sorted=pinv(WB_Factors)*param ;
%     const_NGree(1,k)=0 ;
%     factor_coeff_NGree(:,k)=fit_param_sorted ;   
        
        % GREEDY Method
    [res,fit_param_factor_chosen,i_chosen, Factor_tag, fit_param_sorted] = TEG_Prediction(WB_Factors,param) ;
    const_G(1,k)=fit_param_factor_chosen(1) ;
    factor_coeff_G(:,k)=fit_param_sorted ;

end
toc
%% Model construction and plot : Fits, Damon model: ?

tissuefactor=zeros(901,1) ;
tissuefactor(2:8)=10e-9 ;
Trauma_Sample={'Trauma sample 1','Trauma sample 2','Trauma sample 3','Trauma sample 4'};
FontSizeNum=15;
j=1;
for i=1:18 %Samples 
   
    factor_concen=WB_Factors(i,1:10);  

%     ks_est_NG=factor_concen*factor_coeff_NGree+const_NGree;
    ks_est_G=factor_concen*factor_coeff_G+const_G;
    
%     sys_est_NG= tf(ks_est_NG(1)*1e10,[ks_est_NG(2) 1 0],'InputDelay',ks_est_NG(3)) + tf(-ks_est_NG(4)*1e7,[1 0 0],'InputDelay',ks_est_NG(5)) + tf(-ks_est_NG(6)*1e9,[ks_est_NG(7) 1 0],'InputDelay',ks_est_NG(8)) ;
    sys_est_G= tf(ks_est_G(1)*1e10,[ks_est_G(2) 1 0],'InputDelay',ks_est_G(3)) + tf(-ks_est_G(4)*1e7,[1 0 0],'InputDelay',ks_est_G(5)) + tf(-ks_est_G(6)*1e9,[ks_est_G(7) 1 0],'InputDelay',ks_est_G(8)) ;
    sys_est_G2= tf(ks_est_G(1)*1e10,[ks_est_G(2) 1 0],'InputDelay',ks_est_G(3)) + tf(-ks_est_G(6)*1e9,[ks_est_G(7) 1 0],'InputDelay',ks_est_G(8)) ;
    
    T = linspace(0,75,901)';
    
    Y_exp = TEG_exp(:,i) ;
    [Y_exp_peak,i_m]=max(Y_exp);
    T_exp_peak= TEG_WB_experiment_time_min(i_m) ;
    
%     Y_fit = 5*impulse(sys_fit,T);
%     [Y_fit_peak,i_m]=max(Y_fit);
%     T_fit_peak= T(i_m) ;
    
    
%     Y_est =lsim(sys_est,tissuefactor,T) ;
%     [Y_est_peak,i_m]=max(Y_est);
%     T_est_peak= T(i_m) ;
    
%     Y_est_NG=lsim(sys_est_NG,tissuefactor,T) ;
%     [Y_est_NG_peak,i_m]=max(Y_est_NG);
%     T_est_NG_peak= T(i_m) ;
    
    Y_est_G=lsim(sys_est_G,tissuefactor,T) ;
    [Y_est_G_peak,i_m]=max(Y_est_G);
    T_est_G_peak= T(i_m) ;

    Yest2=lsim(sys_est_G2,tissuefactor,T) ;
    
    Y_peak(i,1)= Y_exp_peak ;
    Y_peak(i,2)= Y_est_G_peak ;
%     
    T_peak(i,1)= T_exp_peak ;
    T_peak(i,2)= T_est_G_peak ;
    
    T_delay(i,1)= DetermineDelay(TEG_WB_experiment_time_min, Y_exp) ;
    T_delay(i,2)= DetermineDelay(T, Y_est_G) ;
%     C_area(i,1)= trapz(CAT_measurements_time ,Y_exp ) ;
%     C_area(i,2)= trapz(T,Y_est ) ;

    for e=1:901
        if Y_est_G(e)<0
            Y_est_G(e)=0 ;
        end
    end
    
%     if i==2 || i==4 || i==9 || i==10
%         figure (1) 
%         subplot(2,2,j)
%         
%         plot(TEG_WB_experiment_time_min,Y_exp,'k','LineWidth',4)
%         hold on
%         plot(T,Y_est_G,'color',[0 0.4470 0.7410],'LineWidth',4)
%         grid on 
%         box on
%         legend('TEG experiment','TEG estimation','location','southeast')
%         xlabel('Time [min]')
%         ylabel('Amplitude [mm]')
%         ylim([0 160])
%         ax = gca;
%         ax.FontSize = 16; 
%         title(Trauma_Sample{j})
%         grid on
%         box on
%         
%         j=j+1;
%     end
    
figure (2) 
    subplot(3,6,i)
    plot(TEG_WB_experiment_time_min,Y_exp,'k','LineWidth',4)
    hold on
    plot(T,Y_est_G,'color',[0 0.4470 0.7410],'LineWidth',4)
    plot(T,Yest2,'color','r','LineWidth',4)
    grid on 
    box on
    xlabel('Time [min]')
    ylabel('Amplitude [mm]')
    title(['Trauma Sample ',num2str(i)])
    ylim([0 160])
    xlim([0 60])
    figureHandle = gcf;
    set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
    set(gca,'FontName','Helvetica','FontSize',FontSizeNum)
        
        end
    legend('Experiment','Estimation','location','southeast','Orientation','Horizontal')

    
    
%  for i=1:3
%    if i==1
% %       Fit_error(:,i) = abs((Y_peak(:,2)-Y_peak(:,1))./Y_peak(:,1)) *100 ;
%       Est_G_error(:,i) = abs((Y_peak(:,2)-Y_peak(:,1))./Y_peak(:,1)) *100;
% 
%    elseif i==2
% %       Fit_error(:,i) = abs((T_peak(:,2)-T_peak(:,1))./T_peak(:,1)) *100 ;
%       Est_G_error(:,i) = abs((T_peak(:,2)-T_peak(:,1))./T_peak(:,1)) *100;
% 
%    else
% %       Fit_error(:,i) = abs((T_delay(:,2)-T_delay(:,1))./T_delay(:,1)) *100;
%       Est_G_error(:,i) = abs((T_delay(:,2)-T_delay(:,1))./T_delay(:,1)) *100;
% 
%    end
%     
%  end
% 
%  error={'Max Amplitude';'MA Time';'Delay Time'};
% % Fit_error_m = mean(Fit_error,1)  ;
% Est_G_error_m=mean(Est_G_error,1)  ;
% 
% % format short
% T1=table(error,Est_G_error_m') 