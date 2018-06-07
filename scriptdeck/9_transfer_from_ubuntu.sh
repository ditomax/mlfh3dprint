#!/bin/bash
ROOT=$HOME/deeplearning/stpoelten
MODEL=trained

#LOCALDIR=$ROOT/tensorflow/models/research/object_detection/$MODEL
#REMOTEDIR=dietmar@192.168.3.138:/home/dietmar/deeplearning/stpoelten/tensorflow/models/research/object_detection/$MODEL
#rsync -vrzPlpt --exclude='*.pyc' --exclude='events.out.tfevents*' -e "ssh -p 22" $REMOTEDIR $LOCALDIR 

#LOCALDIR=$ROOT/ground_truth/training
#REMOTEDIR=dietmar@192.168.3.138:/home/dietmar/deeplearning/stpoelten/tensorflow/models/research/object_detection/training/ssd_mobilenet_v1.config
#rsync -vrzPlpt --exclude='*.pyc' --exclude='events.out.tfevents*' -e "ssh -p 22" $REMOTEDIR $LOCALDIR 

LOCALDIR=$ROOT/tensorflow/models/research/object_detection/
REMOTEDIR=dietmar@192.168.3.138:/home/dietmar/deeplearning/stpoelten/tensorflow/models/research/object_detection/object_detection_tutorial_eval.ipynb
rsync -vrzPlpt --exclude='*.pyc' --exclude='events.out.tfevents*' -e "ssh -p 22" $REMOTEDIR $LOCALDIR 
