#!/bin/bash

readonly dev=${1:-0}
readonly host=${2:-127.0.0.1}
readonly port=${3:-7001}
readonly hz=${4:-10}

echo "dev: ${dev}, host: ${host}, port: ${port}"

gst-launch-1.0 avfvideosrc device-index=${dev} do-timestamp=true \
  ! videoconvert \
  ! videorate \
  ! video/x-raw, width=640, height=480, framerate=${hz}/1 \
  ! jpegenc \
  ! rtpjpegpay \
  ! queue \
  ! udpsink host=${host} port=${port}

