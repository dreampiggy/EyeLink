# 拍照

`M`: GET /photo/capture

`P`: null

`R`: 200: Image/PNG / 403: 失败

# 拍视频

`M`: GET /video/capture

`P`: {time: 时长，秒数}

`R`: 200: Video/MPEG-4 / 403: 失败

# 开启监控

`M`: GET /monitor/start

`P`: null

`R`: 200: 成功 / 403: 失败

# 关闭监控

`M`: GET /monitor/stop

`P`: null

`R`: 200: 成功 / 403: 失败


# 获取流视频URL

`M`: GET /monitor/url

`P`: null

`R`: 200，String:返回流视频的URL / 403: 失败

# 流媒体播放

`M`: HTTP Live Streaming