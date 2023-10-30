function MCA_model_v2_coeff_determination_ALL

clear all
close all
clc

format long e

%%

MCADataValues = xlsread('../../Data/Processed/CAT_Normals','Fits','B2:M21');
MCADataValues = [MCADataValues;xlsread('../../Data/Processed/CAT_Trauma','Fits','B2:M41')];

k0 = MCADataValues(:,1);
k1 = MCADataValues(:,2);
k2 = MCADataValues(:,3);
kn = MCADataValues(:,4);
kd = MCADataValues(:,5);

II_0 = MCADataValues(:,6);
V_0 = MCADataValues(:,7);
VII_0 = MCADataValues(:,8);
VIII_0 = MCADataValues(:,9);
IX_0 = MCADataValues(:,10);
X_0 = MCADataValues(:,11);
ATIII_0 = MCADataValues(:,12);

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
    

% figure(1)
% clf
% %subplot(2,1,1)
% hold on
% 
% box on
% 
% 
% plotmkcolors = {'r' 'g' 'b' 'k' 'm' 'c' 'y'};
% plotmkstyles = {'^' 's' 'd' 'x' 'o' '*' '+' 'v' '<' '>' 'p' 'h'};
% 
% mkcolorctr = 1;
% mkstylectr = 1;
% 
% 
% for j = 1:length(k0)
%     plot(real(p(:,j)),imag(p(:,j)),[char(plotmkcolors(mkcolorctr)),char(plotmkstyles(mkstylectr))],'LineWidth',6,'MarkerSize',12);
%     mkcolorctr = mkcolorctr + 1;
%     if mkcolorctr > length(plotmkcolors)
%         mkcolorctr = 1;
%         mkstylectr = mkstylectr + 1;
%     end    
% end
% xlabel('Real Axis')
% ylabel('Imaginary Axis')
% %title('All Pole Locations for All Normal Patients')
% % axis([-0.75 0.05 -0.75 0.75]);
% % plot([-0.75,0.05],[0,0],'k:');
% % plot([0,0],[-0.75,0.75],'k:');
% %axis([-1.4 0.1 -2 2]);
% plot([-1.4,0.1],[0,0],'k:');
% plot([0,0],[-2,2],'k:');
% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)


%%

K = kn./k0/100;

options = optimset('MaxFunEvals',1e6,'MaxIter',1e6,'TolFun',1e-9,'TolX',1e-9);

fitK0 = ones(3,1);

[fitKfactors,resfitKnorm] = lsqcurvefit(@fitKModel,fitK0,[II_0 V_0 ATIII_0],K,[],[],options)

Kpredict = fitKfactors(3)*ATIII_0 + fitKfactors(2)*V_0 + 0.0038739537*II_0 + fitKfactors(1);

figure
plot(II_0,K,'k*',II_0,Kpredict,'bo')
xlabel('II_0')
ylabel('K')
grid on

K_percenterror = 100* abs(Kpredict - K) ./ K


avg_K_percenterror = mean(K_percenterror)
std_K_percenterror = std(K_percenterror)

%%

fitrightrealpole0 = ones(4,1);
%[fitrightrealpolefactors,resfitrightrealpolenorm] = lsqcurvefit(@fitrightrealpoleModel,fitrightrealpole0,[II_0_stripped VIII_0_stripped ATIII_0_stripped V_0_stripped],rightrealpolevalue_stripped,[],[],options)
[fitrightrealpolefactors,resfitrightrealpolenorm] = lsqcurvefit(@fitrightrealpoleModel,fitrightrealpole0,[II_0 VIII_0 X_0 ATIII_0 VII_0 V_0],-rightrealpolevalue',[],[],options)

rightrealpolepredict = fitrightrealpolefactors(4)*V_0 + fitrightrealpolefactors(3)*VII_0 + fitrightrealpolefactors(2)*ATIII_0 + 0.0002706628*X_0 + 0.0002468253*VIII_0 - 0.0013723897*II_0 + fitrightrealpolefactors(1);

negrightrealpolepredict = -rightrealpolepredict;

figure
%plot(II_0,rightrealpolevalue,'k*',II_0,fitrightrealpolefactors(5)*V_0 + fitrightrealpolefactors(4)*ATIII_0 + fitrightrealpolefactors(3)*VIII_0 + fitrightrealpolefactors(2)*II_0 + fitrightrealpolefactors(1),'bo')
plot(II_0,-rightrealpolevalue,'k*',II_0,rightrealpolepredict,'bo')
xlabel('II_0')
ylabel('Value of Pole at Right of Complex Pole Pair')
grid on

%rightrealpole_percenterror = 100* abs(fitrightrealpolefactors(5)*V_0_stripped + fitrightrealpolefactors(4)*ATIII_0_stripped + fitrightrealpolefactors(3)*VIII_0_stripped + fitrightrealpolefactors(2)*II_0_stripped + fitrightrealpolefactors(1) - rightrealpolevalue_stripped) ./ abs(rightrealpolevalue_stripped)
rightrealpole_percenterror = 100* abs(negrightrealpolepredict - rightrealpolevalue') ./ abs(rightrealpolevalue')


avg_rightrealpole_percenterror = mean(rightrealpole_percenterror)
std_rightrealpole_percenterror = std(rightrealpole_percenterror)



%%

avg_leftpairanglepolevalue = mean(leftpairanglepolevalue)

leftpairanglepole_percenterror = 100*abs(avg_leftpairanglepolevalue-leftpairanglepolevalue')./abs(leftpairanglepolevalue')

avg_leftpairanglepole_percenterror = mean(leftpairanglepole_percenterror)
std_leftpairanglepole_percenterror = std(leftpairanglepole_percenterror)


%%

fitleftpairmagpole0 = ones(3,1);
%[fitleftpairmagpolefactors,resfitleftpairmagpolenorm] = lsqcurvefit(@fitleftpairmagpoleModel,fitleftpairmagpole0,[X_0_stripped VIII_0_stripped IX_0_stripped],leftpairmagpolevalue_stripped,[],[],options)
[fitleftpairmagpolefactors,resfitleftpairmagpolenorm] = lsqcurvefit(@fitleftpairmagpoleModel,fitleftpairmagpole0,[II_0 VIII_0 X_0 VII_0 V_0],leftpairmagpolevalue',[],[],options)


leftpairmagpolepredict = fitleftpairmagpolefactors(3)*V_0 + fitleftpairmagpolefactors(2)*VII_0 + 0.0018702987*X_0 + 0.0018263832*VIII_0 - 0.0043593893*II_0 + fitleftpairmagpolefactors(1);
 
figure
%plot(X_0_stripped,leftpairmagpolevalue_stripped,'k*',X_0_stripped,fitleftpairmagpolefactors(4)*IX_0_stripped + fitleftpairmagpolefactors(3)*VIII_0_stripped + fitleftpairmagpolefactors(2)*X_0_stripped + fitleftpairmagpolefactors(1),'bo')
plot(II_0,leftpairmagpolevalue,'k*',II_0,leftpairmagpolepredict,'bo')
xlabel('II_0')
ylabel('Value of Magnitude of Complex Pole Pair')
grid on

%leftpairmagpole_percenterror = 100* abs(fitleftpairmagpolefactors(4)*IX_0_stripped + fitleftpairmagpolefactors(3)*VIII_0_stripped + fitleftpairmagpolefactors(2)*X_0_stripped + fitleftpairmagpolefactors(1) - leftpairmagpolevalue_stripped) ./ abs(leftpairmagpolevalue_stripped)
leftpairmagpole_percenterror = 100* abs(leftpairmagpolepredict - leftpairmagpolevalue') ./ leftpairmagpolevalue'

avg_leftpairmagpole_percenterror = mean(leftpairmagpole_percenterror)
std_leftpairmagpole_percenterror = std(leftpairmagpole_percenterror)


%%

fitkd0 = ones(3,1);
%[fitkdfactors,resfitkdnorm] = lsqcurvefit(@fitkdModel,fitkd0,[X_0_stripped V_0_stripped VII_0_stripped],kd_stripped,[],[],options)
[fitkdfactors,resfitkdnorm] = lsqcurvefit(@fitkdModel,fitkd0,[II_0 X_0 IX_0 V_0],kd,[],[],options)

kdpredict = fitkdfactors(3)*V_0 + fitkdfactors(2)*IX_0 - 0.0033648432*X_0 - 0.0115383188*II_0 + fitkdfactors(1);

figure
%plot(X_0_stripped,kd_stripped,'k*',X_0_stripped,fitkdfactors(4)*VII_0_stripped + fitkdfactors(3)*V_0_stripped + fitkdfactors(2)*X_0_stripped + fitkdfactors(1),'bo')
plot(II_0,kd,'k*',II_0,kdpredict,'bo')
xlabel('II_0')
ylabel('k_d')
grid on


%kd_percenterror = 100* abs(fitkdfactors(4)*VII_0_stripped + fitkdfactors(3)*V_0_stripped + fitkdfactors(2)*X_0_stripped + fitkdfactors(1) - kd_stripped) ./ abs(kd_stripped)
kd_percenterror = 100* abs(kdpredict - kd) ./ kd

avg_kd_percenterror = mean(kd_percenterror)
std_kd_percenterror = std(kd_percenterror)

% %%
% 
% fitkn0 = 1;
% %[fitknfactors,resfitknnorm] = lsqcurvefit(@fitknModel,fitkn0,k0_stripped,kn_stripped,[],[],options)
% %[fitknfactors,resfitknnorm] = lsqcurvefit(@fitknModel,fitkn0,k0,kn,[],[],options)
% 
% k0predict = abs(rightrealpolepredict).*leftpairmagpolepredict.^2;
% 
% [fitknfactors,resfitknnorm] = lsqcurvefit(@fitknModel,fitkn0,k0predict,kn,[],[],options)
% 
% knpredict = fitknfactors(1)*k0predict;
% 
% figure(7)
% %plot(k0,kn,'k*',k0,fitknfactors(1)*k0,'bo')
% plot(k0predict,kn,'k*',k0predict,knpredict,'bo')
% xlabel('k_0')
% ylabel('k_n')
% grid on
% 
% kn_percenterror = 100* abs(knpredict - kn) ./ abs(kn)
% 
% avg_kn_percenterror = mean(kn_percenterror)
% std_kn_percenterror = std(kn_percenterror)

return


function fitrightrealpoleEstimate = fitrightrealpoleModel(x,xdata)

% II_Init = xdata(:,1);
% VIII_Init = xdata(:,2);
% ATIII_Init = xdata(:,3);
% V_Init = xdata(:,4);

%fitrightrealpoleEstimate = x(5)*V_Init + x(4)*ATIII_Init + x(3)*VIII_Init + x(2)*II_Init + x(1);


II_Init = xdata(:,1);
VIII_Init = xdata(:,2);
X_Init = xdata(:,3);
ATIII_Init = xdata(:,4);
VII_Init = xdata(:,5);
V_Init = xdata(:,6);

fitrightrealpoleEstimate = x(4)*V_Init + x(3)*VII_Init + x(2)*ATIII_Init + 0.0002706628*X_Init + 0.0002468253*VIII_Init - 0.0013723897*II_Init + x(1);

return


function fitleftpairmagpoleEstimate = fitleftpairmagpoleModel(x,xdata)

% X_Init = xdata(:,1);
% VIII_Init = xdata(:,2);
% IX_Init = xdata(:,3);
% 
% fitleftpairmagpoleEstimate = x(4)*IX_Init + x(3)*VIII_Init + x(2)*X_Init + x(1); 

II_Init = xdata(:,1);
VIII_Init = xdata(:,2);
X_Init = xdata(:,3);
VII_Init = xdata(:,4);
V_Init = xdata(:,5);

fitleftpairmagpoleEstimate = x(3)*V_Init + x(2)*VII_Init + 0.0018702987*X_Init + 0.0018263832*VIII_Init - 0.0043593893*II_Init + x(1); 


return


function fitkdEstimate = fitkdModel(x,xdata)

%X_Init = xdata(:,1);
%V_Init = xdata(:,2);
%VII_Init = xdata(:,3);
%
%fitkdEstimate = x(4)*VII_Init + x(3)*V_Init + x(2)*X_Init + x(1);

II_Init = xdata(:,1);
X_Init = xdata(:,2);
IX_Init = xdata(:,3);
V_Init = xdata(:,4);

fitkdEstimate = x(3)*V_Init + x(2)*IX_Init - 0.0033648432*X_Init - 0.0115383188*II_Init + x(1);

return


function fitknEstimate = fitknModel(x,xdata)

k0_Init = xdata(:,1);

fitknEstimate = x(1)*k0_Init;
return

function fitKEstimate = fitKModel(x,xdata)

II_Init = xdata(:,1);
V_Init = xdata(:,2);
ATIII_Init = xdata(:,3);

fitKEstimate = x(3)*ATIII_Init + x(2)*V_Init + 0.0038739537*II_Init + x(1);
return