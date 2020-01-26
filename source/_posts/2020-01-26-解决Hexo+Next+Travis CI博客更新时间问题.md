---
title: 解决Hexo+Next+Travis CI博客更新时间问题
tags:
  - Travis CI
  - 博客更新时间
description: ' '
date: 2020-01-26 09:58:25
updated: 2020-01-26 23:24:25
categories: 博客搭建
---

# 解决Hexo+Next+Travis-CI博客更新时间问题

## 前言

在用Travis CI实现博客自动部署的时候经常会有这样的情况：明明无文章改动进行commit和push，但网站上所有博客显示的更新日期都为最近一次commit的时间。

## 环境说明

- Hexo+Next+Travis CI搭建博客

- GitHub项目Kepontry.github.io中有两个分支，博客及主题配置文件存在hexo分支，网站文件存在master分支。Travis CI检测hexo分支的变动，并将生成文件部署至master分支。

- 博客大白，摸索前进10日左右

## 原因分析

  开启显示更新时间后，如果在文章中的`front-matter`无updated项，则根据文章的修改时间来显示，但是我在commit的时候各博客文件的修改时间并不是今日。因为利用Travis CI生成网页文件是先运行一个虚拟机，安装环境依赖之后执行hexo generate命令，再将生成文件部署至master分支，所以我怀疑Travis CI生成的时候利用token克隆我的hexo分支，于是所有的博客文件的修改时间都变为了clone时间，更新时间就默认变为了修改时间即clone时间。

![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200126130131.jpg)

## 解决办法

1. 放弃使用Travis CI自动生成，修改配置文件中的deploy项，加入自己的远程仓，用`hexo g`和`hexo d`来生成网页文件并推送至远程仓。因为博客文件都在本地，修改日期自然不会变，所以也能解决这个问题。但就因此想让我放弃使用Travis CI，不可能的。

2. 修改主题配置文件，将post_meta下的updated_at设置为false，禁止显示更新时间选项。但显示文章更新时间不是挺好的吗，这表示博主在很认真的写博客，写完之后还会修改呢。
![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200126130840.jpg)

3. 在文章中的`front-matter`中添加`updated: 更新时间`项，记得不能只写日期，几时几分几秒也要写！

   ![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200126131254.jpg)

   但由于在网页显示的时候只显示日期，这样写还是有些多余。我们可以修改博客文件夹下scaffolds文件夹内的post.md模板文件，添加```updated: {{ date }}```项，这样就可以在执行```hexo new post 标题```命令创建新博客文件时自动将现在时间作为更新时间加入文件中。以后修改文件的话也只需修改updated项对应日期即可，反正后面的具体时间又不显示在博客中。
   
   ![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200126180839.jpg)

## 最后想说

看了一些以前的博客，好像很多都在教如何从手动添加updated项变为自动生成更新时间，但我现在教的好像正好反过来了，我很是疑惑，难道是我想错了？