# -*- coding: utf-8 -*-
# @Time : 2020/3/8 22:26
# @Author : ZS
# @Site : 
# @File : testp.py
# @Software: PyCharm
from lunwen.zhuce import Register_UI
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
import sys
class Main_Register(QMainWindow,Register_UI):
    lists = []
    def __init__(self):
        super(Main_Register, self).__init__()
        self.setupUi(self)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    main_login = Main_Register()
    main_login.show()
    app.exec()
