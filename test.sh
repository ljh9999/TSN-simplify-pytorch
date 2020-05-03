#!/bin/bash
#replace the variables with your github repo url, repo name, test
video name, json named by your UIN
GIT_REPO_URL="https://github.com/callmefish/TSN-simplify-pytorch.git"
REPO="TSN-simplify-pytorch"
VIDEO="./sample_video/sample_video_04(S).mp4"
UIN_JSON="529005218.json"
UIN_JPG="529005218.jpg"
git clone $GIT_REPO_URL
gsutil cp gs://ucf101_for_rar/sample_video.zip /$REPO
cd $REPO
unzip sample_video.zip
gsutil cp gs://ucf101_for_rar/475_inceptionv4__flow_model_best.pth.tar ./
gsutil cp gs://ucf101_for_rar/475_inceptionv4_rgb_model_best.pth.tar ./
#Replace this line with commands for running your test python file.
echo $VIDEO
python test.py --video_name $VIDEO
#If your test file is ipython file, uncomment the following lines and
#replace IPYTHON_NAME with your test ipython file.
#IPYTHON_NAME="test.ipynb"
#echo $IPYTHON_NAME
#jupyter notebook
#rename the generated timeLabel.json and figure with your UIN.
cp timeLable.json $UIN_JSON
cp timeLable.jpg $UIN_JPG
