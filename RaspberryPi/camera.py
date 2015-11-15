import io
import os
import time
import picamera
from PIL import Image

import config

def captureImg():
    if os.path.exists('current.jpg'):
        os.rename('current.jpg', 'prev.jpg')    # Unix will replace it silently
    with picamera.PiCamera() as camera:
        camera.resolution = (config.PHOTO_WIDTH, config.PHOTO_HEIGHT)
        camera.start_preview()
        camera.capture('current.jpg')

def captureImgPIL():
    # Create the in-memory stream
    stream = io.BytesIO()
    with picamera.PiCamera() as camera:
        camera.resolution = (config.PHOTO_WIDTH, config.PHOTO_HEIGHT)
        camera.start_preview()
        camera.capture(stream, format='jpeg')
    # "Rewind" the stream to the beginning so we can read its content
    stream.seek(0)
    image = Image.open(stream)
    return image

def captureImgStream():
    # Create an in-memory stream
    stream = io.BytesIO()
    with picamera.PiCamera() as camera:
        camera.resolution = (config.PHOTO_WIDTH, config.PHOTO_HEIGHT)
        camera.capture(stream, 'jpeg')
    # "Rewind" the stream to the beginning so we can read its content
    stream.seek(0)
    return stream

def captureVideo():
    stream = io.BytesIO()
    with picamera.PiCamera() as camera:
        camera.resolution = (640, 480)
        camera.start_recording(stream, format='h264', quality=23)
        camera.wait_recording(10)
        camera.stop_recording()
    return stream
