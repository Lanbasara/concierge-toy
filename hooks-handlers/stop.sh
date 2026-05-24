#!/usr/bin/env bash
# Toy Stop hook — tests whether plugin-dispatched systemMessage renders to user.
# 仅输出一个固定的 systemMessage，不做任何其他事。
# 防 loop：第二次触发（stop_hook_active=true）直接放行。

set -euo pipefail

input=$(cat)

# 如果是因为上一轮 Stop hook 触发的二次 Stop，直接退出
if echo "$input" | grep -q '"stop_hook_active":[[:space:]]*true'; then
  exit 0
fi

# 输出 systemMessage（如果你的 Claude Code 版本支持，这一行应当渲染到聊天流里）
cat << 'EOF'
{"systemMessage": "📋 [TOY-TEST 成功] 你的 Claude Code 版本支持 plugin-dispatched Stop hook 的 systemMessage 渲染。Concierge v0.3.0 可以用这个通道实现真正的非侵入秘书简报。"}
EOF

exit 0
