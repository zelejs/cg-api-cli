# cg-api-cli
> cg-api 的本地测试cli工具。

### 运行需求

- node >= 10
- Jdk11

>  因为[lib](./lib)目录下的jar包在jdk11下编译。

### 安装

下载最新版本 [https://github.com/zelejs/cg-api-cli/releases/download/latest/cg-cli-1.0.0.jar](https://github.com/zelejs/cg-api-cli/releases/download/latest/cg-cli-1.0.0.jar) , 放置到 lib 目录下, 然后执行以下命令行安装

```shell
$ npm i -g
```

### 使用方法

```
Usage: cg-api-cli <module> <sql> <cruds>

Example:
  cg-api-cil test test.sql test.json

Paramters:
  module	代码模块名
  sql		sql文件路径
  cruds		cruds文件路径
```

> 执行命令后会新建一个项目名和**module**同名的maven项目，后续可用maven命令进行编译和测试。

