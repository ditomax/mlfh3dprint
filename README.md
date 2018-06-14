# mlfh3dprint

This repo contains scripts and ground truth data for detection of 3D print issues using the [tensorflow object detection api] (https://github.com/tensorflow/models/tree/master/research/object_detection). 
This readme helps to download and install the software environment and getting started. This project is for educational purposes only. It does not provide production level results.


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

All steps are required. Don't forget to install the object_detection python modules.


### Jupyter

Follow the instructions on http://jupyter.org/install


### Scripts and ground truth data

Clone this repo into `3dprint`

```
git clone https://github.com/ditomax/mlfh3dprint
```

### Ground truth tooling

For working on OS X there is a very good tool called [RectLabel](https://itunes.apple.com/us/app/rectlabel-for-object-detection/id1210181730?mt=12). This tool is available from the store and is not free.

The more common tool is [labelImg](https://github.com/tzutalin/labelImg) found here on github.

A general source for more information about ground truth tools can be found [here](https://www.quora.com/What-is-the-best-image-labeling-tool-for-object-detection)


## Creating Ground Truth


## Training


## Evaluation


## What next?


## Contribution

Since this tutorial is still very basic, it would be great if you can support the extension and completion of this project. Please contact me via my contact information in github if you are interested in the topic.




