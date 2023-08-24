% TEG Whole blood curve estimation  

%% DATA Importation 
clear 
clc

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
    
    if k==1
            WB_Fit_Par(:,k)=WB_Fit_Par(:,k)./1e10;
        elseif k==4
            WB_Fit_Par(:,k)=WB_Fit_Par(:,k)./1e7 ;
        elseif k==6
            WB_Fit_Par(:,k)=WB_Fit_Par(:,k)./1e9 ;
    end
        
    for q=1:5 
    
        if q==1
        Train_factor=WB_Factors([4:18],:);
        Val_factor=WB_Factors([1:3],:);
        Train_fits=WB_Fit_Par([4:18],:);
        Val_fits=WB_Fit_Par([1:3],:);

        elseif q==5

        Train_factor=WB_Factors([1:15],:);
        Val_factor=WB_Factors([16:18],:);
        Train_fits=WB_Fit_Par([1:15],:);
        Val_fits=WB_Fit_Par([16:18],:);

        else

        Train_factor=WB_Factors([1:4*q-5,4*q:end],:);
        Val_factor=WB_Factors([4*q-4:4*q-1],:);
        Train_fits=WB_Fit_Par([1:4*q-5,4*q:end],:);
        Val_fits=WB_Fit_Par([4*q-4:4*q-1],:);

        end
        
        
        % GREEDY Method
        param=Train_fits(:,k) ;
        [res,fit_param_factor_chosen,i_chosen, fit_param_sorted] = GreedyLSQ(Train_factor,param) ;
        const_G=fit_param_factor_chosen(1) ;
%         factor_coeff_G(:,k)=fit_param_sorted ;
%         factor_concen=Val_factor; 
%         factor_concen=Train_factor(1:4,:); 
%         Ks_est_5([4*q-4,4*q],k)=factor_concen*fit_param_sorted+const_G;
        
        if q==1
            
        factor_concen=Train_factor(1:3,:); 
        Ks_est_5([1:3],k)=factor_concen*fit_param_sorted+const_G;
        
        elseif q==5
        factor_concen=Train_factor(1:3,:); 
        Ks_est_5([16:18],k)=factor_concen*fit_param_sorted+const_G;
        
        else
        factor_concen=Train_factor(1:4,:); 
        Ks_est_5([4*q-4:4*q-1],k)=factor_concen*fit_param_sorted+const_G;
        end
        
    end
    
end

%% Model construction and plot : Fits, Damon model: ?
    
tissuefactor=zeros(901,1) ;
tissuefactor(2:8)=10e-9 ;


for i=1:18 %Samples 
   
    ks_est_G=Ks_est_5(i,:) ;
   
    sys_est_G= tf(ks_est_G(1)*1e10,[ks_est_G(2) 1 0],'InputDelay',ks_est_G(3)) + tf(-ks_est_G(4)*1e7,[1 0 0],'InputDelay',ks_est_G(5)) + tf(-ks_est_G(6)*1e9,[ks_est_G(7) 1 0],'InputDelay',ks_est_G(8)) ;
    
    T = linspace(0,75,901)';
    
    Y_exp = TEG_exp(:,i) ;
    [Y_exp_peak,i_m]=max(Y_exp);
    T_exp_peak= TEG_WB_experiment_time_min(i_m) ;

    Y_est_G=lsim(sys_est_G,tissuefactor,T) ;
    [Y_est_G_peak,i_m]=max(Y_est_G);
    T_est_G_peak= T(i_m) ;

    Y_peak(i,1)= Y_exp_peak ;
    Y_peak(i,2)= Y_est_G_peak ;
     
    T_peak(i,1)= T_exp_peak ;
    T_peak(i,2)= T_est_G_peak ;
    
    T_delay(i,1)= DetermineDelay(TEG_WB_experiment_time_min, Y_exp) ;
    T_delay(i,2)= DetermineDelay(T, Y_est_G) ;

    for e=1:901
        if Y_est_G(e)<0
            Y_est_G(e)=0 ;
        end
    end
    
    R(i)=RSquaredValue(Y_exp, Y_est_G) ;
    mean(R)

%     figure (1) 
%     subplot(5,7,i)
%     plot(CAT_measurements_time,Y_exp,'k',T,Y_fit,'r','LineWidth',5)
%     grid on 
%     legend('Exp','Fit')
%     xlabel('Time [min]')
%     ylabel('Thrombin [\mum]')
%     title(Slabel(Scount))
%     ylim([0 500])
%     figureHandle = gcf;
%     set(findall(figureHandle,'type','text'),'fontSize',20)
%     set(gca,'FontSize',15)
    
%     figure (5)
%     plot(TEG_WB_experiment_time_min,Y_exp,'LineWidth',3)
%     hold on
%     grid on 
%     xlabel('Time [min]')
%     ylabel('amplitude [mm]')
    
    
%     figure (2) 
%     subplot(3,6,i)
%     plot(TEG_WB_experiment_time_min,Y_exp,'k',T,Y_est_G,'g','LineWidth',5)
%     grid on 
%     ylim([0 160])
%     legend('Experiment','Estimation','location','southeast')
%     xlabel('Time [min]')
%     ylabel('amplitude [mm]')
%     figureHandle = gcf;
%     set(findall(figureHandle,'type','text'),'fontSize',20)
%     set(gca,'FontSize',15)

    
end
    
    
 for i=1:3
   if i==1
%       Fit_error(:,i) = abs((Y_peak(:,2)-Y_peak(:,1))./Y_peak(:,1)) *100 ;
      Est_G_error(:,i) = abs((Y_peak(:,2)-Y_peak(:,1))./Y_peak(:,1)) *100;

   elseif i==2
%       Fit_error(:,i) = abs((T_peak(:,2)-T_peak(:,1))./T_peak(:,1)) *100 ;
      Est_G_error(:,i) = abs((T_peak(:,2)-T_peak(:,1))./T_peak(:,1)) *100;

   else
%       Fit_error(:,i) = abs((T_delay(:,2)-T_delay(:,1))./T_delay(:,1)) *100;
      Est_G_error(:,i) = abs((T_delay(:,2)-T_delay(:,1))./T_delay(:,1)) *100;

   end
    
 end

 error={'Max Amplitude';'MA Time';'Delay Time'};
% Fit_error_m = mean(Fit_error,1)  ;
Est_G_error_m=mean(Est_G_error,1)  ;
Est_G_error_m1 = mean(Est_G_error(1:2,:),1)  ;
Est_G_error_m2 = mean(Est_G_error(3:4,:),1)  ;
Est_G_error_m3 = mean(Est_G_error(5:6,:),1)  ;
Est_G_error_m4 = mean(Est_G_error(7:8,:),1)  ;
Est_G_error_m5 = mean(Est_G_error(9:10,:),1)  ;
% 
% format short
T1=table(error,Est_G_error_m1',Est_G_error_m2',Est_G_error_m3',Est_G_error_m4',Est_G_error_m5',Est_G_error_m') 