%DAMON GHETMIRI 

function Tracking_Control_Paper_withLOGISTIC
clear 
close all
clc 

%Set up parameters for simulation
global A B P c1 c2 L21 L22 k Sigma F RhoW ml mr bl br uHist UMAX eta

uHist=[]; 
theta1=1;
theta2=1;
k1=1;
k2=1;
R1=0.5;
R2=0.5;
V1=0.5;
V2=0.5;
F=0.5;
ml=0.5;
mr=0.4;
bl=0.25;
br=0.1;

UMAX=1; 
eta=1;

A=[((-1/theta1)-k1) ((1-R2)/V1); 0 ((-1/theta2)-k2)];
B=[0; F/V2];

% A=[-2 1; 0 -2]; 
% B=[0;1];

%Scheme 2
K=[-1,-1];
Q=eye(2);
c1=4;
c2=4;
L21=10;
L22=10;
k=0.05;

%Simulation final time 
tf=20;

P=lyap((A+B*K)',Q);

% Initial condition vector (X0 must be same size and "form" as X and XDot below)
% (i.e., in this sim, X0 = [E0;theta2hat0;gamma2hat0])
X0 = [-0.5;-1;2;0];

% Options for integration function
opts = odeset('RelTol',1e-3,'AbsTol',1e-3);

% Integrate (you can send the paramters theta to the dynamics as seen below)
states = ddesd(@PaperDynamics, @PaperDelay, X0, [0 tf]);
% states = dde23(@PaperDynamics, [0.5,0.5], X0, [0 tf]);

% ( states = [E thetahat gammahat] over all time);
E  = states.y(1:2,:)';
thetaHat = states.y(3,:)';
gammaHat = states.y(4,:)';
t=states.x'; 

% % Plot the tracking error 
% figure(1)
% plot(t,E,'-','LineWidth',3)
% hold on
% grid on
% ax = gca;
% ax.ColorOrderIndex = 1;
% hold off
% 
% % Plot the parameter estimates
% figure(2)
% plot(t,thetaHat,'-r','LineWidth',3)
% hold on
% grid on
% ax = gca;
% ax.ColorOrderIndex = 1;
% plot(t,gammaHat,'-b','LineWidth',3)
% legend('Theta estimate','Gamma estimate')
% hold off
% 
% % Plot the control
% figure(3)
% U=-0.5*thetaHat*RhoW*C-(((gammaHat.^2)*RhoW*C)./(2*gammaHat*RhoW*(abs(C))+2*Sigma));
% Usat=(mr*(max(U,.01*br)-br)) + (ml*(min(U,-.01*bl)+bl));
% 
% plot(t,Usat,'-r','LineWidth',3)
% grid on
% title('Control input')
% ax = gca;
% ax.ColorOrderIndex = 1;

% SUB PLOT 
figure(4)
subplot(3,1,1)
plot(t,E,'-','LineWidth',3)
legend('State 1','State 2')
ylabel('Plant states')
hold on
grid on
ax = gca;
ax.ColorOrderIndex = 1;
hold off

% Plot the parameter estimates
subplot(3,1,2)
hold on
grid on
ax = gca;
ax.ColorOrderIndex = 1;
plot(t,thetaHat,t,gammaHat,'LineWidth',3)
legend('Theta estimate','Gamma estimate')
ylabel('Parameter estimates')
hold off

% Plot the control
subplot(3,1,3)
plot(uHist(:,1),uHist(:,2),'LineWidth',3)
grid on
xlabel('Time (sec)')
ylabel('Control input')
ax = gca;
ax.ColorOrderIndex = 1;



function XDot = PaperDynamics(t,X,Z)
global A B P c1 c2 L21 L22 k Sigma F RhoW ml mr bl br uHist UMAX eta

xd=[0;0];
x=[X(1); X(2)];
E=x-xd;

thetahat=X(3);
gammahat=X(4);

Sigma=exp(-0.25*t);
F=E'*P*B;
W=E'*P*E;
minLan=min(eig(P));
RhoW=c1+c2*4*(sqrt(W/minLan));

%Control input
% u=-0.5*thetahat*RhoW*F-(((gammahat^2)*RhoW*F)./(2*gammahat*RhoW*(abs(F))+2*Sigma));
% U=(mr*(max(u,br)-br)) + (ml*(min(u,-bl)+bl)); %deadzone 
% ks=(UMAX^(-1.2049))*8.4 ;
% U=1/(1+exp(-ks*(u-(UMAX/2)))); %saturation 

ks=(UMAX^(-1.2049))*8.4 ;
ud=(-eta/(2*UMAX))*(thetahat*RhoW*F) - ((eta*(gammahat^2*RhoW*F))/(2*UMAX*gammahat*RhoW*(abs(F))+2*UMAX*Sigma));
% U=(mr*(max(ud,br)-br)) + (ml*(min(ud,-bl)+bl)); %deadzone
% u=(UMAX/2)-(1/ks)*(log((1/ud)-1)) ; %!
% u=(UMAX/2)-(1/ks)*(log((1/(-eta/(2*UMAX))*(thetahat*RhoW*F) - ((eta*(gammahat^2*RhoW*F))/(2*UMAX*gammahat*RhoW*(abs(F))+2*UMAX*Sigma)))-1)) ; %!
% u=UMAX/(1+exp((-ks)*(ud-UMAX/2))) ;
u=ud;
U=u ;
% U=1/(1+exp(-ks*(u-(UMAX/2)))); %saturation 

% if u >= br
%     U=mr*(u-br);
% elseif u>-bl && u<br
%     U=0 ;
% elseif u<=-bl
%     U=ml*(u+bl);
% end

uHist = [uHist;t,U']; 

EDot=A*E+B*(U+(Z(1,1)+Z(2,2)));

thetahatDot=L21*exp(k*t)*(RhoW^2)*(F^2);
gammahatDot=L22*exp(k*t)*RhoW*F;

XDot=[EDot;thetahatDot;gammahatDot];

function d = PaperDelay(t,X)
% d=[0.5*(1+sin(X(1))); 0.5*(1+sin(X(2)))] ;
d=[0.5*(1+sin(t)); 0.5*(1+sin(t))];