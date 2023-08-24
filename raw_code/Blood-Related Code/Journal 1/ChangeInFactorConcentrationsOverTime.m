% Fig 4
%Comparisson of change in factor concentrations over time 

%% Import all data
[Alldata, Header]=xlsread('ACIT_6Jan17_deidentified1_MitchData','A1:TJ1672');
FactorVII_treatmend_indicator=xlsread('ACIT_6Jan17_deidentified1_MitchData','WO2:WO1672');
MortalityAt28Days_indicator=xlsread('ACIT_6Jan17_deidentified1_MitchData','AMY2:AMY1672');

%% Demographic
allData_statistic=[Alldata(:,1), Alldata(:,490:492), Alldata(:,517), Alldata(:,502), Alldata(:,494:498)];
Header_statistic={Header{1,1}, Header{1,490:492}, Header{1,517}, Header{1,502}, Header{1,494:498}};

%% Blood Data - differnt time windows 
allData_0h=[Alldata(:,1),Alldata(:,490), Alldata(:,17:20), Alldata(:,39:43), Alldata(:,45:49), Alldata(:,35:36), Alldata(:,50:54)]; %0hr
allData_0h_6h=[allData_0h, Alldata(:,189:192), Alldata(:,199:203), Alldata(:,205:216)]; %6h
allData_0h_6h_12h=[allData_0h_6h, Alldata(:,232:235), Alldata(:,242:246), Alldata(:,248:259)]; %12h
allData_0h_6h_12h_24h=[allData_0h_6h_12h, Alldata(:,275:278), Alldata(:,285:289), Alldata(:,291:302)]; %24h

Header_0h={Header{1,1}, Header{1,490}, Header{1,17:20}, Header{1,39:43}, Header{1,45:49}, Header{1,35:36}, Header{1,50:54}};
Header_0h_6h={Header_0h{1,:}, Header{1,189:192}, Header{1,199:203}, Header{1,205:216}};
Header_0h_6h_12h={Header_0h_6h{1,:}, Header{1,232:235}, Header{1,242:246}, Header{1,248:259}};
Header_0h_6h_12h_24h={Header_0h_6h_12h{1,:}, Header{1,275:278}, Header{1,285:289}, Header{1,291:302}};

%% Grouping Data based on factors 
FactorII_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,7), allData_0h_6h_12h_24h(:,28), allData_0h_6h_12h_24h(:,49), allData_0h_6h_12h_24h(:,70)];
FactorII_0to24_Header={Header_0h_6h_12h_24h{1:2}, Header_0h_6h_12h_24h{7}, Header_0h_6h_12h_24h{28}, Header_0h_6h_12h_24h{49}, Header_0h_6h_12h_24h{70}};

FactorV_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,8), allData_0h_6h_12h_24h(:,29), allData_0h_6h_12h_24h(:,50), allData_0h_6h_12h_24h(:,71)];
FactorVII_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,9), allData_0h_6h_12h_24h(:,30), allData_0h_6h_12h_24h(:,51), allData_0h_6h_12h_24h(:,72)];
FactorIX_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,10), allData_0h_6h_12h_24h(:,31), allData_0h_6h_12h_24h(:,52), allData_0h_6h_12h_24h(:,73)];
FactorX_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,11), allData_0h_6h_12h_24h(:,32), allData_0h_6h_12h_24h(:,53), allData_0h_6h_12h_24h(:,74)];
FactorVIII_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,12), allData_0h_6h_12h_24h(:,33), allData_0h_6h_12h_24h(:,54), allData_0h_6h_12h_24h(:,75)];
FactorATIII_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,13), allData_0h_6h_12h_24h(:,34), allData_0h_6h_12h_24h(:,55), allData_0h_6h_12h_24h(:,76)];
FactorPC_0to24=[allData_0h_6h_12h_24h(:,1:2), allData_0h_6h_12h_24h(:,14), allData_0h_6h_12h_24h(:,35), allData_0h_6h_12h_24h(:,56), allData_0h_6h_12h_24h(:,77)];


%% Deleting samples with missing information 

[row, ~] = find(isnan(FactorII_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorII_0to24_select=FactorII_0to24;
for i=length(rowsToDelete):-1:1
    FactorII_0to24_select(rowsToDelete(i),:)=[];
end

[row, ~] = find(isnan(FactorV_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorV_0to24_select=FactorV_0to24;
for i=length(rowsToDelete):-1:1
    FactorV_0to24_select(rowsToDelete(i),:)=[];
end

%VII
[row, ~] = find(isnan(FactorVII_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorVII_0to24_select=FactorVII_0to24;
FactorVII_treatmend_indicator_select=FactorVII_treatmend_indicator;
for i=length(rowsToDelete):-1:1
    FactorVII_0to24_select(rowsToDelete(i),:)=[];
    FactorVII_treatmend_indicator_select(rowsToDelete(i))=[];
end

[row, ~] = find(isnan(FactorIX_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorIX_0to24_select=FactorIX_0to24;
for i=length(rowsToDelete):-1:1
    FactorIX_0to24_select(rowsToDelete(i),:)=[];
end

[row, ~] = find(isnan(FactorX_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorX_0to24_select=FactorX_0to24;
for i=length(rowsToDelete):-1:1
    FactorX_0to24_select(rowsToDelete(i),:)=[];
end

[row, ~] = find(isnan(FactorVIII_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorVIII_0to24_select=FactorVIII_0to24;
for i=length(rowsToDelete):-1:1
    FactorVIII_0to24_select(rowsToDelete(i),:)=[];
end

[row, ~] = find(isnan(FactorATIII_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorATIII_0to24_select=FactorATIII_0to24;
for i=length(rowsToDelete):-1:1
    FactorATIII_0to24_select(rowsToDelete(i),:)=[];
end

[row, ~] = find(isnan(FactorPC_0to24(:,3:6)));
rowsToDelete=unique(row);
FactorPC_0to24_select=FactorPC_0to24;
for i=length(rowsToDelete):-1:1
    FactorPC_0to24_select(rowsToDelete(i),:)=[];
end

%% Change In Factor Measurements Heatmap Test Factor II 
FactorII_0to24_change=[FactorII_0to24_select, FactorII_0to24_select(:,4)-FactorII_0to24_select(:,3), FactorII_0to24_select(:,5)-FactorII_0to24_select(:,4), FactorII_0to24_select(:,6)-FactorII_0to24_select(:,5)];
FactorII_0to24_change_Header={FactorII_0to24_Header{1:6}, 'Change 0-6 hr', 'Change 6-12 hr', 'Change 12-24 hr'};
clear InitialTimeConcen ChangeInConcen TimePeriod RangegroupID ConcentrationRange InitialTimeConcen
InitialTimeConcen=[FactorII_0to24_change(:,3);FactorII_0to24_change(:,4);FactorII_0to24_change(:,5)];
InitialTimeConcenMAT=[FactorII_0to24_change(:,3),FactorII_0to24_change(:,4),FactorII_0to24_change(:,5)];
ChangeInConcen=[FactorII_0to24_change(:,7);FactorII_0to24_change(:,8);FactorII_0to24_change(:,9)];
ChangeInConcenMat=[FactorII_0to24_change(:,7),FactorII_0to24_change(:,8),FactorII_0to24_change(:,9)];

lengthOfData=length(FactorII_0to24_change);
for i=1:272
    TimePeriod{i,1}='0-6 hr';
    TimePeriod{lengthOfData+i,1}='6-12 hr';
    TimePeriod{2*lengthOfData+i,1}='12-24 hr';
    
    TimePeriodNum(i,1)=1;
    TimePeriodNum(lengthOfData+i,1)=2;
    TimePeriodNum(2*lengthOfData+i,1)=3;
end
DivisionRange=20 ;
GroupConcentrationLabels={'0-20','20-40','40-60','60-80','80-100','100-120','120-140','140-160','160-180','180-200'};

for i=1:length(InitialTimeConcen)
        RangegroupID=floor(InitialTimeConcen(i)/DivisionRange)+1;
        ConcentrationRange{i,1}=GroupConcentrationLabels{RangegroupID};
end
T=table(TimePeriod,InitialTimeConcen,ConcentrationRange,ChangeInConcen);
heatmapHandle =heatmap(T,'TimePeriod','ConcentrationRange','ColorVariable','ChangeInConcen')
colormap(redblue) 
caxis(heatmapHandle,[-50 50]);
heatmapHandle.YDisplayData ={'160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'};
heatmapHandle.MissingDataLabel='No Samples';
heatmapHandle.Title='Mean of Change in Concentration in Different Time Periods';
% heatmapHandle.GridVisible ='on';
% figure
% heatmap(T,'TimePeriod','ConcentrationRange')
% figure
% clabel = arrayfun(@(x){sprintf('%0.2f',x)}, CCC);
% heatmap(T,'TimePeriod','ConcentrationRange')



% RangeOfFactor=[0 180];
% DivisionRange=20 ;
% NumOfDivisions=max(RangeOfFactor)/DivisionRange;
% HeatMapData=zeros(NumOfDivisions,3);
% for j=1:3
%     for i=1:NumOfDivisions
%         logicalIndexes = InitialTimeConcenMAT(:,j) < DivisionRange*i & InitialTimeConcenMAT(:,j) > DivisionRange*(i-1) ;
%         HeatMapData(NumOfDivisions-i+1,j)=mean(ChangeInConcenMat(logicalIndexes,j) );
% 
%     end
% end
% figure
% imagesc([1 3],[0 max(RangeOfFactor)],HeatMapData)
% xlabel('Time Period [hour]'); ylabel('Concentration');
% set(gca,'Xtick',1:3,'XTickLabel',{'0-6h', '6-12h', '12-24h'})
% set(gca,'Ytick',0:DivisionRange:max(RangeOfFactor),'YTickLabel',max(RangeOfFactor)+DivisionRange/2:-DivisionRange:0+DivisionRange/2)
% set(gca, 'Ydir', 'reverse');
% colormap(redblue)
% colorbar 


%% Time History factor concentration graphs - grouped by mortality at 28 days 
% Plotting with for loop 
% Factor_Set_Selected={FactorII_0to24_select, FactorV_0to24_select, FactorVII_0to24_select, FactorIX_0to24_select, FactorX_0to24_select, FactorVIII_0to24_select, FactorATIII_0to24_select, FactorPC_0to24_select};
Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};

MortalityAt28Days=[Alldata(:,1), MortalityAt28Days_indicator];

plotnum=0; 
IntersRow=intersect(FactorII_0to24_select(:,1),FactorV_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorVII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorIX_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorX_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorVIII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorATIII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorPC_0to24_select(:,1));

for i=1:length(IntersRow)
    FactorII_0to24_select_Union(i,:)=FactorII_0to24_select(find(IntersRow(i)==FactorII_0to24_select(:,1)),:);
    FactorV_0to24_select_Union(i,:)=FactorV_0to24_select(find(IntersRow(i)==FactorV_0to24_select(:,1)),:);
    FactorVII_0to24_select_Union(i,:)=FactorVII_0to24_select(find(IntersRow(i)==FactorVII_0to24_select(:,1)),:);
    FactorIX_0to24_select_Union(i,:)=FactorIX_0to24_select(find(IntersRow(i)==FactorIX_0to24_select(:,1)),:);
    FactorX_0to24_select_Union(i,:)=FactorX_0to24_select(find(IntersRow(i)==FactorX_0to24_select(:,1)),:);
    FactorVIII_0to24_select_Union(i,:)=FactorVIII_0to24_select(find(IntersRow(i)==FactorVIII_0to24_select(:,1)),:);
    FactorATIII_0to24_select_Union(i,:)=FactorATIII_0to24_select(find(IntersRow(i)==FactorATIII_0to24_select(:,1)),:);
    FactorPC_0to24_select_Union(i,:)=FactorPC_0to24_select(find(IntersRow(i)==FactorPC_0to24_select(:,1)),:);
    
    MortalityAt28Days_select(i,:)=MortalityAt28Days(find(IntersRow(i)==MortalityAt28Days(:,1)),:);
end

Factor_Set_Selected={FactorII_0to24_select_Union, FactorV_0to24_select_Union, FactorVII_0to24_select_Union, FactorIX_0to24_select_Union, FactorX_0to24_select_Union, FactorVIII_0to24_select_Union, FactorATIII_0to24_select_Union, FactorPC_0to24_select_Union};
Time_stamps=[0 6 12 24];

for j=1:8
    ChosenFactor_selec_0to24=Factor_Set_Selected{j};
    figure(plotnum+j)
    boxX=[-1 -1 25 25]; boxY=[60 140 140 60];
    fill(boxX,boxY,[1 1 .85])
    xlim([-1 25])
    box on 
    death_g1=[];
    death_g2=[];
    
    for i=1:length(MortalityAt28Days_select)
        if MortalityAt28Days_select(i,2)==1  %died 2ithin 28 days  
            death_g1=[death_g1; ChosenFactor_selec_0to24(i,3:6)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChosenFactor_selec_0to24(i,3:6),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor','r')    
        else %survived the first 28 days 
            death_g2=[death_g2; ChosenFactor_selec_0to24(i,3:6)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChosenFactor_selec_0to24(i,3:6),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor','g')
        end
    end

    figure(plotnum+j) %Mean of each data set at each time stamp 
    hold on
    plot(Time_stamps, mean(death_g1,'omitnan'),'r','Marker','o','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','k')
    plot(Time_stamps, mean(death_g2,'omitnan'),'g','Marker','o','MarkerSize',10,'MarkerFaceColor','g','MarkerEdgeColor','k')
    title(sprintf('Time History %s Concentration', Factor_Set{j}))
    h = zeros(2, 1);
    h(1) = plot(NaN,NaN,'or','MarkerFaceColor','r');
    h(2) = plot(NaN,NaN,'og','MarkerFaceColor','g');
    legend(h, 'Died Within the First 28 Days','Survived the First 28 Days');
end


%% Heat map for Change (Delta) in Factor Concentrations 
Factor_Set_Selected={FactorII_0to24_select, FactorV_0to24_select, FactorVII_0to24_select, FactorIX_0to24_select, FactorX_0to24_select, FactorVIII_0to24_select, FactorATIII_0to24_select, FactorPC_0to24_select};
Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};
DivisionRange=20 ;
plotnum=10;

FactorII_0to24_change_Header={FactorII_0to24_Header{1:6}, 'Change 0-6 hr', 'Change 6-12 hr', 'Change 12-24 hr'};

FactorRangeLabels{1,1}={'160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'}; %170
FactorRangeLabels{2,1}={'140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'}; %157
FactorRangeLabels{3,1}={'280-300','260-280','240-260','220-240','200-220','180-200','160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'}; %300
FactorRangeLabels{4,1}={'540-560','520-540','500-520','480-500','460-480','440-460','420-440','400-420','380-400','360-380','340-360','320-340','300-320','280-300','260-280','240-260','220-240','200-220','180-200','160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'};
FactorRangeLabels{5,1}={'180-200','160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'};
FactorRangeLabels{6,1}={'1000-1020','980-1000','960-980','940-960','920-940','900-920','880-900','860-880','840-860','820-840','800-820','780-800','760-780','740-760','720-740','700-720','680-700','660-680','640-660','620-640','600-620','580-600','560-580','540-560','520-540','500-520','480-500','460-480','440-460','420-440','400-420','380-400','360-380','340-360','320-340','300-320','280-300','260-280','240-260','220-240','200-220','180-200','160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'};
FactorRangeLabels{7,1}={'280-300','260-280','240-260','220-240','200-220','180-200','160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'};
FactorRangeLabels{8,1}={'180-200','160-180','140-160','120-140','100-120','80-100','60-80','40-60','20-40','0-20'};

for k=1:8
    clear InitialTimeConcen ChangeInConcen TimePeriod RangegroupID ConcentrationRange InitialTimeConcen GroupConcentrationLabels
    ChosenFactor_Select_0to24=Factor_Set_Selected{k};
    FactorSelect_0to24_change=[ChosenFactor_Select_0to24, ChosenFactor_Select_0to24(:,4)-ChosenFactor_Select_0to24(:,3), ChosenFactor_Select_0to24(:,5)-ChosenFactor_Select_0to24(:,4), ChosenFactor_Select_0to24(:,6)-ChosenFactor_Select_0to24(:,5)];

    InitialTimeConcen=[FactorSelect_0to24_change(:,3);FactorSelect_0to24_change(:,4);FactorSelect_0to24_change(:,5)];
    InitialTimeConcenMAT=[FactorSelect_0to24_change(:,3),FactorSelect_0to24_change(:,4),FactorSelect_0to24_change(:,5)];
    ChangeInConcen=[FactorSelect_0to24_change(:,7);FactorSelect_0to24_change(:,8);FactorSelect_0to24_change(:,9)];
    ChangeInConcenMat=[FactorSelect_0to24_change(:,7),FactorSelect_0to24_change(:,8),FactorSelect_0to24_change(:,9)];

    lengthOfData=length(FactorSelect_0to24_change);
    for i=1:lengthOfData
        TimePeriod{i,1}='0-6 hr';
        TimePeriod{lengthOfData+i,1}='6-12 hr';
        TimePeriod{2*lengthOfData+i,1}='12-24 hr';
    end

    GroupConcentrationLabels=FactorRangeLabels{k,1};
    GroupConcentrationLabelsFlip=flip(GroupConcentrationLabels);
    
    for i=1:length(InitialTimeConcen)
            RangegroupID=ceil(InitialTimeConcen(i)/DivisionRange);
            ConcentrationRange{i,1}=GroupConcentrationLabelsFlip{RangegroupID};
    end
    T=table(TimePeriod,InitialTimeConcen,ConcentrationRange,ChangeInConcen);
    
%     figure(plotnum+k)
    figure(2)
    subplot(2,4,k)
    heatmapHandle =heatmap(T,'TimePeriod','ConcentrationRange','ColorVariable','ChangeInConcen')
    colormap(redblue) 
    caxis(heatmapHandle,[-max(abs(ChangeInConcen)) max(abs(ChangeInConcen))]);
    heatmapHandle.XDisplayData={'0-6 hr', '6-12 hr','12-24 hr'};
    heatmapHandle.YDisplayData =GroupConcentrationLabels;
    heatmapHandle.MissingDataLabel='No Samples';
    heatmapHandle.Title=sprintf('Change of %s Concentration within 24 Hours', Factor_Set{k});
    heatmapHandle.FontName='Calibri';
    heatmapHandle.FontSize=12; 
    heatmapHandle.YLabel='Initial CF [% activity]';
    heatmapHandle.XLabel='Time Period';

end

%% Change (Delta) in factor concentration graphs - grouped by mortality at 28 days 
% Plotting with for loop 
% Factor_Set_Selected={FactorII_0to24_select, FactorV_0to24_select, FactorVII_0to24_select, FactorIX_0to24_select, FactorX_0to24_select, FactorVIII_0to24_select, FactorATIII_0to24_select, FactorPC_0to24_select};
Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};

MortalityAt28Days=[Alldata(:,1), MortalityAt28Days_indicator];

plotnum=20; 
IntersRow=intersect(FactorII_0to24_select(:,1),FactorV_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorVII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorIX_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorX_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorVIII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorATIII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorPC_0to24_select(:,1));

for i=1:length(IntersRow)
    FactorII_0to24_select_Union(i,:)=FactorII_0to24_select(find(IntersRow(i)==FactorII_0to24_select(:,1)),:);
    FactorV_0to24_select_Union(i,:)=FactorV_0to24_select(find(IntersRow(i)==FactorV_0to24_select(:,1)),:);
    FactorVII_0to24_select_Union(i,:)=FactorVII_0to24_select(find(IntersRow(i)==FactorVII_0to24_select(:,1)),:);
    FactorIX_0to24_select_Union(i,:)=FactorIX_0to24_select(find(IntersRow(i)==FactorIX_0to24_select(:,1)),:);
    FactorX_0to24_select_Union(i,:)=FactorX_0to24_select(find(IntersRow(i)==FactorX_0to24_select(:,1)),:);
    FactorVIII_0to24_select_Union(i,:)=FactorVIII_0to24_select(find(IntersRow(i)==FactorVIII_0to24_select(:,1)),:);
    FactorATIII_0to24_select_Union(i,:)=FactorATIII_0to24_select(find(IntersRow(i)==FactorATIII_0to24_select(:,1)),:);
    FactorPC_0to24_select_Union(i,:)=FactorPC_0to24_select(find(IntersRow(i)==FactorPC_0to24_select(:,1)),:);
    
    MortalityAt28Days_select(i,:)=MortalityAt28Days(find(IntersRow(i)==MortalityAt28Days(:,1)),:);
end

Factor_Set_Selected={FactorII_0to24_select_Union, FactorV_0to24_select_Union, FactorVII_0to24_select_Union, FactorIX_0to24_select_Union, FactorX_0to24_select_Union, FactorVIII_0to24_select_Union, FactorATIII_0to24_select_Union, FactorPC_0to24_select_Union};
Time_stamps=[6 12 24];

for j=1:8
    ChosenFactor_selec_0to24=Factor_Set_Selected{j};
    figure(plotnum+j)
    xlim([0 25])
    box on 
    death_g1=[];
    death_g2=[];
    
    
    FactorSelect_0to24_change=[ChosenFactor_selec_0to24, ChosenFactor_selec_0to24(:,4)-ChosenFactor_selec_0to24(:,3), ChosenFactor_selec_0to24(:,5)-ChosenFactor_selec_0to24(:,4), ChosenFactor_selec_0to24(:,6)-ChosenFactor_selec_0to24(:,5)];
    InitialTimeConcenMAT=[FactorSelect_0to24_change(:,3),FactorSelect_0to24_change(:,4),FactorSelect_0to24_change(:,5)];
    ChangeInConcenMat=[FactorSelect_0to24_change(:,7),FactorSelect_0to24_change(:,8),FactorSelect_0to24_change(:,9)];

    for i=1:length(MortalityAt28Days_select)
        if MortalityAt28Days_select(i,2)==1  %died 2ithin 28 days  
            death_g1=[death_g1; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor','r')    
        else %survived the first 28 days 
            death_g2=[death_g2; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor','g')
        end
    end

    figure(plotnum+j) %Mean of each data set at each time stamp 
    hold on
    plot(Time_stamps, mean(death_g1,'omitnan'),'r','Marker','o','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','k')
    plot(Time_stamps, mean(death_g2,'omitnan'),'g','Marker','o','MarkerSize',10,'MarkerFaceColor','g','MarkerEdgeColor','k')
    title(sprintf('Delta Change in %s Concentration', Factor_Set{j}))
    h = zeros(2, 1);
    h(1) = plot(NaN,NaN,'or','MarkerFaceColor','r');
    h(2) = plot(NaN,NaN,'og','MarkerFaceColor','g');
    legend(h, 'Died Within the First 28 Days','Survived the First 28 Days');
end


%% Change (Delta) in factor concentration graphs - grouped by initial factor concentration 
% Plotting with for loop 
% Factor_Set_Selected={FactorII_0to24_select, FactorV_0to24_select, FactorVII_0to24_select, FactorIX_0to24_select, FactorX_0to24_select, FactorVIII_0to24_select, FactorATIII_0to24_select, FactorPC_0to24_select};
Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};

plotnum=30; 
IntersRow=intersect(FactorII_0to24_select(:,1),FactorV_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorVII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorIX_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorX_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorVIII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorATIII_0to24_select(:,1));
IntersRow=intersect(IntersRow,FactorPC_0to24_select(:,1));

for i=1:length(IntersRow)
    FactorII_0to24_select_Union(i,:)=FactorII_0to24_select(find(IntersRow(i)==FactorII_0to24_select(:,1)),:);
    FactorV_0to24_select_Union(i,:)=FactorV_0to24_select(find(IntersRow(i)==FactorV_0to24_select(:,1)),:);
    FactorVII_0to24_select_Union(i,:)=FactorVII_0to24_select(find(IntersRow(i)==FactorVII_0to24_select(:,1)),:);
    FactorIX_0to24_select_Union(i,:)=FactorIX_0to24_select(find(IntersRow(i)==FactorIX_0to24_select(:,1)),:);
    FactorX_0to24_select_Union(i,:)=FactorX_0to24_select(find(IntersRow(i)==FactorX_0to24_select(:,1)),:);
    FactorVIII_0to24_select_Union(i,:)=FactorVIII_0to24_select(find(IntersRow(i)==FactorVIII_0to24_select(:,1)),:);
    FactorATIII_0to24_select_Union(i,:)=FactorATIII_0to24_select(find(IntersRow(i)==FactorATIII_0to24_select(:,1)),:);
    FactorPC_0to24_select_Union(i,:)=FactorPC_0to24_select(find(IntersRow(i)==FactorPC_0to24_select(:,1)),:);
end

Factor_Set_Selected={FactorII_0to24_select_Union, FactorV_0to24_select_Union, FactorVII_0to24_select_Union, FactorIX_0to24_select_Union, FactorX_0to24_select_Union, FactorVIII_0to24_select_Union, FactorATIII_0to24_select_Union, FactorPC_0to24_select_Union};
Time_stamps=[6 12 24];

for j=1:8
    ChosenFactor_selec_0to24=Factor_Set_Selected{j};
    figure(plotnum+j)
    xlim([0 25])
    box on 
    Groups_g1=[];
    Groups_g2=[];
    Groups_g3=[];
    Groups_g4=[];
    Groups_g5=[];
    Groups_g6=[];
    Groups_g7=[];
    
    
    FactorSelect_0to24_change=[ChosenFactor_selec_0to24, ChosenFactor_selec_0to24(:,4)-ChosenFactor_selec_0to24(:,3), ChosenFactor_selec_0to24(:,5)-ChosenFactor_selec_0to24(:,4), ChosenFactor_selec_0to24(:,6)-ChosenFactor_selec_0to24(:,5)];
    InitialTimeConcenMAT=[FactorSelect_0to24_change(:,3),FactorSelect_0to24_change(:,4),FactorSelect_0to24_change(:,5)];
    ChangeInConcenMat=[FactorSelect_0to24_change(:,7),FactorSelect_0to24_change(:,8),FactorSelect_0to24_change(:,9)];
    MaxIniCon=max(InitialTimeConcenMAT(:,1));
    Range_incriments=10*(ceil(MaxIniCon/70));
    
    for i=1:length(MortalityAt28Days_select)
        if InitialTimeConcenMAT(i,1) <= Range_incriments  %First range  
            Groups_g1=[Groups_g1; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.9290 0.6940 0.1250]) 
        elseif InitialTimeConcenMAT(i,1) <= 2*Range_incriments  %second range  
            Groups_g2=[Groups_g2; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.4660 0.6740 0.1880])   
        elseif InitialTimeConcenMAT(i,1) <= 3*Range_incriments  %3rd range  
            Groups_g3=[Groups_g3; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.3010 0.7450 0.9330]) 
        elseif InitialTimeConcenMAT(i,1) <= 4*Range_incriments  %4th range  
            Groups_g4=[Groups_g4; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0 0.4470 0.7410]) 
        elseif InitialTimeConcenMAT(i,1) <= 5*Range_incriments  %5th range  
            Groups_g5=[Groups_g5; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.4940 0.1840 0.5560]) 
        elseif InitialTimeConcenMAT(i,1) <= 6*Range_incriments  %6th range  
            Groups_g6=[Groups_g6; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.8500 0.3250 0.0980]) 
        else %Last ran
            Groups_g7=[Groups_g7; ChangeInConcenMat(i,:)];
            figure(plotnum+j)
            hold on 
            scatter(Time_stamps, ChangeInConcenMat(i,:),'Marker','o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.6350 0.0780 0.1840])
        end
    end

    figure(plotnum+j) %Mean of each data set at each time stamp 
    hold on
    plot(Time_stamps, mean(Groups_g1,1,'omitnan'),'Color',[0.9290 0.6940 0.1250],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0.9290 0.6940 0.1250],'MarkerEdgeColor','k')
    plot(Time_stamps, mean(Groups_g2,1,'omitnan'),'Color',[0.4660 0.6740 0.1880],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0.4660 0.6740 0.1880],'MarkerEdgeColor','k')
    plot(Time_stamps, mean(Groups_g3,1,'omitnan'),'Color',[0.3010 0.7450 0.9330],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0.3010 0.7450 0.9330],'MarkerEdgeColor','k')
    plot(Time_stamps, mean(Groups_g4,1,'omitnan'),'Color',[0 0.4470 0.7410],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor','k')
    plot(Time_stamps, mean(Groups_g5,1,'omitnan'),'Color',[0.4940 0.1840 0.5560],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0.4940 0.1840 0.5560],'MarkerEdgeColor','k')
    plot(Time_stamps, mean(Groups_g6,1,'omitnan'),'Color',[0.8500 0.3250 0.0980],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0.8500 0.3250 0.0980],'MarkerEdgeColor','k')
    plot(Time_stamps, mean(Groups_g7,1,'omitnan'),'Color',[0.6350 0.0780 0.1840],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0.6350 0.0780 0.1840],'MarkerEdgeColor','k')
    title(sprintf('Delta Change in %s Concentration, Group by Initial Concentration', Factor_Set{j}))
    h = zeros(7, 1);
    h(1) = plot(NaN,NaN,'ok','MarkerFaceColor',[0.9290 0.6940 0.1250]);
    h(2) = plot(NaN,NaN,'ok','MarkerFaceColor',[0.4660 0.6740 0.1880]);
    h(3) = plot(NaN,NaN,'ok','MarkerFaceColor',[0.3010 0.7450 0.9330]);
    h(4) = plot(NaN,NaN,'ok','MarkerFaceColor',[0 0.4470 0.7410]);
    h(5) = plot(NaN,NaN,'ok','MarkerFaceColor',[0.4940 0.1840 0.5560]);
    h(6) = plot(NaN,NaN,'ok','MarkerFaceColor',[0.8500 0.3250 0.0980]);
    h(7) = plot(NaN,NaN,'ok','MarkerFaceColor',[0.6350 0.0780 0.1840]);
    legend(h, strcat(num2str(0),' to','',num2str(Range_incriments)), strcat(num2str(Range_incriments),' to ','',num2str(2*Range_incriments)), strcat(num2str(2*Range_incriments),' to ','',num2str(3*Range_incriments)), strcat(num2str(3*Range_incriments),' to ','',num2str(4*Range_incriments)), strcat(num2str(4*Range_incriments),' to ','',num2str(5*Range_incriments)), strcat(num2str(5*Range_incriments),' to ','',num2str(6*Range_incriments)), strcat(num2str(6*Range_incriments),' to ','',num2str(7*Range_incriments)));
    
end



%% Heat map for Change (Delta) in Factor Concentrations - 10 groups per factor 
Factor_Set_Selected={FactorII_0to24_select, FactorV_0to24_select, FactorVII_0to24_select, FactorIX_0to24_select, FactorX_0to24_select, FactorVIII_0to24_select, FactorATIII_0to24_select, FactorPC_0to24_select};
Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};

% DivisionRange=20 ;

plotnum=10;

FactorII_0to24_change_Header={FactorII_0to24_Header{1:6}, 'Change 0-6 hr', 'Change 6-12 hr', 'Change 12-24 hr'};

for k=1:8
    clear InitialTimeConcen ChangeInConcen TimePeriod RangegroupID ConcentrationRange InitialTimeConcen GroupConcentrationLabels InitialConcentration
    ChosenFactor_Select_0to24=Factor_Set_Selected{k};
    FactorSelect_0to24_change=[ChosenFactor_Select_0to24, ChosenFactor_Select_0to24(:,4)-ChosenFactor_Select_0to24(:,3), ChosenFactor_Select_0to24(:,5)-ChosenFactor_Select_0to24(:,4), ChosenFactor_Select_0to24(:,6)-ChosenFactor_Select_0to24(:,5)];
    
    if k==4
        FactorSelect_0to24_change(273,:)=[];
    elseif k==7
        FactorSelect_0to24_change(58,:)=[];
    end
    
    InitialTimeConcen=[FactorSelect_0to24_change(:,3);FactorSelect_0to24_change(:,4);FactorSelect_0to24_change(:,5)];
    InitialTimeConcenMAT=[FactorSelect_0to24_change(:,3),FactorSelect_0to24_change(:,4),FactorSelect_0to24_change(:,5)];
    ChangeInConcen=[FactorSelect_0to24_change(:,7);FactorSelect_0to24_change(:,8);FactorSelect_0to24_change(:,9)];
    ChangeInConcenMat=[FactorSelect_0to24_change(:,7),FactorSelect_0to24_change(:,8),FactorSelect_0to24_change(:,9)];
    
    
    MaxIniCon=max(InitialTimeConcen(:,1));
    DivisionRange=10*(ceil(MaxIniCon/100));
    
    lengthOfData=length(FactorSelect_0to24_change);
    for i=1:lengthOfData
        TimePeriod{i,1}='0-6 hr';
        TimePeriod{lengthOfData+i,1}='6-12 hr';
        TimePeriod{2*lengthOfData+i,1}='12-24 hr';
    end
    
    GroupConcentrationLabels={strcat(num2str(0),' to ',num2str(DivisionRange)), strcat(num2str(DivisionRange),' to ',num2str(2*DivisionRange)), ...
        strcat(num2str(2*DivisionRange),' to ',num2str(3*DivisionRange)), ...
        strcat(num2str(3*DivisionRange),' to ',num2str(4*DivisionRange)), ... 
        strcat(num2str(4*DivisionRange),' to ',num2str(5*DivisionRange)), ... 
        strcat(num2str(5*DivisionRange),' to ',num2str(6*DivisionRange)), ...
        strcat(num2str(6*DivisionRange),' to ',num2str(7*DivisionRange)), ...
        strcat(num2str(7*DivisionRange),' to ',num2str(8*DivisionRange)), ...
        strcat(num2str(8*DivisionRange),' to ',num2str(9*DivisionRange)), ...
        strcat(num2str(9*DivisionRange),' to ',num2str(10*DivisionRange))};
%     GroupConcentrationLabels=FactorRangeLabels{k,1};
%     GroupConcentrationLabelsFlip=flip(GroupConcentrationLabels);
    GroupConcentrationLabelsFlip=GroupConcentrationLabels;
    
    for i=1:length(InitialTimeConcen)
            RangegroupID=ceil(InitialTimeConcen(i)/DivisionRange);
            InitialConcentration{i,1}=GroupConcentrationLabelsFlip{RangegroupID};
    end
    T=table(TimePeriod,InitialTimeConcen,InitialConcentration,ChangeInConcen);
    
%     figure(plotnum+k)
%     figure(ceil(k/4))
%     subplot(2,2,k-4*(ceil(k/4)-1))
    figure(4)
    subplot(2,4,k)
    heatmapHandle =heatmap(T,'TimePeriod','InitialConcentration','ColorVariable','ChangeInConcen');
    colormap(redblue) 
    caxis(heatmapHandle,[-max(abs(heatmapHandle.ColorLimits)) max(abs(heatmapHandle.ColorLimits))]);
    heatmapHandle.XDisplayData={'0-6 [hr]', '6-12 [hr]','12-24 [hr]'};
    heatmapHandle.YDisplayData =flip(GroupConcentrationLabels);
    heatmapHandle.MissingDataLabel='\0';
%     heatmapHandle.Title=sprintf('Change of %s Concentration within 24 Hours', Factor_Set{k});
    heatmapHandle.Title=Factor_Set{k};
    heatmapHandle.FontName='Calibri';
    heatmapHandle.FontSize=9; 
    heatmapHandle.YLabel='Initial CF [% activity]';
    heatmapHandle.XLabel='Time period';
end

%% Heat map for Change (Delta) in Factor Concentrations - 10 groups per factor not rounded 
Factor_Set_Selected={FactorII_0to24_select, FactorV_0to24_select, FactorVII_0to24_select, FactorIX_0to24_select, FactorX_0to24_select, FactorVIII_0to24_select, FactorATIII_0to24_select, FactorPC_0to24_select};
Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};

% DivisionRange=20 ;

plotnum=10;

FactorII_0to24_change_Header={FactorII_0to24_Header{1:6}, 'Change 0-6 hr', 'Change 6-12 hr', 'Change 12-24 hr'};

for k=1:8
    clear InitialTimeConcen ChangeInConcen TimePeriod RangegroupID ConcentrationRange InitialTimeConcen GroupConcentrationLabels InitialConcentration
    ChosenFactor_Select_0to24=Factor_Set_Selected{k};
    FactorSelect_0to24_change=[ChosenFactor_Select_0to24, ChosenFactor_Select_0to24(:,4)-ChosenFactor_Select_0to24(:,3), ChosenFactor_Select_0to24(:,5)-ChosenFactor_Select_0to24(:,4), ChosenFactor_Select_0to24(:,6)-ChosenFactor_Select_0to24(:,5)];
    
    if k==4
        FactorSelect_0to24_change(273,:)=[];
    elseif k==7
        FactorSelect_0to24_change(58,:)=[];
    end
    
    InitialTimeConcen=[FactorSelect_0to24_change(:,3);FactorSelect_0to24_change(:,4);FactorSelect_0to24_change(:,5)];
    InitialTimeConcenMAT=[FactorSelect_0to24_change(:,3),FactorSelect_0to24_change(:,4),FactorSelect_0to24_change(:,5)];
    ChangeInConcen=[FactorSelect_0to24_change(:,7);FactorSelect_0to24_change(:,8);FactorSelect_0to24_change(:,9)];
    ChangeInConcenMat=[FactorSelect_0to24_change(:,7),FactorSelect_0to24_change(:,8),FactorSelect_0to24_change(:,9)];
    
    
    MaxIniCon=max(InitialTimeConcen(:,1));
    DivisionRange=1*(ceil(MaxIniCon/10));
    
    lengthOfData=length(FactorSelect_0to24_change);
    for i=1:lengthOfData
        TimePeriod{i,1}='0-6 hr';
        TimePeriod{lengthOfData+i,1}='6-12 hr';
        TimePeriod{2*lengthOfData+i,1}='12-24 hr';
    end
    
    GroupConcentrationLabels={strcat(num2str(0),' to ',num2str(DivisionRange)), strcat(num2str(DivisionRange),' to ',num2str(2*DivisionRange)), ...
        strcat(num2str(2*DivisionRange),' to ',num2str(3*DivisionRange)), ...
        strcat(num2str(3*DivisionRange),' to ',num2str(4*DivisionRange)), ... 
        strcat(num2str(4*DivisionRange),' to ',num2str(5*DivisionRange)), ... 
        strcat(num2str(5*DivisionRange),' to ',num2str(6*DivisionRange)), ...
        strcat(num2str(6*DivisionRange),' to ',num2str(7*DivisionRange)), ...
        strcat(num2str(7*DivisionRange),' to ',num2str(8*DivisionRange)), ...
        strcat(num2str(8*DivisionRange),' to ',num2str(9*DivisionRange)), ...
        strcat(num2str(9*DivisionRange),' to ',num2str(10*DivisionRange))};
%     GroupConcentrationLabels=FactorRangeLabels{k,1};
%     GroupConcentrationLabelsFlip=flip(GroupConcentrationLabels);
    GroupConcentrationLabelsFlip=GroupConcentrationLabels;
    
    for i=1:length(InitialTimeConcen)
            RangegroupID=ceil(InitialTimeConcen(i)/DivisionRange);
            InitialConcentration{i,1}=GroupConcentrationLabelsFlip{RangegroupID};
    end
    T=table(TimePeriod,InitialTimeConcen,InitialConcentration,ChangeInConcen);
    
%     figure(plotnum+k)
%     figure(ceil(k/4))
%     subplot(2,2,k-4*(ceil(k/4)-1))
    figure(4)
    subplot(2,4,k)
    heatmapHandle =heatmap(T,'TimePeriod','InitialConcentration','ColorVariable','ChangeInConcen');
    colormap(redblue) 
    caxis(heatmapHandle,[-max(abs(heatmapHandle.ColorLimits)) max(abs(heatmapHandle.ColorLimits))]);
    heatmapHandle.XDisplayData={'0-6 hr', '6-12 hr','12-24 hr'};
    heatmapHandle.YDisplayData =flip(GroupConcentrationLabels);
    heatmapHandle.MissingDataLabel='No Samples';
%     heatmapHandle.Title=sprintf('Change of %s Concentration within 24 Hours', Factor_Set{k});
    heatmapHandle.Title=Factor_Set{k};
    heatmapHandle.FontName='Calibri';
    heatmapHandle.FontSize=9; 
    heatmapHandle.YLabel='Initial concentration';
    heatmapHandle.XLabel='Time period';
end

%% Mean std  Change (Delta) in Factor Concentrations - 10 groups per factor 
Factor_Set_Selected={FactorII_0to24_select, FactorV_0to24_select, FactorVII_0to24_select, FactorIX_0to24_select, FactorX_0to24_select, FactorVIII_0to24_select, FactorATIII_0to24_select, FactorPC_0to24_select};
Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};

% DivisionRange=20 ;

FactorII_0to24_change_Header={FactorII_0to24_Header{1:6}, 'Change 0-6 hr', 'Change 6-12 hr', 'Change 12-24 hr'};

for k=1:8
    clear InitialTimeConcen ChangeInConcen TimePeriod RangegroupID ConcentrationRange InitialTimeConcen GroupConcentrationLabels
    ChosenFactor_Select_0to24=Factor_Set_Selected{k};
    FactorSelect_0to24_change=[ChosenFactor_Select_0to24, ChosenFactor_Select_0to24(:,4)-ChosenFactor_Select_0to24(:,3), ChosenFactor_Select_0to24(:,5)-ChosenFactor_Select_0to24(:,4), ChosenFactor_Select_0to24(:,6)-ChosenFactor_Select_0to24(:,5)];

    InitialTimeConcen=[FactorSelect_0to24_change(:,3);FactorSelect_0to24_change(:,4);FactorSelect_0to24_change(:,5)];
    InitialTimeConcenMAT=[FactorSelect_0to24_change(:,3),FactorSelect_0to24_change(:,4),FactorSelect_0to24_change(:,5)];
    ChangeInConcen=[FactorSelect_0to24_change(:,7);FactorSelect_0to24_change(:,8);FactorSelect_0to24_change(:,9)];
    ChangeInConcenMat=[FactorSelect_0to24_change(:,7),FactorSelect_0to24_change(:,8),FactorSelect_0to24_change(:,9)];
    
%     figure(plotnum+k)
%     figure(ceil(k/4))
%     subplot(2,2,k-4*(ceil(k/4)-1))
    figure(1)
    subplot(3,3,k)
    errorbar([0 6 12 24], [0 mean(ChangeInConcenMat,1)], [0 std(ChangeInConcenMat,0,1)],'Color',[0.6350 0.0780 0.1840],'Marker','o','MarkerSize',10,'MarkerFaceColor',[0.6350 0.0780 0.1840],'MarkerEdgeColor','k')
    title(sprintf('%s', Factor_Set{j}), 'FontSize', 14, 'FontWeight', 'bold')
    xlabel('Time [hr]', 'FontSize', 14, 'FontWeight', 'bold')
    ylabel('Concentration Change', 'FontSize', 14, 'FontWeight', 'bold')
    ax = gca;
    ax.FontSize = 14; 
    ax.FontWeight = 'bold'; 
    xlim([-1 25])
    ylim([-50 50])
    if k==6
        ylim([-200 200])
    end
    box on 
    grid on

end