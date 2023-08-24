FigLineSize=3;
FontSizeNum=22;



%% AUtomatica 
LineWidthNum=3;
FontSizeNum=18;

figure(1)

% subplot(2,2,2)
subplot(6,2,[2,4])
plot(out.tout,out.x1.Data*1e-9,'LineWidth',LineWidthNum)
hold on
plot(out.tout,out.xr1.Data*1e-9,'LineWidth',LineWidthNum)
box on 
grid on 
% legend('x_1','x_r','Orientation','Horizontal')
xlabel('Time [min]'); ylabel('Output [M]'); legend('Thrombin','Reference'); title('B')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
% ylim([0 .4e-6])
% ytickformat('%4.1f')%
ax=gca;
ax.YAxis.Exponent = -9;

% subplot(2,2,1)
subplot(6,2,[1,3])
plot(out.tout,out.u.Data*1e-14,'Color',[0.4660 0.6740 0.1880],'LineWidth',LineWidthNum)
hold on
plot(out.tout,out.gu_Tau.Data*1e-14,'k','LineWidth',LineWidthNum)
plot(out.tout,out.u.Data*1e-14,'Color',[0.4660 0.6740 0.1880],'LineWidth',LineWidthNum)
box on 
grid on 
xlim([0 60])
legend('Controller', 'Delayed Input');
ylabel('Tissue Factor [M]')
xlabel('Time [min]')
title('A')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
% ylim([0 .4e-6])
% ytickformat('%4.1f')%
ax=gca;
% ax.YAxis.Exponent = -12;

%% MPC SISO

figure(1); 
% subplot(2,2,3);
subplot(6,2,[5,7])
% plot(out.u.Time,out.u.Data,'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880])
h1=stairs(out.u.Time,out.u.Data(:,1),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none');
hold on
h2=stairs(out.u.Time,out.u.Data(:,2),'LineWidth',FigLineSize,'Color','k','Marker','none');
legend([h1,h2],'Controller', 'Delayed Input');
grid on; box on;
xlabel('Time [min]'); ylabel('Tissue Factor [M]'); title('C')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
ylim([0 1e-12])

% subplot(2,2,4);
subplot(6,2,[6,8])
plot(out.y.Time,out.y.Data,out.yr.Time,out.yr.Data,'LineWidth',FigLineSize)
xlabel('Time [min]'); ylabel('Output [M]'); legend('Thrombin','Reference'); title('D')
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
% ylim([0 .4e-6])
% ytickformat('%4.1f')%
ax=gca;
ax.YAxis.Exponent = -9;

%% MPC MISO


figure(1); 
subplot(6,2,9)
h1_1=stairs(out.u.Time,out.u.Data(:,1),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none');
hold on
h1_2=stairs(out.uD.Time,out.uD.Data,'LineWidth',FigLineSize,'Color','k','Marker','none');
legend([h1_1,h1_2],'TF','Delayed')
grid on; box on;
xlabel('Time [min]'); ylabel('Input u_1 [M]'); title('E')

figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(6,2,11)
h2=stairs(out.u.Time,out.u.Data(:,2),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none');
hold on
h3=stairs(out.u.Time,out.u.Data(:,3),'LineWidth',FigLineSize,'Color',[0.4940 0.1840 0.5560],'Marker','none');
legend([h2, h3],'VII','Xa')
grid on; box on;
xlabel('Time [min]'); ylabel('u_2 & u_3 [M]'); title('F')

figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)


subplot(6,2,[10,12]);
plot(out.y.Time,out.y.Data,out.yr.Time,out.yr.Data,'LineWidth',FigLineSize)
xlabel('Time [min]'); ylabel('Output [M]'); legend('Thrombin','Reference'); title('G')
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
% ylim([0 .4e-6])
% ytickformat('%4.1f')%
ax=gca;
ax.YAxis.Exponent = -9;
