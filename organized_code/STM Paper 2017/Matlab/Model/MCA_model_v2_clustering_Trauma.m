
function MCA_model_v2_clustering_Trauma

clear all;
close all;
clc;

%obtain data
MCADataValues = xlsread('../../Data/Processed/CAT_Trauma','Dynamic','A2:AS121');


for VisualNum = 1:40
    
    if VisualNum < 12
        TcheckColIndex = 1;
        CATColIndex = TcheckColIndex + VisualNum;
    elseif VisualNum < 33
        TcheckColIndex = 14;
        CATColIndex = VisualNum - 11 + TcheckColIndex;
    else
        TcheckColIndex = 37;
        CATColIndex = VisualNum - 32 + TcheckColIndex;
    end

    
    MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
    Tcheck = MCADataValues(:,TcheckColIndex);  %min

    [MaxMeasuredThrombin(VisualNum),IndexMaxMeasuredThrombin(VisualNum)] = max(MeasuredThrombin);
    TimeatMaxMeasuredThrombin(VisualNum) = Tcheck(IndexMaxMeasuredThrombin(VisualNum));
    ETPMeasuredThrombin(VisualNum) = trapz(Tcheck,MeasuredThrombin);
    
end

figure
clf
plot3(MaxMeasuredThrombin,TimeatMaxMeasuredThrombin,ETPMeasuredThrombin,'k*','MarkerSize',12)
grid on
box on
xlabel('P [\muM]')
ylabel('T_P (includes T) [min]')
zlabel('ETP [\muM min]')
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',30)
set(gca,'FontSize',30)


%%

MCADataValues = xlsread('../../Data/Processed/CAT_Trauma','Fits','B2:R41');

kd = MCADataValues(:,5);
K = MCADataValues(:,13);
p = MCADataValues(:,15);
omega_n = MCADataValues(:,16);

ACIT = xlsread('../../Data/Processed/CAT_Trauma','Fits','A2:A41');

% figure(2)
% clf
% plot3(kd,p,omega_n,'k*','MarkerSize',12)
% grid on
% box on
% xlabel('T (fitted) [min]')
% ylabel('p')
% zlabel('\omega_n')
% figureHandle = gcf;
% % make all text in the figure to size 30
% set(findall(figureHandle,'type','text'),'fontSize',30)
% set(gca,'FontSize',30)
% 
% figure(3)
% clf
% plot3(K,p,omega_n,'k*','MarkerSize',12)
% grid on
% box on
% xlabel('K')
% ylabel('p')
% zlabel('\omega_n')
% figureHandle = gcf;
% % make all text in the figure to size 30
% set(findall(figureHandle,'type','text'),'fontSize',30)
% set(gca,'FontSize',30)
% 
% figure(4)
% clf
% plot3(kd,p,K,'k*','MarkerSize',12)
% grid on
% box on
% xlabel('T (fitted) [min]')
% ylabel('p')
% zlabel('K')
% figureHandle = gcf;
% % make all text in the figure to size 30
% set(findall(figureHandle,'type','text'),'fontSize',30)
% set(gca,'FontSize',30)

%% K-means clustering

%Figure of Merit

NumKMeansIterations = 100;
opts = statset('Display','final');

for NumClusters = 1:10
    [IDX,kmeansCentroids,sumd] = kmeans([kd K p omega_n],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);
    
    
    FOM(NumClusters) = sqrt(sum(sumd)/length(kd));
    AdjFactor(NumClusters) = sqrt((length(kd)-NumClusters)/length(kd));
    if length(kd) > NumClusters
        AdjFOM(NumClusters) = FOM(NumClusters)/AdjFactor(NumClusters);
    elseif length(kd) == NumClusters
        AdjFOM(NumClusters) = 0;
        break
    end    
    NumClusters
end

figure
clf
plot(1:NumClusters,AdjFOM,'b-o','LineWidth',6,'Markersize',12)
grid on
xlabel('Number of Clusters')
ylabel('Adjusted FOM Score')
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',30)
set(gca,'FontSize',30)

%Choose 4 Clusters Based on FOM
NumClusters = 4;
[IDX,kmeansCentroids] = kmeans([kd K p omega_n],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);

figure
clf

plot3(kd(IDX==1),p(IDX==1),omega_n(IDX==1),'r*','MarkerSize',12)
hold on
plot3(kd(IDX==2),p(IDX==2),omega_n(IDX==2),'g*','MarkerSize',12)
plot3(kd(IDX==3),p(IDX==3),omega_n(IDX==3),'b*','MarkerSize',12)
plot3(kd(IDX==4),p(IDX==4),omega_n(IDX==4),'m*','MarkerSize',12)

grid on
box on
xlabel('T (fitted) [min]')
ylabel('p')
zlabel('\omega_n')
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',30)
set(gca,'FontSize',30)



figure
clf

plot3(K(IDX==1),p(IDX==1),omega_n(IDX==1),'r*','MarkerSize',12)
hold on
plot3(K(IDX==2),p(IDX==2),omega_n(IDX==2),'g*','MarkerSize',12)
plot3(K(IDX==3),p(IDX==3),omega_n(IDX==3),'b*','MarkerSize',12)
plot3(K(IDX==4),p(IDX==4),omega_n(IDX==4),'m*','MarkerSize',12)

grid on
box on
xlabel('K')
ylabel('p')
zlabel('\omega_n')
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',30)
set(gca,'FontSize',30)



figure
clf

plot3(kd(IDX==1),p(IDX==1),K(IDX==1),'r*','MarkerSize',12)
hold on
plot3(kd(IDX==2),p(IDX==2),K(IDX==2),'g*','MarkerSize',12)
plot3(kd(IDX==3),p(IDX==3),K(IDX==3),'b*','MarkerSize',12)
plot3(kd(IDX==4),p(IDX==4),K(IDX==4),'m*','MarkerSize',12)

grid on
box on
xlabel('T (fitted) [min]')
ylabel('p')
zlabel('K')
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',30)
set(gca,'FontSize',30)

