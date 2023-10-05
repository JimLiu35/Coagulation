import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA

options = {'MaxFunEvals': 1e6, 'MaxIter': 1e6, 'TolFun': 1e-6, 'TolX': 1e-6}

"""Data Loading"""
# Read in concentrations, first normals then trauma patients
CATN = '../../Data/Processed/CAT_Normals.xlsx'
dfN = pd.read_excel(CATN, sheet_name='Fits', usecols="A:M").dropna()
CATT = '../../Data/Processed/CAT_Trauma.xlsx'
dfT = pd.read_excel(CATT, sheet_name='Fits', usecols="A:M").dropna()
MCADataValues_Normal = dfN[:20].to_numpy()
MCADataValues_Trauma = dfT[:40].to_numpy()
MCADataValues = np.concatenate((MCADataValues_Normal,MCADataValues_Trauma), axis=0)

II_0    = MCADataValues[:,5]
V_0     = MCADataValues[:,6]
VII_0   = MCADataValues[:,7]
VIII_0  = MCADataValues[:,8]
IX_0    = MCADataValues[:,9]
X_0     = MCADataValues[:,10]
ATIII_0 = MCADataValues[:,11]

# Read in the identifies
ACIT = MCADataValues[:,0]

"""K-means Clustering"""
NumKMeansIterations = 100
NumClusters = 2              # Normal and Trauma
kmeans = KMeans(n_clusters = NumClusters,
                max_iter = NumKMeansIterations).fit(MCADataValues[:,6:13])
IDX = kmeans.labels_         # Equivalent to MATLAB IDX, but contains only 1 and 0
kmeansCentroids = kmeans.cluster_centers_

## Principal Component Analysis into K-means
pca = PCA(svd_solver="full").fit(MCADataValues[:,6:13])
# The following two variables are similar to matlab pca output,
# but signs may be different
matlab_equi_coeff = pca.components_.T
matlab_equi_score = pca.fit_transform(MCADataValues[:,6:13])

print(matlab_equi_score[0,:])
fh = plt.figure(figsize=(2,2))
ax = fh.add_subplot(projection='3d')
# plt.subplot(221)
ax.scatter(matlab_equi_score[0:20,1],
           matlab_equi_score[0:20,2],
           matlab_equi_score[0:20,3],
           s=150, c='g',marker='x',
           linewidth=6)
plt.show()
