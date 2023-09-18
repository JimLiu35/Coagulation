# Determine if trauma patient factor levels are
# a) less than, within, or greater than control plasma factor levels +/- 10%
# b) less than, within, or greater than 20 normals factor levels +/- 10%

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

'''
Control Plasma Percentage
Control - numpy.array:
          Control[0] -> Factor II
          Control[1] -> Factor V
          Control[2] -> Factor VII
          Control[3] -> Factor VIII
          Control[4] -> Factor IX
          Control[5] -> Factor X
          Control[6] -> Factor ATIII
'''
Control = np.zeros(7)
Control[0] = 87
Control[1] = 80
Control[2] = 87
Control[3] = 92
Control[4] = 91
Control[5] = 90
Control[6] = 88

# Read in trauma concentrations
CATN = '../../Data/Processed/CAT_Normals.xlsx'
CATT = '../../Data/Processed/CAT_Trauma.xlsx'
dfN = pd.read_excel(CATN, sheet_name='Fits', usecols="G:M").dropna()
dfT = pd.read_excel(CATT, sheet_name='Fits', usecols="G:M").dropna()
MCADataValues = dfT[:42].to_numpy()

# Create an array, rows are trauma patient, cols are factors
# -1 if below range, 0 if within range, +1 if above range

# Initialize
TraumaPatientWithinControlRange = np.zeros((40,7));
for TraumaPatientNum in range(40):
    for FactorNum in range(7):
        if MCADataValues[TraumaPatientNum, FactorNum] < 0.9 * Control[FactorNum]:
            TraumaPatientWithinControlRange[TraumaPatientNum, FactorNum] = -1;
        elif MCADataValues[TraumaPatientNum, FactorNum] > 1.1 * Control[FactorNum]:
            TraumaPatientWithinControlRange[TraumaPatientNum, FactorNum] = 1;

TraumaPatientWithinControlRangeMin = np.min(TraumaPatientWithinControlRange,axis=1)
TraumaPatientWithinControlRangeMax = np.max(TraumaPatientWithinControlRange,axis=1)
# print(TraumaPatientWithinControlRangeMax)

NormalConc = dfN[:42].to_numpy()
MeanNormalConc = np.mean(NormalConc, axis=0)
StdDevNormalConc = np.std(NormalConc, axis=0, ddof=1)
# Create an array, rows are trauma patient, cols are factors
# -1 if below range, 0 if within range, +1 if above range

# Initialize
TraumaPatientWithinNormalsRange = np.zeros((40,7));
TraumaPatientNum = 0
FactorNum = 0
for TraumaPatientNum in range(40):
    for FactorNum in range(7):
        if MCADataValues[TraumaPatientNum, FactorNum] < (MeanNormalConc[FactorNum] - StdDevNormalConc[FactorNum]):
            TraumaPatientWithinNormalsRange[TraumaPatientNum, FactorNum] = -1;
        elif MCADataValues[TraumaPatientNum, FactorNum] > (MeanNormalConc[FactorNum] + StdDevNormalConc[FactorNum]):
            TraumaPatientWithinNormalsRange[TraumaPatientNum, FactorNum] = 1;

TraumaPatientWithinNormalsRangeMin = np.min(TraumaPatientWithinNormalsRange,axis=1)
TraumaPatientWithinNormalsRangeMax = np.max(TraumaPatientWithinNormalsRange,axis=1)
# print(StdDevNormalConc)
print(TraumaPatientWithinNormalsRangeMin)
