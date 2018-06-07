#!/bin/bash

GT=$HOME/deeplearning/stpoelten/ground_truth
MD=$HOME/deeplearning/stpoelten/tensorflow/models/research/object_detection

cd $GT

MO=training4

mkdir -p $MD/data
cp ./data/train.record $MD/data
cp ./data/test.record $MD/data

mkdir -p $MD/$MO
cp ./$MO/object-detection.pbtxt $MD/$MO
cp ./$MO/pipeline_retrain.config $MD/$MO



cd $MD

python3 train.py --logtostderr --train_dir=$MO/ --pipeline_config_path=$MO/pipeline_retrain.config