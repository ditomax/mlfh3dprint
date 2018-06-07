#!/bin/bash

GT=$HOME/deeplearning/stpoelten/ground_truth
MD=$HOME/deeplearning/stpoelten/tensorflow/models/research/object_detection

cd $MD


#python3 export_inference_graph.py --input_type image_tensor --pipeline_config_path training1/pipeline_retrain.config --trained_checkpoint_prefix ssd_mobilenet_v1_coco/model.ckpt --output_directory movidius-result


echo "export inference graph"

SLIM_NAME=mobilenet_v1
IMAGE_SIZE=224
MODEL_FOLDER=training1
CHECKPOINT=mobilenet_v1/mobilenet_v1_1.0_224.ckpt

#echo "export inference graph"
python3 ../slim/export_inference_graph.py --model_name=${SLIM_NAME} --image_size=${IMAGE_SIZE} --batch_size=1 --dataset_name=imagenet --logtostderr --output_file=${MODEL_FOLDER}/unfrozen_graph.pb --dataset_dir=${MODEL_FOLDER}

echo "freeze graph"
python3 ../../../tensorflow/tensorflow/python/tools/freeze_graph.py --input_graph=${MODEL_FOLDER}/unfrozen_graph.pb --input_checkpoint=${CHECKPOINT} --input_binary=true --output_graph=${MODEL_FOLDER}/frozen_graph.pb --output_node_names=MobilenetV1/Predictions/Reshape_1
