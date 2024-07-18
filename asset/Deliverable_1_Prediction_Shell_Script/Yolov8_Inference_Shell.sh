#!/bin/bash
python_path=`which python3`

inference_script=/home/root/inference.py

config_file=/home/root/Yolov8_Predict_Config_File

python3 $inference_script $config_file

#output=$($python_path "$@" )

#echo $output



