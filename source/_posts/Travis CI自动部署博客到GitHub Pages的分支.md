# 用Travis CI实现自动部署GitHub Pages博客

## 不用Travis CI实现的一般方式

### 初级版本

仅将博客目录下的public文件夹与username.github.io远程仓关联，向source文件夹中添加博客文件后在博客目录下输入```hexo generate```，生成网站文件。再到public文件夹中运行git bash，输入```git push```，将生成的网络文件push到云端。这样便可以通过username.github.io访问网站了。

缺点：

- 如果电脑上的记录丢失，则无法通过GitHub仓库获取博客的markdown文件。

### 改进版本

在博客文件夹下打开Git Bash（cmd应该也可以），输入```npm install hexo-deployer-git --save```，为Hexo安装Git插件。再修改_config.yml文件中的deploy项为如下，即将生成的文件部署到远程git仓库的master分支。

```
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

- GitHub Pages提供给

参考资料

[Hexo 博客部署到 GitHub](https://www.cnblogs.com/imapla/p/5533000.html)

