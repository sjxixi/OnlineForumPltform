#encoding:utf-8

import os
import pymysql

DEBUG=False
SECRET_KEY=os.urandom(24)

db=pymysql.connect(host='localhost',user='root',password='root123',db='OnlineForumPlatform',port=3306)