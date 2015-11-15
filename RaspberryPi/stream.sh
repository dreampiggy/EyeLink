#!/bin/bash

raspivid -o - -t 9999999 -w 1136 -h 640 --hflip | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/}' :demux=h264
