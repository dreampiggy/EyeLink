import os, requests, time, threading

import config
import camera
import simpleCV
import apn

def schedule():
    camera.captureImg()
    if os.path.exists('prev.jpg'):
        result = simpleCV.judge_move()
        if result:
            apn.send_push()
            upload_img()
    threading.Timer(config.INTERVAL_TIME, schedule).start()


def upload_img():
    files = {'file': open('current.jpg', 'rb')}
    r = requests.post(config.SERVER_URL, files=files)

def upload_video():
    with open('live.h264', 'rb') as f:
        requests.post(config.SERVER_URL, data=f)