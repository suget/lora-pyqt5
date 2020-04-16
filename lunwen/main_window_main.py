from PyQt5.QtSql import QSqlDatabase,QSqlQuery
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
import sys
import os
from lunwen.main_window import Ui_Form
from lunwen.denglu import Login_UI
import numpy as np
import pyqtgraph as pg
from lunwen.zhuce import Register_UI
from lunwen.exportDialog import Ui_Dialog
import random
import string
import serial #导入模块
import csv

import time
# 主窗口
class Main(QMainWindow,Ui_Form):
    def __init__(self):
        super(Main, self).__init__()

        pg.setConfigOption('background', '#ffffff') # 顺序在ui初始化之前进行初始化 背景化
        pg.setConfigOption('foreground','#000000') # 所有的坐标轴的颜色
        pg.setConfigOption('antialias',True) # 设置曲线光滑

        self.setWindowOpacity(0.98)  # 使用self,设置窗口透明度
        # self.setStyleSheet('#Form{border-image:url(e:/python/lunwen/1.jpg);}')  # 设置主背景图
        self.setStyleSheet(
            '#Form{background-color:#ffffff;}#page_2{background-color:#F5FFFA;}'
            '#widget{background-color:#FFFAF0;}#widget_5{background-color:#C1FFC1;}'
            '#label_4{background-color:#FFFAF0;}')  # 设置窗口背景图{}表示一个css规则
        self.setupUi(self)
        self.label_21.setFrameShadow(0x020) # 设置公司标题
        self.label_21.setFont(QFont("宋体", 16, QFont.Bold))
        self.label_21.setAlignment(Qt.AlignBottom)
        self.label_22.setFrameShadow(0x020)
        self.label_22.setFont(QFont("宋体", 16, QFont.Bold))
        self.label_22.setAlignment(Qt.AlignTop)
        self.label_21.setText('绿源科技')
        self.label_22.setText('  竭诚为您')

        # self.la.setAlignment(Qt.AlignHCenter)# 设置温度和湿度居中显示
        # self.lineEdit_9.setAlignment(Qt.AlignHCenter)

        # self.pushButton2 = QPalette()   # 本来想着使用调色板，结果不能使用
        # self.pushButton2.setColor(QPalette.Button,Qt.red)  # QPalette.Button ,QPalette.Window ,QPalette.Background 不知道什么区别
        # self.label_3.setPalette(self.pushButton_2) # 使用调色板

        self.pushButton_5.clicked.connect(self.export_to)# 数据导出

        self.pushButton.clicked.connect(lambda :self.display(1)) # 显示哪一个page页面,默认显示第一个，第一个设置的在UI界面中

        self.pushButton_click()# 默认显示第一个页面，并且设置第一个样式主题
        self.pushButton.clicked.connect(self.pushButton_click) # 按钮主题颜色变化

        self.pushButton_2.clicked.connect(lambda :self.display(0))
        self.pushButton_2.clicked.connect(self.pushButton2_click)

        self.pushButton_3.clicked.connect(lambda :self.display(2))
        self.pushButton_3.clicked.connect(self.pushButton3_click)
        self.pushButton_3.clicked.connect(self.db_select)

        self.pushButton_4.clicked.connect(lambda: self.display(3))
        self.pushButton_4.clicked.connect(self.pushButton4_click)
        self.pushButton_4.clicked.connect(self.user_info)

        filename = r'.\logo.png'   # 设置图标背景
        img = QImage(filename)
        result = img.scaled(self.label_3.width(),self.label_3.height(),Qt.IgnoreAspectRatio,Qt.SmoothTransformation)# 无缩放图标
        self.label_3.setPixmap(QPixmap.fromImage(result))

        self.setWindowFlags(Qt.WindowCloseButtonHint) #设置主界面只有一个关闭按钮

        self.pushButton_7.setStyleSheet('#pushButton_7{border-image:url(e:/python/lunwen/kaiguan3.png);}')#设置按钮背景图
        self.pushButton_8.setStyleSheet('#pushButton_8{border-image:url(e:/python/lunwen/kaiguan4.png);}')

        self.widget_2.load(QUrl.fromLocalFile(os.path.abspath('tianqi.html'))) # 获取天气显示页面的绝对路径，使用WebEngine
        #self.widget_2.load(QUrl(QFileInfo("./tianqi.html").absoluteFilePath()))# 获取天气显示页面的绝对路径的第二种方法

        self.timer1 = QTimer()# 定时器，获取com口数据  得到数据库数据
        self.timer1.timeout.connect(self.Get_data)
        self.timer1.start(30000) # 30秒

        self.timer2 = QTimer()  # 定时器 保存数据库
        self.timer2.timeout.connect(self.Save_db)
        self.timer2.start(300000)  # 300秒,5分钟

        self.timer3 = QTimer()  # 定时器  画图
        self.timer3.timeout.connect(self.plot)
        self.timer3.start(3000)  # 30秒

        self.pushButton_6.clicked.connect(self.get_text)# 设置密码

        self.pushButton_7.clicked.connect(self.change_button_background_7)# 点击按钮7，改变按钮背景
        self.pushButton_8.clicked.connect(self.change_button_background_8)# 点击按钮8，改变按钮背景

    def __del__(self):# 因为在执行程序的时候，可能会出现关闭程序QWebEngineView崩溃的情况，加上这句就是让系统加快释放这部分内存，避免QWebEngineView崩溃的情况。
        self.widget_2.deleteLater()

    def change_button_background_7(self):
        self.pushButton_7.setStyleSheet('#pushButton_7{border-image:url(e:/python/lunwen/kaiguan4.png);}')  # 设置按钮背景图
        self.pushButton_8.setStyleSheet('#pushButton_8{border-image:url(e:/python/lunwen/kaiguan3.png);}')
        datet = QDateTime.currentDateTime()
        self.label_15.setText(datet.toString('yyyy-MM-dd HH:mm'))

    def change_button_background_8(self):
        self.pushButton_7.setStyleSheet('#pushButton_7{border-image:url(e:/python/lunwen/kaiguan3.png);}')  # 设置按钮背景图
        self.pushButton_8.setStyleSheet('#pushButton_8{border-image:url(e:/python/lunwen/kaiguan4.png);}')
        datet = QDateTime.currentDateTime()
        self.label_19.setText(datet.toString('yyyy-MM-dd HH:mm'))

    def get_text(self):# 设置要显示的密码，这里没有连接数据库进行查询，直接就显示了，也没有存储数据库，进行操作。
        text,ok = QInputDialog.getText(self,'修改密码','请输入需要修改的密码：')
        if ok:
            self.label_11.setText(text)

    def export_to(self):# 数据导出
        main_dialog.show()
        self.db = QSqlDatabase.addDatabase('QMYSQL')  # 数据库设置
        self.db.setHostName('localhost')
        self.db.setDatabaseName('bigpeng')
        self.db.setUserName('root')
        self.db.setPassword('')
        if not self.db.open():
            QMessageBox.critical(None, ('无法打开数据库'), ('无法建立连接，需要配置'), QMessageBox.Cancel)
            return False
        query = QSqlQuery()
        query.exec("select * from df_grounddata where tu_place='大棚一'")
        filename = 'data.csv'# 导出为csv文件
        with open(filename, mode='w', encoding='utf-8') as f:
            write = csv.writer(f, dialect='excel')
            write.writerow(['时间', '位置','土壤深度','温度', '湿度'])# 先写下标题
            while query.next():
                date = query.value(1).toString('yyyy-MM-dd HH:mm:ss')
                place = query.value(4)
                depth = query.value(5)
                shidu = query.value(6)
                wendu = query.value(7)
                write.writerow([date,place,depth,shidu,wendu]) # 每次写一行

    def plot(self):# 历史温湿度画图
        self.widget_3.clear()
        self.db = QSqlDatabase.addDatabase('QMYSQL')  # 数据库设置
        self.db.setHostName('localhost')
        self.db.setDatabaseName('bigpeng')
        self.db.setUserName('root')
        self.db.setPassword('')
        if not self.db.open():
            QMessageBox.critical(None, ('无法打开数据库'), ('无法建立连接，需要配置'), QMessageBox.Cancel)
            return False
        query = QSqlQuery()
        query.exec("select * from df_grounddata where tu_place='大棚一'order by id desc limit 10;")# 取出的数据是逆序排列，在数组中取出也要逆序取出
        lie_wendu = []
        lie_shidu = []
        time = []
        while query.next():
            time.append(query.value(1).toString('HH:mm'))
            lie_wendu.append(query.value(7))
            lie_shidu.append(query.value(6))
        print(lie_wendu+lie_shidu)
        p1 = self.widget_3.addPlot(title="历史温度曲线图")  # 曲线图显示
        p1.plot(lie_wendu[::-1], pen=(255, 0, 0), name="Red curve")# data数据格式为列表，或者元组都行
        # p1.plot(np.random.normal(size=10) + 9, pen=(0, 255, 0), name="Green curve") # 另外两条其他的曲线
        # p1.plot(np.random.normal(size=11) + 7, pen=(0, 0, 255), name="Blue curve")

        # xax = p1.getAxis('left') # 改成坐标轴y
        xax = p1.getAxis('bottom')  # 坐标轴x
        xticks = [list(zip(range(10), (time[8], '', time[6], '', time[4], '', time[2], '', time[0], '')))]  # 声明五个坐标，分别是
        xax.setTicks(xticks)

        p2 = self.widget_3.addPlot(title="历史湿度曲线图")
        p2.plot(lie_shidu[::-1], pen=(255, 0, 0), name="Red curve")
        xax2 = p2.getAxis('bottom')  # 坐标轴x
        xticks2 = [list(zip(range(10), (time[8], '', time[6], '', time[4], '', time[2], '', time[0], '')))]  # 声明五个坐标，分别是
        xax2.setTicks(xticks2)
        self.db.close()

    def Save_db(self): # 数据存储到数据库
        self.db = QSqlDatabase.addDatabase('QMYSQL')  # 数据库设置
        self.db.setHostName('localhost')
        self.db.setDatabaseName('bigpeng')
        self.db.setUserName('root')
        self.db.setPassword('')
        if not self.db.open():
            QMessageBox.critical(None, ('无法打开数据库'), ('无法建立连接，需要配置'), QMessageBox.Cancel)
            return False
        query = QSqlQuery()
        # 73        2019 - 10 - 14  2019 - 10 - 14       0    大棚一        20        57        20
        current_datetime = QDateTime.currentDateTime()
        current_date = current_datetime.toString('yyyy-MM-dd HH:mm:ss')
        text = self.comboBox.currentText()
        wendu = self.label_23.text().rstrip('°C')
        shidu = self.label_24.text().rstrip('%')
        print(current_date,text,shidu,wendu)
        # 若当前行为空，会自动分配id编号
        sql = "insert into df_grounddata values ('','%s','%s',0,'%s',20,%s,%s)"%(current_date,current_date,text,shidu,wendu)
        print(sql)
        query.exec(sql)
        self.db.close()


    def Get_data(self):# 获得lora数据
        try:
            # 端口，GNU / Linux上的/ dev / ttyUSB0 等 或 Windows上的 COM3 等
            portx = "COM3"
            # 波特率，标准值之一：50,75,110,134,150,200,300,600,1200,1800,2400,4800,9600,19200,38400,57600,115200
            bps = 9600
            # 超时设置,None：永远等待操作，0为立即返回请求结果，其他值为等待超时时间(单位为秒）
            # 打开串口，并得到串口对象
            ser = serial.Serial(portx, bps, timeout=500)
            print("串口详情参数：", ser)
            i=0
            while i<1: # 循环只进行一次
                if ser.in_waiting:
                    str = ser.read(ser.in_waiting).decode('gbk')
                    print(str)

                    print('%s°C'%str[5:10])
                    print(str[13:18]+'%')
                    i+=1
                    self.label_23.setText(str[5:10].strip()+'°C') # 设置显示
                    self.label_24.setText(str[13:18].strip()+'%')
        except:
            return

    def display(self,i):# 显示当前页面的函数
        self.stackedWidget.setCurrentIndex(i)

    def pushButton_click(self):# 设置按钮背景颜色函数
        print('button1')
        # self.pushButton_2.setPalette(self.pushButton2) # 调色板失败，不能动态改变按钮的颜色
        self.pushButton.setStyleSheet('#pushButton{background-color:#FF8C69;}') # 使用css改变按钮的颜色
        self.pushButton_2.setStyleSheet('#pushButton_2{background-color:#EED8AE;}')  # 使用css改变按钮2的颜色,还原为原来的样式
        self.pushButton_3.setStyleSheet('#pushButton_3{background-color:#EED8AE;}')  # 使用css改变按钮3的颜色
        self.pushButton_4.setStyleSheet('#pushButton_4{background-color:#EED8AE;}')  # 使用css改变按钮4的颜色

    def pushButton2_click(self):
        print('button2')
        self.pushButton_2.setStyleSheet('#pushButton_2{background-color:#FF8C69;}') # 使用css改变按钮的颜色
        self.pushButton.setStyleSheet('#pushButton{background-color:#EED8AE;}')  # 使用css改变按钮的颜色
        # 使用css改变按钮2的颜色,还原为原来的样式
        self.pushButton_3.setStyleSheet('#pushButton_3{background-color:#EED8AE;}')  # 使用css改变按钮3的颜色
        self.pushButton_4.setStyleSheet('#pushButton_4{background-color:#EED8AE;}')  # 使用css改变按钮4的颜色

    def pushButton3_click(self):
        print('button3')
        self.pushButton_3.setStyleSheet('#pushButton_3{background-color:#FF8C69;}') # 使用css改变按钮的颜色
        self.pushButton_2.setStyleSheet('#pushButton_2{background-color:#EED8AE;}') # 使用css改变按钮的颜色
        self.pushButton.setStyleSheet('#pushButton{background-color:#EED8AE;}')  # 使用css改变按钮的颜色
        # 使用css改变按钮2的颜色,还原为原来的样式
        self.pushButton_4.setStyleSheet('#pushButton_4{background-color:#EED8AE;}')  # 使用css改变按钮4的颜色

    def pushButton4_click(self):
        print('button4')
        # 使用css改变按钮2的颜色,还原为原来的样式
        self.pushButton.setStyleSheet('#pushButton{background-color:#EED8AE;}')  # 使用css改变按钮的颜色
        self.pushButton_2.setStyleSheet('#pushButton_2{background-color:#EED8AE;}')  # 使用css改变按钮的颜色
        self.pushButton_3.setStyleSheet('#pushButton_3{background-color:#EED8AE;}')  # 使用css改变按钮的颜色
        self.pushButton_4.setStyleSheet('#pushButton_4{background-color:#FF8C69;}')  # 使用css改变按钮的颜色

    def db_select(self): # 数据库设置
        self.db = QSqlDatabase.addDatabase('QMYSQL') # 数据库设置
        self.db.setHostName('localhost')
        self.db.setDatabaseName('bigpeng')
        self.db.setUserName('root')
        self.db.setPassword('')
        if not self.db.open():
            QMessageBox.critical(None,('无法打开数据库'),('无法建立连接，需要配置'),QMessageBox.Cancel)
            return False
        query = QSqlQuery()
        text = self.comboBox_2.currentText() # 获取选择的哪块土地
        print(text)
        query.exec("select * from df_status WHERE place='%s'"%text)
        i=0
        self.tableWidget.setColumnWidth(3,130) # 设置table表格最后一个列的宽度
        # self.tableWidget.setRowHeight(3,130)# 设置table表格最后一个列的宽度
        #设置表格标题的方法
        # self.tableWidget.setHorizontalHeaderLabels(('第一列','第二列'))# 括号中为Iterable对象，即可迭代，其中可以为列表[]，元组(),集合{}
        # self.tableWidget.setVerticalHeaderLabels(('第一行', '第二行'))# 这里使用元组，有几行或者几列，元组内有几个字符串
        # self.tableWidget.insertColumn(0) #插入到第一列
        # self.tableWidget.insertRow(0)
        while(query.next()):# 判断查询语句集合是否有下一条
            self.tableWidget.setItem(i,0,QTableWidgetItem(str(query.value(8))))
            self.tableWidget.setItem(i, 1, QTableWidgetItem('板载温度'))
            self.tableWidget.setItem(i, 2, QTableWidgetItem(str(query.value(4))))
            self.tableWidget.setItem(i, 3, QTableWidgetItem(str(query.value(2).toString("yyyy/MM/dd HH:mm:ss"))))

            self.tableWidget.setItem(i+1, 0, QTableWidgetItem(str(query.value(8))))
            self.tableWidget.setItem(i+1, 1, QTableWidgetItem('电压'))
            self.tableWidget.setItem(i+1, 2, QTableWidgetItem(str(query.value(5))))
            self.tableWidget.setItem(i+1, 3, QTableWidgetItem(str(query.value(2).toString("yyyy/MM/dd HH:mm:ss"))))

            self.tableWidget.setItem(i+2, 0, QTableWidgetItem(str(query.value(8))))
            self.tableWidget.setItem(i+2, 1, QTableWidgetItem('电量'))
            self.tableWidget.setItem(i+2, 2, QTableWidgetItem(str(query.value(6))))
            self.tableWidget.setItem(i+2, 3, QTableWidgetItem(str(query.value(2).toString("yyyy/MM/dd HH:mm:ss"))))

            self.tableWidget.setItem(i+3, 0, QTableWidgetItem(str(query.value(8))))
            self.tableWidget.setItem(i+3, 1, QTableWidgetItem('放置位置'))
            self.tableWidget.setItem(i+3, 2, QTableWidgetItem(str(query.value(7))))
            self.tableWidget.setItem(i+3, 3, QTableWidgetItem(str(query.value(2).toString("yyyy/MM/dd HH:mm:ss"))))
            i=i+4
            print(str(query.value(8)),query.at())

    def user_info(self):
        '''个人中心显示'''
        self.label_9.setText(main_login.lists[0])# 设置个人中心显示的密码
        self.label_11.setText(main_login.lists[1])


# 登录窗口类
class Main_Login(QWidget,Login_UI):
    lists = [] #设置一个空列表，实现账号密码的存储,方便主窗口类读取

    def __init__(self):
        super(Main_Login, self).__init__()
        self.setupUi(self)
        #self.pushButton.clicked.connect(self.close) # 原来的关闭当前窗口的程序 ，现在不再使用
        self.LoginButton.clicked.connect(self.Login_Control) # 调用登录函数
        self.RegisterButton.clicked.connect(self.Register)# 调用注册函数
        self.read_user()

    # 跳转到注册界面
    def Register(self):
        main_register.show()
        self.close()

    # 数据库连接以及跳转主界面
    def Login_Control(self):
        self.db = QSqlDatabase.addDatabase('QMYSQL')
        self.db.setHostName('localhost')
        self.db.setDatabaseName('bigpeng')
        self.db.setUserName('root')
        self.db.setPassword('')
        if not self.db.open():
            QMessageBox.critical(None, ('无法打开数据库'), ('无法建立连接，需要配置'), QMessageBox.Cancel)
            return False
        query = QSqlQuery()
        user = self.lineEdit.text() # 得到用户输入的数据
        pwd = self.lineEdit_2.text()
        print(user+'=get='+pwd)
        query.exec("select * from df_user WHERE username='%s'"%user)# 由于django采用的登录密码放入数据库采用sha256加密，不能破解
        while(query.next()):
            print(query.value(4))
            if pwd==query.value(4): # 因此不在比对密码，直接比对账号
                print(user, pwd)
                main_login.lists.clear()  # 清空密码存储,确保以后放入的数据在第一位和第二位
                self.lists.append(user)
                self.lists.append(pwd)
                print(self.lists[0]+'list')
                if (self.checkBox.isChecked()==True)|(self.checkBox_2.isChecked()==True):  # 复选框选中，记录账号和密码
                    self.save_user()
                main.show() # 打开新窗口
                main.label_4.setText('欢迎您：%s' % main_login.lists[0])#
                self.close()  # 关闭当前登录窗口
            else:
                self.lineEdit_2.setText('密码错误') # 提示输入错误类型信息
        else:
            self.lineEdit.setText('账号错误')

    # 保存账号密码到本地
    def save_user(self):
        with open('user_pwd.txt','w') as f: #新建一个文件
            print('open file')
            seq = ["%s\n"%self.lists[0], "%s"%self.lists[1]]
            print(seq)
            f.writelines(seq)# 分成两行写入,取出的时候一行一行的读
            f.close()


    def read_user(self):# 读取保存的账号和密码
        try:
            with open(r'user_pwd.txt', 'r') as f:  #
                self.lists = f.readlines() # 读取多行，返回一个列表
                f.close()
            self.lineEdit.setText(self.lists[0].strip())  # 设置账号和密码
            self.lineEdit_2.setText(self.lists[1].strip())
            self.checkBox.setChecked(True)
            self.checkBox_2.setChecked(True)
        except:
            return

# 注册界面
class Main_Register(QMainWindow,Register_UI):

    def __init__(self):
        super(Main_Register, self).__init__()
        self.code_str = string.ascii_letters+string.digits # 获取abcd等字母和123等数字
        self.setupUi(self)
        self.get_code()
        self.Button_re.clicked.connect(self.register_control)

    def get_code(self,len=6):# 得到6位验证码
        self.content = ''.join(random.sample(self.code_str, len)) # 随机产生6位字符
        self.label.setStyleSheet("color:black") # 设置字符格式
        self.label_4.setFrameShadow(0x020)
        self.label_4.setFont(QFont("宋体", 16, QFont.Bold))
        self.label_4.setText(self.content) # 显示字符


    def register_control(self): # 注册实现方法
        user = self.lineEdit.text() # 获取输入的信息
        pwd1 = self.lineEdit_2.text()
        pwd2 = self.lineEdit_3.text()
        code = self.lineEdit_4.text()
        print(user+pwd1+pwd2+code+self.content)
        if (pwd1 == pwd2) & (code == self.content):# 必须加两个括号来进行if判断
            self.db = QSqlDatabase.addDatabase('QMYSQL')# 连接数据库
            self.db.setHostName('localhost')
            self.db.setDatabaseName('bigpeng')
            self.db.setUserName('root')
            self.db.setPassword('')
            if not self.db.open():# 判断数据库打开与否
                QMessageBox.critical(None, ('无法打开数据库'), ('无法建立连接，需要配置'), QMessageBox.Cancel)
                return False
            query = QSqlQuery()
            query.exec('select * from df_user') # 查询所有
            count=query.size()  # 获得总数据条目数
            sql = "insert into df_user values(%d,'%s','',0,'%s','','','1447826735@qq.com',0,0,'','','',0,'','')"%(count+1,pwd2,user)
            flag = query.exec(sql)# 判断是否插入成功
            if flag==True:
                main_login.show()
                self.close()




class Main_Dialog(QMainWindow,Ui_Dialog):
    def __init__(self):
        super(Main_Dialog, self).__init__()
        self.setupUi(self)
        self.buttonBox.accepted.connect(self.accept)
        self.buttonBox.rejected.connect(self.reject)


    def accept(self):
        self.start_time = self.dateEdit_2.time()
        self.end_time = self.dateEdit.time()
        self.close()

    def reject(self):
        self.close()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    main_login = Main_Login()
    main = Main()  # 实例化主窗口函数
    main_register = Main_Register()# 实例化注册窗口
    main_dialog = Main_Dialog() # 实例化弹窗
    main_login.show()
    sys.exit(app.exec())
