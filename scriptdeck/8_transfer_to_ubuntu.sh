#!/bin/bash
#LOCALDIR=../tensorflow/
#REMOTEDIR=dietmar@192.168.3.138:/home/dietmar/deeplearning/stpoelten/tensorflow/
#rsync -vrzPlpt --exclude='*.pyc' --exclude='*/.git' -e "ssh -p 22" $LOCALDIR $REMOTEDIR

LOCALDIR=../ground_truth/
REMOTEDIR=dietmar@192.168.3.138:/home/dietmar/deeplearning/stpoelten/ground_truth
rsync -vrzPlpt --exclude='*.pyc' -e "ssh -p 22" $LOCALDIR $REMOTEDIR

LOCALDIR=./
REMOTEDIR=dietmar@192.168.3.138:/home/dietmar/deeplearning/stpoelten/scriptdeck
rsync -vrzPlpt --exclude='*.pyc' -e "ssh -p 22" $LOCALDIR $REMOTEDIR

