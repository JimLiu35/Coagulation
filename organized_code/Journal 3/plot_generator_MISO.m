out=sim('ACC2021_PositiveSystem_Delayed_Saturated','StartTime','0','StopTime','60')
FigLineSize=3;
FontSizeNum=22;

figure(1); 
subplot(2,3,1);
stairs(out.u.Time,out.u.Data(:,1),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none')
grid on; box on;
xlabel('Time [min]'); ylabel('TF [mol]'); title('A')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(2,3,2);
stairs(out.u.Time,out.u.Data(:,2),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none')
grid on; box on;
xlabel('Time [min]'); ylabel('Factor VII [mol]'); title('B')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(2,3,3);
stairs(out.u.Time,out.u.Data(:,3),'LineWidth',FigLineSize,'Color',[0.4660 0.6740 0.1880],'Marker','none')
grid on; box on;
xlabel('Time [min]'); ylabel('Factor X [mol]'); title('C')
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)


subplot(2,3,[4 5 6]);
plot(out.y.Time,out.y.Data,out.yr.Time,out.yr.Data,'LineWidth',FigLineSize)
xlabel('Time [min]'); ylabel('Output [mol]'); legend('Thrombin','Reference'); title('D')
grid on; box on;
figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)
% ylim([0 .4e-6])
% ytickformat('%4.1f')%
ax=gca;
ax.YAxis.Exponent = -9;