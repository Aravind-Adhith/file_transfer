export CAPS="video/x-raw,framerate=30/1"

MODEL="fisheye"

CAMERA_MATRIX="{\"fx\":969.39730147, \"fy\":973.51601219, \"cx\":979.2872961, \"cy\":578.4708829}"
DISTORTION_PARAMETERS="{\"k1\":-0.07716797055102056, \"k2\":0.08841429525238206, \"k3\":-0.12823734449869909, \"k4\":0.05988227153260679}"

 gst-launch-1.0 bev name=bev calibration-file=examples/birds_eye_view.json ! $CAPS ! queue ! videoconvert ! xvimagesink sync=false \
   rtspsrc location=rtsp://admin:admin@192.168.0.50:554/snl/live/1/1 ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! cudaundistort distortion-model="$MODEL" camera-matrix="$CAMERA_MATRIX" distortion-parameters="$DISTORTION_PARAMETERS" valid-pixels=1 ! nvvidconv ! video/x-raw,width=1920,height=1080 ! nvvidconv ! videorate ! queue ! bev.sink_0 \
   rtspsrc location=rtsp://admin:admin@192.168.0.51:554/snl/live/1/1 ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! cudaundistort distortion-model="$MODEL" camera-matrix="$CAMERA_MATRIX" distortion-parameters="$DISTORTION_PARAMETERS" valid-pixels=1 ! nvvidconv ! video/x-raw,width=1920,height=1080 ! nvvidconv ! videorate ! queue ! bev.sink_1 \
   rtspsrc location=rtsp://admin:admin@192.168.0.52:554/snl/live/1/1 ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! cudaundistort distortion-model="$MODEL" camera-matrix="$CAMERA_MATRIX" distortion-parameters="$DISTORTION_PARAMETERS" valid-pixels=1 ! nvvidconv ! video/x-raw,width=1920,height=1080 ! nvvidconv ! videorate ! queue ! bev.sink_2 \
   rtspsrc location=rtsp://admin:admin@192.168.0.53:554/snl/live/1/1 ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! cudaundistort distortion-model="$MODEL" camera-matrix="$CAMERA_MATRIX" distortion-parameters="$DISTORTION_PARAMETERS" valid-pixels=1 ! nvvidconv ! video/x-raw,width=1920,height=1080 ! nvvidconv ! videorate ! queue ! bev.sink_3 \
   rtspsrc location=rtsp://admin:admin@192.168.0.54:554/snl/live/1/1 ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! cudaundistort distortion-model="$MODEL" camera-matrix="$CAMERA_MATRIX" distortion-parameters="$DISTORTION_PARAMETERS" valid-pixels=1 ! nvvidconv ! video/x-raw,width=1920,height=1080 ! nvvidconv ! videorate ! queue ! bev.sink_4 \
   rtspsrc location=rtsp://admin:admin@192.168.0.55:554/snl/live/1/1 ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! cudaundistort distortion-model="$MODEL" camera-matrix="$CAMERA_MATRIX" distortion-parameters="$DISTORTION_PARAMETERS" valid-pixels=1 ! nvvidconv ! video/x-raw,width=1920,height=1080 ! nvvidconv ! videorate ! queue ! bev.sink_5
