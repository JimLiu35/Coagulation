function ModelFree_FactorConc_Classification

clear all;
close all;
clc;

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-6,'TolX',1e-6);

format long e;

% Read in concentrations, first normals then trauma patients

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','B2:M21');
MCADataValues = [MCADataValues;xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','B2:M41')];

II_0 = MCADataValues(:,6);
V_0 = MCADataValues(:,7);
VII_0 = MCADataValues(:,8);
VIII_0 = MCADataValues(:,9);
IX_0 = MCADataValues(:,10);
X_0 = MCADataValues(:,11);
ATIII_0 = MCADataValues(:,12);

% Also read in the identifiers
ACIT = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Fits','A2:A21');
ACIT = [ACIT;xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','A2:A41')];


%% K-means clustering

NumKMeansIterations = 100;
opts = statset('Display','final');
NumClusters = 2; % Normal and Trauma

[IDX,kmeansCentroids] = kmeans([II_0 V_0 VII_0 VIII_0 IX_0 X_0 ATIII_0],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);


%% Principal Component Analysis into K-means

[Coeff, Score, Latent, TSquared, Explained] = pca([II_0 V_0 VII_0 VIII_0 IX_0 X_0 ATIII_0])

figure(1)
clf

subplot(2,2,1)
p1 = scatter3(Score(1:20,1),Score(1:20,2),Score(1:20,3),150,'Green','filled','d','MarkerEdgeColor','Black');
hold on
p2 = scatter3(Score(21:60,1),Score(21:60,2),Score(21:60,3),150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
zlabel('Component 3')
tA = title('A');
axis([-300 410 -100 335 -100 100])
h_legA = legend([p1 p2],{'Normal','Trauma'},2);
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)




subplot(2,2,2)
p1 = scatter(Score(1:20,1),Score(1:20,2),150,'Green','filled','d','MarkerEdgeColor','Black');
hold on
p2 = scatter(Score(21:60,1),Score(21:60,2),150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
tB = title('B');
axis([-300 410 -100 335])
h_legB = legend([p1 p2],{'Normal','Trauma'},4);
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)


% Now cluster based on first two/three components 
% (which explain most of the variance here)
% Score is the representation of the data in the principal component space. 
% Rows of Score correspond to observations, columns to components.

% Repetition to get the desired classifier numbers and colors
IDX = [];
while length(Score(IDX==1,1)) ~= 56
    [IDX,kmeansCentroids] = kmeans([Score(:,1) Score(:,2)],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);
    %[IDX,kmeansCentroids] = kmeans([Score(:,1) Score(:,2) Score(:,3)],NumClusters,'Replicates',NumKMeansIterations,'Options',opts);
end

subplot(2,2,3)
p1 = scatter(Score(IDX==1,1),Score(IDX==1,2),150,'Cyan','filled','d','MarkerEdgeColor','Black');
hold on
p2 = scatter(Score(IDX==2,1),Score(IDX==2,2),150,'Blue','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
tC = title('C');
axis([-300 410 -100 335])
h_legC = legend([p1 p2],{'KM Cluster 1','KM Cluster 2'},4);
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)


%% Support Vector Machines - Basic Code from Mathworks Online Example
% http://www.mathworks.com/help/stats/support-vector-machines-svm.html
% adapted for older Matlab version

% Put the data in one matrix, and make a vector of classifications.

data3 = [Score(:,1) Score(:,2)];
theclass = ones(60,1);
theclass(21:60) = -1; %so 1 indicates normal, -1 indicates trauma

% Train an SVM classifier with KernelFunction set to 'rbf' and BoxConstraint set to Inf. Plot the decision boundary and flag the support vectors.

% Train the SVM Classifier
svmStruct = svmtrain(data3,theclass,'kernel_function','rbf',...
    'boxconstraint',Inf);

% Plot the original data
subplot(2,2,4)
p1 = scatter(Score(1:20,1),Score(1:20,2),150,'Green','filled','d','MarkerEdgeColor','Black');
hold on
p2 = scatter(Score(21:60,1),Score(21:60,2),150,'Red','filled','o','MarkerEdgeColor','Black');

% Plot the support vectors
p3 = scatter(data3(svmStruct.SupportVectorIndices,1),data3(svmStruct.SupportVectorIndices,2),150,'Black','s','MarkerEdgeColor','Black');

% Determine the decision boundary / Predict scores over the grid
d = 0.5;
[x1Grid,x2Grid] = meshgrid(-50:d:50,...
    -100:d:0);
xGrid = [x1Grid(:),x2Grid(:)];
Group = svmclassify(svmStruct,xGrid);

% Plot the decision boundary
[contourdata,p4] = contour(x1Grid,x2Grid,reshape(Group,size(x1Grid)),[0 0],'k','Linewidth',1.5);

% Complete the plot
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
tD = title('D');
axis([-50 50 -100 0])
h_leg = legend([p3 p4],{'Support Vector','Decision Curve'},2);
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

set(tA, 'FontSize',31, 'FontWeight', 'bold')
set(tB, 'FontSize',31, 'FontWeight', 'bold')
set(tC, 'FontSize',31, 'FontWeight', 'bold')
set(tD, 'FontSize',31, 'FontWeight', 'bold')

%% Demographics/Outcomes vs. Trauma Principal Components

% Read in age, ISS, PTT, INR

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Fits','S2:V41');

Age = MCADataValues(:,1);
ISS = MCADataValues(:,2);
PTT = MCADataValues(:,3);
INR = MCADataValues(:,4);


figure(2)
clf

subplot(2,2,1)
p1 = scatter3(Score(21:60,1),Score(21:60,2),Age,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
zlabel('Age [yrs]')
tA2 = title('A');
axis([-300 410 -100 335 20 100])
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitAgevsComponentsfactors,resfitAgevsComponents] = lsqcurvefit(@fit2DLinearModel,[1;1;1],Score(21:60,1:2),Age,[],[],options)
R2fitAgevsComponents = Determine2DLinearModelR2(Score(21:60,1:2),Age,fitAgevsComponentsfactors)


subplot(2,2,2)
p1 = scatter3(Score(21:60,1),Score(21:60,2),ISS,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
zlabel('ISS')
tB2 = title('B');
axis([-300 410 -100 335 0 40])
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

UnalteredScore = Score(21:60,1:2);
ScoreWithoutNAN = UnalteredScore(~any(isnan(ISS),2),:);
[fitISSvsComponentsfactors,resfitISSvsComponents] = lsqcurvefit(@fit2DLinearModel,[1;1;1],ScoreWithoutNAN,ISS(~any(isnan(ISS),2)),[],[],options)
R2fitISSvsComponents = Determine2DLinearModelR2(ScoreWithoutNAN,ISS(~any(isnan(ISS),2)),fitISSvsComponentsfactors)


subplot(2,2,3)
p1 = scatter3(Score(21:60,1),Score(21:60,2),PTT,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
zlabel('PTT [s]')
tC2 = title('C');
axis([-300 410 -100 335 20 36])
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitPTTvsComponentsfactors,resfitPTTvsComponents] = lsqcurvefit(@fit2DLinearModel,[1;1;1],Score(21:60,1:2),PTT,[],[],options)
R2fitPTTvsComponents = Determine2DLinearModelR2(Score(21:60,1:2),PTT,fitPTTvsComponentsfactors)


subplot(2,2,4)
p1 = scatter3(Score(21:60,1),Score(21:60,2),INR,150,'Red','filled','o','MarkerEdgeColor','Black');
grid on
box on
xlabel('Component 1')
ylabel('Component 2')
zlabel('INR')
tD2 = title('D');
axis([-300 410 -100 335 0.8 1.8])
figureHandle = gcf;
% make all text in the figure to size 30
set(findall(figureHandle,'type','text'),'fontSize',27)
set(gca,'FontSize',27)

[fitINRvsComponentsfactors,resfitINRvsComponents] = lsqcurvefit(@fit2DLinearModel,[1;1;1],Score(21:60,1:2),INR,[],[],options)
R2fitINRvsComponents = Determine2DLinearModelR2(Score(21:60,1:2),INR,fitINRvsComponentsfactors)


set(tA2, 'FontSize',31, 'FontWeight', 'bold')
set(tB2, 'FontSize',31, 'FontWeight', 'bold')
set(tC2, 'FontSize',31, 'FontWeight', 'bold')
set(tD2, 'FontSize',31, 'FontWeight', 'bold')

return

function fit2DLinearEstimate = fit2DLinearModel(x,xdata)

fit2DLinearEstimate = x(1)*xdata(:,1) + x(2)*xdata(:,2) + x(3);

return

function R2of2DLinearEstimate = Determine2DLinearModelR2(Xdata,Yactualdata,LinearCoeffs)

Ypredicteddata = LinearCoeffs(1)*Xdata(:,1) + LinearCoeffs(2)*Xdata(:,2) + LinearCoeffs(3);

MeanYactualdata = mean(Yactualdata);
SStot_vec = (Yactualdata - MeanYactualdata).^2;
SStot = sum(SStot_vec);
SSres_vec = (Yactualdata - Ypredicteddata).^2;
SSres = sum(SSres_vec);
R2of2DLinearEstimate = 1 - SSres/SStot;


return

%%%%%%%%%%%%%%%%
%% Ignore everything below; attempt at Support Vector Clustering was unsuccessful
% 
% %% Support Vector Clustering of PCA
% 
% load fisheriris
% 
% [Coeff, Score, Latent, TSquared, Explained] = pca(meas);
% 
% q = 6;
% p = 0.6;
% 
% 
% 
% 
% C = 1/length(Score(:,1))/p;
% 
% beta = SVC([Score(:,1) Score(:,2)],C,q)
% 
% return
% 
% 
% 
% function output = GaussianKernel(vector1,vector2,q)
% 
% output = exp(-q*((norm(vector1 - vector2))^2));
% 
% return
% 
% 
% function WToMinimize = WolfeDualLagrangian(beta,Data,q)
% 
% %For use in Support Vector Clustering
% %Rows of Data correspond to observations/samples, columns to components.
% 
% FirstPartOfW = 0;
% 
% for j = 1:length(Data(:,1))
%    Kxjxj = GaussianKernel(Data(j,:)',Data(j,:)',q);
%    FirstPartOfW = FirstPartOfW + Kxjxj*beta(j);
% end
% 
% SecondPartOfW = 0;
% 
% for i  = 1:length(Data(:,1))
%     for j = 1:length(Data(:,1))
%        Kxixj = GaussianKernel(Data(i,:)',Data(j,:)',q);
%        SecondPartOfW = SecondPartOfW + beta(i)*beta(j)*Kxixj;
%     end
% end
% 
% WInPaper = FirstPartOfW - SecondPartOfW;
% 
% WToMinimize = -WInPaper;
% 
% return
% 
% 
% function beta = SVC(Data,C,q)
% 
% %Support Vector Clustering Implementation
% %Rows of Data correspond to observations/samples, columns to components.
% 
% f = @(beta)WolfeDualLagrangian(beta,Data,q);
% 
% beta0 = zeros(length(Data(:,1)),1);
% lb = zeros(length(Data(:,1)),1);
% ub = C*ones(length(Data(:,1)),1);
% 
% options = optimoptions('fmincon','TolFun',1e-10,'TolX',1e-12);
% 
% beta = fmincon(f,beta0,[],[],[],[],lb,ub,[],options);
% 
% 
% return
% 
