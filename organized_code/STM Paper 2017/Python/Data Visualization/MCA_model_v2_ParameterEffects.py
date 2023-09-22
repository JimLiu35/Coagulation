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
PredictedSystem_nodelay = knpredict/(s^3 + k2predict*s^2 + k1predict*s + k0predict)
PredictedT = linspace(0,45,451);
T1out, PredictedY = DelaySimulation(kdpredict, 5, PredictedT, PredictedSystem_nodelay)

fh = plt.figure(figsize=(2,2))
plt.subplot(221)
Kminus = K - 0.05
knpredictminus = Kminus*k0predict
