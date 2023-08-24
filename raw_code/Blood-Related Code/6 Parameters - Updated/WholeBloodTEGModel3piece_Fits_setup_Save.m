clear ;
clc 

TEGdata=xlsread('Trauma_WholeBloodTEG_data',1,'B2:Y902') ;
TEGtime=xlsread('Trauma_WholeBloodTEG_data',1,'A2:A902') ;
TEGtime=TEGtime./60 ;

tissuefactor=zeros(901,1) ;
tissuefactor(1:13)=5e-9 ;


%% Step 1 preparing for SDO 

i=15 ; %Number of sample 

% Kp1 = 5  ;
% Kn1= 2.5e10 ; 
% Kd1 = 2  ; 
% Kn2 = 5e7 ;
% Kd2 = 30 ;
% Kn3= 2.5e10 ;
% Kp3= 5 ;
% Kd3= 35 ;

Kp1 = .2  ;
Kn1= 5e9 ; 
Kd1 = 2  ; 
Kn2 = 5e7 ;
Kd2 = 30 ;
% Kp2= .2 ;
Kn3= 5e9 ;
Kp3= .2 ;
Kd3= 40 ;

TEGy=TEGdata(:,i) ;

output=[TEGtime TEGy] ;
input = [TEGtime tissuefactor] ;



%% Step 2 - Saving the STO fit results 

FourthTEG_ModelFits(i,1)= Kp1 ;
FourthTEG_ModelFits(i,2)= Kn1 ;
FourthTEG_ModelFits(i,3)= Kd1 ;
FourthTEG_ModelFits(i,4)= Kn2 ;
FourthTEG_ModelFits(i,5)= Kd2 ;
FourthTEG_ModelFits(i,6)= Kn3 ;
FourthTEG_ModelFits(i,7)= Kp3 ;
FourthTEG_ModelFits(i,8)= Kd3 ;