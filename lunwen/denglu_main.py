# -*- coding: utf-8 -*-
# @Time : 2020/3/2 18:44
# @Author : ZS
# @Site : 
# @File : denglu_main.py
# @Software: PyCharm
from PyQt5.QtCore import *
from PyQt5.QtSql import QSqlDatabase, QSqlQuery
from PyQt5.QtWidgets import *
import sys
import os
from lunwen.denglu import Ui_Form

class Main_Login(QMainWindow,Ui_Form):
    signals = pyqtSignal(str,str)
    def __init__(self):
        super(Main_Login, self).__init__()
        self.setupUi(self)
        #self.pushButton.clicked.connect(self.close) # 原来的关闭当前窗口的程序 ，现在不再使用
        self.pushButton.clicked.connect(self.new_window) # 调用函数

    def new_window(self):
        self.db = QSqlDatabase.addDatabase('QMYSQL')
        self.db.setHostName('localhost')
        self.db.setDatabaseName('bigpeng')
        self.db.setUserName('root')
        self.db.setPassword('')
        if not self.db.open():
            QMessageBox.critical(None, ('无法打开数据库'), ('无法建立连接，需要配置'), QMessageBox.Cancel)
            return False
        query = QSqlQuery()
        user = self.lineEdit.text()
        pwd = self.lineEdit_2.text()

        query.exec("select * from df_user WHERE username='%s'"%user)# 由于django采用的登录密码放入数据库采用sha256加密，不能破解
        while(query.next()):
            print(query.value(4))
            if pwd==query.value(4): # 因此不在比对密码，直接比对账号
                print(user, pwd)
                self.signals.emit(user,pwd)

                self.close()  # 关闭当前窗口
                os.system('python testp.py %s %s'%(user,pwd) ) # 打开新的窗口

            else:
                self.lineEdit_2.setText('密码错误')
        else:
            self.lineEdit.setText('账号错误')

if __name__ == '__main__':
    app = QApplication(sys.argv)
    main = Main_Login()
    main.show()
    sys.exit(app.exec())
