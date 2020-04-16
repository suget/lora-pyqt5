# -*- coding: utf-8 -*-
# @Time : 2020/3/2 20:32
# @Author : ZS
# @Site : 
# @File : openweb.py
# @Software: PyCharm


from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
import sys
class WebView(QWebEngineView):
    def __init__(self):
        super(WebView, self).__init__()
        url='http://127.0.0.1:8000/news/luntan'
        self.load(QUrl(url))
        self.show()
        self.resize(1000,800)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = WebView()
    win.show()
    sys.exit(app.exec())
