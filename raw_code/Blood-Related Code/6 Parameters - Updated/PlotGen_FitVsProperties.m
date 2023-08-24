%% Import Data 
% Model Fit Parameters: [Kp1, Kn1, Kd1, Kp2, Kn2, Kd2]
TEG_WB_6_parameters=xlsread('ModelFitParameters - 2Piece B',1,'C3:H26');

% Coagulation Measurements [II, V, VII, VIII, IX, X, ATIII, PC, Fibrinogen, ddimer, platelet]
TEG_24tra_CoagFac_data=xlsread('ModelFitParameters - 2Piece B',1,'I3:S26');

% Machine read TEG Parameters: [R, K, alpha, MA, Ly30]
TEG_24tra_MachProp=xlsread('ModelFitParameters - 2Piece B',1,'U3:Z26');

%% Fits vs Prop
FigLineSize=3;
FontSizeNum=20;
MarkSIze=10;

% Kn1 vs MA
figure(1); 
clf
subplot(2,2,1)
xAxisData=TEG_WB_6_parameters(:,2);
yAxisData=TEG_24tra_MachProp(:,4);
plot(xAxisData,yAxisData,'k^','MarkerSize',MarkSIze,'MarkerFaceColor',[0 0.4470 0.7410])
xlabel('Kn1'); ylabel('MA'); title('A');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
R2_1=RSquaredValue(yAxisData,y1)
R1_1=sqrt(R2_1)

% Kd1 vs R time
figure(1); 
subplot(2,2,2)
xAxisData=TEG_WB_6_parameters(:,3);
yAxisData=TEG_24tra_MachProp(:,1);
plot(xAxisData,yAxisData,'kd','MarkerSize',MarkSIze,'MarkerFaceColor',[0.8500 0.3250 0.0980])
xlabel('Kd1'); ylabel('R-time'); title('B');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_2=RSquaredValue(yAxisData,y1)
R1_2=sqrt(R2_2)
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)


% Kp1 vs alpha
figure(1); 
subplot(2,2,3) 
xAxisData=TEG_WB_6_parameters(:,1);
yAxisData=TEG_24tra_MachProp(:,3);
RD_1=find(yAxisData<60);
RD=RD_1;
xAxisData(RD)=[];
yAxisData(RD)=[];
plot(xAxisData,yAxisData,'ko','MarkerSize',MarkSIze,'MarkerFaceColor',[0.4660 0.6740 0.1880])
xlabel('Kp1'); ylabel('\alpha Angle'); title('C');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_4=RSquaredValue(yAxisData,y1)
R1_4=sqrt(R2_4)
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

% Degredation (Area under the curve of the lysis component)
tissuefactor=zeros(901,1) ;
tissuefactor(2:8)=10e-9 ;
T = linspace(0,75,901)';
% sys_test=tf(-3.47e17,[5.9e9,1,0],'InputDelay',33.4);
% sys_test=tf(2.7e10,[3.93,1,0],'InputDelay',2.5);
degredation=zeros(24,1);
for cnt=1:24
    sys_test=tf(TEG_WB_6_parameters(cnt,5),[TEG_WB_6_parameters(cnt,4),1,0],'InputDelay',TEG_WB_6_parameters(cnt,6));
    Y_est = lsim(sys_test,tissuefactor,T) ;
    degredation(cnt,1)=trapz(T,Y_est);
end

% Degredation vs LY30
figure(1); 
subplot(2,2,4)
xAxisData=degredation;
yAxisData=TEG_24tra_MachProp(:,5);
% RD_1=find(xAxisData>300);
% RD=RD_1;
% xAxisData(RD)=[];
% yAxisData(RD)=[];
plot(xAxisData,yAxisData,'ks','MarkerSize',MarkSIze,'MarkerFaceColor',[0.4940 0.1840 0.5560])
ylabel('Ly30'); xlabel('AUC'); title('D');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_7=RSquaredValue(yAxisData,y1)
R1_7=sqrt(R2_7)
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
