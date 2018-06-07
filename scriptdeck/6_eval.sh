#!/bin/bash

GT=$HOME/deeplearning/stpoelten/ground_truth
MD=$HOME/deeplearning/stpoelten/tensorflow/models/research/object_detection

cd $GT

cp ./data/train.record $MD/data
cp ./data/test.record $MD/data
cp ./training/object-detection.pbtxt $MD/training
cp ./training/ssd_mobilenet_v1.config $MD/training

cd $MD

python3 eval.py --logtostderr --pipeline_config_path=training/ssd_mobilenet_v1.config --checkpoint_dir=training/ --eval_dir=eval/