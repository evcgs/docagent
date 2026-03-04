# DocAgent 配置说明

详细的配置说明文档。

---

## 一、OpenClaw 配置

### 1.1 Agent 配置

在 `openclaw.json` 的 `agents.list` 中添加：

```json
{
  "id": "docagent",
  "name": "DocAgent",
  "workspace": "/Users/evcgs/.openclaw/agents/DocAgent/workspace",
  "agentDir": "/Users/evcgs/.openclaw/agents/DocAgent",
  "identity": {
    "name": "DocAgent",
    "emoji": "📚"
  }
}
```

| 字段 | 说明 | 示例 |
|------|------|------|
| id | Agent ID（唯一标识） | docagent |
| name | Agent 名称 | DocAgent |
| workspace | Agent 工作区路径 | /Users/evcgs/.openclaw/agents/DocAgent/workspace |
| agentDir | Agent 状态目录 | /Users/evcgs/.openclaw/agents/DocAgent |
| identity.name | 显示名称 | DocAgent |
| identity.emoji | 图标 | 📚 |

---

### 1.2 Binding 配置

在 `openclaw.json` 的 `bindings` 数组中添加：

```json
{
  "agentId": "docagent",
  "match": {
    "channel": "feishu",
    "accountId": "docagent"
  }
}
```

| 字段 | 说明 |
|------|------|
| agentId | 绑定的 Agent ID |
| match.channel | 匹配的渠道（feishu） |
| match.accountId | 匹配的飞书账号 ID |

---

### 1.3 飞书账号配置

在 `openclaw.json` 的 `channels.feishu.accounts` 中添加：

```json
"docagent": {
  "appId": "cli_a92e72365878dcca",
  "appSecret": "YOUR_FEISHU_APP_SECRET_HERE",
  "name": "DocAgent"
}
```

| 字段 | 说明 | 获取方式 |
|------|------|---------|
| appId | 飞书应用 App ID | 飞书开放平台 → 凭证与基础信息 |
| appSecret | 飞书应用 App Secret | 飞书开放平台 → 凭证与基础信息 |
| name | 机器人名称 | 自定义 |

---

## 二、Agent 工作区文件

DocAgent 工作区应包含以下文件：

| 文件 | 说明 | 是否必需 |
|------|------|---------|
| IDENTITY.md | Agent 身份定义 | ✅ 必需 |
| SOUL.md | Agent 灵魂与行为准则 | ✅ 必需 |
| TOOLS.md | 工具与凭证配置 | ✅ 必需 |
| MEMORY.md | 长期记忆（可选） | ⭕ 推荐 |
| skills/ | 技能目录（符号链接） | ✅ 必需 |

---

## 三、目录结构示例

```
~/.openclaw/
├── openclaw.json                 # 主配置文件
├── agents/
│   └── DocAgent/
│       ├── workspace/
│       │   ├── IDENTITY.md
│       │   ├── SOUL.md
│       │   ├── TOOLS.md
│       │   ├── MEMORY.md (可选)
│       │   └── skills/
│       │       └── feishu-doc-manager -> ~/.openclaw/workspace/skills/feishu-doc-manager
│       └── sessions/             # 自动生成
└── workspace/
    └── skills/
        └── feishu-doc-manager/   # 技能源文件
```

---

## 四、验证配置

配置完成后，检查以下项目：

- [ ] openclaw.json 语法正确
- [ ] Agent 工作区目录存在
- [ ] Agent 定义文件已复制
- [ ] 技能已部署（符号链接正确）
- [ ] 飞书凭证已填入
- [ ] 飞书权限已开通

---

## 五、常见问题

### Q: 配置后 Agent 不响应？
A: 检查以下几点：
1. 飞书权限是否已开通（im:message:send）
2. binding 配置是否正确
3. OpenClaw Gateway 是否已重启

### Q: 符号链接不生效？
A: 确保符号链接指向正确的路径，并且源文件存在。
