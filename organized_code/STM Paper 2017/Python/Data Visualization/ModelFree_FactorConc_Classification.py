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

print(matlab_equi_score.shape)
fh = plt.figure(figsize=(2,2))
ax = fh.add_subplot(221, projection='3d', frame_on=True)
ax.scatter(matlab_equi_score[0:20,1],
           matlab_equi_score[0:20,2],
           matlab_equi_score[0:20,3],
           s=30, c='g',marker='d',
           linewidth=2,
           label='Normal')
ax.scatter(matlab_equi_score[21:61,1],
           matlab_equi_score[21:61,2],
           matlab_equi_score[21:61,3],
           s=30, c='r',marker='o',
           linewidth=2,
           label='Trauma')

ax.set_xlabel('Component 1')
ax.set_ylabel('Component 2')
ax.set_zlabel('Component 3')
ax.set_title('A')

ax.axes.set_xlim3d(left=-300, right=410)
ax.axes.set_ylim3d(bottom=-100, top=335)
ax.axes.set_zlim3d(bottom=-100, top=100)
ax.legend()

# plt.show()
