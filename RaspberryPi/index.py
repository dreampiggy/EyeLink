from flask import Flask
from flask import send_file

import camera
import request

request.schedule()

app = Flask(__name__)

@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    return 'Hello World'

@app.route('/photo/capture')
def photo_capture():
    return send_file(camera.captureImgStream(), mimetype="image/jpeg")

@app.route('/video/stop')
def video_stop():
	return

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
