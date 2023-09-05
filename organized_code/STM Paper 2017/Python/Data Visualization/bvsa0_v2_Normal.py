'''This python code generates Fig. S6 G and H
'''
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from control.matlab import *
# import control.matlab as ct
import math

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
print(SampleNormalb)

s = tf('s')
# Delay approximation
num, den = pade(SampleNormalT, 3)
DelayApprox = tf(num, den)
# FittedSystem = SampleNormalb/(s**3 + SampleNormala2*s**2 + SampleNormala1*s + SampleNormala0) * DelayApprox;
FittedSystem = SampleNormalb/(s**3 + SampleNormala2*s**2 + SampleNormala1*s + SampleNormala0);
T = np.linspace(0,45,451)
Y = 5 * impulse(FittedSystem, T, output=-1)

plt.subplot(121)
# plt.plot(T,Y, 'b-', linewidth=6)

print(Y)

# plt.show()
