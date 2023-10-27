% Automatica controller using discrete method
clear all;
close all;
clc;
global gus;
gus = [];

% Parameters
d1 = 1.1311;
d2 = 1.1362;
d3 = 0.2727;

% The following 3 variables can be changed in function "state_eq"
% beta = 50;
% eta = 75;
% ks = 0.0224;

gamma_hat = 1;
kd_hat = 1;
% lambda = .1;
alpha = 5;
% k = 0.15;
% Damon's parameters
lambda = 0.2;
k = 0.1;

% Automatica Paper
% A = [-d1 1 0; 0 -d2 1; 0 0 -d3];
% Sci Trans Med Paper
% A = [-d1 1 0; -d2 0 1; -d3 0 0];
% Damon's coagulation model
A = [-2.2306 1 0; -0.3*2.4752 0 1; -0.25*0.5370 0 0];
B = [0 0 1]';

% Initial Conditions
t0 = 0;
tf = 60;
x0 = [500; 50; 5];

% Input Delay
t_hat = gamma_hat * x0(3) ^ (-kd_hat);

% Time Span
N = 2000;
ts = t0:t_hat/N:tf;

% Reference Signal
xr = 200 * (tanh(0.15 * ts)).^2;

% Initialize states and input vector
xs = zeros(3, length(ts));
es = zeros(3, length(ts));
eus = zeros(1, length(ts));
us = zeros(1, length(ts));
dt = t_hat/N;

% Convert system to discrete time
Ad = expm(A*dt);
try
    A_inv = inv(A);
catch
    warning('A is not invertible');
end
Bd = A_inv * (eye(3) - Ad) * B;
v = 0;

for i = 1:length(ts)
    if i == 1
        u = 0;
        xs(:, 1) = x0;
        us(i) = u;
        vs(i) = 0;
        dvs(i) = 0;
        e1 = 0 - x0(1);
        e2 = 0;
        e3 = -1000;
        es(:,i) = [e1 e2 e3];
        continue
    end
    % Get delayed input
    if (t_hat ~=0 )
        if (ts(i) < t_hat)
            u_delay = 0;
        else
            u_delay = us(i - N);
        end
    else
        u_delay = u;
    end
    % Update State Variables
    xs(:, i) = state_eq(xs(:, i-1), A, B, u_delay, dt);
    % Calculate Error Signals
    e1 = xr(i) - xs(1, i);
    dxr = Euler(xr(i-1), xr(i), dt);
    dx1 = Euler(xs(1, i-1), xs(1, i), dt);
    de1 = dxr - dx1;
    e2 = de1 + e1;
    if i == 2
        % Second order derivate approximation
        d2x1 = SecOrder(x0(1), xs(1, i-1), xs(1, i), dt);
        d2xr = SecOrder(0, xr(i-1), xr(i), dt);
    else
        % Second order derivate approximation
        d2x1 = SecOrder(xs(1, i-2), xs(1, i-1), xs(1, i), dt);
        d2xr = SecOrder(xr(i-2), xr(i-1), xr(i), dt);
        e3 = d2xr - d2x1 + 2 * de1 + 2 * e1;
    end
    e3 = d2xr - d2x1 + 2 * de1 + 2 * e1;
    d2e1(i) = d2xr - d2x1;
    es(:,i) = [e1 e2 e3];
    
    % Calculate Error signal for Input Delay
    if i < t_hat/dt + 1
        eu = 0;
    else
        % eu = - (u - us(i-N)); % This eu is consistent with paper description
       eu = - (u - gus(i - N)); % This eu is the one defined in Damon's model
    end
    eus(i) = eu;
    v = v + dt * k * (lambda * es(3, i-1) + alpha * eus(i-1));
    u = (sign(0.5 * (sign(e1) + 1))) * ...
        (k * (e3 - es(3,1)) + v);
    us(i) = u;
    vs(i) = v;
    dvs(i) = k * (lambda * es(3, i-1) + alpha * eus(i-1));
    
end

% plots
figure

subplot(3,1,1)
plot(ts, xr, 'DisplayName', 'xr', 'LineWidth', 2)
hold on
grid on
box on
plot(ts, xs(1, :), 'black', 'DisplayName', 'x1', 'LineWidth', 2)
legend
xlabel('Time [min]')
ylabel('Thrombin(IIa)')
% title('$\beta=50,\eta=75,k_s=0.0224$','Interpreter', 'latex')
ax = gca;
ax.FontSize = 20; 

subplot(3,1,2)
plot(ts, us, 'green', 'DisplayName', '$u(t)$', 'LineWidth', 2)
hold on
grid on
box on
plot(ts(1:end-1), gus, 'black', 'DisplayName', '$g(u(t-\tau))$', 'LineWidth', 2)
xlabel('Time [min]')
ylabel('Controller($\mu M$)', 'Interpreter', 'latex')
legend('Interpreter', 'latex')
ax = gca;
ax.FontSize = 20; 

subplot(3,1,3)
gamma = 4.48;
kd = 0.322;
tau = gamma * xs(3,:) .^ (-kd);
plot(ts, tau, 'red', 'DisplayName', '$\tau$', 'Linewidth', 2)
grid on
box on
xlabel('Time [min]')
ylabel('Time Delay [min]')
legend('Interpreter', 'latex')
ax = gca;
ax.FontSize = 20; 

function xas = state_eq(xs, Ad, Bd, u, dt)
global gus;
% beta = 87;
beta = 50;
eta = 75;
ks = 0.0224;
% g = 0.5 * beta + 0.5 * beta * (tanh(0.5 * ks ...
%     * (u - eta)));
% Damon's g function
g = u;
if g > 50
    g = 50;
end
gus(end+1) = g;
xas = xs + (Ad * xs + Bd * g) * dt;
end

function dx = Euler(x1, x2, dt)
dx = (x2 - x1)/dt;
end

function d2x = SecOrder(x1, x2, x3, dt)
d2x = (x3 - 2 * x2 + x1)/(dt^2);
end