# DocAgent - 技能打包说明

**面向技能系统的打包说明文件**

> 注意：面向用户的项目介绍请查看 [PROJECT.md](./PROJECT.md)

---

## 📦 打包元数据

| 字段 | 值 |
|------|-----|
| **name** | DocAgent |
| **version** | 1.0.0 |
| **type** | openclaw-agent |
| **agent_id** | docagent |
| **emoji** | 📚 |
| **created_at** | 2026-03-04 |

---

## 📋 打包内容清单

| 类型 | 路径 | 说明 |
|------|------|------|
| agent_definition | agent/IDENTITY.md | Agent 身份定义 |
| agent_definition | agent/SOUL.md | Agent 灵魂与行为准则 |
| agent_definition | agent/TOOLS.md | 工具与凭证配置 |
| skill | skills/feishu-doc-manager/ | 飞书文档管理技能 |
| config_template | openclaw-config/agent-config.json | Agent 配置模板 |
| config_template | openclaw-config/binding-config.json | Binding 配置模板 |
| config_template | openclaw-config/feishu-account.json | 飞书账号配置模板 |
| install_script | INSTALL.sh | 安装脚本 |
| test_script | TEST.sh | 测试脚本 |
| uninstall_script | UNINSTALL.sh | 卸载脚本 |
| documentation | QUICKSTART.md | 快速开始指南 |
| documentation | CONFIG.md | 详细配置说明 |
| documentation | PERMISSIONS.md | 飞书权限要求 |
| documentation | SKILLS_USAGE.md | 技能使用说明 |
| documentation | CONFIG_CHECKLIST.md | 配置检查清单 |

---

## 🔧 安装入口

| 方式 | 命令 |
|------|------|
| 自动安装 | `./INSTALL.sh` |
| 手动安装 | 参考 QUICKSTART.md |

---

## ✅ 前置条件检查

技能系统安装前应检查：

- [ ] OpenClaw 已安装（~/.openclaw/ 目录存在）
- [ ] 用户已拥有飞书开放平台账号
- [ ] 用户已创建飞书机器人应用
- [ ] 用户已知晓需要手动配置 openclaw.json
- [ ] 用户已知晓需要手动开通飞书权限

---

## 📝 安装后配置提醒

安装完成后，必须提醒用户：

1. **手动配置 openclaw.json**
   - 添加 agent 配置
   - 添加 binding 配置
   - 添加飞书账号凭证

2. **开通飞书权限**
   - 消息发送权限（im:message:send 或类似）
   - 参考 PERMISSIONS.md

3. **重启 OpenClaw Gateway**
   ```bash
   openclaw gateway restart
   ```

4. **验证安装**
   - 运行 ./TEST.sh
   - 对照 CONFIG_CHECKLIST.md 检查

---

## 📖 文档优先级

技能系统展示文档时的优先级：

1. **PROJECT.md** - 项目介绍（给用户看）
2. **QUICKSTART.md** - 快速开始（5分钟上手）
3. **CONFIG_CHECKLIST.md** - 安装后检查
4. **PERMISSIONS.md** - 权限要求
5. **CONFIG.md** - 详细配置
6. **SKILLS_USAGE.md** - 技能使用
7. **INDEX.md** - 完整索引

---

## 🎯 技能依赖

| 依赖 | 说明 |
|------|------|
| openclaw | >= 2026.2.26 |
| feishu plugin | 已安装 |

---

## 🔐 敏感信息提示

此打包**不包含**：
- 真实的飞书 App ID / App Secret
- 真实的 API Key / Token
- 用户私人数据

用户需要手动填入这些信息。

---

创建日期：2026-03-04

