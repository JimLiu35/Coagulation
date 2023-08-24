
clear all;
close all;
clc;

%% Load Thrombograms

%Normal Thrombograms

NormalTime1 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:A121');
NormalCATSet1 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','B2:K121');

NormalTime2 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','M2:M121');
NormalCATSet2 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','N2:R121');

NormalTime3 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','T2:T121');
NormalCATSet3 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','U2:Y121');


%Patient Thrombograms

PatientTime1 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:A121');
PatientCATSet1 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','B2:L121');

PatientTime2 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','N2:N121');
PatientCATSet2 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','O2:AI121');

PatientTime3 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','AK2:AK121');
PatientCATSet3 = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','AL2:AS121');

%% Plot Thrombograms



figure(1)
clf
subplot(2,1,1)

H3 = area([0;30],[0.5;0.5],0.2,'LineStyle','none');
h3=get(H3,'children');
set(h3,'FaceAlpha',0.25,'FaceColor',[0.5 0 0]);
text(15,0.35,'Thrombotic:={\itP} > 0.2')

hold on

for i = 1:11;
    plot(PatientTime1,PatientCATSet1(:,i)/1000,'r-')
end
for i = 1:21;
    plot(PatientTime2,PatientCATSet2(:,i)/1000,'r-')
end
for i = 1:8;
    tlast(i) = plot(PatientTime3,PatientCATSet3(:,i)/1000,'r-');
end

for i = 1:10;
    plot(NormalTime1,NormalCATSet1(:,i)/1000,'g-')
end
for i = 1:5;
    plot(NormalTime2,NormalCATSet2(:,i)/1000,'g-')
end
for i = 1:5;
    nlast(i) = plot(NormalTime3,NormalCATSet3(:,i)/1000,'g-');
end
grid on
box on
xlabel('Time [min]')
ylabel('IIa [\muM]')
axis([0 30 -0.05 0.5])
legend([nlast(1) tlast(1)],{'Normal','Trauma'},1)
%title('C')

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)
% cure the axis rendering problem with using FaceAlpha
set(gca,'LineWidth',1.5)

%subplot(2,2,2)
%hold on
% for i = 1:11;
%     plot(PatientTime1,PatientCATSet1(:,i)/1000,'r-')
% end
% for i = 1:21;
%     plot(PatientTime2,PatientCATSet2(:,i)/1000,'r-')
% end
% for i = 1:8;
%     plot(PatientTime3,PatientCATSet3(:,i)/1000,'r-')
% end
%grid on
%box on
%xlabel('Time [min]')
%ylabel('IIa [\muM]')
%axis([0 45 -0.05 0.5])
%t = title('D');




% NORMALS

%obtain data
MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Normals','Dynamic','A2:Y121');


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
MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Trauma','Dynamic','A2:AS121');


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


% subplot(2,2,2)
% %plot3(MaxMeasuredThrombin(1:20),TimeatMaxMeasuredThrombin(1:20),ETPMeasuredThrombin(1:20),'bx','MarkerSize',12)
% p1 = scatter3(MaxMeasuredThrombin(1:20),TimeatMaxMeasuredThrombin(1:20),ETPMeasuredThrombin(1:20),150,'Green','filled','d','MarkerEdgeColor','Black');
% hold on
% %plot3(MaxMeasuredThrombin(21:60),TimeatMaxMeasuredThrombin(21:60),ETPMeasuredThrombin(21:60),'ro','MarkerSize',12)
% p2 = scatter3(MaxMeasuredThrombin(21:60),TimeatMaxMeasuredThrombin(21:60),ETPMeasuredThrombin(21:60),150,'Red','filled','o','MarkerEdgeColor','Black');
% grid on
% box on
% xlabel('{\itP} [\muM]')
% ylabel('{\itT_P} [min]')
% zlabel('IIa_{\ittot} [\muM min]')
% title('D')
% h_leg = legend([p1 p2],{'Normal','Trauma'},2);
% figureHandle = gcf;
% % make all text in the figure to size 30
% set(findall(figureHandle,'type','text'),'fontSize',30)
% set(gca,'FontSize',30)
% 
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)