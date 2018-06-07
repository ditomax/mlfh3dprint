
# source: https://gist.github.com/cbednarski/8450931

import cv2
import re
import os

cap = cv2.VideoCapture(2)

target_folder= './images/train'
name='image'
ext='jpg'
size= 300

max_count= 60
files = []
for file in os.listdir(target_folder):
    if file.endswith(".jpg"):
        files.append(os.path.join(target_folder, file) )

for file in files:
    path, filename = os.path.split(file)
    filebase, file_extension = os.path.splitext(filename)
    
    num = int(re.search( name + '(\d*)', filebase).group(1) )  # assuming filename is "filexxx.txt"
    # compare num to previous max, e.g.
    max_count = num if num > max_count else max_count  # set max = 0 before for-loop


count=max_count+1

print ('starting capture with count {}'.format(count) )

while(True):
    ret, frame = cap.read()
    rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2BGRA)

    cv2.imshow('frame', rgb)
    key = cv2.waitKey(1) & 0xFF
    if key == ord('w'):
        image_name= "{}{}.{}".format( name, count, ext )
        
        r = float(size) / frame.shape[0]
        w = int(frame.shape[1] * r)
        cw = int(( w - size ) / 2)
        dim = (w, size)
        resized = cv2.resize(frame, dim, interpolation = cv2.INTER_AREA)
        cropped = resized[0:size,cw:cw+size]
        
        out = cv2.imwrite( os.path.join(target_folder, image_name) , cropped)
        
        print ('written image {} to folder {}'.format(image_name, target_folder ) )
        
        count+=1

    if key == ord('q'):
        break


cap.release()
cv2.destroyAllWindows()