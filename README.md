# snapshot
opencv python snapshot
<br>基于opencv-python 完成的抽帧程序，可以抽取rtsp直播流、ts ip组播流的视频画面保存为图片。

#install
<br>linux 安装到 /opt 目录
<br>sh install/install.sh

#调用方法：
<br>/opt/python36/bin/python3 snapshot.py rtsp://admin:admin123@192.168.1.154:554/cam/realmonitor?channel=1#subtype=0 /opt/snapshot/pic/test1.jpg
#参数说明：
<br>命令行参数1：摄像头rtsp信源地址  
<br>例子：rtsp://admin:admin123@192.168.1.154:554/cam/realmonitor?channel=1#subtype=0
<br>命令行参数2：抽帧图片的绝对路径  
<br>例子：/opt/snapshot/pic/test1.jpg
#打印输出：
<br>Sucess   抽帧成功
<br>Failed    抽帧失败（会尝试三次）
<br>其他打印 异常详细信息
