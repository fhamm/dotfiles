RTSP="rtsp://admin:dodV!##10@192.168.1.100:554/cam/realmonitor?channel=2&subtype=0&unicast=true"
OPERATION="op039"
CAMERA="c02"
TIME=10
FPS=5
LOCAL_PATH="/home/getter/getter-videos/"
FILENAME="${OPERATION}-${CAMERA}-$(date '+%Y-%m-%d-%H-%M-%S').avi"
S3_PATH="s3://getter.videos/NVR/"

ffmpeg -copytb 1 -i $RTSP -t ${TIME} -b 900k -vcodec copy -r ${FPS} -y "${LOCAL_PATH}${FILENAME}"

echo ${LOCAL_PATH}${FILENAME}
aws s3 cp ${LOCAL_PATH}${FILENAME} ${S3_PATH}
