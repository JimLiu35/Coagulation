import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from control.matlab import *
import scipy as spy

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

r = np.empty((3, k0.shape[0]), dtype=np.cdouble)
p = np.empty((3, k0.shape[0]), dtype=np.cdouble)
onlyrealpoles = np.empty((3, k0.shape[0]))
onlypoleswithcomplexparts = np.empty((3, k0.shape[0]), dtype=np.cdouble)
realpartofpoleswithcomplexparts = np.empty((3, k0.shape[0]))
complexpartofpoleswithcomplexparts = np.empty((3, k0.shape[0]))
checkpoleisonlyreal = np.empty((3, k0.shape[0]), dtype=int)

# Separate real poles and complex poles
# and find complex poles' real and imaginary parts
for j in range(k0.shape[0]):
    sysnodel.append(kn[j]/(s**3 + k2[j] * s**2 + k1[j]*s + k0[j]))
    r[:,j], p[:,j], direct = spy.signal.residue(kn[j],[1, k2[j], k1[j], k0[j]])
    for i in range(3):
        checkpoleisonlyreal[i, j] = np.isreal(p[i,j])
        if np.isreal(p[i,j]):
            onlyrealpoles[i, j] = np.real(p[i, j])
            onlypoleswithcomplexparts[i, j] = complex(np.nan, np.NAN)
            realpartofpoleswithcomplexparts[i, j] = np.nan
            complexpartofpoleswithcomplexparts[i, j] = np.nan
        else:
            onlyrealpoles[i, j] = np.NAN
            onlypoleswithcomplexparts[i, j] = p[i, j]
            realpartofpoleswithcomplexparts[i, j] = np.real(
                onlypoleswithcomplexparts[i, j])
            complexpartofpoleswithcomplexparts[i, j] = np.imag(
                onlypoleswithcomplexparts[i, j])

numonlyrealpoles = sum(checkpoleisonlyreal)
# print(complexpartofpoleswithcomplexparts)
checkpoleisrightofpair = np.empty(k0.shape[0], dtype=int)

for j in range(k0.shape[0]):
    if numonlyrealpoles[j] == 1:
        if np.min(realpartofpoleswithcomplexparts[:,j],
                     where=~np.isnan(realpartofpoleswithcomplexparts[:,j]),
                     initial=1000) < np.min(onlyrealpoles[:,j],
                                            where=~np.isnan(onlyrealpoles[:,j]),
                                            initial=1000):
            # This means the complex pole is more "negative" than the real pole
            checkpoleisrightofpair[j] = 1
        else:
            # This means the complex pole is not on the right side of the real pole
            checkpoleisrightofpair[j] = 0
    else:
        # This means the system only has one real pole and no complex poles
        checkpoleisrightofpair[j] = np.nan


# print(onlyrealpoles)
rightrealpolevalue = np.empty(k0.shape[0])
leftpairrealpolevalue = np.empty(k0.shape[0])
leftpairimagpolevalue = np.empty(k0.shape[0])
leftpairmagpolevalue = np.empty(k0.shape[0])
leftpairanglepolevalue = np.empty(k0.shape[0])

for j in range(k0.shape[0]):
    if checkpoleisrightofpair[j] == 1:
        rightrealpolevalue[j] = np.min(onlyrealpoles[:,j],
                                       where=~np.isnan(onlyrealpoles[:,j]),
                                       initial=1000)
        leftpairrealpolevalue[j] = np.min(realpartofpoleswithcomplexparts[:,j],
                                          where=~np.isnan(realpartofpoleswithcomplexparts[:,j]),
                                          initial=1000)
        leftpairimagpolevalue[j] = np.min(complexpartofpoleswithcomplexparts[:,j],
                                          where=~np.isnan(complexpartofpoleswithcomplexparts[:,j]),
                                          initial=1000)
        leftpairmagpolevalue[j] = np.sqrt([leftpairrealpolevalue[j]**2+
                                           leftpairimagpolevalue[j]**2])[0]
        leftpairanglepolevalue[j] = np.arctan2(leftpairimagpolevalue[j],
                                               leftpairrealpolevalue[j])
    else:
        rightrealpolevalue[j] = np.nan
        leftpairrealpolevalue[j] = np.nan
        leftpairimagpolevalue[j] = np.nan
        leftpairmagpolevalue[j] = np.nan
        leftpairanglepolevalue[j] = np.nan

fh = plt.figure(figsize=(1,2))
plt.subplot(121)
plotmkcolors = ['r','g','b','k','m','c','y']
plotmkstyles = ['^','s','d','x','o','*','+','v','<','>','p','h']
mkcolorctr = 0
mkstylectr = 0
for j in range(k0.shape[0]):
    plt.scatter(np.real(p[:,j]), np.imag(p[:,j]), s=12, c=plotmkcolors[mkcolorctr],
                marker=plotmkstyles[mkstylectr], linewidth=6)
    mkcolorctr += 1
    if mkcolorctr >= len(plotmkcolors):
        mkcolorctr = 0
        mkstylectr = mkstylectr + 0
# print(sysnodel[0])
plt.xlabel('Real Axis')
plt.ylabel('Imaginary Axis')
plt.xlim(-0.6, 0.043)
plt.ylim(-0.857, 0.857)
plt.plot([-1.4,0.1],[0,0],'k:');
plt.plot([0,0],[-2,2],'k:');


plt.show()
