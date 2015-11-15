# -*- coding:utf-8 -*-

import time
import random
from apns import APNs, Frame, Payload

apns = APNs(use_sandbox=True, cert_file='lib/cert.pem', key_file='lib/key.pem')

# Send a notification
token_hex = '7f93f93475aebaaed800ddb000424b800fafd146534834cfc9edd2a9b52fc443'

content = [u"有未知人影正在接近，点击来查看",
    u"这是谁在这里闲晃？点击来查看",
    u"可疑人物已被监控发现，点击来查看"]

def send_push():
    payload = Payload(alert=content[random.randint(0,2)], sound="default", badge=1)
    apns.gateway_server.send_notification(token_hex, payload)