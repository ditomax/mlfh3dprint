#!/bin/bash

JOB_ID=`whoami`_object_detection_training_`date +%s`

GT=$HOME/deeplearning/stpoelten/ground_truth
MD=$HOME/deeplearning/stpoelten/tensorflow/models/research/object_detection


#
# BEFORE changing this MO, be sure to delete the gs://fhml/train folder in the cloud bucket
#
MO=training3

BUCKET=gs://fhml
REGION=europe-west1

cd $GT

cp ./$MO/cloud.yaml $MD/
cp $GT/$MO/pipeline_retrain_cloud.config $MD/$MO
gsutil cp ./$MO/pipeline_retrain_cloud.config $BUCKET/data

cd $MD
cd ..


gcloud ml-engine jobs submit training $JOB_ID --job-dir=$BUCKET/train --packages dist/object_detection-0.1.tar.gz,slim/dist/slim-0.1.tar.gz --module-name object_detection.train --config object_detection/cloud.yaml --region $REGION -- --train_dir=$BUCKET/train --pipeline_config_path=$BUCKET/data/pipeline_retrain_cloud.config

