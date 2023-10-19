
clear all;
close all;
clc;

% Read in PT and PTT values, first normals, then trauma patient

PTTvalues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','U2:U21');
PTTvalues = [PTTvalues;xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','U2:U41')];

PTvalues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','W2:W21');
PTvalues = [PTvalues;xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','W2:W41')];

figure(1)
clf

subplot(2,2,1)
p1 = scatter(PTTvalues(1:20),PTvalues(1:20),150,'Green','filled','d','MarkerEdgeColor','Black');
hold on
p2 = scatter(PTTvalues(21:60),PTvalues(21:60),150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('PTT [s]')
ylabel('PT [s]')
h_legA = legend([p1 p2],{'Normal','Trauma'},2);
axis([20 40 10 20])
tA = title('A');
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)
% cure the axis rendering problem with using FaceAlpha
%set(gca,'LineWidth',1.5)


%% K-means clustering


NumKMeansIterations = 100;
opts = statset('Display','final');

%2 clusters

NumClusters = 2;

[IDX,kmeansCentroids] = kmeans([PTTvalues PTvalues],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);

subplot(2,2,2)
p1 = scatter(PTTvalues(IDX==1),PTvalues(IDX==1),150,'Blue','filled','s','MarkerEdgeColor','Black');
hold on
p2 = scatter(PTTvalues(IDX==2),PTvalues(IDX==2),150,'Magenta','filled','^','MarkerEdgeColor','Black');
grid on
box on
xlabel('PTT [s]')
ylabel('PT [s]')
h_legB = legend([p1 p2],{'Cluster 1','Cluster 2'},2);
axis([20 40 10 20])
tB = title('B');
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)
% cure the axis rendering problem with using FaceAlpha
%set(gca,'LineWidth',1.5)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')