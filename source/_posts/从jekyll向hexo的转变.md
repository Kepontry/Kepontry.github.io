
# 从jekyll向hexo的转变

### 放弃jekyll的原因

- 教程太古老，网上的教程大都是17、18年的
- liquid的版本从大多数教程所写的3.0更新到了4.0，有几个文件都需要更改（虽然已经改成功了，但还是担心后面会出现莫名其妙的问题，而且github pages用的jekyll版本和本地的有较大差距，不方便本地调试）。虽然后面尝试安装3.0版本，但由出现了乱码的情况，搞的心情有点糟糕

<img src="https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200115204054.jpg" style="zoom:50%;" />

- 在本地调试时会出现css无法加载的情况，不太懂前端的东西，所以也不想折腾

### 在windows下安装hexo的过程

**注意：**

- 网上的很多教程都是mac或者linux版本的，和windows的安装过程略有差异，windows须在git bash中运行
- 此篇博客写于2020年1月15日，请读者注意时效

**具体过程**

1. 安装node.js，去[官网](https://nodejs.org/en/)下载安装包（建议选择长期支持版而不是最新版），双击安装包安装，环境变量默认加入了，不用手动添加。在cmd中输入```npm -v```可以检验是否安装成功。我是6.13.4版本的。
2. 安装hexo（从此步开始，最好在git bash下进行，我用cmd出现了一些问题），输入```npm install -g hexo-cli```，全局安装hexo-cli，此步安装较慢，需要耐心等待（我安装过程中出现了一个warning，应该是不需要管的）。安装完成后，输入```hexo version```,如果显示版本信息，则安装成功。

<img src="https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200115220511.jpg" style="zoom:80%;" />

3. 生成博客，用```hexo init 文件夹名```的命令生成博客文件夹，时间会有些长，特别是后面install dependencies的时候，一定要等他正常退出，不要中断，否则会造成命令无法识别的情况。（前面的hexo版本在这步之前是没有的，我觉得在install dependencies这一步安装了4.2.0的hexo，而且是局部的，因为我在别的路径下看不到这个hexo版本）

<img src="https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200115220125.jpg" style="zoom: 80%;" />

在桌面路径下输入命令，可见未出现hexo的版本号，且未能识别hexo server命令

<img src="https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200115223121.jpg" style="zoom:80%;" />

4. 本地调试，运行```hexo server ```命令，在浏览器输入```localhost:4000```即可访问页面，不过是官方默认主题，有点丑，以后再换吧。

![](https://raw.githubusercontent.com/jpzhouchina/PicBed/master/img/20200115223524.jpg)

### 注意

- 网上的各大教程，有很多都是mac或者linux上的安装教程，在windows上安装略有不同，最好用git bash进行安装。（之前我用cmd和powershell都没装好）
- 一定要等install dependencies完成后再关闭，这个过程会有些漫长，如果没有它运行完，就会出现命令无法识别的情况，也就是局部环境没有装上去。我大致看了一下，后面构建环境的文件主要在node_modules文件夹中，这个文件夹有27M左右的大小，这应该就是慢的原因吧

### 感想与说明

- 发现安装复杂的环境完全无脑搬教程上的做法是无法做到的，每个人的环境差别大，教程可能是几年前的，现在完全不适用，写教程的人没讲清，各种依赖的版本更新……这些都可能使你安装失败。而最好的办法就是折腾，多想想原理，多看几篇教程，魔改一些东西，这样才能在实践中不断成长。
- 在写博客的过程中，由于打字速度慢、操作的熟练度不够和语言表达能力弱使得博客的质量可能不咋地，如果有不懂的地方欢迎留言。

### 参考

- [安装 Hexo](https://blog.csdn.net/m0_38064214/article/details/84502677)
- [创建并测试本地 Hexo 仓库](https://blog.csdn.net/m0_38064214/article/details/84504870)
- [个人网站更换 Hexo 主题](https://blog.csdn.net/m0_38064214/article/details/84557777)
- [hexo官方文档](https://hexo.io/zh-cn/docs/)
- 我的个人博客之旅：[从jekyll到hexo](https://wordzzzz.github.io/2018/01/10/HEXO/)

