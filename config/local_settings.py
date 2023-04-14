from .settings import *

DEBUG = True

ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'content',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOST': 'db.cv0mjqsao6wx.ap-northeast-2.rds.amazonaws.com',
        'PORT': '3306',
    }
}
