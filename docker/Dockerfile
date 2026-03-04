# DocAgent Docker 镜像（示例）
# 注意：这是一个示例，需要根据实际 OpenClaw Docker 镜像调整

FROM node:18-alpine

LABEL maintainer="DocAgent"
LABEL description="DocAgent - 文档管理智能助手"

# 设置工作目录
WORKDIR /app

# 安装 OpenClaw（示例，根据实际情况调整）
# RUN npm install -g openclaw

# 复制 DocAgent 文件
COPY agent/ /app/docagent-agent/
COPY skills/ /app/docagent-skills/
COPY openclaw-config/ /app/docagent-config/

# 设置环境变量
ENV DOCAGENT_WORKSPACE=/app/docagent-agent
ENV DOCAGENT_SKILLS=/app/docagent-skills

# 暴露端口（如需要）
# EXPOSE 18789

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:18789/health || exit 1

# 启动命令（示例）
# CMD ["openclaw", "gateway", "start"]

CMD ["echo", "DocAgent Docker 镜像（示例），请根据实际 OpenClaw 配置调整"]
