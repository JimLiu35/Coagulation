import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from control.matlab import *

# Normals
CATN = '../../Data/Processed/CAT_Normals.xlsx'
dfN = pd.read_excel(CATN, sheet_name='Fits', usecols="A:M").dropna()
MCADataValues = dfN[:20].to_numpy()
# print(MCADataValues)
Normalnum = MCADataValues[:,0]
k0 = MCADataValues[:,1]
k1 = MCADataValues[:,2]
k2 = MCADataValues[:,3]
kn = MCADataValues[:,4]
kd = MCADataValues[:,5]

II_0 = MCADataValues[:,6]
V_0 = MCADataValues[:,7]
VII_0 = MCADataValues[:,8]
VIII_0 = MCADataValues[:,9]
IX_0 = MCADataValues[:,10]
X_0 = MCADataValues[:,11]
ATIII_0 = MCADataValues[:,12]
# print(k0.shape[0])

s = tf('s');
sysnodel = []   # System's transfer functions without delay
sysdel = []     # System's transfer functions with delay

for j in range(k0.shape[0]):
    sysnodel.append(kn[j]/(s**3 + k2[j] * s**2 + k1[j]*s + k0[j]))


print(len(sysnodel))
