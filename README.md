# image_proc_chain_app

# overview

T.B.D

# backend

## launch native camera device via GStreamer

```bash
function gst-launch() {
  gst-launch-1.0 avfvideosrc do-timestamp=true \
    ! jpegenc \
    ! rtpjpegpay \
    ! udpsink host=${1:-127.0.0.1} port=${2:-7001}
}
```

## launch ros-gst-bridge to convert native image stream to ROS2 message

```bash
docker run \
  -e GST_PLUGIN_PATH=install/gst_bridge/lib/gst_bridge \
  -it \
  --rm \
  -p 127.0.0.1:7001:7001/udp \
  --name gst-bridge \
  gst-ros-bridge:ros2 \
  bash -c 'source install/setup.bash && gst-launch-1.0 udpsrc port=7001 ! application/x-rtp,encoding-name=JPEG ! rtpjpegdepay ! jpegdec ! rosimagesink'
```

## launch image_proc_chain

# frontend
