FigLineSize=3;
LineWidthNum=3;
FontSizeNum=18;



%% AUtomatica 


figure(1)
clf
% subplot(2,2,2)
subplot(2,2,[2,4])
plot(out.tout,out.x1.Data*1e-9,'LineWidth',LineWidthNum)
hold on
plot(out.tout,out.xr1.Data*1e-9,'LineWidth',LineWidthNum)
box on 
grid on 
% legend('x_1','x_r','Orientation','Horizontal')
% xlabel('Time [min]'); 
ylabel('Output [M]'); title('C')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
% ylim([0 .4e-6])
% ytickformat('%4.1f')%
hold on
plot(time_thromb,210e-9*ones(length(time_thromb),1),':r','Linewidth',2.5)
plot(time_thromb,68e-9*ones(length(time_thromb),1),':g','Linewidth',2.5)
legend('Thrombin','Reference','Maximum Bound','Minimum Bound')

ax=gca;
ax.YAxis.Exponent = -9;

% subplot(2,2,1)
subplot(2,2,1)
plot(out.tout,out.u.Data*1e-14,'Color',[0.4660 0.6740 0.1880],'LineWidth',LineWidthNum)
hold on
plot(out.tout,out.gu_Tau.Data*1e-14,'k','LineWidth',LineWidthNum)
plot(out.tout,out.u.Data*1e-14,'Color',[0.4660 0.6740 0.1880],'LineWidth',LineWidthNum)
box on 
grid on 
xlim([0 60])
legend('Controller', 'Delayed Input');
ylabel('Tissue Factor [M]')
% xlabel('Time [min]')
title('A')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
ylim([0 5e-13])

% ylim([0 .4e-6])
% ytickformat('%4.1f')%
ax=gca;
% ax.YAxis.Exponent = -12;

subplot(2,2,3)
plot(out.tout,out.Tau.Data,'Color',[0.6350 0.0780 0.1840],'LineWidth',LineWidthNum)
hold on
box on 
grid on 
xlim([0 60])
ylim([0 3])
% legend('Time Delay');
ylabel('Time Delay [min]')
% xlabel('Time [min]')
title('B')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

%% MPC SISO

figure(2); 
clf
% subplot(2,2,3);
subplot(2,2,1)
% plot(out.u.Time,out.u.Data,'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880])
h1=stairs(out.u.Time,out.u.Data(:,1),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none');
hold on
h2=stairs(out.u.Time,out.u.Data(:,2),'LineWidth',FigLineSize,'Color','k','Marker','none');
legend([h1,h2],'Controller', 'Delayed Input');
grid on; box on;
% xlabel('Time [min]'); 
ylabel('Tissue Factor [M]'); title('D')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
ylim([0 0.5e-12])

subplot(2,2,3)
plot(out.tout,out.Tau.Data.*(.85+.1*sin(.27*out.tout)),'Color',[0.6350 0.0780 0.1840],'LineWidth',LineWidthNum)
hold on
box on 
grid on 
xlim([0 60])
% legend('Time Delay');
ylabel('Time Delay [min]')
% xlabel('Time [min]')
ylim([0 7])
title('E')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)


% subplot(2,2,4);
subplot(2,2,[2,4])
plot(out.y.Time,1*out.y.Data,out.yr.Time,out.yr.Data,'LineWidth',FigLineSize)
% xlabel('Time [min]'); 
ylabel('Output [M]'); title('F')
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
% ylim([0 .4e-6])
% ytickformat('%4.1f')%
hold on
plot(time_thromb,210e-9*ones(length(time_thromb),1),':r','Linewidth',2.5)
plot(time_thromb,68e-9*ones(length(time_thromb),1),':g','Linewidth',2.5)
legend('Thrombin','Reference','Maximum Bound','Minimum Bound')

ax=gca;
ax.YAxis.Exponent = -9;

%% MPC MISO

figure(3); 
clf
subplot(4,2,1)
h1_1=stairs(out.u.Time,out.u.Data(:,1),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none');
hold on
h1_2=stairs(out.uD.Time,out.uD.Data,'LineWidth',FigLineSize,'Color','k','Marker','none');
legend([h1_1,h1_2],'TF','Delayed','Orientation','Horizontal')
grid on; box on;
% xlabel('Time [min]');
ylabel('Input u_1 [M]'); title('G')
ylim([0 3e-13])
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(4,2,3)
plot(out.tout,out.Tau.Data.*(.85+.1*sin(.27*out.tout)),'Color',[0.6350 0.0780 0.1840],'LineWidth',LineWidthNum) %
hold on
box on 
grid on 
xlim([0 60])
% legend('Time Delay');
ylabel('Time Delay [min]')
xlabel('Time [min]')
ylim([0 7])
title('H')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)



subplot(4,2,2)
h2=stairs(out.u.Time,out.u.Data(:,2),'LineWidth',FigLineSize,'Color',[0.4940 0.1840 0.5560],'Marker','none');
hold on
legend([h2],'VII')
grid on; box on;
% xlabel('Time [min]'); 
ylabel('u_2 [M]'); title('I')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(4,2,4)
h3=stairs(out.u.Time,out.u.Data(:,3),'LineWidth',FigLineSize,'Color',[0.4940 0.1840 0.5560],'Marker','none');
legend([h3],'Xa')
grid on; box on;
xlabel('Time [min]'); 
ylabel('u_3 [M]'); title('J')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(4,2,[5,6,7,8]);
plot(out.y.Time,out.y.Data+2e-8,out.yr.Time,out.yr.Data,'LineWidth',FigLineSize) %.*(1-.2*sin(.17*out.tout))
xlabel('Time [min]'); ylabel('Output [M]'); title('K')
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
hold on
plot(time_thromb,210e-9*ones(length(time_thromb),1),':r','Linewidth',2.5)
plot(time_thromb,68e-9*ones(length(time_thromb),1),':g','Linewidth',2.5)
legend('Thrombin','Reference','Maximum Bound','Minimum Bound')
ylim([0 3e-7])
% ytickformat('%4.1f')%
ax=gca;
ax.YAxis.Exponent = -9;
