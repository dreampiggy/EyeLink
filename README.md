# EyeLink

###构建属于你的云端智能家居监控平台

> Yet Another Hackathon Project
> 
> 又一个[Hackathon](https://en.wikipedia.org/wiki/Hackathon)项目

# Introduction

+ 利用树莓派的摄像头，上传图片至云端([Picamera](https://picamera.readthedocs.org/en/release-1.10/))
+ 用户管理，登记树莓派([Node.js](https://nodejs.org/en/) [MongoDB](https://www.mongodb.org/))
+ 移动端展示图片历史([Node.js](https://nodejs.org/en/) [Stream](https://nodejs.org/api/stream.html))
+ 移动端远程控制拍照([Flask](http://flask.pocoo.org/) [SuperAgent](https://visionmedia.github.io/superagent/))
+ 移动端远程串流视频([RTSP](https://en.wikipedia.org/wiki/Real_Time_Streaming_Protocol))
+ 运动追踪识别，推送通知报警([OpenCV](http://opencv.org/),[SimpleCV](http://simplecv.org/),[Push Notifacation](https://developer.apple.com/notifications/))

# Build

+ Pi -- Raspbian Jessie(4.1)

首先，你的有一个[树莓派](https://www.raspberrypi.org)，以及摄像头模块，并且打开[摄像头模块支持](https://www.raspberrypi.org/help/camera-module-setup/)

```bash
> raspi-config
[Enable Camera]
```

依赖：

```
sudo su
apt-get update
apt-get upgrade
apt-get install python-dev vlc screen
pip install picamera flask simpleCV requests apn

```


+ Server -- OS X / Ubuntu & Node.js > 0.12

1. 安装Mongodb && Node
	
	OS X:
	
	```bash
	brew install node mongodb 
	```
	
	Ubuntu:
	
	```bash
	sudo apt-get install nodejs node-legacy mongodb
	```
2. Build

	```bash
	npm install
	```

+ iOS -- OS X 10.11 & Xcode 7

需要CocoaPods，若国内gem安装慢，请先更换[RubyGem镜像](https://ruby.taobao.org)

```
sudo gem install cocoapods
```

之后，进入iOS项目目录

```
pod install
```

# Config

+ Pi -- `config.py`

```python
# URL
SERVER_URL = "http://192.168.1.100/photo/upload"

# Parameter
INTERVAL_TIME = 30 # 30s for interval photo capture

PHOTO_WIDTH = 640
PHOTO_HEIGHT = 480
VIDEO_WIDTH = 640
VIDEO_HEIGHT = 480
VIDEO_QUALITY = 23

THRES_HOLD = 5.0 # define the threshold to judge movement
```
要使用`Apple Push Notification`，需要提供你的SSL证书的公匙(Public Key)和私匙(Private Key)，并且请用自己的Pass签名私匙

```bash
> openssl rsa -in key-old.pem -out key.pem
[enter the passphrase]
```

之后把公匙和签名的私匙放入`lib/`避免手动输入密码

```python
apns = APNs(use_sandbox=True, cert_file='lib/cert.pem', key_file='lib/key.pem')
```

+ Server -- `config.js`

```js
if (env == 'production'){
	console.log('#Production mode#');
	mongoURI = 'mongodb://xxx.xxx.xxx.xxx:27017/eyelink';
	serverIP='xxx.xxx.xxx.xxx';
}
//NODE_ENV=development or other
else{
	console.log('#Development mode#');
	mongoURI = 'mongodb://localhost:27017/eyelink';
	serverIP= ip.address();
}
```

+ iOS -- `Consts.swift`

```swift
//Server(Node.js) IP
static let mainUrl = "http://192.168.1.100/"

//RaspberryPi RTSP IP
static let path = "rtsp://192.168.1.101:8554/"
```


# Start

+ Pi

```bash
sudo screen python index.py
./stream.sh
```

+ Server

```bash
sudo mongod -f mongod.conf
sudo PORT=80 npm start
```

+ iOS

```bash
run Xcode Simulator or iPhone
```


# Screenshot

![iOS](http://img.hb.aicdn.com/01bc4754394a32a808c159933497a0ab283e2fa5193ee-PpDBuP)

![Pi](http://img.hb.aicdn.com/64c4c9a5d147f4aae8e9ae427904feeb8bb9f7b41a0eb6-wNDM90_fw658)


