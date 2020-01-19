# 安装jekyll实现本地调试博客

### 坎坷的安装过程

首先看的是最初教我搭博客的大佬的[教程](https://www.jianshu.com/p/e68fba58f75c)，可他直接给的代码中有gem命令，在cmd中尝试无果（~~啥命令都喜欢到cmd里面试的小白~~）后跳转到了大佬推荐的另一个[教程](https://www.jianshu.com/p/9535334ffd54)，该教程是针对windows平台的。

另外我也查看了其他的教程，发现大都是2017年左右的，而且要安装Ruby和Ruby Devkit两个东西，还要输入很多命令。进入[官网](https://rubyinstaller.org/downloads/)后，我发现现在的都已经集成了Devkit这个东西，也就不用之前那么麻烦了。

![](https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200113000921.jpg)

![](https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200113001631.jpg)

输入以下代码，等待了较长时间才装好,发现是4.0版本的，而网上的教程大都是3.0版本

```
gem install jekyll
gem install jekyll bundler
```

<img src="https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200113002008.jpg" style="zoom:80%;" />

直接输入```jekyll s```后却直接报错（此处运行平台变为powershell）

<img src="https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200113002016.jpg" style="zoom: 60%;" />

报错的意思是我在_config.yml配置文件中未包含```plugins: [jekyll-paginate]```这行代码，查询后发现paginate是一个分页工具，官方介绍[可点此处](http://jekyllcn.com/docs/pagination/)。解决方案就是把配置文件中的```gems: [jekyll-paginate]```换成```plugins: [jekyll-paginate]```，并且用```gem install ‘jekyll-paginate’```命令安装缺失的插件，此处参考自[csdn博客](https://blog.csdn.net/henryhu712/article/details/84800410)。

最后再运行```jekyll s```,在浏览器中输入``` http://127.0.0.1:4000/```,便可以在本地调试博客了。

### 注意

博客路径中不要出现中文名，否则会报编码方面的错误（我就被它坑了）

### 补充

应该是由于语言语法的更改，导致出现不能识别原来代码中的大括号的错误，具体可看[此篇教程](https://github.com/Huxpro/huxpro.github.io/issues/105)

### 最后

本人最近才开始写博客，初衷呢是对自己学习过程的一种记录，并不断提升自我，一些用语方面可能会难以理解，讲不清楚，可能很多地方还会有错误，请大神勿喷。

