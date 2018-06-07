#!/bin/bash

MD=$HOME/deeplearning/stpoelten/tensorflow/models/research/object_detection
cd $MD


MO=training3
MODIR=$MD/$MO/
BUCKET=gs://fhml/train
VERSION=1001
OUTDIR=$MO-result
MC=$MO/model.ckpt-$VERSION
TESTFILE=$MO/model.ckpt-$VERSION.index

if [ -f "$TESTFILE" ]
then
	echo "$TESTFILE already copied."
else
	gsutil cp $BUCKET/model.ckpt-$VERSION.data-00000-of-00001 $MODIR
	gsutil cp $BUCKET/model.ckpt-$VERSION.index $MODIR
	gsutil cp $BUCKET/model.ckpt-$VERSION.meta $MODIR
	gsutil cp $BUCKET/graph.pbtxt $MODIR
fi

mkdir -p $OUTDIR

rm -r $OUTDIR/saved_model

python3 export_inference_graph.py --input_type image_tensor --pipeline_config_path $MO/pipeline_retrain.config --trained_checkpoint_prefix $MC --output_directory $OUTDIR


