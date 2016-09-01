import matplotlib.pyplot as plt
import numpy as np

# Getting the data :
f = open('RAWDATA_TestSub','r')
line = f.readline()


# The program is written for 4 images situations only !
# Could be generalised later.
aveNhalos = []
NhalosSub = []
rho = []
mass_max = []
mass_min = []
rmax_max = []
SumMassSub = []
AveMassTh = []

# Getting the data :

for line in f:
  column = line.split()
  aveNhalos.append(float(column[0]))
  NhalosSub.append(float(column[1]))
  rho.append(float(column[2]))
  mass_max.append(float(column[3]))
  mass_min.append(float(column[4]))
  rmax_max.append(float(column[5]))
  SumMassSub.append(float(column[6]))
  AveMassTh.append(float(column[7]))

# Closing the file :
f.close()

# Doing vectors with it :
aveNhalosv = np.array(aveNhalos)
NhalosSubv = np.array(NhalosSub)
rhov = np.array(rho)
mass_maxv = np.array(mass_max)
mass_minv = np.array(mass_min)
rmax_maxv = np.array(rmax_max)
SumMassSubv = np.array(SumMassSub)
AveMassTh = np.array(AveMassTh)


# DATA Nhalos Sub :
###################
"""
fig = plt.figure()
Nbins = 50

# Plot distribution
plt.hist(NhalosSubv,Nbins,histtype='stepfilled',color='Blue')
plt.title("NhalosSub")
plt.grid(True)
plt.show()

# Plot cumulative
plt.hist(NhalosSubv,Nbins,histtype='stepfilled',color='Blue',cumulative=True)
plt.title("NhalosSub Cumulative")
plt.grid(True)
plt.show()
"""


# DATA mass_min/max :
#####################
"""
fig2 = plt.figure()
Nbins = 50

MIN = mass_minv.min()
MAX = mass_maxv.max()

print MIN, MAX

# Plot distribution
plt.hist(mass_maxv,Nbins,histtype='stepfilled',color='Green',label='mass_max')
plt.hist(mass_minv,Nbins,histtype='stepfilled',color='Blue',label='mass_min',alpha=0.5)
plt.title("mass_min and mass_max")
plt.xlabel("Value")
plt.ylabel("Number of occurence")
plt.legend()
plt.show()
"""


# DATA AveMassTh :
##################

fig3 = plt.figure()
Nbins = 50

# Plot distribution
plt.hist(SumMassSubv,Nbins,histtype='stepfilled',color='Green',label='mass_max')
plt.hist(AveMassThv,Nbins,histtype='stepfilled',color='Blue',label='mass_min',alpha=0.5)
plt.title("mass_min and mass_max")
plt.xlabel("Value")
plt.ylabel("Number of occurence")
plt.legend()
plt.show()


exit(0);


# SECOND WAY : 4 PLOTS ON DIFFERENT SUB FRAMES :
################################################

# First calls for the plot :
fig = plt.figure()

ax1 = fig.add_subplot(221)
ax2 = fig.add_subplot(222)
ax3 = fig.add_subplot(223)
ax4 = fig.add_subplot(224)

numBins = 20

plt.subplots_adjust(hspace=0.4)

# Image 1
plt.subplot(221)
plt.hist(x1v,numBins,color='green',alpha=0.8)
plt.title('Image 1')
plt.grid(True)

# Image 2
plt.subplot(222)
ax2.hist(x2v,numBins,color='blue',alpha=0.8)
plt.title('Image 2')
plt.grid(True)

# Image 3
plt.subplot(223)
ax3.hist(x3v,numBins,color='red',alpha=0.8)
plt.grid(True)
plt.title('Image 3')

# Image 4
plt.subplot(224)
ax4.hist(x4v,numBins,color='orange',alpha=0.8)
plt.grid(True)
plt.title('Image 4')

plt.show()




# THIRD WAY : 4 PLOTS ON THE SAME FRAME
#######################################

fig = plt.figure()

numBins = 20

plt.hist(x1v,bins=numBins,histtype='stepfilled', normed=True, color='green', label='Image1')
plt.hist(x2v,bins=numBins,histtype='stepfilled', normed=True, color='blue', label='Image2')
plt.hist(x3v,bins=numBins,histtype='stepfilled', normed=True, color='red', label='Image3')
plt.hist(x4v,bins=numBins,histtype='stepfilled', normed=True, color='orange', label='Image4')

plt.title("Dt distributions for the 4 images")
plt.xlabel("Value")
plt.ylabel("Number of occurence")
plt.legend()
plt.show()





