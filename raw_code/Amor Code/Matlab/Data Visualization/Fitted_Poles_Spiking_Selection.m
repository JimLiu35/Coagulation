clear all
close all
clc

%format long e

%% 

MCADataValues = xlsread('/Users/amenezes/Documents/Work/Research/Projects/Coagulation/2014/Data/Processed/CAT_Spiking_Selection','Fits_Validation','B2:F5');


k0 = MCADataValues(:,1);
k1 = MCADataValues(:,2);
k2 = MCADataValues(:,3);
kn = MCADataValues(:,4);
kd = MCADataValues(:,5);


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
plot([-1.4,0.1],[0,0],'k:');
plot([0,0],[-2,2],'k:');
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
set(gca,'FontSize',30)
