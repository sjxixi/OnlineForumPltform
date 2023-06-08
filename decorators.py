from functools import wraps
from flask import session, url_for, redirect


def login_limit(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        # 这里用来区分是否登录，查看session中是否赋值了email，如果赋值了，说明已经登录
        if session.get('email'):
            # 如果登录了，就正常访问函数的功能
            return func(*args, **kwargs)
        else:
            # 如果没有登录，将重定向到登录页面
            return redirect(url_for('login'))

    return wrapper
