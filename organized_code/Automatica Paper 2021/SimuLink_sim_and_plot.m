% This file runs the SimuLink Model and generate plots
% clear
close all
clc

simout = sim('ACC_Model_by_GL.slx');
figure
subplot(3,1,1)
plot(simout.tout, simout.xr.data, 'DisplayName', '$x_r(t)$', 'LineWidth', 2)
hold on
grid on
plot(simout.tout, simout.x1.data, 'black','DisplayName', '$x_1(t)$', 'LineWidth', 2)
legend('Interpreter', 'latex')
xlabel('Time [min]')
ylabel('Thrombin(IIa)')
title('$\beta=50,\eta=75,k_s=0.0224$','Interpreter', 'latex')
ax = gca;
ax.FontSize = 20; 

subplot(3,1,2)
plot(simout.tout, simout.u.data, 'green', 'DisplayName', '$u(t)$', 'LineWidth', 2)
hold on
grid on
plot(simout.tout, simout.g_uTau.data, 'black', 'DisplayName', '$g(u_\tau)$', 'LineWidth', 2)
xlabel('Time [min]')
ylabel('Controller [$\mu M$]', 'Interpreter', 'latex')
legend('Interpreter', 'latex')
ax = gca;
ax.FontSize = 20;

subplot(3,1,3)
plot(simout.tout, simout.Tau_actual.data, 'red', 'DisplayName', '$\tau$', 'LineWidth', 2)
grid on
box on
xlabel('Time [min]')
ylabel('Time Delay [min]')
legend('Interpreter', 'latex')
ax = gca;
ax.FontSize = 20; 