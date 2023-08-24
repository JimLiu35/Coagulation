% Fig 3
%% Import all data
[Alldata, Header]=xlsread('ACIT_6Jan17_deidentified1_MitchData','A1:TJ1672');
FactorVII_treatmend_indicator=xlsread('ACIT_6Jan17_deidentified1_MitchData','WO2:WO1672');

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
        TimePeriod{i,1}='0-6 [hr]';
        TimePeriod{lengthOfData+i,1}='6-12 [hr]';
        TimePeriod{2*lengthOfData+i,1}='12-24 [hr]';
    end
    
    GroupConcentrationLabels={strcat(num2str(0),'-',num2str(DivisionRange)), strcat(num2str(DivisionRange),'-',num2str(2*DivisionRange)), ...
        strcat(num2str(2*DivisionRange),'-',num2str(3*DivisionRange)), ...
        strcat(num2str(3*DivisionRange),'-',num2str(4*DivisionRange)), ... 
        strcat(num2str(4*DivisionRange),'-',num2str(5*DivisionRange)), ... 
        strcat(num2str(5*DivisionRange),'-',num2str(6*DivisionRange)), ...
        strcat(num2str(6*DivisionRange),'-',num2str(7*DivisionRange)), ...
        strcat(num2str(7*DivisionRange),'-',num2str(8*DivisionRange)), ...
        strcat(num2str(8*DivisionRange),'-',num2str(9*DivisionRange)), ...
        strcat(num2str(9*DivisionRange),'-',num2str(10*DivisionRange))};
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
%     figure(4)
%     subplot(2,4,k)
    figure(0+k)
    heatmapHandle =heatmap(T,'TimePeriod','InitialConcentration','ColorVariable','ChangeInConcen');
    colormap(redblue) 
    caxis(heatmapHandle,[-max(abs(heatmapHandle.ColorLimits)) max(abs(heatmapHandle.ColorLimits))]);
    heatmapHandle.XDisplayData={'0-6 [hr]', '6-12 [hr]','12-24 [hr]'};
    heatmapHandle.YDisplayData =flip(GroupConcentrationLabels);
    heatmapHandle.MissingDataLabel='\0';
%     heatmapHandle.Title=sprintf('Change of %s Concentration within 24 Hours', Factor_Set{k});
    heatmapHandle.Title=Factor_Set{k};
    heatmapHandle.FontName='Calibri';
    heatmapHandle.FontSize=35; 
    heatmapHandle.YLabel='Initial CF [% activity]';
    heatmapHandle.XLabel='Time Period';
end