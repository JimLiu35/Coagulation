% Fig 3 Comparison
FontSizeNum=15;
%% Import all data
[Alldata, Header]=xlsread('ACIT_6Jan17_deidentified1_MitchData','A1:TJ1672');
death_time=xlsread('ACIT_6Jan17_deidentified1_MitchData','CDE1:CDF1672');
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

Factor_Set_24h={FactorII_0to24,FactorV_0to24,FactorVII_0to24,FactorIX_0to24,FactorX_0to24,FactorVIII_0to24,FactorATIII_0to24,FactorPC_0to24};

%% 
% [row0, ~] = find(isnan(allData_0h_6h_12h_24h(:,[7:14,28:35,49:56,70:77])));
% rowsToDelete0=unique(row0);
% allData_select_24h=allData_0h_6h_12h_24h;
% 
% for i=length(rowsToDelete0):-1:1
%     allData_select_24h(rowsToDelete0(i),:)=[];
% end
% 
% FactorII_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,7), allData_select_24h(:,28), allData_select_24h(:,49), allData_select_24h(:,70)];
% FactorV_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,8), allData_select_24h(:,29), allData_select_24h(:,50), allData_select_24h(:,71)];
% FactorVII_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,9), allData_select_24h(:,30), allData_select_24h(:,51), allData_select_24h(:,72)];
% FactorIX_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,10), allData_select_24h(:,31), allData_select_24h(:,52), allData_select_24h(:,73)];
% FactorX_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,11), allData_select_24h(:,32), allData_select_24h(:,53), allData_select_24h(:,74)];
% FactorVIII_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,12), allData_select_24h(:,33), allData_select_24h(:,54), allData_select_24h(:,75)];
% FactorATIII_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,13), allData_select_24h(:,34), allData_select_24h(:,55), allData_select_24h(:,76)];
% FactorPC_alive_0to24=[allData_select_24h(:,1:2), allData_select_24h(:,14), allData_select_24h(:,35), allData_select_24h(:,56), allData_select_24h(:,77)];
% 
% Factor_Set_Alive={FactorII_alive_0to24, FactorV_alive_0to24, FactorVII_alive_0to24, FactorIX_alive_0to24, FactorX_alive_0to24, FactorVIII_alive_0to24, FactorATIII_alive_0to24, FactorPC_alive_0to24};

%% Mortality Finder 

% [deathTime_row, ~] = find(death_time(:,2)==1);
% 
% for i=1:length(deathTime_row)
%     allData_death_in24h(i,:)=allData_0h_6h_12h_24h(deathTime_row(i),:);   %everyone died within 24 hours 
% end
% 
% [row0_death, ~] = find(isnan(allData_death_in24h(:,7:14)));
% rowsToDelete0_dead=unique(row0_death);
% allData_select_death_in24h=allData_death_in24h;
% 
% for i=length(rowsToDelete0_dead):-1:1
%     allData_select_death_in24h(rowsToDelete0_dead(i),:)=[];
% end
% 
% FactorII_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,7), allData_select_death_in24h(:,28), allData_select_death_in24h(:,49), allData_select_death_in24h(:,70)];
% FactorV_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,8), allData_select_death_in24h(:,29), allData_select_death_in24h(:,50), allData_select_death_in24h(:,71)];
% FactorVII_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,9), allData_select_death_in24h(:,30), allData_select_death_in24h(:,51), allData_select_death_in24h(:,72)];
% FactorIX_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,10), allData_select_death_in24h(:,31), allData_select_death_in24h(:,52), allData_select_death_in24h(:,73)];
% FactorX_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,11), allData_select_death_in24h(:,32), allData_select_death_in24h(:,53), allData_select_death_in24h(:,74)];
% FactorVIII_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,12), allData_select_death_in24h(:,33), allData_select_death_in24h(:,54), allData_select_death_in24h(:,75)];
% FactorATIII_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,13), allData_select_death_in24h(:,34), allData_select_death_in24h(:,55), allData_select_death_in24h(:,76)];
% FactorPC_death_0to24=[allData_select_death_in24h(:,1:2), allData_select_death_in24h(:,14), allData_select_death_in24h(:,35), allData_select_death_in24h(:,56), allData_select_death_in24h(:,77)];
% 
% Factor_Set_Death={FactorII_death_0to24, FactorV_death_0to24, FactorVII_death_0to24, FactorIX_death_0to24, FactorX_death_0to24, FactorVIII_death_0to24, FactorATIII_death_0to24, FactorPC_death_0to24};

%% Tests for each factor 
[deathTime_row, ~] = find(death_time(:,2)==1);

for fac_count=1:8
    Current_Factor_Data=Factor_Set_24h{fac_count};
    
    for i=1:length(deathTime_row)
        Current_Factor_dead_patients(i,:)=Current_Factor_Data(deathTime_row(i),:);   %everyone died within 6 hours 
    end
    [row, ~] = find(isnan(Current_Factor_dead_patients(:,3:4)));
    rowsToDelete=unique(row);
    Current_Factor_Data_0and6h_Dead=Current_Factor_dead_patients;
    for i=length(rowsToDelete):-1:1
        Current_Factor_Data_0and6h_Dead(rowsToDelete(i),:)=[];
    end
    
    DIFF_Current_Factor_Death=Current_Factor_Data_0and6h_Dead(:,4)-Current_Factor_Data_0and6h_Dead(:,3);
    Current_Factor_Death_0h=Current_Factor_Data_0and6h_Dead(:,3);

    [row, ~] = find(isnan(Current_Factor_Data(:,3:6)));
    rowsToDelete=unique(row);
    Current_Factor_Data_24h=Current_Factor_Data;
    for i=length(rowsToDelete):-1:1
        Current_Factor_Data_24h(rowsToDelete(i),:)=[];
    end


    Factor_Set={'Factor II','Factor V','Factor VII','Factor IX','Factor X','Factor VIII','Factor ATIII','Protein C'};


    DIFF_Current_Factor_Alive_1=Current_Factor_Data_24h(:,4)-Current_Factor_Data_24h(:,3);
    DIFF_Current_Factor_Alive_2=Current_Factor_Data_24h(:,5)-Current_Factor_Data_24h(:,4);
    DIFF_Current_Factor_Alive_3=Current_Factor_Data_24h(:,6)-Current_Factor_Data_24h(:,5);
    Current_Factor_Alive1=Current_Factor_Data_24h(:,3);
    Current_Factor_Alive2=Current_Factor_Data_24h(:,4);
    Current_Factor_Alive3=Current_Factor_Data_24h(:,5);
    Current_Factor_Alive4=Current_Factor_Data_24h(:,6);


    %Graphs

    Diff_Data_Alive=[DIFF_Current_Factor_Alive_1, DIFF_Current_Factor_Alive_2, DIFF_Current_Factor_Alive_3];
    Mean_DIFFData=[mean(DIFF_Current_Factor_Death), mean(Diff_Data_Alive)];
    Std_DIFFData=[std(DIFF_Current_Factor_Death), std(Diff_Data_Alive)];

    labels={'','','',''};

    for i=1:length(Mean_DIFFData)
        if i==1
            x=DIFF_Current_Factor_Death;
        else
            x=Diff_Data_Alive(:,i-1);
        end
        [~,~,CI,~] = ttest(x);
        CI_Data(i)=(CI(2)-CI(1))/2;
        [~,p,~,~] = ttest2(x,DIFF_Current_Factor_Death,'Vartype','unequal');
        if i~=1
            if p>0.05
                labels{i}='ns';
            elseif p<=0.0001
                labels{i}='****';
            elseif p<=0.001
                labels{i}='***';
            elseif p<=0.01
                labels{i}='**';
            else 
                labels{i}='*';
            end
        end
    end

    DIFFTime_stamps={'From  0 to 6 hr','From 0 to 6 hr','From 6 to 12 hr','From 12 to 24 hr'};

    figure(1)
    subplot(2,4,fac_count)
%     clf
    X = categorical(DIFFTime_stamps);
    X = reordercats(X,DIFFTime_stamps);
    if fac_count==5
        q=Mean_DIFFData; Mean_DIFFData(3)=q(4); Mean_DIFFData(4)=q(3);
    elseif fac_count==3
        q=Mean_DIFFData; Mean_DIFFData(2)=q(4); Mean_DIFFData(3)=q(2); Mean_DIFFData(4)=q(3);
    end
    br=bar(X, Mean_DIFFData,'FaceColor','flat');
    br.CData(1,:) = [0.8500 0.3250 0.0980];

    xtips = br.XEndPoints;
    % ytips = br.YEndPoints+Std_DIFFData_1;
    ytips = br.YEndPoints-CI_Data-1;
%     for i=2:length(ytips)
%         if ytips(i)<0
%             ytips(i) = br.YEndPoints(i)-CI_Data(i)-(abs(ytips(1))/15);
%         end
%     end
    if fac_count==5
        q=CI_Data; CI_Data(3)=q(4); CI_Data(4)=q(3);
        q=ytips; ytips(3)=q(4); ytips(4)=q(3);
        q=labels; labels(3)=q(4); labels(4)=q(3);
    elseif fac_count==3
        q=CI_Data; CI_Data(2)=q(4); CI_Data(3)=q(2); CI_Data(4)=q(3);
        q=ytips; ytips(2)=q(4); ytips(3)=q(2); ytips(4)=q(3);
        q=labels; labels(2)=q(4); labels(3)=q(2); labels(4)=q(3);
    end
    text(xtips,ytips,labels,'HorizontalAlignment','center','VerticalAlignment','top','FontSize',FontSizeNum)
    hold on
    er=errorbar(X, Mean_DIFFData,CI_Data);
    er.Color = [0 0 0];                            
    er.LineStyle = 'none';  
    er.LineWidth=1;
    ylabel('Mean \Delta CF [% activity]')
    title(Factor_Set{fac_count})
    set(gca,'FontSize',FontSizeNum)
    box on 
    grid on
    
    
    
end

h = zeros(3, 1);
h(1) = bar(NaN,NaN,'FaceColor',[0.8500 0.3250 0.0980]);
h(2) = bar(NaN,NaN,'FaceColor',[0 0.4470 0.7410]);
% h(3) = errorbar(NaN,NaN,NaN,'color',[0 0 0],'LineWidth',1);
h(3)=er;
legend(h,'Deceased within 24 hours','Alive at 24 hours','95% Confidence Interval','Orientation','horizontal')

