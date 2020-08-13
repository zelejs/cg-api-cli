# cg-api-cli
> cg-api 的本地测试cli工具。

### 运行需求

- node >= 10
- Jdk11

>  因为[lib](./lib)目录下的jar包在jdk11下编译。

### 安装

运行npm安装： `npm i -g`

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

