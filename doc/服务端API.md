# 注册
`M`: POST /register

`P`: {phone: 电话; pass: 密码加密过后}

`R`: 200 成功 / 403 失败

# 登陆

`M`: POST /login

`P`: {phone: 电话; pass: 密码加密后; captcha: 验证码}

`R`: 200 成功 / 403 失败

# 验证码

`M`: GET /catpcha

`P`: null

`R`: 200 Image/PNG / 403 失败

# 拍照

`M`: GET /photo/capture

`P`: {id: 唯一ID}

`R`: 200: Image/PNG / 403: 失败

# 拍视频

`M`: GET /video/capture

`P`: {id: 唯一ID;time: 时长，秒数}

`R`: 200: Video/MPEG-4 / 403: 失败

# 获取历史照片

`M`: GET /photo/history

`P`: {id: 唯一ID;page: 第几页}

`R`: 

200: 

```
[{
	time: "2015/11/26 11:11:12",
	url: "http://serverip/image/xx/xxxxxxxxx.png"
},{
	time: "2015/11/26 11:11:11",
	url: "http://serverip/image/xx/xxxxxxxxx.png"
},
{
	time: "2015/11/26 11:11:10",
	url: "http://serverip/image/xx/xxxxxxxxx.png"
}]

```

403: 失败

# 直接读取照片

`M`: GET /image/xx/xxxxxxx.png

`P`: null

`R`: 200 Image/PNG / 403 失败

# 获取流视频URL

`M`: GET /monitor/url

`P`: {id: 唯一ID}

`R`: 200，String:返回流视频的URL / 403: 失败

# 开启监控

`M`: GET /monitor/start

`P`: {id: 唯一ID}

`R`: 200: 成功 / 403: 失败

# 关闭监控

`M`: GET /monitor/stop

`P`: {id: 唯一ID}

`R`: 200: 成功 / 403: 失败

# 定时监控计划

`M` POST /monitor/schedule

`P`: {id:唯一ID; start: "11:11:11"; end: "11:11:12"}

`R`: 200: 成功 / 403: 失败

# 查看计划

`M` GET /monitor/schedule

`P`: {id: 唯一ID}

`R`: {start: "11:11:11"; end: "11:11:12"}

# 接受树莓派推送信息(仅树莓派请求)

`M`: GET /push/

`P`: {message: 推送的内容}

`R`: 200 成功 / 403 失败


