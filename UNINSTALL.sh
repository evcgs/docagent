#!/bin/bash
# DocAgent 卸载脚本
# 使用方法: ./UNINSTALL.sh

set -e

echo "========================================="
echo "  DocAgent 卸载脚本"
echo "========================================="
echo ""

# 确认卸载
read -p "⚠️  确定要卸载 DocAgent 吗? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "卸载已取消"
    exit 0
fi

echo ""
echo "开始卸载..."

# 步骤 1: 删除 Agent 工作区
echo ""
echo "[1/4] 删除 Agent 工作区..."
if [ -d "$HOME/.openclaw/agents/DocAgent" ]; then
    read -p "⚠️  删除 $HOME/.openclaw/agents/DocAgent? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$HOME/.openclaw/agents/DocAgent"
        echo "✅ Agent 工作区已删除"
    else
        echo "⏭️  跳过删除 Agent 工作区"
    fi
else
    echo "⏭️  Agent 工作区不存在，跳过"
fi

# 步骤 2: 删除技能（可选）
echo ""
echo "[2/4] 删除技能..."
if [ -d "$HOME/.openclaw/workspace/skills/feishu-doc-manager" ]; then
    read -p "⚠️  删除技能 feishu-doc-manager? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$HOME/.openclaw/workspace/skills/feishu-doc-manager"
        echo "✅ 技能已删除"
    else
        echo "⏭️  跳过删除技能"
    fi
else
    echo "⏭️  技能不存在，跳过"
fi

# 步骤 3: 提示手动修改 openclaw.json
echo ""
echo "[3/4] 配置清理提醒..."
echo ""
echo "⚠️  请手动从 ~/.openclaw/openclaw.json 中删除："
echo ""
echo "1. agents.list 中的 docagent 配置"
echo "2. bindings 中的 docagent binding"
echo "3. channels.feishu.accounts 中的 docagent 账号"
echo ""
echo "参考 CONFIG.md 了解配置结构"
echo ""

# 步骤 4: 提示重启 Gateway
echo "[4/4] 重启提醒..."
echo ""
echo "配置清理完成后，请重启 OpenClaw Gateway："
echo "  openclaw gateway restart"
echo ""

echo ""
echo "========================================="
echo "  ✅ DocAgent 卸载完成！"
echo "========================================="
echo ""
echo "📖 提醒："
echo "- 记得手动清理 openclaw.json 配置"
echo "- 记得重启 OpenClaw Gateway"
echo ""
