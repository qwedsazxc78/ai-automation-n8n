# n8n AI Chat Hub 对话中心是什么？

![n8n AI Chat Hub Cover](https://raw.githubusercontent.com/qwedsazxc78/ai-automation-n8n/main/n8n/50-n8n-ai-chat-hub/cover.png)

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁體中文](./readme.md)


## 📌 5 大视频重点

1. **多模型统一界面** — 一个 Chat Hub 切换 OpenAI、Claude、Gemini，维持对话脉络
2. **原生功能齐全** — 语音输入、文件上传、网络搜索（Jina AI / SERP API）开箱即用
3. **Personal Agent** — 像定制化 GPT，设定 System Prompt 打造专属翻译机、助理
4. **Workflow Agent** — 把现有 n8n 工作流无痛转换成对话式 AI Agent
5. **企业级权限管理** — Chat only 角色让非技术人员安全使用自动化工作流

---

## 🎯 目标

- ✅ 了解 n8n Chat Hub 是什么（n8n 2.1.0 Beta 新功能）
- ✅ 掌握 Personal Agent 与 Workflow Agent 的差异
- ✅ 学会建立自定义代理人并发布到 Chat Hub
- ✅ 理解 Chat Hub 对团队协作与企业管理的价值

---

## 🛠️ 对应情境

| 情境 | 解决方案 |
|------|----------|
| 同时订阅多个 AI 服务（ChatGPT Plus、Claude Pro）成本高 | Chat Hub 整合多模型 API，统一管理降低成本 |
| 想让同事使用 AI Agent 但他们不懂 n8n 操作 | 建立 Workflow Agent + Chat only 角色权限 |
| 需要快速建立定制化 GPT 但不想用 OpenAI Custom GPT | 用 Personal Agent 直接在 n8n 内建立 |
| 工作流程已经建好，想转成对话式界面 | Workflow Agent 无痛转换，勾选 Make Available 即可 |
| 企业需要集中管理 AI 资源与使用量 | Chat Hub 提供统一平台，方便追踪成本与权限 |

---

## 🎥 学习内容

### 1️⃣ Chat Hub 核心概念

- Chat Hub 是 n8n 2.1.0 Beta 推出的整合式聊天界面
- 设计目的：打造 LLM 不可知的护城河，所有工作流都在 n8n 上
- 四大特色：多模型支持、原生功能、消息触发工作流、两种 Agent 模式

### 2️⃣ 统一聊天界面功能

- **多模型切换**：同一对话窗可切换 OpenAI、Claude、Gemini、DeepSeek
- **对话脉络维持**：切换模型后仍记得前面聊过的内容
- **原生工具**：语音输入、文件上传、Jina AI Web Search / SERP API

### 3️⃣ Personal Agent（个人助理）

- 类似 Custom GPT，预设 System Prompt
- 范例：万用转简体中文翻译机
- 支持语音、搜索、文件上传等 Chat Hub 原生功能

### 4️⃣ Workflow Agent（工作流代理）

- 把现有 n8n 工作流直接转成 Chat Hub 代理人
- 关键设定：
  - 在 Chat Trigger 勾选 `Make Chat Available in n8n Chat`
  - AI Agent 升级到 3.1+ 版本
  - 启用 `Enable Streaming` 选项
  - 按 Publish 发布工作流

### 5️⃣ 企业价值与限制

**四大价值：**
1. 整合工具并降低成本
2. 简化自动化流程的使用
3. 赋能开发者
4. 集中管理与治理

**目前限制：**
- 网络搜索只有两种选择（Jina AI / SERP API）
- 没有分组功能（不像 GPT 可分 Project）
- Workflow Agent 建议搭配 Streaming 支持

---

## 🚀 延伸资源

| 资源 | 链接 |
|------|------|
| 📂 GitHub 模板 | [50-n8n-ai-chat-hub](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/n8n/50-n8n-ai-chat-hub) |
| 🎓 Skool 社群 | [AI 相谈室](https://www.skool.com/ai-brain-alex?ref=5dde9b20e8e7432aa9a01df6e89685f4) |
| 💬 LINE 社群 | [加入群组](https://line.me/ti/g2/ZypIgLSzVPweRBgBqKvaRU10WEmnotuZOr7Lpg) |
| 📋 名单磁铁 | [免费资源](https://nifty-scale-675.notion.site/1fbbc76657488098a5dfee1d639679eb) |
| 🚀 Zeabur 部署 | [立即部署](https://zeabur.com?referralCode=qwedsazxc78) |

---

## 📹 相关视频

| EP | 标题 | 关联 |
|----|------|------|
| 49 | [n8n 2.0 五大重点功能](https://youtu.be/NH_TdarJX44) | 最新版本更新 |
| 16 | [n8n AI Agent + Think Tool](https://youtu.be/GMil7csSP6U) | AI Agent 进阶 |
| 9 | [AI Agent with MCP](https://youtu.be/MwHuCtkzvdo) | MCP 整合 |
| 5 | [xAI AI Agent 教学](https://youtu.be/Z1uqqLNAB4U) | AI Agent 基础 |
