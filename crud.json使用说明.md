## 表关系配置说明
>  cruds.json 

### 单表配置
```xml
[
    {
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
        "masterId": "master_id;other_id",   //从表关联主表id，顺序为slaves键从表的顺序
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

### 一对多带中间表配置
> 首先配置主表，主表从表的关系
> 然后添加从表的单表配置
```xml
[
    {
        "mask": "master",     //mask键值为master
        "master": "cg_master_resource",    //主表名称
        "masterId": "cg_master_resource_item::master_id:id;cg_master_resource_record::other_id:id",  //masterId 键值为"从表名称::从表关联主表id:主表id"，顺序为slaves键从表的顺序
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

