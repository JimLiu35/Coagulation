
# Table of Contents

1.  [Background](#orgd9d4854)
2.  [Getting Started](#org6fd747d)
    1.  [Targeted clinical control of trauma patient coagulation through a thrombin dynamics model](#org30a1025)
    2.  [Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy](#org96636d3)
    3.  [Control of positive systems with an unknown state-dependent power law input delay and input saturation](#org5f85da4)
    4.  [Nonlinear dynamic modeling and model predictive control of thrombin generation to treat trauma-induced coagulopathy](#org17fe297)
3.  [Notes for source code](#orgc4db193)
    1.  [Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy](#orgb0bbfa5)
        1.  [`GCM_Algorithm_for_TIC.m`](#org81057a8)



<a id="orgd9d4854"></a>

# Background

To gain the background knowledge about our current research, please read the following paper in order.

1.  [Targeted clinical control of trauma patient coagulation through a thrombin dynamics model](https:www.science.org/doi/10.1126/scitranslmed.aaf5045)
2.  [Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy](https://www.nature.com/articles/s41540-021-00202-9)
3.  [Control of positive systems with an unknown state-dependent power law input delay and input saturation](https:www.sciencedirect.com/science/article/abs/pii/S0005109823000031?via%3Dihub)
4.  [Nonlinear dynamic modeling and model predictive control of thrombin generation to treat trauma-induced coagulopathy](https:onlinelibrary.wiley.com/doi/10.1002/rnc.5963)


<a id="org6fd747d"></a>

# Getting Started

The section severs to install or setup necessary scripts to regenerate plots in the aforementioned publications.


<a id="org30a1025"></a>

## Targeted clinical control of trauma patient coagulation through a thrombin dynamics model

Comming Soon&#x2026;


<a id="org96636d3"></a>

## Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy

The source code for this paper i.e. GCM Algorithm is on our [SYBORG github repository](https://github.com/SYBORGS-Lab/GCM-Algorithm). There is a detailed README file, but if you want, you can follow the following instructions to get the code and necessary third-party package installed on your local machine.

The detailed notes for the source codes is available here.


<a id="org5f85da4"></a>

## Control of positive systems with an unknown state-dependent power law input delay and input saturation

Comming Soon&#x2026;


<a id="org17fe297"></a>

## Nonlinear dynamic modeling and model predictive control of thrombin generation to treat trauma-induced coagulopathy

The SimuLink model is available on our lab&rsquo;s Google Drive. Damon uploaded it to his own research ouputs folder and named the corresponding journal as &ldquo;Journal 4&rdquo;. However, the model on the drive need be converted to a &rsquo;.slx&rsquo; file. Otherwise, SimuLink cannot open it. To do this,

1.  Open MATLAB
2.  In MATLAB command window, navigate to this path `SYBORGS/Research Outputs and Project Data/Member Specific Data and Output/Damon Ghetmiri/MATLAB Codes/Journal 4/Codes/WB TEG/6 Parameters - Updated/WholeBloodTEGModel_6P_B.slx (Unzipped Files)/`;
3.  Then, run `!zip -r journal4_simulink.slx '[Content_Types].xml' _rels metadata simulink`. You can choose your own filename, but I use `journal4_simulink.slx`. Then a slx file should be available to you.
4.  To open this SimuLink Model, simply run `open_system('journal4_simulink.slx')` in the MATLAB command window.


<a id="orgc4db193"></a>

# Notes for source code

These notes does not explain every single line of the source codes. They serve as complementary comments so that some trival parts are not included!


<a id="orgb0bbfa5"></a>

## Personalized modulation of coagulation factors using a thrombin dynamics model to treat trauma-induced coagulopathy


<a id="org81057a8"></a>

### `GCM_Algorithm_for_TIC.m`

-   Max, min and mean CAT profiles for normal plasma samples.
    
        % Mean of Parameters / Max and Min of Fit to Data
        
        sys_est_Min_Nor=tf(Min_ModelParameters_Nor(4),[1 Min_ModelParameters_Nor(3) Min_ModelParameters_Nor(2) Min_ModelParameters_Nor(1)],'InputDelay',Min_ModelParameters_Nor(5));
        sys_est_Max_Nor=tf(Max_ModelParameters_Nor(4),[1 Max_ModelParameters_Nor(3) Max_ModelParameters_Nor(2) Max_ModelParameters_Nor(1)],'InputDelay',Max_ModelParameters_Nor(5));
        sys_est_Mean_Nor=tf(Mean_ModelParameters_Nor(4),[1 Mean_ModelParameters_Nor(3) Mean_ModelParameters_Nor(2) Mean_ModelParameters_Nor(1)],'InputDelay',Mean_ModelParameters_Nor(5));
        
        T2 = linspace(0,42,124)';
        Y_est_Min_Nor = 5*impulse(sys_est_Min_Nor,T2);
        Y_est_Max_Nor = 5*impulse(sys_est_Max_Nor,T2);
        Y_est_Mean_Nor = 5*impulse(sys_est_Mean_Nor,T2);

