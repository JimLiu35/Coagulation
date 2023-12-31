
# Table of Contents

1.  [Background](#org6007541)
2.  [Getting Started](#org98ffaae)
    1.  [Targeted clinical control of trauma patient coagulation through a thrombin dynamics model](#org141d2c8)
    2.  [Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy](#orgcfb80a8)
    3.  [Control of positive systems with an unknown state-dependent power law input delay and input saturation](#orgec4c5d3)
    4.  [Nonlinear dynamic modeling and model predictive control of thrombin generation to treat trauma-induced coagulopathy](#orga308fab)
3.  [Notes for source code](#orgf6bd232)
    1.  [Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy](#org2845ecd)
        1.  [`GCM_Algorithm_for_TIC.m`](#orgbd9506b)



<a id="org6007541"></a>

# Background

To gain the background knowledge about our current research, please read the following paper in order.

1.  [Targeted clinical control of trauma patient coagulation through a thrombin dynamics model](https:www.science.org/doi/10.1126/scitranslmed.aaf5045)
2.  [Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy](https://www.nature.com/articles/s41540-021-00202-9)
3.  [Control of positive systems with an unknown state-dependent power law input delay and input saturation](https:www.sciencedirect.com/science/article/abs/pii/S0005109823000031?via%3Dihub)
4.  [Nonlinear dynamic modeling and model predictive control of thrombin generation to treat trauma-induced coagulopathy](https:onlinelibrary.wiley.com/doi/10.1002/rnc.5963)


<a id="org98ffaae"></a>

# Getting Started

The section severs to install or setup necessary scripts to regenerate plots in the aforementioned publications.


<a id="org141d2c8"></a>

## Targeted clinical control of trauma patient coagulation through a thrombin dynamics model

Comming Soon&#x2026;


<a id="orgcfb80a8"></a>

## Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy

The source code for this paper i.e. GCM Algorithm is on our [SYBORG github repository](https://github.com/SYBORGS-Lab/GCM-Algorithm). There is a detailed README file, but if you want, you can follow the following instructions to get the code and necessary third-party package installed on your local machine.

The detailed notes for the source codes is available here.


<a id="orgec4c5d3"></a>

## Control of positive systems with an unknown state-dependent power law input delay and input saturation

Comming Soon&#x2026;


<a id="orga308fab"></a>

## Nonlinear dynamic modeling and model predictive control of thrombin generation to treat trauma-induced coagulopathy

The SimuLink model is available on our lab&rsquo;s Google Drive. Damon uploaded it to his own research ouputs folder and named the corresponding journal as &ldquo;Journal 4&rdquo;. However, the model on the drive need be converted to a &rsquo;.slx&rsquo; file. Otherwise, SimuLink cannot open it. To do this,

1.  Open MATLAB
2.  In MATLAB command window, navigate to this path `SYBORGS/Research Outputs and Project Data/Member Specific Data and Output/Damon Ghetmiri/MATLAB Codes/Journal 4/Codes/WB TEG/6 Parameters - Updated/WholeBloodTEGModel_6P_B.slx (Unzipped Files)/`;
3.  Then, run `!zip -r journal4_simulink.slx '[Content_Types].xml' _rels metadata simulink`. You can choose your own filename, but I use `journal4_simulink.slx`. Then a slx file should be available to you.
4.  To open this SimuLink Model, simply run `open_system('journal4_simulink.slx')` in the MATLAB command window.


<a id="orgf6bd232"></a>

# Notes for source code

These notes don&rsquo;t detail every line of the source code but provide supplementary comments, omitting certain trivial parts.


<a id="org2845ecd"></a>

## Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy


<a id="orgbd9506b"></a>

### `GCM_Algorithm_for_TIC.m`

-   Max, min and mean CAT profiles for normal plasma samples.  
    The provided code computes the Maximum, Minimum, and Mean CAT profiles, which play a crucial role in establishing the acceptable range for a healthy individual&rsquo;s CAT profile. `tf` function computes the transfer function of the system, and the output Y (`Y_est_Min_Nor, Y_est_Max_Nor, Y_est_Mean_Nor`) is a **impulse response**.
    
        % Mean of Parameters / Max and Min of Fit to Data
        
        sys_est_Min_Nor=tf(Min_ModelParameters_Nor(4),[1 Min_ModelParameters_Nor(3) Min_ModelParameters_Nor(2) Min_ModelParameters_Nor(1)],'InputDelay',Min_ModelParameters_Nor(5));
        sys_est_Max_Nor=tf(Max_ModelParameters_Nor(4),[1 Max_ModelParameters_Nor(3) Max_ModelParameters_Nor(2) Max_ModelParameters_Nor(1)],'InputDelay',Max_ModelParameters_Nor(5));
        sys_est_Mean_Nor=tf(Mean_ModelParameters_Nor(4),[1 Mean_ModelParameters_Nor(3) Mean_ModelParameters_Nor(2) Mean_ModelParameters_Nor(1)],'InputDelay',Mean_ModelParameters_Nor(5));
        
        T2 = linspace(0,42,124)';
        Y_est_Min_Nor = 5*impulse(sys_est_Min_Nor,T2);
        Y_est_Max_Nor = 5*impulse(sys_est_Max_Nor,T2);
        Y_est_Mean_Nor = 5*impulse(sys_est_Mean_Nor,T2);

-   Normal ranges
    
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
    
    1.  This part calculates the ranges for the Peak value, Peak time, Delay time, and the Area under the curve.
    2.  The area is calculated via trapezoidal method, an approximation of integral.
    3.  NOTE: Damon created 4 vectors to store the min, max, and mean values for each model parameters, but the order are not the same. The order for `Range_Peak` is **min &#x2013;> max &#x2013;> mean**, but the order for `Range_T_Peak` is **max &#x2013;> mean &#x2013;> min**. One possible reason is when Peak achieves its minimum value, the time to reach the peak value is at its maximum value.

-   Model parameters initialization
    
        %% CAT Variation with factor recommendation adjustments Sample by sample
        T3 = linspace(0,42,42001)';
        FactorConcentration_History_TraSample=[];
        Factor_tag={'II', 'V', 'VII' , 'IX', 'X', 'VIII', 'ATIII', 'PC'};
        FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; factor_concen_Tra_sample_initial];
    
    The last line of this code block seems decalre a 2x8 matrix, but since the `FactorConcentration_History_TraSample` is declared as `[]` i.e. empty. Thus, at current stage, this matrix is only a 1x8 vector containing all initial factor concentrations of the trauma patient, i.e. `factor_concen_Tra_sample_initial`.

-   QUESTION: Why do we need to half the factor VIII concentration if it exceeds 400?
    
        %STEP 1: Correct factor V to normal range
        if FactorConcentration_History_TraSample(1,6)>400
            FactorConcentration_History_TraSample(1,6)=FactorConcentration_History_TraSample(1,6)/2;
        end
-   Step 3 to 6, adjust individual factor concentration. Code for these steps are almost the same. The only difference lies in which model parameters are used to polyfit against the factor concentrations.
    
        %STEP 3: adjusting factor II to correct peak
        
        j=1; %Factor II
        Factor_Tra_changes_treat={};
        
        factor_concen_Tra_sample=FactorConcentration_History_TraSample(end,:);
        Delta_parameter=factor_concen_Tra_sample(j)/10 ;
        
        %Estimate the CAT model using the update coagulation factor set
        Trau_1_coeff=factor_concen_Tra_sample*factor_coeff_All_Train+const_All_Train;
        sys_est_change_Tra1=tf(Trau_1_coeff(4),[1 Trau_1_coeff(3) Trau_1_coeff(2) Trau_1_coeff(1)],'InputDelay',Trau_1_coeff(5));
        
        Y_est_change_Tra= 5*impulse(sys_est_change_Tra1,T3);
        [Y_est_change_Tra_peak,i_m]=max(Y_est_change_Tra);
        T_est_change_Tra_peak= T3(i_m) ;
        AreaUnderCurve= trapz(T3,Y_est_change_Tra ) ;
        DelayCurve=DetermineDelayTherapy(T3,Y_est_change_Tra);
        
        Factor_Tra_changes_treat{1,j}=[factor_concen_Tra_sample(j) Y_est_change_Tra_peak T_est_change_Tra_peak AreaUnderCurve DelayCurve];
    
    First of all, Damon created an empty cell array `Factor_Tra_changes_treat`, this cell array will contain all important model parameters associated with changing one factor concentration. For example, in Step 3 we are adjusting factor II, and thus the current factor II&rsquo;s concentration with all system parameters, Peak, Peak Time, Area, Time Delay, will be filled into this cell array, i.e. `Factor_Tra_changes_treat{1,j}`. This is what the last line of code in this block means.  
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-right" />
    </colgroup>
    
    <colgroup>
    <col  class="org-left" />
    </colgroup>
    
    <colgroup>
    <col  class="org-left" />
    </colgroup>
    
    <colgroup>
    <col  class="org-left" />
    </colgroup>
    
    <colgroup>
    <col  class="org-left" />
    </colgroup>
    <thead>
    <tr>
    <th scope="col" class="org-right">Factor Concentration</th>
    <th scope="col" class="org-left">Peak</th>
    <th scope="col" class="org-left">Peak Time</th>
    <th scope="col" class="org-left">Area Under the Curve</th>
    <th scope="col" class="org-left">Time Delay</th>
    </tr>
    </thead>
    
    <tbody>
    <tr>
    <td class="org-right">Original</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">-10%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">+10%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">-20%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">+20%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">-30%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">+30%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">-40%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">+40%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">-50%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-right">+50%</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    </tbody>
    </table>
    
      
    After declared this empty cell array, he get the latest concentration values for all factors and then calculate the increment (i.e. 10% of the current factor concentrations).  
      
    Next, he did a linear mapping from patient&rsquo;s current factor concentrations to a set of estimated coefficients, $[K_{0}, K_{1}, K_{2}, K_{n}, K_{d}]$, to generate an updated system transfer function.  
      
    Then, find the impulse response of this new transfer function.
    
        % Forming the mappifng function from factor concentration to graph parameter
        
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
    
    This `for` loop corresponds to the GCM tuning process. It starting from -50% to +50% with 10% increments. Two important notes:
    
    1.  This tuning process is not going sequentially. In other words, it is not proceeding as -50%, -40%, &#x2026; +40%, + 50%. Instead, it jumps from -10% to +10%, then -20% to +20%, and so on.
    2.  Damon reset the `factor_concen_Tra_sample` vector for every single loop. He did this because when he re-estimated the system&rsquo;s transfer function, he changed the corresponding factor concentration in `factor_concen_Tra_sample`. As the new factor concentration in the next iteration was based upon the original value, he had to reset the vector whenever a new iteration started.
        
            Factor_Tra_changes_treat_Mat=cell2mat(Factor_Tra_changes_treat);
            factor_param_fit=polyfit(Factor_Tra_changes_treat_Mat(:,2),Factor_Tra_changes_treat_Mat(:,1),2); %a second order polynomial from peak to factor II
            recommend_factor_update=min(max(60, polyval(factor_param_fit, Range_Peak(2))),140);
            
            FactorConcentration_History_TraSample=[FactorConcentration_History_TraSample; FactorConcentration_History_TraSample(end,:)];
            FactorConcentration_History_TraSample(end,j)=recommend_factor_update;
        
        Since the most significant impacts on the CAT Peak arise from changes in factor II, Damon chose to fit the factor II concentrations using a 2nd order polynomial against the peak values, i.e. `polyfit(X, Y, N) = polyfit(peak_values, factorII_concen, 2)`. Then, by given the mean value of peak (i.e. `Range_Peak(2)`), the `polyval` function outputs the corresponding factor II concentration to achieve the mean peak value. Finally, compare the `polyval` output with the boundaries (60 and 140), and update the recommend factor concentration.
-   QUESTION: Step 4 adjusts factor X. Similar to step 3, Damon fits the factor X concentrations using a 2nd order polynomial against the peak values. However, in paper, Damon claimed that factor X supplement the peak correct of factor II coz it may be saturated. It also compensates the peak time and affects the time delay. The algorithm does neither manifest when factor II will be saturated nor does it consider the impacts factor X have on peak time and time delay. In addition, the step 4 title, `%STEP 4: adding factor X to correct peak and peak time`, specifically states peak-time correction, but nothing in this part of code related to peak time! **This problem may be trivial but it does not make sense!**
-   QUESTION: After step 6, Damon re-adjust the factor II? Why??? Mistake?
-   Step 7 (optional) additional adjustment
    First of all, Damon regenerated the normal systems&rsquo; impulse responses, namely `Y_est_Min_Nor_Comparison`, `Y_est_Max_Nor_Comparison`, and `Y_est_Mean_Nor_Comparison`. Instead of using T2, this time he used T3. They share the same time range but different resolutions. Then he recalculated the ranges for the four model parameters.   
      
    Next, he got the latest estimated CAT profile based on the recommended factor concentrations obtained after step 6.  
      
    With both normal and recommended profiles, he initiated a comparing process to check the necessities of adjusting factor ATIII and Protein C. Here is the corresponding code block.
    
        % Identify if peak is in the range
        if Peak_current_Tra>Range_Peak(3)
            Current_CAT_Peak_Indicator=1; % Exceed the normal range
        elseif Range_Peak(1)>Peak_current_Tra
            Current_CAT_Peak_Indicator=-1; % Below the normal range
        else
            Current_CAT_Peak_Indicator=0; % Within the normal range
        end
        % Identify if tail (between 10 and 20 minutes) is in the range
        if mean(Y_est_current_Tra(12500:22500)-Y_est_Max_Nor_Comparison(12500:22500))>0
            Current_CAT_Tail_Indicator=1;
        elseif mean(Y_est_current_Tra(8000:18000)-Y_est_Min_Nor_Comparison(8000:18000))<0
            Current_CAT_Tail_Indicator=-1;
        else
            Current_CAT_Tail_Indicator=0;
        end
    
    Here arise a QUESTION. In the paper, Damon said in step 7, the decision was made based upon two model parameters, Peak and Thrombin potential (area under the curve). Instead of using area, he used the impulse responses from time step 12500 to 22500. Why not just using the `trapz` function to directly calculate the area?   
      
    If additional adjustments are required, figuring out which factor we&rsquo;d like to change follows next.
    
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

