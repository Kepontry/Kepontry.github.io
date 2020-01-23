---
title: hexo自动生成阅读全文
tags:
  - 进阶
  - 教程
  - hexo
description: ' '
date: 2020-01-23 21:09:36
categories: 博客搭建
---

# hexo进阶之路之自动生成阅读全文按钮

hexo默认每篇文章都将全文显示在首页的设定对于有单篇长文章或者多篇文章的博主来说不太友好，好在hexo提供了显示阅读全文按钮的设定。网上的关于生成阅读全文按钮的方法有三个，一个是在文章中添加```< !--more-->```标签进行手动截断，一个是在文章中的`front-matter`中添加description，一个是修改主题配置文件，自动截取固定长度文字作为摘要。具体可以看这篇文章：[Hexo-设置阅读全文](https://www.jianshu.com/p/78c218f9d1e7)。

当使用```< !--more-->```标签时，只有当标签前面有正文时该标签才起作用，如果该标签前面只有空格或空行，即无摘要文字，next主题仍然会显示全文。

<img src="https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200122210039.jpg" style="zoom:80%;" />

<img src="https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200122211050.jpg"  />

若将```< !--more-->```标签放在文章中部，则会显示标签前的部分，个人感觉显示部分文章仍然占用较大篇幅，还是更喜欢无摘要文字且显示阅读全文按钮的风格。

![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200123204531.jpg)

![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200123204522.jpg)

然而目前修改主题配置文件的方法已经失效了，hexo最新版的配置文件中找不到相应项，那就只能通过在文章的`front-matter`中添加description来实现了，只需添加```description:" "```即可。

![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200123205251.jpg)

这是添加```description:" "```后的效果，个人感觉比带摘要的好看一些。

![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200122150838.jpg)

在博客文件夹下的scaffolds文件夹中的post.md中添加一行```description:" "```，即可在输入```hexo new post 博客标题```命令新建.md文件时自动加上```description:' '```，在页面上显示阅读全文按钮且不带摘要。

![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200123205811.jpg)

![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200123210428.jpg)