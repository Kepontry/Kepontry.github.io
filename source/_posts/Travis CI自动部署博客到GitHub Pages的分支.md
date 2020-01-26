---
title: 用Travis CI实现自动部署GitHub Pages博客
date: 2020-01-19 21:10:33
updated: 2020-01-23 21:10:33
tags: 
 - Travis CI 
 - 教程
description: " "
categories: 博客搭建
---
# 用Travis CI实现自动部署GitHub Pages博客

## 不用Travis CI实现的一般方式

### 初级版本

仅将博客目录下的public文件夹与username.github.io远程仓关联，向source文件夹中添加博客文件后在博客目录下输入```hexo generate```，生成网站文件。再到public文件夹中运行git bash，输入```git push```，将生成的网络文件push到云端。这样便可以通过username.github.io访问网站了。

缺点：

- 如果电脑上的记录丢失，则无法通过GitHub仓库获取博客的markdown文件。

### 改进版本

在博客文件夹下打开Git Bash（cmd应该也可以），输入```npm install hexo-deployer-git --save```，为Hexo安装Git插件。再修改_config.yml文件中的deploy项为如下，即将生成的文件部署到远程git仓库的master分支。

```yaml
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: git@github.com:flyoob/flyoob.github.io.git
  branch: master
```

再依次输入```hexo generate```和```hexo deploy```，生成静态文件并完成向远程git仓的部署。

缺点同上。

## 利用Travis CI实现自动部署

### 几个需要说明的地方

- GitHub Pages提供给用户展示静态网页有两种形式，一种是项目页面，一种是个人展示页面。

  ![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200121212758.jpg)

  项目页面可以使用任一分支存放网站文件，并通过https://username.github.io/projectname访问

  ![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200121212922.jpg)

  而个人页面只能将网站文件存在master分支中，可以通过https://username.github.io进行访问

  ![](https://raw.githubusercontent.com/Kepontry/PicBed/master/img/20200121212914.jpg)

- 关于Travis CI的介绍，可以看这篇文章：[持续集成服务 Travis CI 教程](http://ruanyifeng.com/blog/2017/12/travis_ci_tutorial.html)

### 利用项目页面建站

  master分支存放博客文件，gh-pages分支存放网站文件，Travis CI监视master分支的变动，并将生成的文件push到gh-pages分支

### 利用个人页面建站

  hexo分支存放博客文件，master分支存放网站文件，Travis CI监视hexo分支的变动，并将生成的文件push到master分支

### .travis.yml的配置

仅需注意注释的两个地方的分支名就行，利用个人页面和项目页面监视和部署的分支是不一样的。以下是利用个人页面将网站文件部署到master分支上的配置文件示例

```yaml
sudo: false
language: node_js
node_js:
  - 10 
cache: npm
branches:
  only:
    - hexo # 当hexo分支有新的commit时执行 
script:
  - hexo generate 
deploy:
  provider: pages
  skip-cleanup: true
  local-dir: public
  target-branch: master # 注意这里是部署到master, 默认是到gh-pages
  github-token: $GH_TOKEN
  keep-history: true
  on:
    branch: hexo
```

### 调换hexo与master分支

如果还是按照以前的教程，利用个人页面建站时，将博客文件放在master分支下，网站文件放在hexo分支下，则无法显示页面。可以按照以下办法解决：

1. 删除远程hexo分支（反正是自动生成的文件，删去也不要紧）

2. 本地新建一个文件夹，并输入```git init```和```git remote add origin git@github.com:XX/XXX.git```，将本地库与远程库的master分支建立联系

3. ```git fetch origin master```，将远程库的master分支下文件拷贝至本地，但此时还未与远程分支建立映射

4. ```git checkout -b hexo origin/master```,在本地创建分支hexo并切换到该分支

5. ```git push origin hexo```,将本地的hexo分支推送至远程

6. 更改.travis.yml，重新生成master分支（存放网站文件）



参考资料

[Hexo 博客部署到 GitHub](https://www.cnblogs.com/imapla/p/5533000.html)

[git 拉取远程分支到本地](https://blog.csdn.net/carfge/article/details/79691360)



