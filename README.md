# ubuntuFontOptimization
Optimization Font for ubuntu 18.04+/mint  19.

针对 ubuntu 18.04/ mint 19 这两个系统 字体优化补丁。 使用freetype2重新编译消除hint以及经过特殊处理的1809 雅黑字体。



## 注意事项

* 原来安装过雅黑字体的需要先删除字体
* 目前只针对ubuntu 18.04 / Linux mint 19做过测试。其他系统是否会引起界面奔溃暂不清楚。也不可能一一适配。主要是替换 
  * 64位系统 ： /usr/lib/x86_64-linux-gnu/ 下的 libfreetype.so.6.XX.X
  * 32位系统 :  /usr/lib/i386-linux-gnu/libfreetype.so.6.16.1_32bit



## 改进事项

* 使用 freeType2 2019-02-23 版本为基础做渲染调整
* 以 win1809系统雅黑字体做调整
* 调整/etc/fonts/font.conf 针对wine等程序做优化调整（不会发虚）



## 截图

### chrome 72

![chrome 72](https://raw.githubusercontent.com/zhangjianying/ubuntuFontOptimization/master/images/chrome.png)

### WPS 2016
![wps](https://raw.githubusercontent.com/zhangjianying/ubuntuFontOptimization/master/images/wps.png)

## gedit
![gedit](https://raw.githubusercontent.com/zhangjianying/ubuntuFontOptimization/master/images/gedit.png)

## wine nodepad++
![nodepad](https://raw.githubusercontent.com/zhangjianying/ubuntuFontOptimization/master/images/nodepad.png)



## 使用方式

 	使用sudo 执行 install.sh




## 备注

如侵，请联删

