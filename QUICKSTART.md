# DocAgent 快速开始指南

5分钟快速上手 DocAgent！

---

## 前提条件

- 已安装 OpenClaw
- 已有飞书开放平台账号
- 已创建飞书机器人应用

---

## 步骤 1：创建目录结构

```bash
# 在 OpenClaw agents 目录下创建 DocAgent
mkdir -p ~/.openclaw/agents/DocAgent/workspace
```

---

## 步骤 2：复制 Agent 定义文件

```bash
# 从本打包文件复制
cp agent/* ~/.openclaw/agents/DocAgent/workspace/
```

---

## 步骤 3：部署技能

```bash
# 复制技能到主工作区
mkdir -p ~/.openclaw/workspace/skills
cp -r skills/feishu-doc-manager ~/.openclaw/workspace/skills/

# 为 DocAgent 创建符号链接
mkdir -p ~/.openclaw/agents/DocAgent/workspace/skills
ln -s ~/.openclaw/workspace/skills/feishu-doc-manager ~/.openclaw/agents/DocAgent/workspace/skills/
```

---

## 步骤 4：配置 OpenClaw

编辑 `~/.openclaw/openclaw.json`：

### 4.1 添加 agent 配置

在 `agents.list` 数组中添加：

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

### 4.2 添加 binding 配置

在 `bindings` 数组中添加：

```json
{
  "agentId": "docagent",
  "match": {
    "channel": "feishu",
    "accountId": "docagent"
  }
}
```

### 4.3 添加飞书账号配置

在 `channels.feishu.accounts` 中添加：

```json
"docagent": {
  "appId": "YOUR_FEISHU_APP_ID_HERE",
  "appSecret": "YOUR_FEISHU_APP_SECRET_HERE",
  "name": "DocAgent"
}
```

---

## 步骤 5：开通飞书权限

在飞书开放平台为 DocAgent 开通以下权限：

- `im:message:send` 或 `im:message:send_as_bot`（消息发送）
- `docs:document`（文档读写，如需要）
- `wiki:wiki`（知识库读写，如需要）
- `drive:drive`（云存储，如需要）

权限申请链接模板：
```
https://open.feishu.cn/app/YOUR_APP_ID/auth?q=im:message:send,im:message,im:message:send_as_bot&op_from=openapi&token_type=tenant
```

---

## 步骤 6：重启 OpenClaw Gateway

```bash
openclaw gateway restart
```

---

## 步骤 7：验证

1. 在飞书中找到 DocAgent
2. 发送消息："你是谁？"
3. 应该收到回复："我是 DocAgent，文档管理专家..."

---

## 🎉 完成！

DocAgent 现在应该可以正常工作了！

详见：
- [CONFIG.md](./CONFIG.md) - 详细配置说明
- [PERMISSIONS.md](./PERMISSIONS.md) - 权限要求
- [SKILLS_USAGE.md](./SKILLS_USAGE.md) - 技能使用说明
