# DocAgent 配置检查清单

安装完成后，使用此清单确保配置正确。

---

## 一、目录结构检查

- [ ] Agent 工作区目录存在
  ```
  ~/.openclaw/agents/DocAgent/workspace/
  ```
- [ ] Agent 定义文件存在
  - [ ] IDENTITY.md
  - [ ] SOUL.md
  - [ ] TOOLS.md
- [ ] 技能目录存在
  ```
  ~/.openclaw/workspace/skills/feishu-doc-manager/
  ```
- [ ] 技能符号链接正确
  ```
  ~/.openclaw/agents/DocAgent/workspace/skills/feishu-doc-manager
  -> ~/.openclaw/workspace/skills/feishu-doc-manager
  ```

---

## 二、OpenClaw 配置检查

### 2.1 Agent 配置

- [ ] `openclaw.json` 中有 `agents.list` 配置
- [ ] Agent 配置包含以下字段：
  - [ ] `id` = "docagent"
  - [ ] `name` = "DocAgent"
  - [ ] `workspace` 路径正确
  - [ ] `agentDir` 路径正确
  - [ ] `identity.name` = "DocAgent"
  - [ ] `identity.emoji` = "📚"

### 2.2 Binding 配置

- [ ] `openclaw.json` 中有 `bindings` 配置
- [ ] Binding 配置包含以下字段：
  - [ ] `agentId` = "docagent"
  - [ ] `match.channel` = "feishu"
  - [ ] `match.accountId` = "docagent"

### 2.3 飞书账号配置

- [ ] `openclaw.json` 中有 `channels.feishu.accounts.docagent` 配置
- [ ] 飞书账号配置包含以下字段：
  - [ ] `appId` 已填入（非占位符）
  - [ ] `appSecret` 已填入（非占位符）
  - [ ] `name` = "DocAgent"

---

## 三、飞书权限检查

- [ ] 消息发送权限已开通（三选一）
  - [ ] `im:message:send`
  - [ ] `im:message`
  - [ ] `im:message:send_as_bot`
- [ ] 权限已生效（有时需要等待几分钟）
- [ ] 权限申请链接格式正确（参考 PERMISSIONS.md）

---

## 四、Gateway 状态检查

- [ ] OpenClaw Gateway 正在运行
- [ ] Gateway 已重启（配置变更后）
- [ ] Gateway 日志中无错误

检查命令：
```bash
openclaw gateway status
```

---

## 五、功能验证检查

- [ ] 在飞书中能找到 DocAgent
- [ ] 给 DocAgent 发送消息能收到回复
- [ ] 回复内容正确（"我是 DocAgent，文档管理专家..."）

---

## 六、快速验证命令

```bash
# 检查目录
ls -la ~/.openclaw/agents/DocAgent/workspace/

# 检查技能
ls -la ~/.openclaw/workspace/skills/

# 检查符号链接
ls -la ~/.openclaw/agents/DocAgent/workspace/skills/

# 检查 Gateway 状态
openclaw gateway status

# 查看 Gateway 日志（可选）
tail -50 ~/.openclaw/logs/gateway.log
```

---

## 七、常见问题排查

### 问题 1：Agent 不响应
检查清单：
- [ ] 飞书权限是否开通？
- [ ] binding 配置是否正确？
- [ ] Gateway 是否已重启？
- [ ] Gateway 日志是否有错误？

### 问题 2：技能不生效
检查清单：
- [ ] 技能文件是否存在？
- [ ] 符号链接是否正确？
- [ ] 符号链接源文件是否存在？

---

## 八、全部完成标记

- [ ] 所有检查项已通过
- [ ] DocAgent 能正常收发消息
- [ ] 技能能正常使用

**检查完成日期**: ____________
**检查人**: ____________
