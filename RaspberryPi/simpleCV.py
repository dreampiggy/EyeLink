import subprocess
import os
from SimpleCV import *
import picamera

import config

def diff_img():
    if(os.path.exists('prev.jpg') & os.path.exists('current.jpg')):
        img_before = Image("prev.jpg")
        img_after = Image("current.jpg")

        diff = img_after - img_before
        return diff
    else:
        return False

def judge_move():

    diff = diff_img()

    if (diff == False):
        return

    matrix = diff.getNumpy()
    mean = matrix.mean()

    if mean >= config.THRES_HOLD:
        return True
    else:
        return False