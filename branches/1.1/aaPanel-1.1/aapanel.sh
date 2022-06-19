#! /bin/bash
# By Aaron
# https://github.com/daovantrong/aaPanel

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
purple(){
    echo -e "\033[35m\033[01m$1\033[0m"
}

# 下载aapanel面板
function aapanel-install(){
wget -O "/root/aapanel-install.sh" "http://www.aapanel.com/script/install_6.0_en.sh"
red "下载完成,正在安装官网原版."
bash "/root/aapanel-install.sh"
}

# 降级aapanel 官网下载(最后一个无广告版本)
function downgrade-official(){
wget -O "/root/LinuxPanel_EN-6.8.23.zip" "http://node.aapanel.com/install/update/LinuxPanel_EN-6.8.23.zip"
blue "下载完成,正在降级."
unzip LinuxPanel_EN-6.8.23.zip
cd /root/panel
wget -O "/root/panel/downgrade.sh" "https://ghproxy.com/https://raw.githubusercontent.com/daovantrong/aaPanel/main/downgrade.sh" 
bash "/root/panel/downgrade.sh"
red "降级成功."
}

# 降级aapanel GitHub下载 (最后一个无广告版本)
function downgrade-github(){
wget -O "/root/LinuxPanel_EN-6.8.23.zip" "https://ghproxy.com/https://github.com/daovantrong/aaPanel/releases/download/1.0/LinuxPanel_EN-6.8.23.zip"
blue "下载完成,正在降级."
unzip LinuxPanel_EN-6.8.23.zip
cd /root/panel
wget -O "/root/panel/downgrade.sh" "https://ghproxy.com/https://raw.githubusercontent.com/daovantrong/aaPanel/main/downgrade.sh" 
bash "/root/panel/downgrade.sh"
red "降级成功."
}

# aapanel 开心
function aapanel-happy(){
sed -i 's|"endtime": -1|"endtime": 999999999999|g' /www/server/panel/data/plugin.json
sed -i 's|"pro": -1|"pro": 0|g' /www/server/panel/data/plugin.json
red "好开心 ٩(ˊᗜˋ*)و."
}

# 清理垃圾
function clean-up-trash(){
rm LinuxPanel_EN-6.8.23.zip aapanel-install.sh bt-uninstall.sh panel/ -rf
red "清理成功."
red "如果想删除此脚本 请执行 rm aapanel.sh -rf ."
}

# 卸载aaPanel
function uninstall(){
wget -O "/root/bt-uninstall.sh" "http://download.bt.cn/install/bt-uninstall.sh"
bash "/root/bt-uninstall.sh"
red "卸载aaPanel成功."
}

# 菜单
function start_menu(){
    clear
    purple " 感谢使用aaPanel小助手,好用请Star."
    purple " https://github.com/daovantrong/aaPanel"
    yellow " =================================================="
    green " 1. CentOS/Debian/Ubuntu 安装 aaPanel"
    yellow " --------------------------------------------------"
    green " 2. 降级 6.8.23 版本 aaPanel(官网)"
    green " 3. 降级 6.8.23 版本 aaPanel(GitHub仓库)"
    green " 4. 开心一下٩(ˊᗜˋ*)و"
    yellow " =================================================="
    green " 8. 卸载 aaPanel"
    green " 9. 清理脚本产生垃圾文件"
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           aapanel-install
	    ;;
        2 )
           downgrade-official
        ;;
        3 )
           downgrade-github
        ;;
        4 )
           aapanel-happy
        ;;
        8 )
           uninstall
        ;;
        9 )
           clean-up-trash
        ;;
        0 )
            exit 1
        ;;
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
