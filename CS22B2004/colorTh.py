#!/usr/bin/python
import matplotlib.image as mpimg
import matplotlib.pyplot as plt 
import numpy as np
import math
typea = 0
typeb = 0
image= "/home/vignesh-aravindh-b/CS22B2004/image.jpg"
#RGB(3 streams) matrix representation of the image
labrat = mpimg.imread(image)
print("Shape of the image : {}".format(labrat.shape))

'''

Write the script wrt the given instruction here.

'''
threshold_limit = [160,160,160]
for i in range(1,2160):
	for j in range(1,3840):
		a = labrat[i,j]
		
		if(a[0]>=160 and a[1]>=160 and a[2]>=160):
			typea+=1
		else:
			typeb+=1

sum = typea+typeb
print("%typeA",(typea*100)/sum)
print("%typeB",(typeb*100)/sum)

imgplot = plt.imshow(labrat)
plt.show()
bright = [107,44,91]
blevel = (0.21*bright[0] + 0.72*bright[1] + 0.07*bright[2])
blevel = blevel/3
bw_image = labrat.copy()
for i in range(1,2160):
	for j in range(1,3840):
		a = bw_image[i,j]
		alevel = (0.21*a[0] + 0.72*a[1] + 0.07*a[2])
		alevel = alevel/3
		if(alevel>=blevel):
			bw_image[i,j] = [0,0,0]
		else:
			bw_image[i,j] = [255,255,255]
		
imgplot = plt.imshow(bw_image)
plt.show()
