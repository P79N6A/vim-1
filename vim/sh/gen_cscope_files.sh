#########################################################################
# File Name: gen_cscope_files.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 2016年08月09日 星期二 20时47分58秒
#########################################################################
#! /bin/bash

TARGET='/home/lin/.vim/cscope_db/cscope.files'
gen_cscope_files_usage() {
        echo "gen_cscope_files.sh 源码顶层目录(绝对路径) 待扫描子目录1 [待扫描子目录2] ... [待扫描子目录N]"
}

if [ -z ${1} ]; then
        echo "请输入起始目录!"
        gen_cscope_files_usage
        exit 1
fi

if [ ${1:0:1} != '/' ]; then
        echo "请输入起始目录的绝对路径形式!"
        gen_cscope_files_usage
        exit 1
fi

if [ ${#} -lt 2 ]; then
        echo "请输入你要扫描的子目录列表!"
        gen_cscope_files_usage
        exit 1
fi

if [ -s ${TARGET} ]; then
        cat /dev/null > ${TARGET}
fi

for dir in $@
do
        if [ ${dir} != ${1} ]; then
                find ${1}/${dir} -name "*.[hc]" -print >> ${TARGET}
        fi
done
