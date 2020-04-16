# -*- coding: utf-8 -*-
# @Time : 2020/3/24 11:39
# @Author : ZS
# @Site : 
# @File : exportDialog_main.py
# @Software: PyCharm
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
import sys

from lunwen.exportDialog import Ui_Dialog

class Main(QMainWindow,Ui_Dialog):
    def __init__(self):
        super(Main, self).__init__()

        self.setupUi(self)
        self.buttonBox.accepted.connect(self.accept)
        self.buttonBox.rejected.connect(self.reject)

    def accept(self):
        self.close()

    def reject(self):
        self.close()
if __name__ == '__main__':
    aapp = QApplication(sys.argv)
    main = Main()
    main.show()
    sys.exit(aapp.exec())
