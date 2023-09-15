'''This python code generates Fig. S6 G and H
'''
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from control.matlab import *
from scipy import interpolate
import math

def DelaySimulation(delayTime, Tin, sys):
    Response = np.array([])
    T0 = np.linspace(0, delayTime, 100)
    # Before delayTime
    youtBefore, Tout, xout = lsim(sys, T = T0)
    # After delayTime
    yout = impulse(sys, Tin)

    T = np.concatenate((T0, Tin+T0[-1]), axis=None)
    youtAfter = np.array(yout[0]) * 5
    Y = np.concatenate((youtBefore, youtAfter), axis=None)
    return T, Y

def DetermineModelR2(Yactualdata, Ypredicteddata):
    MeanYactualdata = np.mean(Yactualdata)
    SStot_vec = (Yactualdata - MeanYactualdata)**2
    SStot = sum(SStot_vec)
    SSres_vec = (Yactualdata - Ypredicteddata)**2
    SSres = sum(SSres_vec)
    R2ofEstimate = 1 - SSres/SStot
    return R2ofEstimate

# Declare files names
CATN = '../../Data/Processed/CAT_Normals.xlsx'
CATT = '../../Data/Processed/CAT_Trauma.xlsx'
# Get Pandas data frame from sheet 'Fits'
dfN = pd.read_excel(CATN, sheet_name='Fits', usecols="B:F").dropna()
dfT = pd.read_excel(CATT, sheet_name='Fits', usecols="B:F").dropna()

## Load b and a0
# Normal Thrombograms
Normalb = dfN['kn'].to_numpy()/100
Normala0 = dfN['k0'].to_numpy()

NormalFita0 = np.arange(min(Normala0), max(Normala0), 0.01)
'''The const 0.2288... was obtained by fitting a line of Normalb against
   Normala0
'''
NormalFitb = 0.2288116658190270 * NormalFita0

# Trauma Thrombograms
Traumab = dfT['kn'].to_numpy()/100
Traumaa0 = dfT['k0'].to_numpy()

TraumaFita0 = np.arange(min(Traumaa0), max(Traumaa0), 0.01)
'''The const 0.2725... was obtained by fitting a line of Traumab against
   Traumaa0
'''
TraumaFitb = 0.2725060908156930 * TraumaFita0

# Plot Fig. S6 H
fh = plt.figure(figsize=(1,2))
plt.subplot(122)
h1, = plt.plot(TraumaFita0, TraumaFitb, 'r-.', linewidth=6)
plt.scatter(Traumaa0,Traumab,s=150,c='r',edgecolors='black')
h2, = plt.plot(NormalFita0, NormalFitb, 'g--', linewidth=6)
plt.scatter(Normala0, Normalb, s=150, c='g', marker='d',edgecolors='black')
plt.xlabel('$\it{a_0}$')
plt.ylabel('$\it{b}$')
plt.legend(handles=[h1, h2], labels=['Trauma', 'Normal'], loc='lower right')
plt.title('H')

# Get Pandas dataframe from sheet "Dynamic"
dfSampleN = pd.read_excel(CATN, sheet_name='Dynamic', usecols="A,H")
SampleNormalCATTime = dfSampleN['time'].to_numpy()
SampleNormalCATData = dfSampleN['14494 5PM 6'].to_numpy()/1000
# Get Sample Coefficients for the transfer function
SampleNormala0 = Normala0.item(6)
SampleNormala1 = dfN['k1'].to_numpy().item(6)
SampleNormala2 = dfN['k2'].to_numpy().item(6)
SampleNormalb = Normalb.item(6)
SampleNormalT = dfN['kd'].to_numpy().item(6)

s = tf('s')
FittedSystem = SampleNormalb/(s**3 + SampleNormala2*s**2 + SampleNormala1*s + SampleNormala0);
T = np.linspace(0,45,451)
dt = 45/(451-1)
Tout, Yout = DelaySimulation(SampleNormalT, T, FittedSystem)

setInterpolation = interpolate.interp1d(Tout, Yout)
FittedDataAtSampleNormalCATTime = setInterpolation(SampleNormalCATTime)
R2FittedData = DetermineModelR2(SampleNormalCATData,FittedDataAtSampleNormalCATTime)
print(R2FittedData)

plt.subplot(121)
g1, = plt.plot(SampleNormalCATTime,SampleNormalCATData, 'k*', linewidth=6, markersize=12)
g2, = plt.plot(SampleNormalCATTime,0.104*SampleNormalCATTime * np.exp(-0.18*SampleNormalCATTime),'r-.',linewidth=6);
g3, = plt.plot(SampleNormalCATTime,0.048*SampleNormalCATTime**2 * np.exp(-0.35*SampleNormalCATTime),'g--',linewidth=6);
g4, = plt.plot(Tout,Yout, 'b-', linewidth=6)
plt.legend(handles=[g1, g2, g3, g4], labels=['Normal CAT Data','0.104t exp(-0.18t)',
                                             '0.048t^2 exp(-0.35t)','SDO Generated Fit'], loc='upper right')
plt.xlim(0, 45)
plt.ylim(-0.05, 0.25)
plt.xlabel('$Time [min]$')
plt.ylabel('$IIa [\mu M]$')
plt.title('G')
plt.show()
