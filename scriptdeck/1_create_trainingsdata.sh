#!/bin/bash

GT=$HOME/deeplearning/stpoelten/ground_truth


cd $GT

cp ./images/test/annotations/*.xml ./images/test
cp ./images/train/annotations/*.xml ./images/train
python xml_to_csv.py
python generate_tfrecord.py --csv_input=data/train_labels.csv  --output_path=data/train.record --image_path=images/train
python generate_tfrecord.py --csv_input=data/test_labels.csv  --output_path=data/test.record --image_path=images/test







