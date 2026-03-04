# DocAgent - 飞书文档管理智能助手

DocAgent 是一个专注于文档管理的飞书智能助手，基于 OpenClaw 构建。

---

## 📅 项目信息

| 项目 | 内容 |
|------|------|
| **名称** | DocAgent |
| **角色** | 飞书文档管理智能助手 |
| **Emoji** | 📚 |
| **创建日期** | 2026-03-04 |
| **基于** | OpenClaw |

---

## 🎯 核心能力

DocAgent 专注于以下领域：

### 1. 文档管理
- 读取和编辑飞书文档
- 创建新文档
- 管理文档内容

### 2. 知识库操作
- 导航飞书知识库（Wiki）
- 编辑和管理知识库节点
- 查找和整理知识内容

### 3. 云存储管理
- 管理飞书云端存储的文件
- 文件和文件夹操作
- 组织云存储内容

### 4. 多维表格操作
- 读取和编辑飞书多维表格（Bitable）
- 数据管理和分析
- 表格结构操作

---

## 🚀 快速开始

### 前提条件

- 已安装 OpenClaw
- 已有飞书开放平台账号
- 已创建飞书机器人应用

### 一键安装

```bash
cd docagent-full
chmod +x INSTALL.sh
./INSTALL.sh
```

### 手动安装

详见 [QUICKSTART.md](./QUICKSTART.md)

---

## 📖 文档导航

### 面向用户

| 文档 | 用途 |
|------|------|
| [QUICKSTART.md](./QUICKSTART.md) | 5分钟快速上手 |
| [CONFIG_CHECKLIST.md](./CONFIG_CHECKLIST.md) | 安装后检查清单 |
| [PERMISSIONS.md](./PERMISSIONS.md) | 飞书权限要求 |

### 面向开发者/运维

| 文档 | 用途 |
|------|------|
| [CONFIG.md](./CONFIG.md) | 详细配置说明 |
| [SKILLS_USAGE.md](./SKILLS_USAGE.md) | 技能使用说明 |
| [INDEX.md](./INDEX.md) | 完整内容索引 |

### 脚本

| 脚本 | 用途 |
|------|------|
| [INSTALL.sh](./INSTALL.sh) | 一键安装 |
| [TEST.sh](./TEST.sh) | 安装后测试 |
| [UNINSTALL.sh](./UNINSTALL.sh) | 卸载 |

---

## 📦 打包内容

```
docagent-full/
├── PROJECT.md                   # 本文件 - 项目介绍（面向用户）
├── README.md                    # 打包说明（面向技能）
├── INDEX.md                     # 内容索引
├── QUICKSTART.md               # 快速开始
├── CONFIG.md                   # 配置说明
├── PERMISSIONS.md              # 权限要求
├── SKILLS_USAGE.md             # 技能使用
├── CONFIG_CHECKLIST.md         # 配置检查清单
├── INSTALL.sh                  # 安装脚本
├── TEST.sh                     # 测试脚本
├── UNINSTALL.sh                # 卸载脚本
├── agent/                      # Agent 定义
├── skills/                     # 技能文件
├── openclaw-config/            # 配置片段
└── docker/                     # Docker 支持（示例）
```

---

## 🤝 相关项目

- [OpenClaw](https://github.com/openclaw/openclaw) - AI Agent 平台
- [CalendarAgent](https://github.com/evcgs/calendaragent) - 日程管理智能助手

---

## 📝 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-03-04 | 初始版本 |

---

## 📄 许可证

（待补充）

---

## 👤 联系方式

- 项目地址：https://github.com/evcgs/docagent
- 问题反馈：GitHub Issues

---

创建日期：2026-03-04
最后更新：2026-03-04
