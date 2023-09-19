clear all
close all
clc

%format long e

%% Normals

MCADataValues = xlsread('../../Data/Processed/CAT_Normals','Fits','A2:M21');

Normalnum = MCADataValues(:,1);
k0 = MCADataValues(:,2);
k1 = MCADataValues(:,3);
k2 = MCADataValues(:,4);
kn = MCADataValues(:,5);
kd = MCADataValues(:,6);

II_0 = MCADataValues(:,7);
V_0 = MCADataValues(:,8);
VII_0 = MCADataValues(:,9);
VIII_0 = MCADataValues(:,10);
IX_0 = MCADataValues(:,11);
X_0 = MCADataValues(:,12);
ATIII_0 = MCADataValues(:,13);

s = tf('s');



for j=1:length(k0)
    sysnodel(j) = kn(j)/(s^3 + k2(j)*s^2 + k1(j)*s + k0(j));
    sysdel(j) = sysnodel(j)*exp(-kd(j)*s);
    [r(:,j) p(:,j) direct] = residue(kn(j),[1 k2(j) k1(j) k0(j)]);
    for i = 1:3
        checkpoleisonlyreal(i,j) = isreal(p(i,j));
        if isreal(p(i,j))
            onlyrealpoles(i,j) = p(i,j);
        else
            onlypoleswithcomplexparts(i,j) = p(i,j);
            realpartofpoleswithcomplexparts(i,j) = real(p(i,j));
            complexpartofpoleswithcomplexparts(i,j)= imag(p(i,j));
        end
    end
end



numonlyrealpoles = sum(checkpoleisonlyreal);


for j=1:length(k0)
    if numonlyrealpoles(j)==1
        if min(realpartofpoleswithcomplexparts(:,j)) < min(onlyrealpoles(:,j))
            checkpoleisrightofpair(j) = 1;
        else
            checkpoleisrightofpair(j) = 0;
        end
    else
        checkpoleisrightofpair(j) = NaN;
    end
end


for j=1:length(k0)
    if checkpoleisrightofpair(j) == 1
        rightrealpolevalue(j) = min(onlyrealpoles(:,j));
        leftpairrealpolevalue(j) = min(realpartofpoleswithcomplexparts(:,j));
        leftpairimagpolevalue(j) = min(complexpartofpoleswithcomplexparts(:,j));
        leftpairmagpolevalue(j) = sqrt(leftpairrealpolevalue(j)^2 + leftpairimagpolevalue(j)^2);
        leftpairanglepolevalue(j) = atan2(leftpairimagpolevalue(j),leftpairrealpolevalue(j));
    else
        rightrealpolevalue(j) = NaN;
        leftpairrealpolevalue(j) = NaN;
        leftpairimagpolevalue(j) = NaN;
        leftpairmagpolevalue(j) = NaN;
        leftpairanglepolevalue(j) = NaN;
    end
end
    

figure(1)
clf
subplot(2,2,1)
hold on

box on


plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

mkcolorctr = 1;
mkstylectr = 1;


for j = 1:length(k0)
    plot(real(p(:,j)),imag(p(:,j)),[char(plotmkcolors(mkcolorctr)),char(plotmkstyles(mkstylectr))],'LineWidth',6,'MarkerSize',12);
    mkcolorctr = mkcolorctr + 1;
    if mkcolorctr > length(plotmkcolors)
        mkcolorctr = 1;
        mkstylectr = mkstylectr + 1;
    end    
end
xlabel('Real Axis')
ylabel('Imaginary Axis')
%title('All Pole Locations for All Normal Patients')
axis([-0.6 0.043 -0.857 0.857]);
% plot([-0.75,0.05],[0,0],'k:');
% plot([0,0],[-0.75,0.75],'k:');
% axis([-1.4 0.1 -2 2]); %same as trauma plot
plot([-1.4,0.1],[0,0],'k:');
plot([0,0],[-2,2],'k:');
%title('A')
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)


AverageRightRealPoleValue = mean(rightrealpolevalue)
AverageLeftPairMagPoleValue = mean(leftpairmagpolevalue)
AverageLeftPairAnglePoleValue = mean(leftpairanglepolevalue)
AverageDelay = mean(kd)

%% Trauma Patients

%MCADataValues = xlsread('../../Data/Processed/CAT_Trauma','Fits','B2:M48');
MCADataValues = xlsread('../../Data/Processed/CAT_Trauma','Fits','B2:M41');

%Normalnum = MCADataValues(:,1);
k0 = MCADataValues(:,1);
k1 = MCADataValues(:,2);
k2 = MCADataValues(:,3);
kn = MCADataValues(:,4);
kd = MCADataValues(:,5);

% II_0 = MCADataValues(:,7);
% V_0 = MCADataValues(:,8);
% VII_0 = MCADataValues(:,9);
% VIII_0 = MCADataValues(:,10);
% IX_0 = MCADataValues(:,11);
% X_0 = MCADataValues(:,12);
% ATIII_0 = MCADataValues(:,13);

s = tf('s');

%%

for j=1:length(k0)
    sysnodel(j) = kn(j)/(s^3 + k2(j)*s^2 + k1(j)*s + k0(j));
    sysdel(j) = sysnodel(j)*exp(-kd(j)*s);
    [r(:,j) p(:,j) direct] = residue(kn(j),[1 k2(j) k1(j) k0(j)]);
    for i = 1:3
        checkpoleisonlyreal(i,j) = isreal(p(i,j));
        if isreal(p(i,j))
            onlyrealpoles(i,j) = p(i,j);
        else
            onlypoleswithcomplexparts(i,j) = p(i,j);
            realpartofpoleswithcomplexparts(i,j) = real(p(i,j));
            complexpartofpoleswithcomplexparts(i,j)= imag(p(i,j));
        end
    end
end



numonlyrealpoles = sum(checkpoleisonlyreal);


for j=1:length(k0)
    if numonlyrealpoles(j)==1
        if min(realpartofpoleswithcomplexparts(:,j)) < min(onlyrealpoles(:,j))
            checkpoleisrightofpair(j) = 1;
        else
            checkpoleisrightofpair(j) = 0;
        end
    else
        checkpoleisrightofpair(j) = NaN;
    end
end



for j=1:length(k0)
    if checkpoleisrightofpair(j) == 1
        rightrealpolevalue(j) = min(onlyrealpoles(:,j));
        leftpairrealpolevalue(j) = min(realpartofpoleswithcomplexparts(:,j));
        leftpairimagpolevalue(j) = min(complexpartofpoleswithcomplexparts(:,j));
        leftpairmagpolevalue(j) = sqrt(leftpairrealpolevalue(j)^2 + leftpairimagpolevalue(j)^2);
        leftpairanglepolevalue(j) = atan2(leftpairimagpolevalue(j),leftpairrealpolevalue(j));
    else
        rightrealpolevalue(j) = NaN;
        leftpairrealpolevalue(j) = NaN;
        leftpairimagpolevalue(j) = NaN;
        leftpairmagpolevalue(j) = NaN;
        leftpairanglepolevalue(j) = NaN;
    end
end
    

%figure(2)
%clf
subplot(2,2,2)
hold on

box on


plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};

mkcolorctr = 1;
mkstylectr = 1;


for j = 1:length(k0)
    plot(real(p(:,j)),imag(p(:,j)),[char(plotmkcolors(mkcolorctr)),char(plotmkstyles(mkstylectr))],'LineWidth',6,'MarkerSize',12);
    mkcolorctr = mkcolorctr + 1;
    if mkcolorctr > length(plotmkcolors)
        mkcolorctr = 1;
        mkstylectr = mkstylectr + 1;
    end    
end
xlabel('Real Axis')
ylabel('Imaginary Axis')
%title('All Pole Locations for All Trauma Patients')
axis([-1.4 0.1 -2 2]);
plot([-1.4,0.1],[0,0],'k:');
plot([0,0],[-2,2],'k:');
%title('B')
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',27)%,'fontWeight','bold')
set(gca,'FontSize',27)



%load only data for which there are complete factor values
AvailableData = 1:40;
k0 = MCADataValues(AvailableData,1);
k1 = MCADataValues(AvailableData,2);
k2 = MCADataValues(AvailableData,3);
kn = MCADataValues(AvailableData,4);
kd = MCADataValues(AvailableData,5);

II_0 = MCADataValues(AvailableData,6);
V_0 = MCADataValues(AvailableData,7);
VII_0 = MCADataValues(AvailableData,8);
VIII_0 = MCADataValues(AvailableData,9);
IX_0 = MCADataValues(AvailableData,10);
X_0 = MCADataValues(AvailableData,11);
ATIII_0 = MCADataValues(AvailableData,12);

rightrealpolevalue = rightrealpolevalue(1,AvailableData);
leftpairanglepolevalue = leftpairanglepolevalue(1,AvailableData);
leftpairmagpolevalue = leftpairmagpolevalue(1,AvailableData);