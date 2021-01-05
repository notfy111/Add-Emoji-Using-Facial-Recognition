import cv2
import random
import os
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np

path='/Users/fengyi111/Documents/GitHub/octi-gram/assets/background-images/'
random_filename=random.choice(os.listdir(path))
#print "This picture is"+path+random_filename

# #stuff='/Users/fengyi111/Documents/GitHub/octi-gram/assets/background-images/IMG_0001.png'

# print  "FaceRec.py trying to find "+path+random_filename
#test1=cv2.imread(str(path)+str(random_filename))



#gray_img=cv2.imread(stuff, cv2.IMREAD_GRAYSCALE)
gray_img=cv2.imread(path+random_filename, cv2.IMREAD_GRAYSCALE)
#print gray_img

haar_face_cascade=cv2.CascadeClassifier('../assets/opencv/data/haarcascades/haarcascade_frontalface_alt.xml')
faces=haar_face_cascade.detectMultiScale(gray_img, scaleFactor=1.1, minNeighbors=5);
x_coor=0
y_coor=0
height=0
for(x,y,w,h) in faces: 
 	#cv2.rectangle(gray_img, (x,y),(x+w,y+h),(0,255,0),2)
	x_coor=x
	y_coor=y
	height=w
	#print x_coor, y_coor, height
	# cv2.imshow('With rectangles',gray_img)
	# cv2.waitKey(0)
 # 	cv2.destroyAllWindows()


s_x=str(x_coor)
s_y=str(y_coor)
s_h=str(height)
#Save coordinates to facelocation.txt
outfile=open('facelocation.txt','w')
outfile.write('INFILE='+path+random_filename+'\n')
outfile.write('XX='+s_x+'\n')
outfile.write('YY='+s_y+'\n')
outfile.write('LL='+s_h+'\n')
outfile.close()

#return x_coor,y_coor,height