
function CAT_Linearity_v2

clear all;
close all;
clc;

%Large Range TF points

LargeRangeTF = [0.25, 0.5, 0.75, 1, 2.5, 5, 7.5, 10, 15, 20]; %[pM]
LargeRangeTFFine = 0.25:0.25:20;

%Large Range Peak: Manual Entry

%Cols are input TF [pM]: 0.25, 0.5, 0.75, 1, 2.5, 5, 7.5, 10, 15, 20
%Rows are trial (i.e., plate) 1, 2, 3

% 0.25
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','B18:B137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,1),LargeRangePeakIndex(1,1)] = max(CATData);
LargeRangePeakTime(1,1) = CATTime(LargeRangePeakIndex(1,1));
LargeRangeETP(1,1) = trapz(CATTime,CATData);
LargeRangeDelay(1,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','B18:B137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,1),LargeRangePeakIndex(2,1)] = max(CATData);
LargeRangePeakTime(2,1) = CATTime(LargeRangePeakIndex(2,1));
LargeRangeETP(2,1) = trapz(CATTime,CATData);
LargeRangeDelay(2,1) = DetermineDelay(CATTime,CATData);

LargeRangePeak(3,1) = NaN;
LargeRangePeakIndex(3,1) = NaN;
LargeRangePeakTime(3,1) = NaN;
LargeRangeETP(3,1) = NaN;
LargeRangeDelay(3,1) = NaN;

% 0.5
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','C18:C137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,2),LargeRangePeakIndex(1,2)] = max(CATData);
LargeRangePeakTime(1,2) = CATTime(LargeRangePeakIndex(1,2));
LargeRangeETP(1,2) = trapz(CATTime,CATData);
LargeRangeDelay(1,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','C18:C137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,2),LargeRangePeakIndex(2,2)] = max(CATData);
LargeRangePeakTime(2,2) = CATTime(LargeRangePeakIndex(2,2));
LargeRangeETP(2,2) = trapz(CATTime,CATData);
LargeRangeDelay(2,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','B18:B137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,2),LargeRangePeakIndex(3,2)] = max(CATData);
LargeRangePeakTime(3,2) = CATTime(LargeRangePeakIndex(3,2));
LargeRangeETP(3,2) = trapz(CATTime,CATData);
LargeRangeDelay(3,2) = DetermineDelay(CATTime,CATData);

% 0.75
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','D18:D137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,3),LargeRangePeakIndex(1,3)] = max(CATData);
LargeRangePeakTime(1,3) = CATTime(LargeRangePeakIndex(1,3));
LargeRangeETP(1,3) = trapz(CATTime,CATData);
LargeRangeDelay(1,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','D18:D137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,3),LargeRangePeakIndex(2,3)] = max(CATData);
LargeRangePeakTime(2,3) = CATTime(LargeRangePeakIndex(2,3));
LargeRangeETP(2,3) = trapz(CATTime,CATData);
LargeRangeDelay(2,3) = DetermineDelay(CATTime,CATData);

LargeRangePeak(3,3) = NaN;
LargeRangePeakIndex(3,3) = NaN;
LargeRangePeakTime(3,3) = NaN;
LargeRangeETP(3,3) = NaN;
LargeRangeDelay(3,3) = NaN;

% 1
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','E18:E137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,4),LargeRangePeakIndex(1,4)] = max(CATData);
LargeRangePeakTime(1,4) = CATTime(LargeRangePeakIndex(1,4));
LargeRangeETP(1,4) = trapz(CATTime,CATData);
LargeRangeDelay(1,4) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','E18:E137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,4),LargeRangePeakIndex(2,4)] = max(CATData);
LargeRangePeakTime(2,4) = CATTime(LargeRangePeakIndex(2,4));
LargeRangeETP(2,4) = trapz(CATTime,CATData);
LargeRangeDelay(2,4) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','C18:C137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,4),LargeRangePeakIndex(3,4)] = max(CATData);
LargeRangePeakTime(3,4) = CATTime(LargeRangePeakIndex(3,4));
LargeRangeETP(3,4) = trapz(CATTime,CATData);
LargeRangeDelay(3,4) = DetermineDelay(CATTime,CATData);

% 2.5
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','F18:F137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,5),LargeRangePeakIndex(1,5)] = max(CATData);
LargeRangePeakTime(1,5) = CATTime(LargeRangePeakIndex(1,5));
LargeRangeETP(1,5) = trapz(CATTime,CATData);
LargeRangeDelay(1,5) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','F18:F137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,5),LargeRangePeakIndex(2,5)] = max(CATData);
LargeRangePeakTime(2,5) = CATTime(LargeRangePeakIndex(2,5));
LargeRangeETP(2,5) = trapz(CATTime,CATData);
LargeRangeDelay(2,5) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','D18:D137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,5),LargeRangePeakIndex(3,5)] = max(CATData);
LargeRangePeakTime(3,5) = CATTime(LargeRangePeakIndex(3,5));
LargeRangeETP(3,5) = trapz(CATTime,CATData);
LargeRangeDelay(3,5) = DetermineDelay(CATTime,CATData);

% 5
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','G18:G137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,6),LargeRangePeakIndex(1,6)] = max(CATData);
LargeRangePeakTime(1,6) = CATTime(LargeRangePeakIndex(1,6));
LargeRangeETP(1,6) = trapz(CATTime,CATData);
LargeRangeDelay(1,6) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','G18:G137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,6),LargeRangePeakIndex(2,6)] = max(CATData);
LargeRangePeakTime(2,6) = CATTime(LargeRangePeakIndex(2,6));
LargeRangeETP(2,6) = trapz(CATTime,CATData);
LargeRangeDelay(2,6) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','F18:F137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,6),LargeRangePeakIndex(3,6)] = max(CATData);
LargeRangePeakTime(3,6) = CATTime(LargeRangePeakIndex(3,6));
LargeRangeETP(3,6) = trapz(CATTime,CATData);
LargeRangeDelay(3,6) = DetermineDelay(CATTime,CATData);

% 7.5
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','H18:H137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,7),LargeRangePeakIndex(1,7)] = max(CATData);
LargeRangePeakTime(1,7) = CATTime(LargeRangePeakIndex(1,7));
LargeRangeETP(1,7) = trapz(CATTime,CATData);
LargeRangeDelay(1,7) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','H18:H137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,7),LargeRangePeakIndex(2,7)] = max(CATData);
LargeRangePeakTime(2,7) = CATTime(LargeRangePeakIndex(2,7));
LargeRangeETP(2,7) = trapz(CATTime,CATData);
LargeRangeDelay(2,7) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','G18:G137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,7),LargeRangePeakIndex(3,7)] = max(CATData);
LargeRangePeakTime(3,7) = CATTime(LargeRangePeakIndex(3,7));
LargeRangeETP(3,7) = trapz(CATTime,CATData);
LargeRangeDelay(3,7) = DetermineDelay(CATTime,CATData);

% 10
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','I18:I137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,8),LargeRangePeakIndex(1,8)] = max(CATData);
LargeRangePeakTime(1,8) = CATTime(LargeRangePeakIndex(1,8));
LargeRangeETP(1,8) = trapz(CATTime,CATData);
LargeRangeDelay(1,8) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','I18:I137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,8),LargeRangePeakIndex(2,8)] = max(CATData);
LargeRangePeakTime(2,8) = CATTime(LargeRangePeakIndex(2,8));
LargeRangeETP(2,8) = trapz(CATTime,CATData);
LargeRangeDelay(2,8) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','H18:H137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,8),LargeRangePeakIndex(3,8)] = max(CATData);
LargeRangePeakTime(3,8) = CATTime(LargeRangePeakIndex(3,8));
LargeRangeETP(3,8) = trapz(CATTime,CATData);
LargeRangeDelay(3,8) = DetermineDelay(CATTime,CATData);

% 15
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','J18:J137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,9),LargeRangePeakIndex(1,9)] = max(CATData);
LargeRangePeakTime(1,9) = CATTime(LargeRangePeakIndex(1,9));
LargeRangeETP(1,9) = trapz(CATTime,CATData);
LargeRangeDelay(1,9) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','J18:J137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,9),LargeRangePeakIndex(2,9)] = max(CATData);
LargeRangePeakTime(2,9) = CATTime(LargeRangePeakIndex(2,9));
LargeRangeETP(2,9) = trapz(CATTime,CATData);
LargeRangeDelay(2,9) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','J18:J137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,9),LargeRangePeakIndex(3,9)] = max(CATData);
LargeRangePeakTime(3,9) = CATTime(LargeRangePeakIndex(3,9));
LargeRangeETP(3,9) = trapz(CATTime,CATData);
LargeRangeDelay(3,9) = DetermineDelay(CATTime,CATData);

% 20
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','K18:K137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate1','TF_gradient_020514_plate1','A18:A137');
[LargeRangePeak(1,10),LargeRangePeakIndex(1,10)] = max(CATData);
LargeRangePeakTime(1,10) = CATTime(LargeRangePeakIndex(1,10));
LargeRangeETP(1,10) = trapz(CATTime,CATData);
LargeRangeDelay(1,10) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','K18:K137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate2','TF_gradient_020514_plate2','A18:A137');
[LargeRangePeak(2,10),LargeRangePeakIndex(2,10)] = max(CATData);
LargeRangePeakTime(2,10) = CATTime(LargeRangePeakIndex(2,10));
LargeRangeETP(2,10) = trapz(CATTime,CATData);
LargeRangeDelay(2,10) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','L18:L137')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/TF_gradient_plate3','TF_gradient_021114_plate','A18:A137');
[LargeRangePeak(3,10),LargeRangePeakIndex(3,10)] = max(CATData);
LargeRangePeakTime(3,10) = CATTime(LargeRangePeakIndex(3,10));
LargeRangeETP(3,10) = trapz(CATTime,CATData);
LargeRangeDelay(3,10) = DetermineDelay(CATTime,CATData);

%Determine PeakTime - Delay (rise time for thrombin)
LargeRangeRiseTime = LargeRangePeakTime - LargeRangeDelay;

%Compute the Mean and Standard Deviation
LargeRangePeakMean = mean(LargeRangePeak);
LargeRangePeakStdDev = std(LargeRangePeak);

LargeRangeETPMean = mean(LargeRangeETP);
LargeRangeETPStdDev = std(LargeRangeETP);

LargeRangeDelayMean = mean(LargeRangeDelay);
LargeRangeDelayStdDev = std(LargeRangeDelay);

LargeRangeRiseTimeMean = mean(LargeRangeRiseTime);
LargeRangeRiseTimeStdDev = std(LargeRangeRiseTime);

%Account for the Cases with Two Samples
LargeRangePeakMean(1,1) = mean([LargeRangePeak(1,1),LargeRangePeak(2,1)]);
LargeRangePeakMean(1,3) = mean([LargeRangePeak(1,3),LargeRangePeak(2,3)]);
LargeRangePeakStdDev(1,1) = std([LargeRangePeak(1,1),LargeRangePeak(2,1)]);
LargeRangePeakStdDev(1,3) = std([LargeRangePeak(1,3),LargeRangePeak(2,3)]);

LargeRangeETPMean(1,1) = mean([LargeRangeETP(1,1),LargeRangeETP(2,1)]);
LargeRangeETPMean(1,3) = mean([LargeRangeETP(1,3),LargeRangeETP(2,3)]);
LargeRangeETPStdDev(1,1) = std([LargeRangeETP(1,1),LargeRangeETP(2,1)]);
LargeRangeETPStdDev(1,3) = std([LargeRangeETP(1,3),LargeRangeETP(2,3)]);

LargeRangeDelayMean(1,1) = mean([LargeRangeDelay(1,1),LargeRangeDelay(2,1)]);
LargeRangeDelayMean(1,3) = mean([LargeRangeDelay(1,3),LargeRangeDelay(2,3)]);
LargeRangeDelayStdDev(1,1) = std([LargeRangeDelay(1,1),LargeRangeDelay(2,1)]);
LargeRangeDelayStdDev(1,3) = std([LargeRangeDelay(1,3),LargeRangeDelay(2,3)]);

LargeRangeRiseTimeMean(1,1) = mean([LargeRangeRiseTime(1,1),LargeRangeRiseTime(2,1)]);
LargeRangeRiseTimeMean(1,3) = mean([LargeRangeRiseTime(1,3),LargeRangeRiseTime(2,3)]);
LargeRangeRiseTimeStdDev(1,1) = std([LargeRangeRiseTime(1,1),LargeRangeRiseTime(2,1)]);
LargeRangeRiseTimeStdDev(1,3) = std([LargeRangeRiseTime(1,3),LargeRangeRiseTime(2,3)]);

%Determine best fit through the mean
options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);
FitLargeRangePeakMeanCoeffs0 = ones(2,1);
[FitLargeRangePeakMeanCoeffs,resFitLargeRangePeakMeannorm] = lsqcurvefit(@LinearModel,FitLargeRangePeakMeanCoeffs0,LargeRangeTF,LargeRangePeakMean,[],[],options)
LargeRangePeakModel = FitLargeRangePeakMeanCoeffs(1)*LargeRangeTF + FitLargeRangePeakMeanCoeffs(2);

FitLargeRangeRiseTimeMeanCoeffs0 = ones(2,1);
[FitLargeRangeRiseTimeMeanCoeffs,resFitLargeRangeRiseTimeMeannorm] = lsqcurvefit(@LinearModel,FitLargeRangeRiseTimeMeanCoeffs0,LargeRangeTF,LargeRangeRiseTimeMean,[],[],options)
LargeRangeRiseTimeModel = FitLargeRangeRiseTimeMeanCoeffs(1)*LargeRangeTF + FitLargeRangeRiseTimeMeanCoeffs(2);

FitLargeRangeDelayMeanCoeffs0 = ones(2,1);
[FitLargeRangeDelayMeanCoeffs,resFitLargeRangeDelayMeannorm] = lsqcurvefit(@PowerLawModel,FitLargeRangeDelayMeanCoeffs0,LargeRangeTF,LargeRangeDelayMean,[],[],options)
LargeRangeDelayModel = FitLargeRangeDelayMeanCoeffs(1)*LargeRangeTF.^FitLargeRangeDelayMeanCoeffs(2);
LargeRangeDelayModelFine = FitLargeRangeDelayMeanCoeffs(1)*LargeRangeTFFine.^FitLargeRangeDelayMeanCoeffs(2);

FitLargeRangeETPMeanCoeffs0 = 1;
[FitLargeRangeETPMeanCoeffs,resFitLargeRangeETPMeannorm] = lsqcurvefit(@LinearModelNoOffset,FitLargeRangeETPMeanCoeffs0,LargeRangeRiseTimeModel.*LargeRangePeakModel,LargeRangeETPMean,[],[],options)
LargeRangeETPModel = FitLargeRangeETPMeanCoeffs(1)*LargeRangeRiseTimeModel.*LargeRangePeakModel;


%Determine R^2 value of fit
MeanLargeRangePeakMean = mean(LargeRangePeakMean);
SStot_vec = (LargeRangePeakMean - MeanLargeRangePeakMean).^2;
SStot = sum(SStot_vec);
SSres_vec = (LargeRangePeakMean - LargeRangePeakModel).^2;
SSres = sum(SSres_vec);
LargeRangePeakMeanR2 = 1 - SSres/SStot

MeanLargeRangeRiseTimeMean = mean(LargeRangeRiseTimeMean);
SStot_vec = (LargeRangeRiseTimeMean - MeanLargeRangeRiseTimeMean).^2;
SStot = sum(SStot_vec);
SSres_vec = (LargeRangeRiseTimeMean - LargeRangeRiseTimeModel).^2;
SSres = sum(SSres_vec);
LargeRangeRiseTimeMeanR2 = 1 - SSres/SStot

MeanLargeRangeDelayMean = mean(LargeRangeDelayMean);
SStot_vec = (LargeRangeDelayMean - MeanLargeRangeDelayMean).^2;
SStot = sum(SStot_vec);
SSres_vec = (LargeRangeDelayMean - LargeRangeDelayModel).^2;
SSres = sum(SSres_vec);
LargeRangeDelayMeanR2 = 1 - SSres/SStot



%%

%Large Number TF points

LargeNumberTF = [1, 5, 20]; %[pM]
LargeNumberTFFine = 1:0.25:20;

%Large Number Peak: Manual Entry

%Cols are input TF [pM]: 1, 5, 20
%Rows are lot number: 14488, 14489, 14490, 14491, 14492, 14493, 14494, 14495, 14496, 14497, 14498, 14499, 14500, 14501, 14502, 14503, 14504, 14505, 14506, 14507

% 1 pM
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','B54:B173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(1,1),LargeNumberPeakIndex(1,1)] = max(CATData);
LargeNumberPeakTime(1,1) = CATTime(LargeNumberPeakIndex(1,1));
LargeNumberETP(1,1) = trapz(CATTime,CATData);
LargeNumberDelay(1,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','F54:F173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(2,1),LargeNumberPeakIndex(2,1)] = max(CATData);
LargeNumberPeakTime(2,1) = CATTime(LargeNumberPeakIndex(2,1));
LargeNumberETP(2,1) = trapz(CATTime,CATData);
LargeNumberDelay(2,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','J54:J173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(3,1),LargeNumberPeakIndex(3,1)] = max(CATData);
LargeNumberPeakTime(3,1) = CATTime(LargeNumberPeakIndex(3,1));
LargeNumberETP(3,1) = trapz(CATTime,CATData);
LargeNumberDelay(3,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','N54:N173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(4,1),LargeNumberPeakIndex(4,1)] = max(CATData);
LargeNumberPeakTime(4,1) = CATTime(LargeNumberPeakIndex(4,1));
LargeNumberETP(4,1) = trapz(CATTime,CATData);
LargeNumberDelay(4,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','E54:E173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(5,1),LargeNumberPeakIndex(5,1)] = max(CATData);
LargeNumberPeakTime(5,1) = CATTime(LargeNumberPeakIndex(5,1));
LargeNumberETP(5,1) = trapz(CATTime,CATData);
LargeNumberDelay(5,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','B54:B173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(6,1),LargeNumberPeakIndex(6,1)] = max(CATData);
LargeNumberPeakTime(6,1) = CATTime(LargeNumberPeakIndex(6,1));
LargeNumberETP(6,1) = trapz(CATTime,CATData);
LargeNumberDelay(6,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','F54:F173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(7,1),LargeNumberPeakIndex(7,1)] = max(CATData);
LargeNumberPeakTime(7,1) = CATTime(LargeNumberPeakIndex(7,1));
LargeNumberETP(7,1) = trapz(CATTime,CATData);
LargeNumberDelay(7,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','J54:J173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(8,1),LargeNumberPeakIndex(8,1)] = max(CATData);
LargeNumberPeakTime(8,1) = CATTime(LargeNumberPeakIndex(8,1));
LargeNumberETP(8,1) = trapz(CATTime,CATData);
LargeNumberDelay(8,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','N54:N173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(9,1),LargeNumberPeakIndex(9,1)] = max(CATData);
LargeNumberPeakTime(9,1) = CATTime(LargeNumberPeakIndex(9,1));
LargeNumberETP(9,1) = trapz(CATTime,CATData);
LargeNumberDelay(9,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','E54:E173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(10,1),LargeNumberPeakIndex(10,1)] = max(CATData);
LargeNumberPeakTime(10,1) = CATTime(LargeNumberPeakIndex(10,1));
LargeNumberETP(10,1) = trapz(CATTime,CATData);
LargeNumberDelay(10,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','B54:B173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(11,1),LargeNumberPeakIndex(11,1)] = max(CATData);
LargeNumberPeakTime(11,1) = CATTime(LargeNumberPeakIndex(11,1));
LargeNumberETP(11,1) = trapz(CATTime,CATData);
LargeNumberDelay(11,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','F54:F173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(12,1),LargeNumberPeakIndex(12,1)] = max(CATData);
LargeNumberPeakTime(12,1) = CATTime(LargeNumberPeakIndex(12,1));
LargeNumberETP(12,1) = trapz(CATTime,CATData);
LargeNumberDelay(12,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','J54:J173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(13,1),LargeNumberPeakIndex(13,1)] = max(CATData);
LargeNumberPeakTime(13,1) = CATTime(LargeNumberPeakIndex(13,1));
LargeNumberETP(13,1) = trapz(CATTime,CATData);
LargeNumberDelay(13,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','N54:N173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(14,1),LargeNumberPeakIndex(14,1)] = max(CATData);
LargeNumberPeakTime(14,1) = CATTime(LargeNumberPeakIndex(14,1));
LargeNumberETP(14,1) = trapz(CATTime,CATData);
LargeNumberDelay(14,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','E54:E173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(15,1),LargeNumberPeakIndex(15,1)] = max(CATData);
LargeNumberPeakTime(15,1) = CATTime(LargeNumberPeakIndex(15,1));
LargeNumberETP(15,1) = trapz(CATTime,CATData);
LargeNumberDelay(15,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','B54:B173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(16,1),LargeNumberPeakIndex(16,1)] = max(CATData);
LargeNumberPeakTime(16,1) = CATTime(LargeNumberPeakIndex(16,1));
LargeNumberETP(16,1) = trapz(CATTime,CATData);
LargeNumberDelay(16,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','F54:F173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(17,1),LargeNumberPeakIndex(17,1)] = max(CATData);
LargeNumberPeakTime(17,1) = CATTime(LargeNumberPeakIndex(17,1));
LargeNumberETP(17,1) = trapz(CATTime,CATData);
LargeNumberDelay(17,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','J54:J173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(18,1),LargeNumberPeakIndex(18,1)] = max(CATData);
LargeNumberPeakTime(18,1) = CATTime(LargeNumberPeakIndex(18,1));
LargeNumberETP(18,1) = trapz(CATTime,CATData);
LargeNumberDelay(18,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','N54:N173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(19,1),LargeNumberPeakIndex(19,1)] = max(CATData);
LargeNumberPeakTime(19,1) = CATTime(LargeNumberPeakIndex(19,1));
LargeNumberETP(19,1) = trapz(CATTime,CATData);
LargeNumberDelay(19,1) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','E54:E173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(20,1),LargeNumberPeakIndex(20,1)] = max(CATData);
LargeNumberPeakTime(20,1) = CATTime(LargeNumberPeakIndex(20,1));
LargeNumberETP(20,1) = trapz(CATTime,CATData);
LargeNumberDelay(20,1) = DetermineDelay(CATTime,CATData);

% 5 pM
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','C54:C173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(1,2),LargeNumberPeakIndex(1,2)] = max(CATData);
LargeNumberPeakTime(1,2) = CATTime(LargeNumberPeakIndex(1,2));
LargeNumberETP(1,2) = trapz(CATTime,CATData);
LargeNumberDelay(1,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','G54:G173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(2,2),LargeNumberPeakIndex(2,2)] = max(CATData);
LargeNumberPeakTime(2,2) = CATTime(LargeNumberPeakIndex(2,2));
LargeNumberETP(2,2) = trapz(CATTime,CATData);
LargeNumberDelay(2,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','K54:K173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(3,2),LargeNumberPeakIndex(3,2)] = max(CATData);
LargeNumberPeakTime(3,2) = CATTime(LargeNumberPeakIndex(3,2));
LargeNumberETP(3,2) = trapz(CATTime,CATData);
LargeNumberDelay(3,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','O54:O173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(4,2),LargeNumberPeakIndex(4,2)] = max(CATData);
LargeNumberPeakTime(4,2) = CATTime(LargeNumberPeakIndex(4,2));
LargeNumberETP(4,2) = trapz(CATTime,CATData);
LargeNumberDelay(4,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','I54:I173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(5,2),LargeNumberPeakIndex(5,2)] = max(CATData);
LargeNumberPeakTime(5,2) = CATTime(LargeNumberPeakIndex(5,2));
LargeNumberETP(5,2) = trapz(CATTime,CATData);
LargeNumberDelay(5,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','C54:C173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(6,2),LargeNumberPeakIndex(6,2)] = max(CATData);
LargeNumberPeakTime(6,2) = CATTime(LargeNumberPeakIndex(6,2));
LargeNumberETP(6,2) = trapz(CATTime,CATData);
LargeNumberDelay(6,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','G54:G173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(7,2),LargeNumberPeakIndex(7,2)] = max(CATData);
LargeNumberPeakTime(7,2) = CATTime(LargeNumberPeakIndex(7,2));
LargeNumberETP(7,2) = trapz(CATTime,CATData);
LargeNumberDelay(7,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','K54:K173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(8,2),LargeNumberPeakIndex(8,2)] = max(CATData);
LargeNumberPeakTime(8,2) = CATTime(LargeNumberPeakIndex(8,2));
LargeNumberETP(8,2) = trapz(CATTime,CATData);
LargeNumberDelay(8,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','O54:O173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(9,2),LargeNumberPeakIndex(9,2)] = max(CATData);
LargeNumberPeakTime(9,2) = CATTime(LargeNumberPeakIndex(9,2));
LargeNumberETP(9,2) = trapz(CATTime,CATData);
LargeNumberDelay(9,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','I54:I173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(10,2),LargeNumberPeakIndex(10,2)] = max(CATData);
LargeNumberPeakTime(10,2) = CATTime(LargeNumberPeakIndex(10,2));
LargeNumberETP(10,2) = trapz(CATTime,CATData);
LargeNumberDelay(10,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','C54:C173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(11,2),LargeNumberPeakIndex(11,2)] = max(CATData);
LargeNumberPeakTime(11,2) = CATTime(LargeNumberPeakIndex(11,2));
LargeNumberETP(11,2) = trapz(CATTime,CATData);
LargeNumberDelay(11,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','G54:G173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(12,2),LargeNumberPeakIndex(12,2)] = max(CATData);
LargeNumberPeakTime(12,2) = CATTime(LargeNumberPeakIndex(12,2));
LargeNumberETP(12,2) = trapz(CATTime,CATData);
LargeNumberDelay(12,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','K54:K173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(13,2),LargeNumberPeakIndex(13,2)] = max(CATData);
LargeNumberPeakTime(13,2) = CATTime(LargeNumberPeakIndex(13,2));
LargeNumberETP(13,2) = trapz(CATTime,CATData);
LargeNumberDelay(13,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','O54:O173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(14,2),LargeNumberPeakIndex(14,2)] = max(CATData);
LargeNumberPeakTime(14,2) = CATTime(LargeNumberPeakIndex(14,2));
LargeNumberETP(14,2) = trapz(CATTime,CATData);
LargeNumberDelay(14,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','I54:I173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(15,2),LargeNumberPeakIndex(15,2)] = max(CATData);
LargeNumberPeakTime(15,2) = CATTime(LargeNumberPeakIndex(15,2));
LargeNumberETP(15,2) = trapz(CATTime,CATData);
LargeNumberDelay(15,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','C54:C173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(16,2),LargeNumberPeakIndex(16,2)] = max(CATData);
LargeNumberPeakTime(16,2) = CATTime(LargeNumberPeakIndex(16,2));
LargeNumberETP(16,2) = trapz(CATTime,CATData);
LargeNumberDelay(16,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','G54:G173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(17,2),LargeNumberPeakIndex(17,2)] = max(CATData);
LargeNumberPeakTime(17,2) = CATTime(LargeNumberPeakIndex(17,2));
LargeNumberETP(17,2) = trapz(CATTime,CATData);
LargeNumberDelay(17,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','K54:K173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(18,2),LargeNumberPeakIndex(18,2)] = max(CATData);
LargeNumberPeakTime(18,2) = CATTime(LargeNumberPeakIndex(18,2));
LargeNumberETP(18,2) = trapz(CATTime,CATData);
LargeNumberDelay(18,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','O54:O173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(19,2),LargeNumberPeakIndex(19,2)] = max(CATData);
LargeNumberPeakTime(19,2) = CATTime(LargeNumberPeakIndex(19,2));
LargeNumberETP(19,2) = trapz(CATTime,CATData);
LargeNumberDelay(19,2) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','I54:I173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(20,2),LargeNumberPeakIndex(20,2)] = max(CATData);
LargeNumberPeakTime(20,2) = CATTime(LargeNumberPeakIndex(20,2));
LargeNumberETP(20,2) = trapz(CATTime,CATData);
LargeNumberDelay(20,2) = DetermineDelay(CATTime,CATData);

% 20 pM
CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','D54:D173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(1,3),LargeNumberPeakIndex(1,3)] = max(CATData);
LargeNumberPeakTime(1,3) = CATTime(LargeNumberPeakIndex(1,3));
LargeNumberETP(1,3) = trapz(CATTime,CATData);
LargeNumberDelay(1,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','H54:H173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(2,3),LargeNumberPeakIndex(2,3)] = max(CATData);
LargeNumberPeakTime(2,3) = CATTime(LargeNumberPeakIndex(2,3));
LargeNumberETP(2,3) = trapz(CATTime,CATData);
LargeNumberDelay(2,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','L54:L173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(3,3),LargeNumberPeakIndex(3,3)] = max(CATData);
LargeNumberPeakTime(3,3) = CATTime(LargeNumberPeakIndex(3,3));
LargeNumberETP(3,3) = trapz(CATTime,CATData);
LargeNumberDelay(3,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','P54:P173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(4,3),LargeNumberPeakIndex(4,3)] = max(CATData);
LargeNumberPeakTime(4,3) = CATTime(LargeNumberPeakIndex(4,3));
LargeNumberETP(4,3) = trapz(CATTime,CATData);
LargeNumberDelay(4,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','M54:M173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(5,3),LargeNumberPeakIndex(5,3)] = max(CATData);
LargeNumberPeakTime(5,3) = CATTime(LargeNumberPeakIndex(5,3));
LargeNumberETP(5,3) = trapz(CATTime,CATData);
LargeNumberDelay(5,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','D54:D173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(6,3),LargeNumberPeakIndex(6,3)] = max(CATData);
LargeNumberPeakTime(6,3) = CATTime(LargeNumberPeakIndex(6,3));
LargeNumberETP(6,3) = trapz(CATTime,CATData);
LargeNumberDelay(6,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','H54:H173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(7,3),LargeNumberPeakIndex(7,3)] = max(CATData);
LargeNumberPeakTime(7,3) = CATTime(LargeNumberPeakIndex(7,3));
LargeNumberETP(7,3) = trapz(CATTime,CATData);
LargeNumberDelay(7,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','L54:L173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(8,3),LargeNumberPeakIndex(8,3)] = max(CATData);
LargeNumberPeakTime(8,3) = CATTime(LargeNumberPeakIndex(8,3));
LargeNumberETP(8,3) = trapz(CATTime,CATData);
LargeNumberDelay(8,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','P54:P173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(9,3),LargeNumberPeakIndex(9,3)] = max(CATData);
LargeNumberPeakTime(9,3) = CATTime(LargeNumberPeakIndex(9,3));
LargeNumberETP(9,3) = trapz(CATTime,CATData);
LargeNumberDelay(9,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','M54:M173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-11-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(10,3),LargeNumberPeakIndex(10,3)] = max(CATData);
LargeNumberPeakTime(10,3) = CATTime(LargeNumberPeakIndex(10,3));
LargeNumberETP(10,3) = trapz(CATTime,CATData);
LargeNumberDelay(10,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','D54:D173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(11,3),LargeNumberPeakIndex(11,3)] = max(CATData);
LargeNumberPeakTime(11,3) = CATTime(LargeNumberPeakIndex(11,3));
LargeNumberETP(11,3) = trapz(CATTime,CATData);
LargeNumberDelay(11,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','H54:H173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(12,3),LargeNumberPeakIndex(12,3)] = max(CATData);
LargeNumberPeakTime(12,3) = CATTime(LargeNumberPeakIndex(12,3));
LargeNumberETP(12,3) = trapz(CATTime,CATData);
LargeNumberDelay(12,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','L54:L173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(13,3),LargeNumberPeakIndex(13,3)] = max(CATData);
LargeNumberPeakTime(13,3) = CATTime(LargeNumberPeakIndex(13,3));
LargeNumberETP(13,3) = trapz(CATTime,CATData);
LargeNumberDelay(13,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','P54:P173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(14,3),LargeNumberPeakIndex(14,3)] = max(CATData);
LargeNumberPeakTime(14,3) = CATTime(LargeNumberPeakIndex(14,3));
LargeNumberETP(14,3) = trapz(CATTime,CATData);
LargeNumberDelay(14,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','M54:M173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_1','Sheet1','A54:A173');
[LargeNumberPeak(15,3),LargeNumberPeakIndex(15,3)] = max(CATData);
LargeNumberPeakTime(15,3) = CATTime(LargeNumberPeakIndex(15,3));
LargeNumberETP(15,3) = trapz(CATTime,CATData);
LargeNumberDelay(15,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','D54:D173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(16,3),LargeNumberPeakIndex(16,3)] = max(CATData);
LargeNumberPeakTime(16,3) = CATTime(LargeNumberPeakIndex(16,3));
LargeNumberETP(16,3) = trapz(CATTime,CATData);
LargeNumberDelay(16,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','H54:H173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(17,3),LargeNumberPeakIndex(17,3)] = max(CATData);
LargeNumberPeakTime(17,3) = CATTime(LargeNumberPeakIndex(17,3));
LargeNumberETP(17,3) = trapz(CATTime,CATData);
LargeNumberDelay(17,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','L54:L173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(18,3),LargeNumberPeakIndex(18,3)] = max(CATData);
LargeNumberPeakTime(18,3) = CATTime(LargeNumberPeakIndex(18,3));
LargeNumberETP(18,3) = trapz(CATTime,CATData);
LargeNumberDelay(18,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','P54:P173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(19,3),LargeNumberPeakIndex(19,3)] = max(CATData);
LargeNumberPeakTime(19,3) = CATTime(LargeNumberPeakIndex(19,3));
LargeNumberETP(19,3) = trapz(CATTime,CATData);
LargeNumberDelay(19,3) = DetermineDelay(CATTime,CATData);

CATData = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','M54:M173')/1000;
CATTime = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Raw/CAT_plate_3-12-14_plate_2','Sheet1','A54:A173');
[LargeNumberPeak(20,3),LargeNumberPeakIndex(20,3)] = max(CATData);
LargeNumberPeakTime(20,3) = CATTime(LargeNumberPeakIndex(20,3));
LargeNumberETP(20,3) = trapz(CATTime,CATData);
LargeNumberDelay(20,3) = DetermineDelay(CATTime,CATData);

%Determine PeakTime - Delay (rise time for thrombin)
LargeNumberRiseTime = LargeNumberPeakTime - LargeNumberDelay;

%Compute the Mean and Standard Deviation
LargeNumberPeakMean = mean(LargeNumberPeak);
LargeNumberPeakStdDev = std(LargeNumberPeak);

LargeNumberETPMean = mean(LargeNumberETP);
LargeNumberETPStdDev = std(LargeNumberETP);

LargeNumberDelayMean = mean(LargeNumberDelay);
LargeNumberDelayStdDev = std(LargeNumberDelay);

LargeNumberRiseTimeMean = mean(LargeNumberRiseTime);
LargeNumberRiseTimeStdDev = std(LargeNumberRiseTime);

%Determine best fit through the mean
options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);
FitLargeNumberPeakMeanCoeffs0 = ones(2,1);
[FitLargeNumberPeakMeanCoeffs,resFitLargeNumberPeakMeannorm] = lsqcurvefit(@LinearModel,FitLargeNumberPeakMeanCoeffs0,LargeNumberTF,LargeNumberPeakMean,[],[],options)
LargeNumberPeakModel = FitLargeNumberPeakMeanCoeffs(1)*LargeNumberTF + FitLargeNumberPeakMeanCoeffs(2);
LargeNumberPeakModelFine = FitLargeNumberPeakMeanCoeffs(1)*LargeNumberTFFine + FitLargeNumberPeakMeanCoeffs(2);

FitLargeNumberRiseTimeMeanCoeffs0 = ones(2,1);
[FitLargeNumberRiseTimeMeanCoeffs,resFitLargeNumberRiseTimeMeannorm] = lsqcurvefit(@LinearModel,FitLargeNumberRiseTimeMeanCoeffs0,LargeNumberTF,LargeNumberRiseTimeMean,[],[],options)
LargeNumberRiseTimeModel = FitLargeNumberRiseTimeMeanCoeffs(1)*LargeNumberTF + FitLargeNumberRiseTimeMeanCoeffs(2);
LargeNumberRiseTimeModelFine = FitLargeNumberRiseTimeMeanCoeffs(1)*LargeNumberTFFine + FitLargeNumberRiseTimeMeanCoeffs(2);

FitLargeNumberDelayMeanCoeffs0 = ones(2,1);
[FitLargeNumberDelayMeanCoeffs,resFitLargeNumberDelayMeannorm] = lsqcurvefit(@PowerLawModel,FitLargeNumberDelayMeanCoeffs0,LargeNumberTF,LargeNumberDelayMean,[],[],options)
LargeNumberDelayModel = FitLargeNumberDelayMeanCoeffs(1)*LargeNumberTF.^FitLargeNumberDelayMeanCoeffs(2);
LargeNumberDelayModelFine = FitLargeNumberDelayMeanCoeffs(1)*LargeNumberTFFine.^FitLargeNumberDelayMeanCoeffs(2);

FitLargeNumberETPMeanCoeffs0 = 1;
[FitLargeNumberETPMeanCoeffs,resFitLargeNumberETPMeannorm] = lsqcurvefit(@LinearModelNoOffset,FitLargeNumberETPMeanCoeffs0,LargeNumberRiseTimeModel.*LargeNumberPeakModel,LargeNumberETPMean,[],[],options)
LargeNumberETPModel = FitLargeNumberETPMeanCoeffs(1)*LargeNumberRiseTimeModel.*LargeNumberPeakModel;
LargeNumberETPModelFine = FitLargeNumberETPMeanCoeffs(1)*LargeNumberRiseTimeModelFine.*LargeNumberPeakModelFine;

%Determine R^2 value of fit
MeanLargeNumberPeakMean = mean(LargeNumberPeakMean);
SStot_vec = (LargeNumberPeakMean - MeanLargeNumberPeakMean).^2;
SStot = sum(SStot_vec);
SSres_vec = (LargeNumberPeakMean - LargeNumberPeakModel).^2;
SSres = sum(SSres_vec);
LargeNumberPeakMeanR2 = 1 - SSres/SStot

MeanLargeNumberRiseTimeMean = mean(LargeNumberRiseTimeMean);
SStot_vec = (LargeNumberRiseTimeMean - MeanLargeNumberRiseTimeMean).^2;
SStot = sum(SStot_vec);
SSres_vec = (LargeNumberRiseTimeMean - LargeNumberRiseTimeModel).^2;
SSres = sum(SSres_vec);
LargeNumberRiseTimeMeanR2 = 1 - SSres/SStot

MeanLargeNumberDelayMean = mean(LargeNumberDelayMean);
SStot_vec = (LargeNumberDelayMean - MeanLargeNumberDelayMean).^2;
SStot = sum(SStot_vec);
SSres_vec = (LargeNumberDelayMean - LargeNumberDelayModel).^2;
SSres = sum(SSres_vec);
LargeNumberDelayMeanR2 = 1 - SSres/SStot

%Determine line without offset
options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);
FitLinearPeakMeanCoeffs0 = 1;
[FitLinearPeakMeanCoeffs,resFitLinearPeakMeannorm] = lsqcurvefit(@LinearModelNoOffset,FitLinearPeakMeanCoeffs0,LargeNumberTF,LargeNumberPeakMean,[],[],options)
LinearPeakX = 0:20;
LinearPeakModel = FitLinearPeakMeanCoeffs(1)*LinearPeakX;

%Determine horizontal line fits
options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);
FitConstantRiseTimeMeanCoeffs0 = 1;
[FitConstantRiseTimeMeanCoeffs,resFitConstantRiseTimeMeannorm] = lsqcurvefit(@ConstantModel,FitConstantRiseTimeMeanCoeffs0,LargeNumberTF,LargeNumberRiseTimeMean,[],[],options)
ConstantRiseTimeX = 0:20;
ConstantRiseTimeModel = FitConstantRiseTimeMeanCoeffs(1)*ones(length(ConstantRiseTimeX),1);

FitConstantDelayMeanCoeffs0 = 1;
[FitConstantDelayMeanCoeffs,resFitConstantDelayMeannorm] = lsqcurvefit(@ConstantModel,FitConstantDelayMeanCoeffs0,LargeNumberTF,LargeNumberDelayMean,[],[],options)
ConstantDelayX = 0:20;
ConstantDelayModel = FitConstantDelayMeanCoeffs(1)*ones(length(ConstantDelayX),1);




%%
%Plotting

figure(1)
clf

subplot(2,2,1)
hold on 

errorbar(LargeNumberTF,LargeNumberPeakMean,LargeNumberPeakStdDev,'ro','LineWidth',6,'MarkerSize',12)
p1 = plot(LargeNumberTF,LargeNumberPeakModel,'r-.','LineWidth',6,'MarkerSize',12);

p2 = plot(LinearPeakX,LinearPeakModel,'g--','LineWidth',6,'MarkerSize',12);

errorbar(LargeRangeTF,LargeRangePeakMean,LargeRangePeakStdDev,'bo','LineWidth',6,'MarkerSize',12)
p3 = plot(LargeRangeTF,LargeRangePeakModel,'b-','LineWidth',6,'MarkerSize',12);



grid on
box on
axis([0 20.5 0 0.75])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. {\itP} [\muM]')
tC = title('C');
legend([p1 p2 p3],{'20 Normal Plasma Samples', 'No-Offset Fit', '3-Repeats on a Pool'},2)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


%%
subplot(2,2,2)
hold on

errorbar(LargeNumberTF,LargeNumberRiseTimeMean,LargeNumberRiseTimeStdDev,'ro','LineWidth',6,'MarkerSize',12)
p1 = plot(LargeNumberTF,LargeNumberRiseTimeModel,'r-.','LineWidth',6,'MarkerSize',12);

p2 = plot(ConstantRiseTimeX,ConstantRiseTimeModel,'g--','LineWidth',6,'MarkerSize',12);

errorbar(LargeRangeTF,LargeRangeRiseTimeMean,LargeRangeRiseTimeStdDev,'bo','LineWidth',6,'MarkerSize',12)
p3 = plot(LargeRangeTF,LargeRangeRiseTimeModel,'b-','LineWidth',6,'MarkerSize',12);

grid on
box on
axis([0 20.5 0 15])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. {\itT_P}-{\itT} [min]')
tD = title('D');
legend([p1 p2 p3],{'20 Normal Plasma Samples', 'Constant Fit', '3-Repeats on a Pool'},2)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%

subplot(2,2,4)
hold on

errorbar(LargeNumberTF,LargeNumberETPMean,LargeNumberETPStdDev,'ro','LineWidth',6,'MarkerSize',12)
p1 = plot(LargeNumberTFFine,LargeNumberETPModelFine,'r-.','LineWidth',6,'MarkerSize',12);

p2 = plot(LinearPeakX,2*LinearPeakModel'.*ConstantRiseTimeModel,'g--','LineWidth',6,'MarkerSize',12);

errorbar(LargeRangeTF,LargeRangeETPMean,LargeRangeETPStdDev,'bo','LineWidth',6,'MarkerSize',12)
p3 = plot(LargeRangeTF,LargeRangeETPModel,'b-','LineWidth',6,'MarkerSize',12);


grid on
box on
axis([0 20.5 0 5])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. IIa_{\ittot} [\muM min]')
tF = title('F');
legend([p1 p2 p3],{'2 * {\itP} Fit_{20} * {\itT_P}-{\itT} Fit_{20}', '2 * {\itP} Fit_{no-offset} * {\itT_P}-{\itT} Fit_{constant}', '2 * {\itP} Fit_3 * {\itT_P}-{\itT} Fit_3'},2)

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

%%

subplot(2,2,3)
hold on

errorbar(LargeNumberTF,LargeNumberDelayMean,LargeNumberDelayStdDev,'ro','LineWidth',6,'MarkerSize',12)
p1 = plot(LargeNumberTFFine,LargeNumberDelayModelFine,'r-.','LineWidth',6,'MarkerSize',12);

p2 = plot(ConstantDelayX,ConstantDelayModel,'g--','LineWidth',6,'MarkerSize',12);

errorbar(LargeRangeTF,LargeRangeDelayMean,LargeRangeDelayStdDev,'bo','LineWidth',6,'MarkerSize',12)
p3 = plot(LargeRangeTFFine,LargeRangeDelayModelFine,'b-','LineWidth',6,'MarkerSize',12);


grid on
box on
axis([0 20.5 0 17.5])
xlabel('Initial CAT Tissue Factor [pM]')
ylabel('Avg. {\itT} [min]')
tE = title('E');
legend([p1 p2 p3],{'20 Normal Plasma Samples', 'Constant Fit', '3-Repeats on a Pool'},2)


figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)

set(tC, 'FontSize',31, 'FontWeight', 'bold')
set(tD, 'FontSize',31, 'FontWeight', 'bold')
set(tE, 'FontSize',31, 'FontWeight', 'bold')
set(tF, 'FontSize',31, 'FontWeight', 'bold')

return


function OutputEstimate = LinearModel(x,xdata)

OutputEstimate = x(1)*xdata + x(2);

return

function OutputEstimate = LinearModelNoOffset(x,xdata)

OutputEstimate = x(1)*xdata;

return

function OutputEstimate = PowerLawModel(x,xdata)

OutputEstimate = x(1)*xdata.^x(2);

return

function OutputEstimate = ConstantModel(x,xdata)

OutputEstimate = x(1)*ones(1,length(xdata));

return



function Delay = DetermineDelay(Tcheck,MeasuredThrombin)

%first, look for the first data point below half of the thrombin peak

[MaxThrombin,MaxThrombinIndex] = max(MeasuredThrombin);
TimeMaxThrombin = Tcheck(MaxThrombinIndex);

SlopeUpperValueIndex = find(MeasuredThrombin<=0.5*MaxThrombin & Tcheck<=TimeMaxThrombin,1,'last');
SlopeUpperValue = MeasuredThrombin(SlopeUpperValueIndex);
SlopeUpperTime = Tcheck(SlopeUpperValueIndex);

%calculate the slope with the next lower data point
SlopeLowerValue = MeasuredThrombin(SlopeUpperValueIndex-1);
SlopeLowerTime = Tcheck(SlopeUpperValueIndex-1);
Slope = (SlopeUpperValue - SlopeLowerValue)/(SlopeUpperTime-SlopeLowerTime);

%calculate the x-intercept
b = SlopeLowerValue-Slope*SlopeLowerTime;
xintercept = -b/Slope;

if xintercept > 0
    EstimatedThrombinAtIntercept = interp1(Tcheck,MeasuredThrombin,xintercept);

    %calculate parameters for perpendicalar through this x-intercept
    SlopePerp = -1/Slope;
    bPerp = -SlopePerp*xintercept;

    %find a pair of points backwards from the x-intercept that lie on either
    %side of this perpendicular
    found = 0;
    CurrentIndex = find(MeasuredThrombin<=EstimatedThrombinAtIntercept & Tcheck<=TimeMaxThrombin,1,'last');
    while found == 0
        CurrentThrombinValue=MeasuredThrombin(CurrentIndex);
        CurrentPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex)+bPerp;

        if CurrentIndex > 1
            NextThrombinValue = MeasuredThrombin(CurrentIndex-1);
            NextPerpThrombinValue = SlopePerp*Tcheck(CurrentIndex-1)+bPerp;

            if(CurrentThrombinValue <= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex);
            elseif (CurrentThrombinValue >= CurrentPerpThrombinValue && NextThrombinValue < NextPerpThrombinValue)
                found = 1;
                Delay = Tcheck(CurrentIndex-1);
            else
                CurrentIndex = CurrentIndex-1;
            end
        else
            found = 1;
            Delay = Tcheck(CurrentIndex);
        end
    end
else
    Delay = Tcheck(1);
end

return
