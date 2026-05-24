# concierge-toy

一次性验证用 plugin。**5 分钟测试 → 验证完即可卸载。**

## 它在测什么

Claude Code 的 Stop hook 输出 `{"systemMessage": "..."}` 时，这条消息**是否会以独立行渲染到用户的聊天流里**。

这个问题在不同版本的 Claude Code 里行为不同（参见 [issue #50542](https://github.com/anthropics/claude-code/issues/50542)）。我们需要在你这台机器上实测才能知道能不能用这个通道做"非侵入秘书简报"。

## 安装与测试

1. 添加到 marketplace 或本地 plugin：
   ```
   /plugins
   → 选 lanbasara marketplace
   → concierge-toy → Install
   ```
2. **重启 Claude Code 会话**（hooks 只在 SessionStart 加载）
3. 在新会话里发任何一句话（比如"在吗"）
4. **观察 Claude 回复后**：

| 看到什么 | 结论 |
|---------|------|
| 在 Claude 回复**之外**的位置出现一行 `📋 [TOY-TEST 成功] ...` | ✅ 渲染正常 — 可走 systemMessage 旁路方案 |
| 完全看不到那一行 | ❌ 你的版本踩了 #50542 — 只能走手动 `/sec brief` 方案 |
| Claude 把那段话接到自己的回复里 / 重新生成 | ⚠️ 异常 — 收集截图我再分析 |

把结果告诉我即可。

## 卸载

```
/plugins → concierge-toy → Uninstall
```
