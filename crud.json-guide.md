## 表关系配置说明
>  cruds.json 
> mask 为配置类型
> * master  -- 主表，包括一对多类型
> * group   -- 多层级分组
> * peer    -- 多对多 (已没有维护, 已合并到一对多)
> * entity  -- 仅对实体进行字段更新

### 单表配置
>  `mask`省缺为`master`（`features`对以下所有配置有效）
>
>  `cg_master_resource` 为单表名称
>  
```xml
[
    {
        "master": "cg_master_resource" 
        "features": ["tag","image","eav","category","attachment"]
    }
]
```

### 更新数据库字段
> 用于修改数据表字段后，可重新生成并重写文件
>
> 代码手工变更字段

```xml
[
    {
        "mask": "entity",  
        "master": "cg_master_resource"  
    }
]
```

### 一对多配置
> 首先配置主表，主表从表的关系
> 
> 从表关联主表id，顺序为slaves键从表的顺序 (如果关联主表不是id, 通过:号申明 :other_than_id)
>
> `cg_master_resource_item`，`cg_master_resource_record` 从表
> 
```xml
[
    {
        "mask": "master",
        "master": "cg_master_resource",
        "masterId": "master_id:id;other_id:id",
        "slaves": [
            "cg_master_resource_item", 
            "cg_master_resource_record"
        ]
    },
   {
        "master": "cg_master_resource_item"
    },
    {
        "master": "cg_master_resource_record"
    }
]
```

### 一对多带 通过多对多关联表配置
> `masterId`为以`;`分隔的各从表关联字段: "关系表名称::关联表关联主表id:关联表关联从表id"
> 
> `cg_master_resource_peer`可认为是从表，但绑定字段在关联表`cg_master_resource_relation`
> 
> `cg_master_resource_relation` 关联表, 现用于一对多
> 
```xml
[
    {
        "mask": "master", 
        "master": "cg_master_resource", 
        "masterId": "cg_master_resource_relation::master_id:master_peer_id",
        "slaves": 
        [
            "cg_master_resource_peer" 
        ]
    },
    {
         "master": "cg_master_resource_peer"
    }
    {
         "mask": "entity",
         "master": "cg_master_resource_relation"
     }
 ]
```

### TODO 进一步完善
> master 继续引入子表与分组 children, group
