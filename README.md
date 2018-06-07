# mlfh3dprint

This repo contains scripts and ground truth data for detection of 3D print issues using the tensorflow object detection api. 
The readme helps to download and install the software environment and getting started.


## Software Setup

This procedure was tested for tensorflow 1.7 on OS X using python 3.4.

### Folder Setup

Create a project folder (lets call it 3dprint)

### Tensorflow

Install tensorflow by following this guide https://www.tensorflow.org/install/


### Tensorflow Models

Clone the tensorflow model repo into `3dprint/tensorflow`

```
git clone https://github.com/tensorflow/models.git
```

Install the object detection api following the instructions in https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/installation.md

All steps are required.

### Scripts and ground truth data

Clone this repo into `3dprint`

```
git clone https://github.com/ditomax/mlfh3dprint
```





