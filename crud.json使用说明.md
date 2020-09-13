# cruds.json

## 1. 单表配置

### JSON

```json
[
    {
        "master": "t_test"  //t_test为单表名称
    }
]
```

## 2. 一对多配置
### JSON
> 首先配置主表，主表从表的关系
> 然后添加从表的单表配置
```json
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

## 3. 一对多带中间表配置
### JSON
> 首先配置主表，主表从表的关系
> 然后添加从表的单表配置
```json
[
    {
        "mask": "master",     //mask键值为master
        "master": "cg_master_resource",    //主表名称
        "masterId": "cg_master_resource_item::master_id:id;cg_master_resource_record::other_id:id",   //masterId键值为"从表名称::从表关联主表id:主表id"，顺序为slaves键从表的顺序
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

