
function MCA_model_v2_clustering_ALL

clear all;
close all;
clc;

% NORMALS

%obtain data
MCADataValues = xlsread('../../Data/Processed/CAT_Normals','Dynamic','A2:Y121');


for VisualNum = 1:20
    
    if VisualNum < 11
        TcheckColIndex = 1;
        CATColIndex = TcheckColIndex + VisualNum;
    elseif VisualNum < 16
        TcheckColIndex = 13;
        CATColIndex = VisualNum - 10 + TcheckColIndex;
    else
        TcheckColIndex = 20;
        CATColIndex = VisualNum - 15 + TcheckColIndex;
    end

    
    MeasuredThrombin = MCADataValues(:,CATColIndex)/1000; %microM
    Tcheck = MCADataValues(:,TcheckColIndex);  %min

    [MaxMeasuredThrombin(VisualNum),IndexMaxMeasuredThrombin(VisualNum)] = max(MeasuredThrombin);
    TimeatMaxMeasuredThrombin(VisualNum) = Tcheck(IndexMaxMeasuredThrombin(VisualNum));
    ETPMeasuredThrombin(VisualNum) = trapz(Tcheck,MeasuredThrombin);
    
end


% TRAUMA

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

    [MaxMeasuredThrombin(VisualNum+20),IndexMaxMeasuredThrombin(VisualNum+20)] = max(MeasuredThrombin);
    TimeatMaxMeasuredThrombin(VisualNum+20) = Tcheck(IndexMaxMeasuredThrombin(VisualNum+20));
    ETPMeasuredThrombin(VisualNum+20) = trapz(Tcheck,MeasuredThrombin);
    
end

figure(1)
clf
subplot(2,2,1)
%plot3(MaxMeasuredThrombin(1:20),TimeatMaxMeasuredThrombin(1:20),ETPMeasuredThrombin(1:20),'bx','MarkerSize',12)
p1 = scatter3(MaxMeasuredThrombin(1:20),TimeatMaxMeasuredThrombin(1:20),ETPMeasuredThrombin(1:20),150,'Green','filled','d','MarkerEdgeColor','Black');
hold on
%plot3(MaxMeasuredThrombin(21:60),TimeatMaxMeasuredThrombin(21:60),ETPMeasuredThrombin(21:60),'ro','MarkerSize',12)
p2 = scatter3(MaxMeasuredThrombin(21:60),TimeatMaxMeasuredThrombin(21:60),ETPMeasuredThrombin(21:60),150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('{\itP} [\muM]')
ylabel('{\itT_P} [min]')
zlabel('IIa_{\ittot} [\muM min]')
title('D')
h_leg = legend([p1 p2],{'Normal','Trauma'}, 'Location', 'NorthEast');
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',30)
set(gca,'FontSize',30)


figure(2)
clf
subplot(2,2,2)
H1 = area([0;0.2],[5.5;5.5],'LineStyle','none','FaceColor',[1 0.5 0]);
h1=get(H1,'children');
set(h1,'FaceAlpha',0.2);
hold on
text(0.005,4,'Rapid')
text(0.005,2.5,'Peak:=')
text(0.005,0.5,'{\itT_P} < 5.5')
hold on
H2 = area([0.2;0.6],[5.5;5.5],'LineStyle','none');
h2=get(H2,'children');
set(h2,'FaceAlpha',0.25,'FaceColor',[1 0 0]);
% text(0.21,1,'Thrombotic')
H3 = area([0.2;0.6],[11;11],5.5,'LineStyle','none');
h3=get(H3,'children');
set(h3,'FaceAlpha',0.25,'FaceColor',[0.5 0 0]);
%text(0.445,9.5,'Tall Peak,')
text(0.375,6.25,'{\itP} > 0.2')
text(0.375,7.75,'Thrombotic:=')
%plot(MaxMeasuredThrombin(1:20),TimeatMaxMeasuredThrombin(1:20),'gx','MarkerSize',6,'LineWidth',6);
p1 = scatter(MaxMeasuredThrombin(1:20),TimeatMaxMeasuredThrombin(1:20),150,'Green','filled','d','MarkerEdgeColor','Black');
%plot(MaxMeasuredThrombin(21:60),TimeatMaxMeasuredThrombin(21:60),'ro','MarkerSize',6,'LineWidth',6);
p2 = scatter(MaxMeasuredThrombin(21:60),TimeatMaxMeasuredThrombin(21:60),150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('{\itP} [\muM]')
ylabel('{\itT_P} [min]')
h_leg = legend([p1 p2],{'Normal','Trauma'}, 'Location', 'SouthEast');
%set(h_leg,'Xcolor',[0 0 0],'Ycolor',[0 0 0]);
axis([0 0.6 0 10.5])
%title('E')
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)
% cure the axis rendering problem with using FaceAlpha
set(gca,'LineWidth',1.5)

 


%figure
subplot(2,2,1)
H3 = area([0.2;0.6],[5;5],'LineStyle','none');
h3=get(H3,'children');
set(h3,'FaceAlpha',0.25,'FaceColor',[0.5 0 0]);
%text(0.445,9.5,'Tall Peak,')
text(0.375,0.25,'{\itP} > 0.2')
text(0.375,0.8,'Thrombotic:=')
hold on
%plot(MaxMeasuredThrombin(1:20),ETPMeasuredThrombin(1:20),'bx','MarkerSize',12)
p1 = scatter(MaxMeasuredThrombin(1:20),ETPMeasuredThrombin(1:20),150,'Green','filled','d','MarkerEdgeColor','Black');
%plot(MaxMeasuredThrombin(21:60),ETPMeasuredThrombin(21:60),'ro','MarkerSize',12)
p2 = scatter(MaxMeasuredThrombin(21:60),ETPMeasuredThrombin(21:60),150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('{\itP} [\muM]')
ylabel('IIa_{\ittot} [\muM min]')
legend([p1 p2],{'Normal','Trauma'}, 'Location', 'NorthEast')
axis([0 0.6 0 4])
%title('F')
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)
% cure the axis rendering problem with using FaceAlpha
set(gca,'LineWidth',1.5)


%%
MCADataValues = xlsread('../../Data/Processed/CAT_Normals','Fits','B2:R21');

kd = MCADataValues(:,5);
K = MCADataValues(:,13);
p = MCADataValues(:,15);
omega_n = MCADataValues(:,16);

ACIT = xlsread('../../Data/Processed/CAT_Normals','Fits','A2:A21');

MCADataValues = xlsread('../../Data/Processed/CAT_Trauma','Fits','B2:R41');

kd = [kd; MCADataValues(:,5)];
K = [K; MCADataValues(:,13)];
p = [p; MCADataValues(:,15)];
omega_n = [omega_n; MCADataValues(:,16)];

ACIT = [ACIT;xlsread('../../Data/Processed/CAT_Trauma','Fits','A2:A41')];



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

% Repetition to get the desired classifier numbers and colors
while ((length(ACIT(IDX==1)) ~= 24) || (length(ACIT(IDX==2)) ~= 23) || (length(ACIT(IDX==3)) ~= 9) || (length(ACIT(IDX==4)) ~= 4))
    [IDX,kmeansCentroids] = kmeans([kd K p omega_n],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);
end

ACIT(IDX==1)
ACIT(IDX==2)
ACIT(IDX==3)
ACIT(IDX==4)

figure
clf
subplot(2,2,1)

%plot3(kd(IDX==1),p(IDX==1),omega_n(IDX==1),'r*','MarkerSize',12)
scatter3(kd(IDX==1),p(IDX==1),omega_n(IDX==1),150,'Red','filled','o','MarkerEdgeColor','Black');
hold on
%plot3(kd(IDX==2),p(IDX==2),omega_n(IDX==2),'g*','MarkerSize',12)
scatter3(kd(IDX==2),p(IDX==2),omega_n(IDX==2),150,'Green','filled','d','MarkerEdgeColor','Black');
%plot3(kd(IDX==3),p(IDX==3),omega_n(IDX==3),'b*','MarkerSize',12)
scatter3(kd(IDX==3),p(IDX==3),omega_n(IDX==3),150,'Blue','filled','s','MarkerEdgeColor','Black');
%plot3(kd(IDX==4),p(IDX==4),omega_n(IDX==4),'m*','MarkerSize',12)
scatter3(kd(IDX==4),p(IDX==4),omega_n(IDX==4),150,'Magenta','filled','^','MarkerEdgeColor','Black');

grid on
box on
xlabel('{\itT} [min]')
ylabel('{\itp}')
zlabel('{\it\omega_n}')
axis([0 6 0 3 0.3 2.1])
tA = title('A');
legend('Low {\itT}','Med. {\itT}, Low {\it\omega_n}', 'Med. {\itT}, High {\it\omega_n}','High {\itT}', 'Location', 'NorthEast')


figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)


%figure
%clf
subplot(2,2,2)
%plot(kd(IDX==1),omega_n(IDX==1),'r*','MarkerSize',12)
scatter(kd(IDX==1),omega_n(IDX==1),150,'Red','filled','o','MarkerEdgeColor','Black');
hold on
%plot(kd(IDX==2),omega_n(IDX==2),'g*','MarkerSize',12)
scatter(kd(IDX==2),omega_n(IDX==2),150,'Green','filled','d','MarkerEdgeColor','Black');
%plot(kd(IDX==3),omega_n(IDX==3),'b*','MarkerSize',12)
scatter(kd(IDX==3),omega_n(IDX==3),150,'Blue','filled','s','MarkerEdgeColor','Black');
%plot(kd(IDX==4),omega_n(IDX==4),'m*','MarkerSize',12)
scatter(kd(IDX==4),omega_n(IDX==4),150,'Magenta','filled','^','MarkerEdgeColor','Black');
grid on
box on
xlabel('{\itT} [min]')
ylabel('{\it\omega_n}')
axis([1.4 12 0.3 2.1])
tB = title('B');
legend('Low {\itT}','Med. {\itT}, Low {\it\omega_n}', 'Med. {\itT}, High {\it\omega_n}','High {\itT}', 'Location', 'North')

figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')

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

