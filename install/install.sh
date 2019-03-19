#!/bin/bash

function printResult()
{
 if [ $2 -ne 0 ]; then
    echo -e "\033[31m ################ [ $1 install Faild ]\033[0m"
 else
    echo -e "\033[32m ################ [ $1 install Success ] \033[0m"
 fi
}
declare -A dic


cd /opt/snapshot/install/
tar xvf Python-3.6.3.tar.xz
cd Python-3.6.3
./configure --prefix=/opt/python36 ;make ;make install
dic["Python-3.6.3"]=$?
cd ../;rm Python-3.6.3 -rf

cd  /opt/snapshot/install/
/opt/python36/bin/pip3.6 install opencv_python-4.0.0.21-cp36-cp36m-manylinux1_x86_64.whl
dic["opencv_python-4.0.0.21"]=$?


cd  /opt/snapshot/install/
/opt/python36/bin/pip3.6 install numpy-1.16.2-cp36-cp36m-manylinux1_x86_64.whl
dic["numpy-1.16.2"]=$?

for key in $(echo ${!dic[*]})
do
        #echo "$key : ${dic[$key]}"
        printResult $key ${dic[$key]}
done


