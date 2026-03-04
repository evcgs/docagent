# DocAgent 技能使用说明

DocAgent 可用的技能及使用方法。

---

## 一、技能列表

| 技能 | 说明 | 目录 |
|------|------|------|
| feishu-doc-manager | 飞书文档管理 | `skills/feishu-doc-manager/` |

---

## 二、feishu-doc-manager 技能

### 2.1 技能说明

飞书文档管理技能，提供以下能力：

- 文档读写操作
- 知识库导航和编辑
- 云存储文件管理
- 多维表格操作
- 聊天操作
- 应用权限管理

### 2.2 可用工具

| 工具 | 说明 |
|------|------|
| feishu_doc | 文档读写操作 |
| feishu_wiki | 知识库导航和编辑 |
| feishu_drive | 云存储文件管理 |
| feishu_bitable | 多维表格操作 |
| feishu_chat | 聊天操作 |
| feishu_app_scopes | 应用权限管理 |

### 2.3 使用场景示例

#### 场景 1：读取文档

用户问：
> "帮我读取一下这个文档的内容"

DocAgent 可以：
1. 使用 `feishu_doc` 工具读取文档
2. 整理内容并回复

---

#### 场景 2：编辑文档

用户问：
> "帮我更新一下这个文档"

DocAgent 可以：
1. 先读取现有内容
2. 根据用户需求修改
3. 使用 `feishu_doc` 工具写回文档

---

#### 场景 3：知识库导航

用户问：
> "帮我找找知识库中关于 XX 的内容"

DocAgent 可以：
1. 使用 `feishu_wiki` 工具导航知识库
2. 查找相关节点
3. 整理结果回复

---

## 三、技能部署

### 3.1 部署到主工作区

```bash
# 复制技能到主工作区
cp -r skills/feishu-doc-manager ~/.openclaw/workspace/skills/
```

### 3.2 为 DocAgent 创建符号链接

```bash
# 确保 DocAgent 的 skills 目录存在
mkdir -p ~/.openclaw/agents/DocAgent/workspace/skills

# 创建符号链接
ln -s ~/.openclaw/workspace/skills/feishu-doc-manager ~/.openclaw/agents/DocAgent/workspace/skills/
```

---

## 四、技能文件结构

```
skills/feishu-doc-manager/
├── SKILL.md              # 技能定义
├── README.md             # 技能说明
└── [技能相关文件...]
```

---

## 五、注意事项

⚠️ **使用技能前**：
1. 确认 DocAgent 有对应的飞书权限
2. 确认技能已正确部署
3. 确认符号链接（如使用）指向正确

⚠️ **安全提醒**：
- 不要泄露文档中的敏感信息
- 修改重要文档前先确认
- 尊重文档权限设置
