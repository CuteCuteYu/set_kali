#!/bin/bash

# 设置root用户的密码为toor
echo "设置root用户的密码为toor..."
echo "root:toor" | chpasswd

# 替换apt源为国内源
echo "替换apt源为国内源..."
cat <<EOL > /etc/apt/sources.list
# Kali Linux Official Repositories
deb http://mirrors.163.com/kali kali-rolling main non-free contrib
deb-src http://mirrors.163.com/kali kali-rolling main non-free contrib
EOL

# 更新和升级
echo "更新和升级系统..."
apt-get update && apt-get upgrade -y

# 设置Kali为中文语言
echo "设置Kali为中文语言..."
apt-get install -y language-pack-zh-hans
echo "LANG=zh_CN.UTF-8" >> /etc/default/locale

# 安装谷歌拼音输入法
echo "安装谷歌拼音输入法..."
apt-get install -y fcitx fcitx-googlepinyin

# 配置输入法
echo "配置输入法..."
cat <<EOL > ~/.xinputrc
# 设置fcitx为默认输入法
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
EOL

# 提示重启
echo "配置完成，请重启系统以应用更改。"
