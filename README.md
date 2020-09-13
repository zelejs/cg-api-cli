# cg-api-cli
> cg-api 的本地测试cli工具。

### 运行需求

- node >= 10
- Jdk11

>  因为[lib](./lib)目录下的jar包在jdk11下编译。

### 安装

运行npm安装： `npm i -g`

下载 https://github.com/zelejs/cg-api-cli/releases/download/latest/cg-cli-1.0.0.jar，然后放置到 lib 目录下

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

