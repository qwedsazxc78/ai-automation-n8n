# n8n AI Chat Hub 對話中心是什麼？

![n8n AI Chat Hub Cover](https://raw.githubusercontent.com/qwedsazxc78/ai-automation-n8n/main/n8n/50-n8n-ai-chat-hub/cover.png)

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁體中文](./readme.md)


## 📌 5 大影片重點

1. **多模型統一介面** — 一個 Chat Hub 切換 OpenAI、Claude、Gemini，維持對話脈絡
2. **![alt text](EP50.png)** — 語音輸入、檔案上傳、網路搜尋（Jina AI / SERP API）開箱即用
3. **Personal Agent** — 像客製化 GPT，設定 System Prompt 打造專屬翻譯機、助理
4. **Workflow Agent** — 把現有 n8n 工作流無痛轉換成對話式 AI Agent
5. **企業級權限管理** — Chat only 角色讓非技術人員安全使用自動化工作流

---

## 🎯 目標

- ✅ 了解 n8n Chat Hub 是什麼（n8n 2.1.0 Beta 新功能）
- ✅ 掌握 Personal Agent 與 Workflow Agent 的差異
- ✅ 學會建立自訂代理人並發布到 Chat Hub
- ✅ 理解 Chat Hub 對團隊協作與企業管理的價值

---

## 🛠️ 對應情境

| 情境 | 解決方案 |
|------|----------|
| 同時訂閱多個 AI 服務（ChatGPT Plus、Claude Pro）成本高 | Chat Hub 整合多模型 API，統一管理降低成本 |
| 想讓同事使用 AI Agent 但他們不懂 n8n 操作 | 建立 Workflow Agent + Chat only 角色權限 |
| 需要快速建立客製化 GPT 但不想用 OpenAI Custom GPT | 用 Personal Agent 直接在 n8n 內建立 |
| 工作流程已經建好，想轉成對話式介面 | Workflow Agent 無痛轉換，勾選 Make Available 即可 |
| 企業需要集中管理 AI 資源與使用量 | Chat Hub 提供統一平台，方便追蹤成本與權限 |

---

## 🎥 學習內容

### 1️⃣ Chat Hub 核心概念

- Chat Hub 是 n8n 2.1.0 Beta 推出的整合式聊天介面
- 設計目的：打造 LLM 不可知的護城河，所有工作流都在 n8n 上
- 四大特色：多模型支援、原生功能、訊息觸發工作流、兩種 Agent 模式

### 2️⃣ 統一聊天介面功能

- **多模型切換**：同一對話窗可切換 OpenAI、Claude、Gemini、DeepSeek
- **對話脈絡維持**：切換模型後仍記得前面聊過的內容
- **原生工具**：語音輸入、檔案上傳、Jina AI Web Search / SERP API

### 3️⃣ Personal Agent（個人助理）

- 類似 Custom GPT，預設 System Prompt
- 範例：萬用轉繁體中文翻譯機
- 支援語音、搜尋、檔案上傳等 Chat Hub 原生功能

### 4️⃣ Workflow Agent（工作流代理）

- 把現有 n8n 工作流直接轉成 Chat Hub 代理人
- 關鍵設定：
  - 在 Chat Trigger 勾選 `Make Chat Available in n8n Chat`
  - AI Agent 升級到 3.1+ 版本
  - 啟用 `Enable Streaming` 選項
  - 按 Publish 發布工作流

### 5️⃣ 企業價值與限制

**四大價值：**
1. 整合工具並降低成本
2. 簡化自動化流程的使用
3. 賦能開發者
4. 集中管理與治理

**目前限制：**
- 網路搜尋只有兩種選擇（Jina AI / SERP API）
- 沒有分組功能（不像 GPT 可分 Project）
- Workflow Agent 建議搭配 Streaming 支援

---

## 🚀 延伸資源

| 資源 | 連結 |
|------|------|
| 📂 GitHub 模板 | [50-n8n-ai-chat-hub](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/n8n/50-n8n-ai-chat-hub) |
| 🎓 Skool 社群 | [AI 相談室](https://www.skool.com/ai-brain-alex) |
| 💬 LINE 社群 | [加入群組](https://line.me/ti/g2/ZypIgLSzVPweRBgBqKvaRU10WEmnotuZOr7Lpg) |
| 📋 名單磁鐵 | [免費資源](https://nifty-scale-675.notion.site/1fbbc76657488098a5dfee1d639679eb) |
| 🚀 Zeabur 部署 | [立即部署](https://zeabur.com?referralCode=qwedsazxc78) |

---

## 📹 相關影片

| EP | 標題 | 關聯 |
|----|------|------|
| 49 | [n8n 2.0 五大重點功能](https://youtu.be/NH_TdarJX44) | 最新版本更新 |
| 16 | [n8n AI Agent + Think Tool](https://youtu.be/GMil7csSP6U) | AI Agent 進階 |
| 9 | [AI Agent with MCP](https://youtu.be/MwHuCtkzvdo) | MCP 整合 |
| 5 | [xAI AI Agent 教學](https://youtu.be/Z1uqqLNAB4U) | AI Agent 基礎 |
