python3 xml_to_csv.py

python3 generate_labelmap.py

python3 generate_tfrecord.py --csv_input=images/train_labels.csv --image_dir=images/train --output_path=train.record


python3 generate_tfrecord.py --csv_input=images/test_labels.csv --image_dir=images/test --output_path=test.record











#python generate_tfrecord_2.0.py -x images/train -l training/labelmap.pbtxt -o test.train

#python generate_tfrecord_2.0.py -x images/test -l training/labelmap.pbtxt -o test.record




python3 model_main.py \
  --pipeline_config_path=training/pipeline.config \
  --model_dir=training/ \
  --num_train_steps=40000 \
  --num_eval_steps=200




---------------------
export inference graph

python export_inference_graph.py --input_type image_tensor --pipeline_config_path training/pipeline.config --trained_checkpoint_prefix training/model.ckpt-10000 --output_directory inference_graph

