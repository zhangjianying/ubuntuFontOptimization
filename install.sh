#进入config_all_in_one文件夹
cd ./config_all_in_one
#禁用所有wqy字体（也就是打包）
if [ -d "/usr/share/fonts/truetype/wqy" ]
then
   sudo tar -zcvf /usr/share/fonts/truetype/wqy.tar.gz /usr/share/fonts/truetype/wqy
   sudo rm -rf /usr/share/fonts/truetype/wqy
fi
#创建windows字体文件夹
if [ ! -d "/usr/share/fonts/truetype/windows" ]
then
   sudo mkdir /usr/share/fonts/truetype/windows
fi
#安装mysh.ttc和simsun.ttc字体到windows字体文件夹中
sudo cp msyh.ttf /usr/share/fonts/truetype/windows/
sudo cp SIMSUN.ttf /usr/share/fonts/truetype/windows/
sudo cp SIMSUN-bold.ttf /usr/share/fonts/truetype/windows/
#拷贝infinality-settings.sh到/etc/profile.d
sudo cp infinality-settings.sh /etc/profile.d/
#备份原始的/etc/fonts为/etc/fonts_backup_before_infinality
if [ ! -d "/etc/fonts_backup_before_infinality" ]
then
   sudo mv /etc/fonts /etc/fonts_backup_before_infinality
else
   sudo rm -rf /etc/fonts
fi
#移动fonts_infinality文件夹为/etc/fonts
sudo cp -r fonts_infinality /etc/fonts
#在系统lib文件夹建立libfreetype_infinality文件夹，把libfreetype.so.6.16.1移动进去，然后cd到系统lib文件夹
if [ $(getconf LONG_BIT|grep 64) -eq 64 ]
then
   if [ ! -d "/usr/lib/x86_64-linux-gnu/libfreetype_infinality" ]
   then
      sudo mkdir /usr/lib/x86_64-linux-gnu/libfreetype_infinality
      sudo cp libfreetype.so.6.16.1  /usr/lib/x86_64-linux-gnu/libfreetype_infinality
   else
      sudo rm /usr/lib/x86_64-linux-gnu/libfreetype_infinality/*
      sudo cp libfreetype.so.6.16.1  /usr/lib/x86_64-linux-gnu/libfreetype_infinality/libfreetype.so.6.16.1
   fi
   cd  /usr/lib/x86_64-linux-gnu
else
   if [ ! -d "/usr/lib/i386-linux-gnu/libfreetype_infinality" ]
   then
      sudo mkdir /usr/lib/i386-linux-gnu/libfreetype_infinality
      sudo cp libfreetype.so.6.16.1_32bit  /usr/lib/i386-linux-gnu/libfreetype_infinality/libfreetype.so.6.16.1
   else
      sudo rm /usr/lib/i386-linux-gnu/libfreetype_infinality/*
      sudo cp libfreetype.so.6.16.1_32bit  /usr/lib/i386-linux-gnu/libfreetype_infinality/libfreetype.so.6.16.1
   fi
   cd  /usr/lib/i386-linux-gnu
fi
#备份原始的libfreetype.so.6.1*到libfreetype_backup_before_infinality
if [ ! -d "./libfreetype_backup_before_infinality" ]
then
   sudo mkdir libfreetype_backup_before_infinality
   sudo  find ./ -maxdepth 1 -name libfreetype.so.6.1* -exec mv {} ./libfreetype_backup_before_infinality/ \;
fi
#将libfreetype_infinality中的libfreetype.so.6.16.1拷贝到上一级文件夹
sudo cp ./libfreetype_infinality/libfreetype.so.6.16.1 ./
#然后给libfreetype.so.6建立链接
sudo ln -sf libfreetype.so.6.16.1 libfreetype.so.6
sudo ln -sf libfreetype.so.6.16.1 libfreetype.so
#2014.09有用户反映系统无法进入的严重故障，经过qq远程协助，得知是libfreetype.so.6有读取权限的问题，
#所以对freetype.so文件及所有字体配置文件都更改权限，防止类似严重bug发生。
sudo chmod 755 libfreetype.so.6.16.1
sudo chmod 755 libfreetype.so.6
sudo chmod -R 755 /etc/fonts
#貌似拷贝msyh和simsun字体后用户没有权限读取，更改之
sudo chmod -R 755 /usr/share/fonts/truetype/windows
#作为您对本程序的“感谢”，请访问www.lulinux.com并收藏它，谢谢！
if [ -f "/usr/bin/zenity" ]
then
   zenity --info --text="恭喜！安装完成！" --no-markup
else
   echo ""
   echo "恭喜！安装完成！"
fi

