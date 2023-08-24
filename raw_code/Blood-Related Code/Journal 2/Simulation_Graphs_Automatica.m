% PositiveSystems_Delayed_Saturated_Script Plots 
clear all; 
% clf;
clc; 

LineWidthNum=4;
FontSizeNum=20;

simout=sim('ACC2021_PositiveSystem_Delayed_Saturated','StartTime','0','StopTime','60') ;
% simout=sim('ACC2021_3_PositiveSystem_Delayed_Saturated','StartTime','0','StopTime','60') ;

% figure(1)
% 
% subplot(3,1,1)
% plot(simout.tout,simout.x1.Data,'k','LineWidth',LineWidthNum)
% hold on
% plot(simout.tout,simout.xr1.Data,'b','LineWidth',LineWidthNum)
% box on 
% grid on 
% legend('x_1','x_r','Orientation','Horizontal')
% % xlabel('Time [min]')
% ylabel('Thrombin (IIa)')
% % ylim([0 600])
% 
% subplot(3,1,2)
% plot(simout.tout,simout.x2.Data,'k','LineWidth',LineWidthNum)
% hold on
% box on 
% grid on 
% % legend('x_1','x_r')
% % xlabel('Time [min]')
% ylabel('X_2')
% % ylim([0 600])
% 
% subplot(3,1,3)
% plot(simout.tout,simout.x3.Data,'k','LineWidth',LineWidthNum)
% hold on
% box on 
% grid on 
% % legend('x_1','x_r')
% xlabel('Time [min]')
% ylabel('X_3')
% ylim([0 600])
% 
% 
% figure(2)
% subplot(3,1,1)
% plot(simout.tout,simout.u.Data,'g-','LineWidth',LineWidthNum)
% box on 
% grid on 
% legend('u(t)')
% xlabel('Time [min]')
% ylabel('Controller')
% % ylim([0 300])
% 
% subplot(3,1,2)
% plot(simout.tout,simout.gu_Tau.Data,'k-','LineWidth',LineWidthNum)
% box on 
% grid on 
% legend('g(u(t-\tau))')
% xlabel('Time [min]')
% ylabel('Saturated Controller')
% % ylim([0 300])
% 
% figure(3)
% subplot(3,1,3)
% plot(simout.tout,simout.Tau.Data,'r','LineWidth',LineWidthNum)
% hold on
% % plot(simout.tout,2*ones(length(simout.tout),1),'r--','LineWidth',5)
% box on 
% grid on 
% % legend('\tau','\tau^{hat}')
% legend('\tau')
% xlabel('Time [min]')
% ylabel('Time Delay [min]') %(\tau (x))
% % ylim([0 8])

% figureHandle = gcf;
% %# make all text in the figure to size 30 and bold
% set(findall(figureHandle,'type','text'),'fontSize',30)%,'fontWeight','bold')
% set(gca,'FontSize',30)

figure(3)
i=1;
subplot(3,2,i+1)
plot(simout.tout,simout.x1.Data,'k','LineWidth',LineWidthNum)
hold on
plot(simout.tout,simout.xr1.Data,'b','LineWidth',LineWidthNum)
box on 
grid on 
legend('x_1','x_r','Orientation','Horizontal')
xlabel('Time [min]')
ylabel('Thrombin (IIa)')
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(3,2,i+3)
plot(simout.tout,simout.u.Data,'g-','LineWidth',LineWidthNum)
hold on 
plot(simout.tout,simout.gu_Tau.Data,'k-','LineWidth',LineWidthNum)
box on 
grid on 
legend('u(t)','g(u(t-\tau))','Orientation','Horizontal')
xlabel('Time [min]')
ylabel('Controller')
figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)

subplot(3,2,i+5)
plot(simout.tout,simout.Tau.Data,'r','LineWidth',LineWidthNum)
hold on
box on 
grid on 
% legend('\tau','\tau^{hat}')
legend('\tau')
xlabel('Time [min]')
ylabel('Time Delay [min]') %(\tau (x))
ylim([0 .02])

figureHandle = gcf;
%# make all text in the figure to size 30 and bold
set(findall(figureHandle,'type','text'),'fontSize',FontSizeNum)%,'fontWeight','bold')
set(gca,'FontSize',FontSizeNum)


