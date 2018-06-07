#!/bin/bash

ROOT=/stpoelten
TF_SRC_PATH=${ROOT}/tensorflow/tensorflow
TF_MODELS_PATH=${ROOT}/tensorflow/models
OUTPUT_NODE_NAME=MobilenetV1/Predictions/Reshape_1
MODEL_FOLDER=training1



cd $ROOT/tensorflow/models/research/object_detection


echo "mvNCCompile"
mvNCCompile -s 12 ${MODEL_FOLDER}/frozen_graph.pb -in=input -on=$OUTPUT_NODE_NAME


