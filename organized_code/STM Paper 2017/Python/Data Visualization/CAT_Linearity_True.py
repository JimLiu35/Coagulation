'''This python code generates Fig. S6 A and B
'''

import numpy as np
import pandas as pd
from transfer_function_delay import *
import matplotlib.pyplot as plt
from control.matlab import *
import math

s = tf('s')

# From Normals

AverageRightRealPoleValue = -2.318156549837209e-01
AverageLeftPairMagPoleValue = 5.403446173651191e-01
AverageLeftPairAnglePoleValue = -2.488325421384519e+00
AverageDelay = 2.486724446978783e+00
K = 0.228811665819

AverageSigma = AverageLeftPairMagPoleValue* math.cos(
    math.pi+AverageLeftPairAnglePoleValue)
AverageZeta = AverageSigma/AverageLeftPairMagPoleValue

# Plot
fh = plt.figure(figsize=(1,2))
plt.subplot(121)

rightrealpole = AverageRightRealPoleValue
avg_leftpairanglepolevalue = AverageLeftPairAnglePoleValue
leftpairmagpole = AverageLeftPairMagPoleValue
kdpredict = AverageDelay

sigma = leftpairmagpole * math.cos(math.pi+avg_leftpairanglepolevalue);
k2predict = 2*sigma+abs(rightrealpole);
k1predict = leftpairmagpole**2 + 2*sigma*abs(rightrealpole);
k0predict = abs(rightrealpole)*leftpairmagpole**2;
knpredict = K*k0predict;

PredictedSystem_noDelay = knpredict/(s**3 + k2predict*s**2 + k1predict*s + k0predict)
PredictedT = np.linspace(0,45,451)
T1out, Predicted1Y = DelaySimulation(kdpredict, 1, PredictedT, PredictedSystem_noDelay)
T5out, Predicted5Y = DelaySimulation(kdpredict, 5, PredictedT, PredictedSystem_noDelay)
T10out, Predicted10Y = DelaySimulation(kdpredict, 10, PredictedT, PredictedSystem_noDelay)
T15out, Predicted15Y = DelaySimulation(kdpredict, 15, PredictedT, PredictedSystem_noDelay)

a1, = plt.plot(T15out, Predicted15Y, 'm:', linewidth=6)
a2, = plt.plot(T10out, Predicted10Y, 'r-.', linewidth=6)
a3, = plt.plot(T5out, Predicted5Y, 'g--', linewidth=6)
a4, = plt.plot(T1out, Predicted1Y, 'b-', linewidth=6)
plt.ylabel('$IIa [\mu M]$')
plt.xlabel('$Time [min]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.45)
plt.title('A')
plt.grid(1)
label=[r'5y(t)+z(t)=''\n''C(5u(t)+v(t))',
       r'z(t)=C(v(t))''\n'' where v(t)=10u(t)',
       r'5y(t)=C(5u(t))',
       r'y(t)=C(u(t))']
plt.legend(handles = [a1, a2, a3, a4], labels=label)

filename = '../../Data/Raw/TF_gradient_plate1.xlsx'
df = pd.read_excel(filename,
                   sheet_name='TF_gradient_020514_plate1',
                   usecols="A:K", skiprows=16).dropna()
TFGradientTime = df['time'].to_numpy()
TFGradient = df[df.columns[1:]].to_numpy()/1000
plt.subplot(122)
b1, = plt.plot(TFGradientTime, TFGradient[:,9], c=[1, 0.5, 0], linewidth=6,
               markersize=12, linestyle='-')
b2, = plt.plot(TFGradientTime, TFGradient[:,8], 'm:', linewidth=6,
               markersize = 12)
b3, = plt.plot(TFGradientTime, TFGradient[:,7], 'r-.', linewidth=6,
               markersize = 12)
b4, = plt.plot(TFGradientTime, TFGradient[:,5], 'g--', linewidth=6,
               markersize = 12)
b5, = plt.plot(TFGradientTime, TFGradient[:,3], 'b-', linewidth=6,
               markersize = 12)

plt.ylabel('$IIa [\mu M]$')
plt.xlabel('$Time [min]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.35)
plt.grid(1)
plt.title('B')
label_B = ['20 pM Tissue Factor','15 pM Tissue Factor',
           '10 pM Tissue Factor','5 pM Tissue Factor','1 pM Tissue Factor']
plt.legend(handles = [b1, b2, b3, b4, b5], labels=label_B)
# print(TFGradient[:,9])
plt.show()
