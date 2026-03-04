# 工具使用参考

## feishu_doc - 文档操作

### 基本操作

#### read - 读取文档
```python
feishu_doc(action="read", doc_token="xxx")
```
**参数：**
- `doc_token`: 文档 token（从 URL 中提取，如 /docx/xxx 中的 xxx）
- `offset`: 起始行号（可选）
- `limit`: 最大行数（可选）

**示例：**
```markdown
用户：帮我读取这个文档 https://example.feishu.cn/docx/doxcnABC123
操作：提取 doc_token = "doxcnABC123"，调用 feishu_doc(action="read", doc_token="doxcnABC123")
```

#### write - 写入文档（替换整个内容）
```python
feishu_doc(action="write", doc_token="xxx", content="# 标题\n\n内容")
```
**参数：**
- `doc_token`: 文档 token
- `content`: Markdown 格式内容

**注意：** 这会替换文档的全部内容，请谨慎使用。

#### append - 追加内容
```python
feishu_doc(action="append", doc_token="xxx", content="追加的内容")
```
**参数：**
- `doc_token`: 文档 token
- `content`: 要追加的内容
- `after_block_id`: 在指定块后追加（可选）

#### insert - 插入内容
```python
feishu_doc(action="insert", doc_token="xxx", content="插入的内容", after_block_id="yyy")
```
**参数：**
- `doc_token`: 文档 token
- `content`: 要插入的内容
- `after_block_id`: 在指定块后插入

#### create - 创建文档
```python
feishu_doc(action="create", title="文档标题", content="文档内容")
```
**参数：**
- `title`: 文档标题
- `content`: 文档内容（Markdown 格式，可选）
- `folder_token`: 文件夹 token（可选）
- `grant_to_requester`: 是否授权给请求者（默认 true）

**返回：** 包含 doc_token 和文档链接的信息

### 块操作

#### list_blocks - 列出文档块
```python
feishu_doc(action="list_blocks", doc_token="xxx")
```

#### get_block - 获取单个块
```python
feishu_doc(action="get_block", doc_token="xxx", block_id="yyy")
```

#### update_block - 更新块
```python
feishu_doc(action="update_block", doc_token="xxx", block_id="yyy", content="新内容")
```

#### delete_block - 删除块
```python
feishu_doc(action="delete_block", doc_token="xxx", block_id="yyy")
```

## feishu_wiki - 知识库操作

### 空间操作

#### spaces - 列出知识库空间
```python
feishu_wiki(action="spaces")
```

### 节点操作

#### nodes - 列出空间下的节点
```python
feishu_wiki(action="nodes", space_id="xxx")
```

#### get - 获取节点信息
```python
feishu_wiki(action="get", token="xxx")
```

#### create - 创建节点
```python
feishu_wiki(action="create", space_id="xxx", title="节点标题", obj_type="docx", parent_node_token="yyy")
```
**参数：**
- `space_id`: 空间 ID
- `title`: 节点标题
- `obj_type`: 对象类型（docx/sheet/bitable，默认 docx）
- `parent_node_token`: 父节点 token（可选，根节点则不填）

#### move - 移动节点
```python
feishu_wiki(action="move", node_token="xxx", target_parent_token="yyy")
```

#### rename - 重命名节点
```python
feishu_wiki(action="rename", node_token="xxx", title="新标题")
```

## feishu_drive - 云存储操作

### 文件操作

#### list - 列出文件
```python
feishu_drive(action="list", folder_token="xxx")
```

#### info - 获取文件信息
```python
feishu_drive(action="info", file_token="xxx")
```

#### create_folder - 创建文件夹
```python
feishu_drive(action="create_folder", name="文件夹名", folder_token="xxx")
```

#### move - 移动文件
```python
feishu_drive(action="move", file_token="xxx", folder_token="yyy")
```

#### delete - 删除文件
```python
feishu_drive(action="delete", file_token="xxx")
```

## feishu_bitable - 多维表格操作

### 应用操作

#### feishu_bitable_create_app - 创建应用
```python
feishu_bitable_create_app(name="应用名称", folder_token="xxx")
```

### 表操作

首先需要获取应用信息：
```python
feishu_bitable_get_meta(url="https://example.feishu.cn/base/xxx")
```

#### feishu_bitable_list_fields - 列出字段
```python
feishu_bitable_list_fields(app_token="xxx", table_id="yyy")
```

#### feishu_bitable_create_field - 创建字段
```python
feishu_bitable_create_field(
    app_token="xxx",
    table_id="yyy",
    field_name="字段名",
    field_type=1,  # 1=文本, 2=数字, 3=单选, 4=多选, 5=日期, 7=复选框...
    property={}   # 字段属性（可选）
)
```

**字段类型：**
- 1: 文本
- 2: 数字
- 3: 单选
- 4: 多选
- 5: 日期时间
- 7: 复选框
- 11: 用户
- 13: 电话
- 15: URL
- 17: 附件
- 18: 单向关联
- 19: 查找
- 20: 公式
- 21: 双向关联
- 22: 地理位置
- 23: 群聊
- 1001: 创建时间
- 1002: 修改时间
- 1003: 创建人
- 1004: 修改人
- 1005: 自动编号

### 记录操作

#### feishu_bitable_list_records - 列出记录
```python
feishu_bitable_list_records(app_token="xxx", table_id="yyy", page_size=100, page_token="zzz")
```

#### feishu_bitable_get_record - 获取单条记录
```python
feishu_bitable_get_record(app_token="xxx", table_id="yyy", record_id="zzz")
```

#### feishu_bitable_create_record - 创建记录
```python
feishu_bitable_create_record(
    app_token="xxx",
    table_id="yyy",
    fields={
        "文本字段": "值",
        "数字字段": 123,
        "单选字段": "选项",
        "多选字段": ["选项1", "选项2"],
        "日期时间字段": 1234567890000,  # 毫秒时间戳
        "用户字段": [{"id": "ou_xxx"}],
        "URL字段": {"text": "显示文本", "link": "https://example.com"}
    }
)
```

#### feishu_bitable_update_record - 更新记录
```python
feishu_bitable_update_record(
    app_token="xxx",
    table_id="yyy",
    record_id="zzz",
    fields={"字段名": "新值"}
)
```

## feishu_chat - 聊天操作

#### members - 列出群成员
```python
feishu_chat(action="members", chat_id="xxx")
```

#### info - 获取群信息
```python
feishu_chat(action="info", chat_id="xxx")
```

## feishu_app_scopes - 权限检查

```python
feishu_app_scopes()
```
返回当前应用的所有权限列表。

## URL Token 提取方法

### 文档 URL
```
https://example.feishu.cn/docx/doxcnABC123XYZ
doc_token = "doxcnABC123XYZ"
```

### 知识库 URL
```
https://example.feishu.cn/wiki/wikiABC123XYZ
token = "wikiABC123XYZ"
```

### 多维表格 URL
```
https://example.feishu.cn/base/bascnABC123XYZ?table=tblABC123
先调用 feishu_bitable_get_meta(url) 获取 app_token 和 table_id
```

## 常见问题

### Q: 提示没有权限怎么办？
A: 先运行 `feishu_app_scopes()` 检查权限，然后联系管理员开通相应权限。

### Q: 知识库操作失败？
A: 需要在知识库空间设置中添加机器人为成员。

### Q: 如何从 URL 中提取 token？
A: 参考上面的 "URL Token 提取方法" 部分。

### Q: 创建文档后如何获取链接？
A: `feishu_doc(action="create")` 会返回文档链接。
