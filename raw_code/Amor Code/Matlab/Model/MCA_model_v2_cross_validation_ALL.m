function MCA_model_v2_cross_validation_ALL

%input data

clear all
close all
clc

format long e

%%

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','B2:M21');
MCADataValues = [MCADataValues;xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','B2:M41')];

k0 = MCADataValues(:,1);
k1 = MCADataValues(:,2);
k2 = MCADataValues(:,3);
kn = MCADataValues(:,4);
kd = MCADataValues(:,5);

K = kn./k0/100;

II_0 = MCADataValues(:,6);
V_0 = MCADataValues(:,7);
VII_0 = MCADataValues(:,8);
VIII_0 = MCADataValues(:,9);
IX_0 = MCADataValues(:,10);
X_0 = MCADataValues(:,11);
ATIII_0 = MCADataValues(:,12);

for VisualNum = 1:20
    if VisualNum < 11
        TcheckColIndex(VisualNum) = 1;
        CATColIndex(VisualNum) = TcheckColIndex(VisualNum) + VisualNum;
    elseif VisualNum < 16
        TcheckColIndex(VisualNum) = 13;
        CATColIndex(VisualNum) = VisualNum - 10 + TcheckColIndex(VisualNum);
    else
        TcheckColIndex(VisualNum) = 20;
        CATColIndex(VisualNum) = VisualNum - 15 + TcheckColIndex(VisualNum);
    end
end    
    
for VisualNum = 1:40
    if VisualNum < 12
        TcheckColIndex(VisualNum+20) = 1;
        CATColIndex(VisualNum+20) = TcheckColIndex(VisualNum+20) + VisualNum;
    elseif VisualNum < 33
        TcheckColIndex(VisualNum+20) = 14;
        CATColIndex(VisualNum+20) = VisualNum - 11 + TcheckColIndex(VisualNum+20);
    else
        TcheckColIndex(VisualNum+20) = 37;
        CATColIndex(VisualNum+20) = VisualNum - 32 + TcheckColIndex(VisualNum+20);
    end
end

NormalsFlag = [ones(20,1);zeros(40,1)];

s = tf('s');

%%

for j=1:length(k0)
    sysnodel(j) = kn(j)/(s^3 + k2(j)*s^2 + k1(j)*s + k0(j));
    sysdel(j) = sysnodel(j)*exp(-kd(j)*s);
    [r(:,j) p(:,j) direct] = residue(kn(j),[1 k2(j) k1(j) k0(j)]);
    for i = 1:3
        checkpoleisonlyreal(i,j) = isreal(p(i,j));
        if isreal(p(i,j))
            onlyrealpoles(i,j) = p(i,j);
        else
            onlypoleswithcomplexparts(i,j) = p(i,j);
            realpartofpoleswithcomplexparts(i,j) = real(p(i,j));
            complexpartofpoleswithcomplexparts(i,j)= imag(p(i,j));
        end
    end
end



numonlyrealpoles = sum(checkpoleisonlyreal);


for j=1:length(k0)
    if numonlyrealpoles(j)==1
        if min(realpartofpoleswithcomplexparts(:,j)) < min(onlyrealpoles(:,j))
            checkpoleisrightofpair(j) = 1;
        else
            checkpoleisrightofpair(j) = 0;
        end
    else
        checkpoleisrightofpair(j) = NaN;
    end
end


for j=1:length(k0)
    if checkpoleisrightofpair(j) == 1
        rightrealpolevalue(j) = min(onlyrealpoles(:,j));
        leftpairrealpolevalue(j) = min(realpartofpoleswithcomplexparts(:,j));
        leftpairimagpolevalue(j) = min(complexpartofpoleswithcomplexparts(:,j));
        leftpairmagpolevalue(j) = sqrt(leftpairrealpolevalue(j)^2 + leftpairimagpolevalue(j)^2);
        leftpairanglepolevalue(j) = atan2(leftpairimagpolevalue(j),leftpairrealpolevalue(j));
    else
        rightrealpolevalue(j) = NaN;
        leftpairrealpolevalue(j) = NaN;
        leftpairimagpolevalue(j) = NaN;
        leftpairmagpolevalue(j) = NaN;
        leftpairanglepolevalue(j) = NaN;
    end
end


%%

%5-fold cross validation (given 60)

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-9,'TolX',1e-9);

rand('seed',1);
numfolds = 5;

for foldcounter = 1:numfolds

    numelements = length(k0);
    numtest = floor(numelements/numfolds);

    r=randperm(numelements);
    r=sort(r(1:numtest))
    
    II_0_test = II_0(r);
    II_0_learn = II_0(setdiff(1:numelements,r));
    
    V_0_test = V_0(r);
    V_0_learn = V_0(setdiff(1:numelements,r));
    
    VII_0_test = VII_0(r);
    VII_0_learn = VII_0(setdiff(1:numelements,r));
    
    VIII_0_test = VIII_0(r);
    VIII_0_learn = VIII_0(setdiff(1:numelements,r));
    
    IX_0_test = IX_0(r);
    IX_0_learn = IX_0(setdiff(1:numelements,r));
    
    X_0_test = X_0(r);
    X_0_learn = X_0(setdiff(1:numelements,r));
    
    ATIII_0_test = ATIII_0(r);
    ATIII_0_learn = ATIII_0(setdiff(1:numelements,r));
    
    rightrealpolevalue_test = rightrealpolevalue(r);
    rightrealpolevalue_learn = rightrealpolevalue(setdiff(1:numelements,r));
    
    leftpairmagpolevalue_test = leftpairmagpolevalue(r);
    leftpairmagpolevalue_learn = leftpairmagpolevalue(setdiff(1:numelements,r)); 
    
    leftpairanglepolevalue_test = leftpairanglepolevalue(r);
    leftpairanglepolevalue_learn = leftpairanglepolevalue(setdiff(1:numelements,r)); 
    
    K_test = K(r);
    K_learn = K(setdiff(1:numelements,r));
    
    kd_test = kd(r);
    kd_learn = kd(setdiff(1:numelements,r));
    
    TcheckColIndex_test = TcheckColIndex(r);
    TcheckColIndex_learn = TcheckColIndex(setdiff(1:numelements,r));
    
    CATColIndex_test = CATColIndex(r);
    CATColIndex_learn = CATColIndex(setdiff(1:numelements,r));
    
    NormalsFlag_test = NormalsFlag(r);
    NormalsFlag_learn = NormalsFlag(setdiff(1:numelements,r));
    
    %learning on the learn set

    fitK0 = ones(3,1);
    [fitKfactors,resfitKnorm] = lsqcurvefit(@fitKModel,fitK0,[II_0_learn V_0_learn ATIII_0_learn],K_learn,[],[],options)
    
    fitrightrealpole0 = ones(4,1);
    [fitrightrealpolefactors,resfitrightrealpolenorm] = lsqcurvefit(@fitrightrealpoleModel,fitrightrealpole0,[II_0_learn VIII_0_learn X_0_learn ATIII_0_learn VII_0_learn V_0_learn],-rightrealpolevalue_learn',[],[],options)
    
    avg_leftpairanglepolevalue = mean(leftpairanglepolevalue_learn)
    
    fitleftpairmagpole0 = ones(3,1);
    [fitleftpairmagpolefactors,resfitleftpairmagpolenorm] = lsqcurvefit(@fitleftpairmagpoleModel,fitleftpairmagpole0,[II_0_learn VIII_0_learn X_0_learn VII_0_learn V_0_learn],leftpairmagpolevalue_learn',[],[],options)

    fitkd0 = ones(3,1);
    [fitkdfactors,resfitkdnorm] = lsqcurvefit(@fitkdModel,fitkd0,[II_0_learn X_0_learn IX_0_learn V_0_learn],kd_learn,[],[],options)



    %testing on the test set

    for counter = 1:numtest
        
        Kpredict = fitKfactors(3)*ATIII_0_test(counter) + fitKfactors(2)*V_0_test(counter) + 0.0038739537*II_0_test(counter) + fitKfactors(1);
        
        rightrealpolepredict = fitrightrealpolefactors(4)*V_0_test(counter) + fitrightrealpolefactors(3)*VII_0_test(counter) + fitrightrealpolefactors(2)*ATIII_0_test(counter) + 0.0002706628*X_0_test(counter) + 0.0002468253*VIII_0_test(counter) - 0.0013723897*II_0_test(counter) + fitrightrealpolefactors(1);
        negrightrealpolepredict = -rightrealpolepredict;

        leftpairmagpolepredict = fitleftpairmagpolefactors(3)*V_0_test(counter) + fitleftpairmagpolefactors(2)*VII_0_test(counter) + 0.0018702987*X_0_test(counter) + 0.0018263832*VIII_0_test(counter) - 0.0043593893*II_0_test(counter) + fitleftpairmagpolefactors(1);
 
        kdpredict = fitkdfactors(3)*V_0_test(counter) + fitkdfactors(2)*IX_0_test(counter) - 0.0033648432*X_0_test(counter) - 0.0115383188*II_0_test(counter) + fitkdfactors(1);

        sigma = leftpairmagpolepredict*cos(pi+avg_leftpairanglepolevalue);
        k2predict = 2*sigma+rightrealpolepredict;
        k1predict = leftpairmagpolepredict^2 + 2*sigma*rightrealpolepredict;
        k0predict = rightrealpolepredict*leftpairmagpolepredict^2;

        knpredict = Kpredict*k0predict;

        PredictedSystem = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict) * exp(-kdpredict*s);
        T = linspace(0,45,451);
        Y = 5*impulse(PredictedSystem,T);
        
        [MaxPredictedThrombin(counter),IndexMaxPredictedThrombin] = max(Y);
        TimeatMaxPredictedThrombin(counter) = T(IndexMaxPredictedThrombin);
        
        %obtain data
        
        if NormalsFlag_test(counter) == 1
            
            MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:Y121');            

        else
            
            MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:AS121');
            
        end
        
        MeasuredThrombin = MCADataValues(:,CATColIndex_test(counter))/1000; %microM
        Tcheck = MCADataValues(:,TcheckColIndex_test(counter));  %min
        
        [MaxMeasuredThrombin(counter),IndexMaxMeasuredThrombin] = max(MeasuredThrombin);
        TimeatMaxMeasuredThrombin(counter) = Tcheck(IndexMaxMeasuredThrombin);
        
        MaxThrombinPercentError(counter) = abs(MaxPredictedThrombin(counter)-MaxMeasuredThrombin(counter))/MaxMeasuredThrombin(counter)*100;
        TimeMaxThrombinPercentError(counter) = abs(TimeatMaxPredictedThrombin(counter)-TimeatMaxMeasuredThrombin(counter))/TimeatMaxMeasuredThrombin(counter)*100;


    end

    AverageMaxThrombinPercentError(foldcounter) = mean(MaxThrombinPercentError)
    StdDevMaxThrombinPercentError(foldcounter) = std(MaxThrombinPercentError)
    AverageTimeMaxThrombinPercentError(foldcounter) = mean(TimeMaxThrombinPercentError)
    StdDevTimeMaxThrombinPercentError(foldcounter) = std(TimeMaxThrombinPercentError)

    
end

AverageAverageMaxThrombinPercentError = mean(AverageMaxThrombinPercentError)
AverageAverageTimeMaxThrombinPercentError = mean(AverageTimeMaxThrombinPercentError)

return


function fitrightrealpoleEstimate = fitrightrealpoleModel(x,xdata)

% II_Init = xdata(:,1);
% VIII_Init = xdata(:,2);
% ATIII_Init = xdata(:,3);
% V_Init = xdata(:,4);

%fitrightrealpoleEstimate = x(5)*V_Init + x(4)*ATIII_Init + x(3)*VIII_Init + x(2)*II_Init + x(1);


II_Init = xdata(:,1);
VIII_Init = xdata(:,2);
X_Init = xdata(:,3);
ATIII_Init = xdata(:,4);
VII_Init = xdata(:,5);
V_Init = xdata(:,6);

fitrightrealpoleEstimate = x(4)*V_Init + x(3)*VII_Init + x(2)*ATIII_Init + 0.0002706628*X_Init + 0.0002468253*VIII_Init - 0.0013723897*II_Init + x(1);

return


function fitleftpairmagpoleEstimate = fitleftpairmagpoleModel(x,xdata)

% X_Init = xdata(:,1);
% VIII_Init = xdata(:,2);
% IX_Init = xdata(:,3);
% 
% fitleftpairmagpoleEstimate = x(4)*IX_Init + x(3)*VIII_Init + x(2)*X_Init + x(1); 

II_Init = xdata(:,1);
VIII_Init = xdata(:,2);
X_Init = xdata(:,3);
VII_Init = xdata(:,4);
V_Init = xdata(:,5);

fitleftpairmagpoleEstimate = x(3)*V_Init + x(2)*VII_Init + 0.0018702987*X_Init + 0.0018263832*VIII_Init - 0.0043593893*II_Init + x(1); 


return


function fitkdEstimate = fitkdModel(x,xdata)

%X_Init = xdata(:,1);
%V_Init = xdata(:,2);
%VII_Init = xdata(:,3);
%
%fitkdEstimate = x(4)*VII_Init + x(3)*V_Init + x(2)*X_Init + x(1);

II_Init = xdata(:,1);
X_Init = xdata(:,2);
IX_Init = xdata(:,3);
V_Init = xdata(:,4);

fitkdEstimate = x(3)*V_Init + x(2)*IX_Init - 0.0033648432*X_Init - 0.0115383188*II_Init + x(1);

return


function fitknEstimate = fitknModel(x,xdata)

k0_Init = xdata(:,1);

fitknEstimate = x(1)*k0_Init;
return

function fitKEstimate = fitKModel(x,xdata)

II_Init = xdata(:,1);
V_Init = xdata(:,2);
ATIII_Init = xdata(:,3);

fitKEstimate = x(3)*ATIII_Init + x(2)*V_Init + 0.0038739537*II_Init + x(1);
return