# DocAgent Docker 支持

⚠️ **注意**：这是一个 Docker 支持示例，需要根据实际的 OpenClaw Docker 部署方式调整。

---

## 📋 目录内容

| 文件 | 说明 |
|------|------|
| Dockerfile | Dockerfile 示例 |
| README.md | 本文件 - Docker 说明 |
| docker-compose.yml | Docker Compose 示例（可选） |

---

## 🚀 使用方式

### 方式一：作为 OpenClaw 的一部分部署

DocAgent 通常作为 OpenClaw 的一部分运行，不需要单独的 Docker 镜像。

部署步骤：
1. 按照 QUICKSTART.md 在 OpenClaw 中安装 DocAgent
2. 确保 OpenClaw Gateway 正在运行
3. DocAgent 就可以使用了

### 方式二：独立 Docker 部署（高级）

如果需要独立部署，可以：
1. 修改 Dockerfile，适配你的 OpenClaw 部署方式
2. 构建镜像：`docker build -t docagent .`
3. 运行容器：`docker run -d docagent`

---

## 📝 注意事项

- DocAgent 依赖 OpenClaw 运行时
- 需要配置飞书凭证和权限
- 需要开通飞书消息发送权限

---

## 🔗 相关文档

- [QUICKSTART.md](../QUICKSTART.md) - 快速开始
- [CONFIG.md](../CONFIG.md) - 配置说明
- [PERMISSIONS.md](../PERMISSIONS.md) - 权限要求
