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
plt.xlabel('$IIa [\mu M]$')
plt.ylabel('$Time [min]$')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.45)
plt.title('A')
label=[r'5y(t)+z(t)=''\n''C(5u(t)+v(t))',
       r'z(t)=C(v(t))''\n'' where v(t)=10u(t)',
       r'5y(t)=C(5u(t))',
       r'y(t)=C(u(t))']
plt.legend(handles = [a1, a2, a3, a4], labels=label)

filename = '../../Data/Raw/TF_gradient_plate1.xlsx'
df = pd.read_excel(filename,
                   sheet_name='TF_gradient_020514_plate1', usecols="A:B").dropna()
print(df)
plt.show()
