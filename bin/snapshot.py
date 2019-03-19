import cv2
import os
import sys


def snapshot(rtspurl, filename):
    try:
        cap = cv2.VideoCapture(rtspurl)
        ret, frame = cap.read()
        ret, arr = cv2.imencode('.jpg', frame)
        a = arr.tostring()
        fp = open(filename, 'wb')
        fp.write(a)
        fp.close()
    except Exception as e:
        print(str(e))
        cap.release()
    cap.release()


if __name__ == '__main__':
    # argv1 rtsp stream url
    # argv2 jpg file path and name
    rtspurl = sys.argv[1]
    jpgfile = sys.argv[2]
    snapshot(rtspurl, jpgfile)
    result = os.path.exists(jpgfile)
    i = 1
    while not result:
        if i > 3:
            break
        snapshot(rtspurl, jpgfile)
        result = os.path.exists(jpgfile)
        i = i + 1
    if result:
        print("Sucess")
    else:
        print("Failed")
