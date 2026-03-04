#!/bin/bash
# DocAgent 一键安装脚本
# 使用方法: ./INSTALL.sh

set -e

echo "========================================="
echo "  DocAgent 一键安装脚本"
echo "========================================="
echo ""

# 检查 OpenClaw 是否安装
if [ ! -d "$HOME/.openclaw" ]; then
    echo "❌ 错误: 未检测到 OpenClaw 目录"
    echo "请先安装 OpenClaw"
    exit 1
fi

echo "✅ OpenClaw 检测通过"
echo ""

# 确认安装
read -p "是否继续安装 DocAgent? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "安装已取消"
    exit 0
fi

echo ""
echo "开始安装..."

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 步骤 1: 创建 Agent 目录
echo ""
echo "[1/6] 创建 Agent 目录..."
mkdir -p "$HOME/.openclaw/agents/DocAgent/workspace"
echo "✅ 目录创建完成"

# 步骤 2: 复制 Agent 定义文件
echo ""
echo "[2/6] 复制 Agent 定义文件..."
cp "$SCRIPT_DIR/agent/"* "$HOME/.openclaw/agents/DocAgent/workspace/"
echo "✅ Agent 定义文件复制完成"

# 步骤 3: 部署技能
echo ""
echo "[3/6] 部署技能..."
mkdir -p "$HOME/.openclaw/workspace/skills"
cp -r "$SCRIPT_DIR/skills/feishu-doc-manager" "$HOME/.openclaw/workspace/skills/"

# 创建符号链接
mkdir -p "$HOME/.openclaw/agents/DocAgent/workspace/skills"
ln -sf "$HOME/.openclaw/workspace/skills/feishu-doc-manager" "$HOME/.openclaw/agents/DocAgent/workspace/skills/"
echo "✅ 技能部署完成"

# 步骤 4: 显示配置说明
echo ""
echo "[4/6] 配置说明..."
echo ""
echo "⚠️  请手动完成以下配置："
echo ""
echo "1. 编辑 ~/.openclaw/openclaw.json"
echo "   - 添加 agent 配置（参考 openclaw-config/agent-config.json）"
echo "   - 添加 binding 配置（参考 openclaw-config/binding-config.json）"
echo "   - 添加飞书账号配置（参考 openclaw-config/feishu-account.json）"
echo ""
echo "2. 开通飞书权限"
echo "   详见: PERMISSIONS.md"
echo ""
echo "3. 重启 OpenClaw Gateway"
echo "   openclaw gateway restart"
echo ""

# 步骤 5: 创建占位符目录（可选）
echo "[5/6] 创建占位符目录..."
mkdir -p "$HOME/.openclaw/agents/DocAgent/sessions"
echo "✅ 占位符目录创建完成"

echo ""
echo "========================================="
echo "  ✅ DocAgent 安装完成！"
echo "========================================="
echo ""
echo "📖 下一步："
echo "1. 阅读 QUICKSTART.md 了解详细步骤"
echo "2. 阅读 PERMISSIONS.md 了解权限要求"
echo "3. 手动配置 openclaw.json"
echo "4. 重启 OpenClaw Gateway"
echo ""
