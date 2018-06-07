#!/bin/bash

GT=$HOME/deeplearning/stpoelten/ground_truth
MD=$HOME/deeplearning/stpoelten/tensorflow/models/research/object_detection

cd $MD



# determine youngest model checkpoint
MO=training4
VERSION=1000
#MC=$(ls -t $MO/model.ckpt* -I "*.meta" | cut -c 1-25 | head -1)
MC=$MO/model.ckpt-$VERSION

rm -r $MO-result/saved_model
python3 export_inference_graph.py --input_type image_tensor --pipeline_config_path $MO/pipeline_retrain.config --trained_checkpoint_prefix $MC --output_directory $MO-result