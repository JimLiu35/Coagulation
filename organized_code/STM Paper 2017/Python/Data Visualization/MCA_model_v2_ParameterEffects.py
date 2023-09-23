import numpy as np
from control.matlab import *
import matplotlib.pyplot as plt
from transfer_function_delay import *

s = tf('s')

# From Normals
AverageRightRealPoleValue = -2.318156549837209e-01
AverageLeftPairMagPoleValue = 5.403446173651191e-01          # This variable stands for omega_n
AverageLeftPairAnglePoleValue = -2.488325421384519e+00
AverageDelay = 2.486724446978783e+00
K = 0.228811665819

AverageSigma = AverageLeftPairMagPoleValue*np.cos(np.pi+AverageLeftPairAnglePoleValue)
# Average Damping Ratio
AverageZeta = AverageSigma/AverageLeftPairMagPoleValue
# print(AverageSigma)
rightrealpole = AverageRightRealPoleValue
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue
leftpairmagpole = AverageLeftPairMagPoleValue
kdpredict = AverageDelay


sigma = leftpairmagpole*np.cos(np.pi+avg_leftpairanglepolevalue)
k2predict = 2*sigma+abs(rightrealpole)
k1predict = leftpairmagpole**2 + 2*sigma*abs(rightrealpole)
k0predict = abs(rightrealpole)*leftpairmagpole**2
knpredict = K*k0predict

referencek0 = k0predict
referencek1 = k1predict
PredictedSystem_nodelay = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
PredictedT = linspace(0,45,451);
T1out, PredictedY = DelaySimulation(kdpredict, 5, PredictedT, PredictedSystem_nodelay)

fh = plt.figure(figsize=(2,2))
plt.subplot(221)
Kminus = K - 0.05
knpredictminus = Kminus*k0predict
PredictedSystemminus_nodelay = knpredictminus/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T2out, PredictedYminus = DelaySimulation(kdpredict, 5, PredictedT,
                                         PredictedSystemminus_nodelay)

Kplus = K + 0.05
knpredictplus = Kplus*k0predict
PredictedSystemplus_nodelay = knpredictplus/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T3out, PredictedYplus = DelaySimulation(kdpredict, 5, PredictedT,
                                         PredictedSystemplus_nodelay)

a1, =plt.plot(T2out,PredictedYminus,'r-.',linewidth=6, markersize=12)
a2, =plt.plot(T1out,PredictedY,'g--', linewidth=6, markersize=12)
a3, =plt.plot(T3out,PredictedYplus,'b-', linewidth=6, markersize=12)
plt.legend(handles=[a1, a2, a3], labels=['K = '+str(Kminus), 'K = '+str(K),
                                         'K = '+str(Kplus)], loc = 'upper right')
plt.grid(visible=1, linestyle='--', linewidth=2)
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('A')

plt.subplot(222)
rightrealpoleminus = AverageRightRealPoleValue + 0.1

k2predict = 2*sigma+abs(rightrealpoleminus)
k1predict = leftpairmagpole**2 + 2*sigma*abs(rightrealpoleminus)
k0predict = abs(rightrealpoleminus)*leftpairmagpole**2
knpredict = K*k0predict
PredictedSystemminus_nodelay = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T4out, PredictedYminus = DelaySimulation(kdpredict, 5, PredictedT, PredictedSystemminus_nodelay)

rightrealpoleplus = AverageRightRealPoleValue - 0.1

sigma = leftpairmagpole*np.cos(np.pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpoleplus)
k1predict = leftpairmagpole**2 + 2*sigma*abs(rightrealpoleplus)
k0predict = abs(rightrealpoleplus)*leftpairmagpole**2
knpredict = K*k0predict

PredictedSystemplus_nodelay = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T5out, PredictedYplus = DelaySimulation(kdpredict, 5, PredictedT,
                                        PredictedSystemplus_nodelay)
b1, = plt.plot(T5out, PredictedYplus, 'r-.', linewidth=6, markersize=12)
b2, = plt.plot(T1out, PredictedY, 'g--', linewidth=6, markersize=12)
b3, = plt.plot(T4out, PredictedYminus, 'b-', linewidth=6, markersize=12)
plt.grid(visible=1, linestyle='--', linewidth=2)
plt.legend(handles=[b1, b2, b3],
           labels=['p = '+str(abs(rightrealpoleminus)),
                   'p = '+str(abs(rightrealpole)),
                   'p = '+str(abs(rightrealpoleplus))],
           loc = 'upper right')
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('B')


plt.subplot(223)
rightrealpole = AverageRightRealPoleValue;
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue;
leftpairmagpoleminus = AverageLeftPairMagPoleValue-0.3;
kdpredict = AverageDelay;

sigma = leftpairmagpoleminus * np.cos(np.pi + avg_leftpairanglepolevalue)
k2predict = 2*sigma+abs(rightrealpole)
k1predict = leftpairmagpoleminus**2 + 2*sigma*abs(rightrealpole)
k0predict = abs(rightrealpole)*leftpairmagpoleminus**2
knpredict = K*k0predict

PredictedSystemminus_nodelay = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T6out, PredictedYminus = DelaySimulation(kdpredict, 5, PredictedT,PredictedSystemminus_nodelay)

leftpairmagpoleplus = AverageLeftPairMagPoleValue+0.3;
sigma = leftpairmagpoleplus * np.cos(np.pi + avg_leftpairanglepolevalue)
k2predict = 2*sigma+abs(rightrealpole)
k1predict = leftpairmagpoleplus**2 + 2*sigma*abs(rightrealpole)
k0predict = abs(rightrealpole)*leftpairmagpoleplus**2
knpredict = K*k0predict

PredictedSystemplus_nodelay = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T7out, PredictedYplus = DelaySimulation(kdpredict, 5, PredictedT,PredictedSystemplus_nodelay)

c1, = plt.plot(T6out, PredictedYminus, 'r-.', linewidth=6, markersize=12)
c2, = plt.plot(T1out, PredictedY, 'g--', linewidth=6, markersize=12)
c3, = plt.plot(T7out, PredictedYplus, 'b-', linewidth=6, markersize=12)
plt.legend(handles=[c1, c2, c3],
           labels=[r'$\omega_n = $'+str(abs(leftpairmagpoleminus)),
                   r'$\omega_n = $'+str(abs(leftpairmagpole)),
                   r'$\omega_n = $'+str(abs(leftpairmagpoleplus))],
           loc = 'upper right')
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('C')
plt.grid(visible=1, linestyle='--', linewidth=2)

plt.subplot(224)
rightrealpole = AverageRightRealPoleValue
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue
leftpairmagpole = AverageLeftPairMagPoleValue
kdpredictminus = AverageDelay-2

sigma = leftpairmagpole * np.cos(np.pi + avg_leftpairanglepolevalue)
k2predict = 2*sigma+abs(rightrealpole)
k1predict = leftpairmagpole**2 + 2*sigma*abs(rightrealpole)
k0predict = abs(rightrealpole)*leftpairmagpole**2
knpredict = K*k0predict

PredictedSystem = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predict)

T8out, PredictedYminus = DelaySimulation(kdpredictminus,
                                         5, PredictedT,
                                         PredictedSystem)

kdpredictplus = AverageDelay+2
T9out, PredictedYplus = DelaySimulation(kdpredictplus,
                                        5, PredictedT,
                                        PredictedSystem)
d1, = plt.plot(T8out, PredictedYminus, 'r-.', linewidth=6, markersize=12)
d2, = plt.plot(T1out, PredictedY, 'g--', linewidth=6, markersize=12)
d3, = plt.plot(T9out, PredictedYplus, 'b-', linewidth=6, markersize=12)
plt.legend(handles=[d1, d2, d3],
           labels=['T = '+str(kdpredictminus),
                   'T = '+str(kdpredict),
                   'T = '+str(kdpredictplus)],
           loc = 'upper right')
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('D')
plt.grid(visible=1, linestyle='--', linewidth=2)

fh2 = plt.figure(figsize=(2,2))
plt.subplot(221)
k2predictplus = k2predict+0.3
k2predictminus = k2predict-0.3

PredictedSystemplus = knpredict/(s**3 + k2predictplus*s**2 + k1predict*s + k0predict)
T10out, PredictedYplus = DelaySimulation(kdpredict,
                                         5,
                                         PredictedT,
                                         PredictedSystemplus)
PredictedSystemminus = knpredict/(s**3 + k2predictminus*s**2 + k1predict*s + k0predict)
T11out, PredictedYminus = DelaySimulation(kdpredict,
                                          5,
                                          PredictedT,
                                          PredictedSystemminus)
e1, = plt.plot(T11out, PredictedYminus, 'r-.', linewidth=6, markersize=12)
e2, = plt.plot(T1out, PredictedY, 'g--', linewidth=6, markersize=12)
e3, = plt.plot(T10out, PredictedYplus, 'b-', linewidth=6, markersize=12)
plt.legend(handles=[e1, e2, e3],
           labels=[r'$a_2 = $'+str(k2predictminus),
                   r'$a_2 = $'+str(k2predict),
                   r'$a_2 = $'+str(k2predictplus)],
           loc = 'upper right')
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('E')
plt.grid(visible=1, linestyle='--', linewidth=2)

plt.subplot(222)
k1predictplus = k1predict+0.1
k1predictminus = k1predict-0.1

PredictedSystemplus = knpredict/(s**3 + k2predict*s**2 + k1predictplus*s + k0predict)
T12out, PredictedYplus = DelaySimulation(kdpredict,
                                         5,
                                         PredictedT,
                                         PredictedSystemplus)
PredictedSystemminus = knpredict/(s**3 + k2predict*s**2 + k1predictminus*s + k0predict)
T13out, PredictedYminus = DelaySimulation(kdpredict,
                                          5,
                                          PredictedT,
                                          PredictedSystemminus)
f1, = plt.plot(T13out, PredictedYminus, 'r-.', linewidth=6, markersize=12)
f2, = plt.plot(T1out, PredictedY, 'g--', linewidth=6, markersize=12)
f3, = plt.plot(T12out, PredictedYplus, 'b-', linewidth=6, markersize=12)
plt.legend(handles=[f1, f2, f3],
           labels=[r'$a_1 = $'+str(k1predictminus),
                   r'$a_1 = $'+str(k1predict),
                   r'$a_1 = $'+str(k1predictplus)],
           loc = 'upper right')
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('F')
plt.grid(visible=1, linestyle='--', linewidth=2)

plt.subplot(223)

k0predictplus = k0predict+0.03
k0predictminus = k0predict-0.03

PredictedSystemplus = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predictplus)
T14out, PredictedYplus = DelaySimulation(kdpredict,
                                         5,
                                         PredictedT,
                                         PredictedSystemplus)
PredictedSystemminus = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predictminus)
T15out, PredictedYminus = DelaySimulation(kdpredict,
                                          5,
                                          PredictedT,
                                          PredictedSystemminus)
g1, = plt.plot(T15out, PredictedYminus, 'r-.', linewidth=6, markersize=12)
g2, = plt.plot(T1out, PredictedY, 'g--', linewidth=6, markersize=12)
g3, = plt.plot(T14out, PredictedYplus, 'b-', linewidth=6, markersize=12)
plt.legend(handles=[g1, g2, g3],
           labels=[r'$a_0 = $'+str(k0predictminus),
                   r'$a_0 = $'+str(k0predict),
                   r'$a_0 = $'+str(k0predictplus)],
           loc = 'upper right')
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('G')
plt.grid(visible=1, linestyle='--', linewidth=2)

plt.subplot(224)

knpredictplus = knpredict+0.005
knpredictminus = knpredict-0.005

PredictedSystemplus = knpredictplus/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T16out, PredictedYplus = DelaySimulation(kdpredict,
                                         5,
                                         PredictedT,
                                         PredictedSystemplus)
PredictedSystemminus = knpredictminus/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
T17out, PredictedYminus = DelaySimulation(kdpredict,
                                          5,
                                          PredictedT,
                                          PredictedSystemminus)

h1, = plt.plot(T17out, PredictedYminus, 'r-.', linewidth=6, markersize=12)
h2, = plt.plot(T1out, PredictedY, 'g--', linewidth=6, markersize=12)
h3, = plt.plot(T16out, PredictedYplus, 'b-', linewidth=6, markersize=12)
plt.legend(handles=[g1, g2, g3],
           labels=['b = '+str(knpredictminus),
                   'b = '+str(knpredict),
                   'b = '+str(knpredictplus)],
           loc = 'upper right')
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.2)
plt.title('H')
plt.grid(visible=1, linestyle='--', linewidth=2)
plt.show()
