#!/usr/bin/env bash
# Toy Stop hook v0.0.2 — full-schema systemMessage 测试
# 之前 v0.0.1 用 bare {"systemMessage":...}，在 v2.1.114+ 会一闪而过被丢弃。
# 这次用完整 schema (continue + suppressOutput + systemMessage)，应当持久渲染。
# 参考 issue #50542 的 jphein 自己找到的 workaround。

set -euo pipefail

input=$(cat)

if echo "$input" | grep -q '"stop_hook_active":[[:space:]]*true'; then
  exit 0
fi

cat << 'EOF'
{"continue": true, "suppressOutput": false, "systemMessage": "📋 [TOY-TEST 成功 v0.0.2] systemMessage 用完整 schema 渲染成功！Concierge v0.3.0 可以走 Stop hook 自动旁路 (workaround for issue #50542)."}
EOF

exit 0
