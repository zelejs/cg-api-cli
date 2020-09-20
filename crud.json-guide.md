## 表关系配置说明
>  cruds.json 
> mask 为配置类型
> * master  -- 主表，包括一对多类型
> * group   -- 多层级分组
> * peer    -- 多对多 (已没有维护, 已合并到一对多)
> * entity  -- 仅对实体进行字段更新

### TODO
> master 继续引入子表与分组 children, group


### 单表配置
>  mask 省缺为 master
```xml
[
    {
        "master": "cg_master_resource"  //cg_master_resource为单表名称
    }
]
```

### 更新数据库字段
> 用于修改数据表字段后，可重新生成并重写文件
> 代码手工变更字段

```xml
[
    {
        "mask": "entity",  
        "master": "cg_master_resource"  //cg_master_resource为单表名称
    }
]
```

### 一对多配置
> 首先配置主表，主表从表的关系
> 然后添加从表的单表配置

```xml
[
    {
        "mask": "master",     //mask键值为master
        "master": "cg_master_resource",    //主表名称
        "masterId": "master_id;other_id:id", //从表关联主表id，顺序为slaves键从表的顺序 (如果关联主表不是id, 通过:号申明 :other_than_id)
        "slaves": [
            "cg_master_resource_item",     //从表名称
            "cg_master_resource_record"    //从表名称
        ]
    },
   {
        "master": "cg_master_resource_item"   //从表单表配置
    },
    {
        "master": "cg_master_resource_record"  //从表单表配置
    }
]
```

### 一对多带 通过多对多关联表配置

```xml
[
    {
        "mask": "master",     //mask键值为master
        "master": "cg_master_resource",  //主表名称
        "masterId": "cg_master_resource_relation::master_id:master_peer_id",  //masterId 为以;分隔的各从表关联字段:  "关系表名称::关联表关联主表id:关联表关联从表id"
        "slaves": [
            "cg_master_resource_peer"  //从表名称
        ]
    },
    {
         "master": "cg_master_resource_peer"   // 可认为是从表，但绑定字段在关联表 cg_master_resource_relation
    }
    {
         "mask": "entity",  // 仅生成基础实体 Model与Mapper, 且默认重写文件
         "master": "cg_master_resource_relation"   // 关联表, 现用于一对多
     }
 ]
```
