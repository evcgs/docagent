#!/bin/bash
# DocAgent 测试脚本
# 使用方法: ./TEST.sh

set -e

echo "========================================="
echo "  DocAgent 测试脚本"
echo "========================================="
echo ""

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PASS=0
FAIL=0
WARN=0

# 测试函数
test_pass() {
    echo -e "${GREEN}✅ PASS: $1${NC}"
    PASS=$((PASS+1))
}

test_fail() {
    echo -e "${RED}❌ FAIL: $1${NC}"
    FAIL=$((FAIL+1))
}

test_warn() {
    echo -e "${YELLOW}⚠️  WARN: $1${NC}"
    WARN=$((WARN+1))
}

echo "开始测试..."
echo ""

# 测试 1: 检查 Agent 工作区
echo "[1/8] 检查 Agent 工作区..."
if [ -d "$HOME/.openclaw/agents/DocAgent/workspace" ]; then
    test_pass "Agent 工作区存在"
else
    test_fail "Agent 工作区不存在"
fi

# 测试 2: 检查 Agent 定义文件
echo ""
echo "[2/8] 检查 Agent 定义文件..."
MISSING_FILES=""
for file in IDENTITY.md SOUL.md TOOLS.md; do
    if [ ! -f "$HOME/.openclaw/agents/DocAgent/workspace/$file" ]; then
        MISSING_FILES="$MISSING_FILES $file"
    fi
done
if [ -z "$MISSING_FILES" ]; then
    test_pass "所有 Agent 定义文件存在"
else
    test_fail "缺少文件:$MISSING_FILES"
fi

# 测试 3: 检查技能
echo ""
echo "[3/8] 检查技能..."
if [ -d "$HOME/.openclaw/workspace/skills/feishu-doc-manager" ]; then
    test_pass "技能 feishu-doc-manager 存在"
else
    test_fail "技能 feishu-doc-manager 不存在"
fi

# 测试 4: 检查技能符号链接
echo ""
echo "[4/8] 检查技能符号链接..."
if [ -L "$HOME/.openclaw/agents/DocAgent/workspace/skills/feishu-doc-manager" ]; then
    if [ -e "$HOME/.openclaw/agents/DocAgent/workspace/skills/feishu-doc-manager" ]; then
        test_pass "技能符号链接正确"
    else
        test_fail "技能符号链接指向不存在的文件"
    fi
else
    test_warn "技能符号链接不存在"
fi

# 测试 5: 检查 openclaw.json
echo ""
echo "[5/8] 检查 openclaw.json..."
if [ -f "$HOME/.openclaw/openclaw.json" ]; then
    # 检查是否包含 docagent
    if grep -q "\"docagent\"" "$HOME/.openclaw/openclaw.json"; then
        test_pass "openclaw.json 包含 docagent 配置"
    else
        test_warn "openclaw.json 中未找到 docagent 配置"
    fi
else
    test_fail "openclaw.json 不存在"
fi

# 测试 6: 检查 Gateway 状态
echo ""
echo "[6/8] 检查 Gateway 状态..."
if command -v openclaw &> /dev/null; then
    if openclaw gateway status 2>&1 | grep -q "running"; then
        test_pass "OpenClaw Gateway 正在运行"
    else
        test_warn "OpenClaw Gateway 未运行，请启动: openclaw gateway start"
    fi
else
    test_warn "openclaw 命令未找到"
fi

# 测试 7: 检查权限
echo ""
echo "[7/8] 检查文件权限..."
if [ -r "$HOME/.openclaw/openclaw.json" ]; then
    test_pass "openclaw.json 可读"
else
    test_fail "openclaw.json 不可读"
fi

# 测试 8: 检查目录权限
echo ""
echo "[8/8] 检查目录权限..."
if [ -w "$HOME/.openclaw/agents/DocAgent/workspace" ]; then
    test_pass "Agent 工作区可写"
else
    test_warn "Agent 工作区不可写"
fi

# 总结
echo ""
echo "========================================="
echo "  测试总结"
echo "========================================="
echo ""
echo -e "${GREEN}通过: $PASS${NC}"
if [ $FAIL -gt 0 ]; then
    echo -e "${RED}失败: $FAIL${NC}"
fi
if [ $WARN -gt 0 ]; then
    echo -e "${YELLOW}警告: $WARN${NC}"
fi
echo ""

if [ $FAIL -eq 0 ]; then
    if [ $WARN -eq 0 ]; then
        echo -e "${GREEN}🎉 所有测试通过！${NC}"
    else
        echo -e "${YELLOW}⚠️  测试通过，但有警告${NC}"
    fi
else
    echo -e "${RED}❌ 部分测试失败，请检查${NC}"
fi

echo ""
echo "📖 下一步："
echo "1. 查看 CONFIG_CHECKLIST.md 进行详细检查"
echo "2. 在飞书中测试 DocAgent 是否能正常回复"
echo "3. 如有问题，查看 Gateway 日志: tail -50 ~/.openclaw/logs/gateway.log"
echo ""

exit $FAIL
