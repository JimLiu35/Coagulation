% TEG FIT model parameters compared to Machine properties and Coag Fact
%% Import Data 
% Model Fit Parameters: [Kp1, Kn1, Kd1, Kp2, Kn2, Kd2]
TEG_WB_6_parameters=xlsread('ModelFitParameters - 2Piece B',1,'C3:H26');

% Coagulation Measurements [II, V, VII, VIII, IX, X, ATIII, PC, Fibrinogen, ddimer, platelet]
TEG_24tra_CoagFac_data=xlsread('ModelFitParameters - 2Piece B',1,'I3:S26');

% Machine read TEG Parameters: [R, K, alpha, MA, Ly30]
TEG_24tra_MachProp=xlsread('ModelFitParameters - 2Piece B',1,'U3:Z26');

%% Fits vs Prop
close all

% Kn1 vs MA
figure(1); 
xAxisData=TEG_WB_6_parameters(:,2);
yAxisData=TEG_24tra_MachProp(:,4);
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('Kn1'); ylabel('MA'); title('MA vs Kn1');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_1=RSquaredValue(yAxisData,y1)
R1_1=sqrt(R2_1)

% Kd1 vs R time
figure(2); 
xAxisData=TEG_WB_6_parameters(:,3);
yAxisData=TEG_24tra_MachProp(:,1);
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('Kd1'); ylabel('R time'); title('R time vs Kd1');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_2=RSquaredValue(yAxisData,y1)
R1_2=sqrt(R2_2)

% Kn2/Kp2 vs Ly30
figure(3); 
xAxisData=TEG_WB_6_parameters(:,5)./TEG_WB_6_parameters(:,4);
yAxisData=TEG_24tra_MachProp(:,5);
yAxisData=TEG_24tra_MachProp(:,6);
RD_1=find(yAxisData>3);
RD=RD_1;
xAxisData(RD)=[];
yAxisData(RD)=[];
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('Kn2/Kp2'); ylabel('Ly30'); title('Ly30 vs Kn2/Kp2');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_3=RSquaredValue(yAxisData,y1)
R1_3=sqrt(R2_3)

% Kp1 vs alpha
figure(4); 
xAxisData=TEG_WB_6_parameters(:,1);
yAxisData=TEG_24tra_MachProp(:,3);
RD_1=find(yAxisData<60);
RD=RD_1;
xAxisData(RD)=[];
yAxisData(RD)=[];
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('Kp1'); ylabel('Alpha Angle'); title('Alpha angle vs Kp1');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_4=RSquaredValue(yAxisData,y1)
R1_4=sqrt(R2_4)



%% Prop vs Coag Factors
% ddimer vs lysis
figure(5); 
xAxisData=TEG_24tra_CoagFac_data(:,10);
yAxisData=TEG_24tra_MachProp(:,5);
yAxisData=TEG_24tra_MachProp(:,6);
RD_1=find(yAxisData>3);
RD=RD_1;
xAxisData(RD)=[];
yAxisData(RD)=[];
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('ddimer'); ylabel('Ly30'); title('Ly30 vs ddimer');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_5=RSquaredValue(yAxisData,y1)
R1_5=sqrt(R2_5)

%% Fit Parameters vs Coag Factors
% ddimer vs Kn2
figure(6); 
xAxisData=TEG_24tra_CoagFac_data(:,10);
yAxisData=TEG_WB_6_parameters(:,5)./TEG_WB_6_parameters(:,4)./1e8;
yAxisData=TEG_WB_6_parameters(:,6);
% yAxisData=log(yAxisData);
% RD_1=find(yAxisData<20);
% RD=RD_1;
% xAxisData(RD)=[];
% yAxisData(RD)=[];
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('ddimer'); ylabel('Kp2'); title(' vs ddimer');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_6=RSquaredValue(yAxisData,y1)
R1_6=sqrt(R2_6)

% All factors vs ALL Fir parameters 
figure(8);
for cnt=1:33
    rowID=floor((cnt-1)/11)+1;
    columnID=rem(cnt,11);
    if columnID==0
        columnID=11;
    end
    xAxisData=TEG_24tra_CoagFac_data(:,columnID);
    yAxisData=TEG_WB_6_parameters(:,rowID);
% yAxisData=log(yAxisData);
% RD_1=find(yAxisData<20);
% RD=RD_1;
% xAxisData(RD)=[];
% yAxisData(RD)=[];
    subplot(3,11,cnt);plot(xAxisData,yAxisData,'k*','MarkerSize',5)
% xlabel('ddimer'); ylabel('Kp2'); title(' vs ddimer');
    c1=polyfit(xAxisData,yAxisData,1);
    y1=polyval(c1,xAxisData);
    hold on; plot(xAxisData,y1,'r')
    R2_8(rowID,columnID)=RSquaredValue(yAxisData,y1);
    R1_8(rowID,columnID)=sqrt(R2_8(rowID,columnID));
    
end
R2_8
R1_8

% Kn1 vs Fib*II*Plat
figure(9); 
xAxisData=TEG_24tra_CoagFac_data(:,1).*TEG_24tra_CoagFac_data(:,9).*TEG_24tra_CoagFac_data(:,11);
yAxisData=TEG_WB_6_parameters(:,2);%*TEG_WB_6_parameters(:,4)./1e8;
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('II x Fib x Platelet'); ylabel('Kn1'); title('Factor vs Kn1 ');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_9=RSquaredValue(yAxisData,y1)
R1_9=sqrt(R2_9)

% Kn1 vs Fib*II*Plat
figure(10); 
xAxisData=TEG_24tra_CoagFac_data(:,1).*TEG_24tra_CoagFac_data(:,9).*TEG_24tra_CoagFac_data(:,11);
yAxisData=TEG_24tra_MachProp(:,4);%*TEG_WB_6_parameters(:,4)./1e8;
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('II x Fib x Platelet'); ylabel('MA'); title('Factor vs MA ');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_10=RSquaredValue(yAxisData,y1)
R1_10=sqrt(R2_10)

%% Degredation (Area under the curve of the lysis component)
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
figure(7); 
xAxisData=TEG_24tra_MachProp(:,5);
yAxisData=degredation;
% RD_1=find(xAxisData>4);
RD_1=find(yAxisData>300);
RD=RD_1;
xAxisData(RD)=[];
yAxisData(RD)=[];
plot(xAxisData,yAxisData,'k*','MarkerSize',5)
xlabel('ly30'); ylabel('Degredation'); title('Deg Area vs Ly30');
c1=polyfit(xAxisData,yAxisData,1);
y1=polyval(c1,xAxisData);
hold on; plot(xAxisData,y1,'r')
R2_7=RSquaredValue(yAxisData,y1)
R1_7=sqrt(R2_7)

% figure(8); 
% % xAxisData=TEG_24tra_CoagFac_data(:,10);
% xAxisData=TEG_24tra_MachProp(:,6);
% % xAxisData=TEG_WB_6_parameters(:,5)./TEG_WB_6_parameters(:,4)./1e8;
% yAxisData=degredation;
% % yAxisData=log(yAxisData);
% %RD_1=find(yAxisData>800);
% % RD_1=find(xAxisData>4);
% % RD=RD_1;
% % xAxisData(RD)=[];
% % yAxisData(RD)=[];
% plot(xAxisData,yAxisData,'k*','MarkerSize',5)
% xlabel('ly30'); ylabel('Degredation'); title('vs ddimer');
% c1=polyfit(xAxisData,yAxisData,1);
% y1=polyval(c1,xAxisData);
% hold on; plot(xAxisData,y1,'r')
% R2_7=RSquaredValue(yAxisData,y1)
% R1_7=sqrt(R2_7)