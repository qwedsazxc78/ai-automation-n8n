> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# n8n 也能 vibe coding？3 個使用 n8n-mcp + Claude Desktop 心得

![n8n 也能 vibe coding？3 個使用 n8n-mcp + Claude Desktop 心得](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/34-n8n-vibe-coding/cover.png?raw=true)

## 【 3大重點快速看 】

* 現階段測試：簡單任務可以加減使用
* 複雜任務使用：等待時間比較久，會有上下文不夠問題
* 與 Claude Desktop 整合：n8n-mcp蠻容易有些小問題，排錯比較麻煩，需要訂閱 Claude Pro

## 🎯 目標

* 🚀 利用 n8n MCP 模組與 Claude Desktop，打造 n8n vibe coding 工作流。
* 🛠️ 從 0 掌握 n8n MCP 的安裝、設定流程，包括 Node 環境需求與 API Key 產生。
* 🌎 正確利用 n8n MCP 與 Cloud Desktop 對話整合流程，直接幫你創建 n8n 工作流。

---

## 🛠️ 對應情境

* 希望嘗試 vibe coding ，在 n8n 打造 AI 自動化工作流。
* 需要快速部署 n8n 流程（如 webhook、數據彙整、自動通知等），不要自己設定。

---

## 🎥 你可以從影片中獲得

* **五步驟完整流程與 Demo**：從 n8n-MCP 安裝、API 金鑰設定、Workflow 建立，到 Cloud Desktop 整合，一次搞定 vibe n8n 自動化。
* **基礎與進階應用對照**：從簡易 webhook 任務到「AI 爸媽碎碎念」進階 workflow，示範系統如何協助排除安裝 bug，根據需求及時調整。
* **Claude 專案模式使用**：如何利用 claude 專案模式，建立 n8n 互動與工作環境！
* **n8n MCP 實測注意事項**：各種安裝雷區（Node22.17 版）、Cloud Desktop 重新啟動必備流程，減少新手踩坑機率。

---

## n8n MCP 環境安裝

### Node.js 版本要求
⚠️ **重要**：必須使用 Node.js 22.17 版本，其他版本可能會導致相容性問題。

📥 **下載連結**：https://nodejs.org/zh-tw/download

### 安裝方式

#### 方式一：直接安裝 Node.js
```bash
# 檢查 Node.js 版本
node -v
```

#### 方式二：使用 nvm 版本管理器
```bash
# 安裝 Node.js 22.17
nvm install 22.17
nvm use 22.17
```

### 安裝前測試
在正式設定前，請先執行以下指令測試環境是否正確：

```bash
npx n8n-mcp
```

💡 **Alex 小提醒**：版本不對或環境沒設定好，會一直遇到啟動失敗的問題。請務必確認 Node.js 版本是 22.17！

![npx n8n-mcp](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/36-n8n-vibe-coding-vscode/docs/npx-n8n-mcp.png?raw=true)

---

## 🚀 快速上手 n8n 自動化資源懶人包

### 🎓 學習與社群

* 🔗 [加入 AI 學習社群 (Skool)](https://www.skool.com/ai-brain-alex/about?ref=5dde9b20e8e7432aa9a01df6e89685f4)
  建立學習 AI 與 n8n 的學習路徑，無痛上手！
* 🔗 [加入 Line 社群一起搞懂 AI](https://line.me/ti/g2/ZypIgLSzVPweRBgBqKvaRU10WEmnotuZOr7Lpg)
  互相幫助前進！打造自己的 AI 自動化場景！

### 📚 教學資源

* 🎥 [n8n AI 自動化工作流：從基礎到進階實戰](https://youtube.com/playlist?list=PLUf88uk7T54I83MBdbuXgUuA8rVklF4FA&si=wHsQw8YJu-erSdLd)
  YouTube 系列教學，邊看邊做快速上手！
* ⏱️ [碎片化時間學習 n8n](https://youtube.com/playlist?list=PLUf88uk7T54Iv6LV2NFgdTghaX2cPhtgH&si=G3gj2qn179ZFUqAZ)
  每天5分鐘學習，自動化養成沒負擔。

### 🛠️ 部署與工具

* 🧩 [zeabur n8n 部署模板 (隨時更新)](https://zeabur.com/zh-TW/templates/0TUVZ7?referralDesktop=qwedsazxc78)
  零架設壓力，點擊部署即可使用，適合初學者與進階用戶。
* 🌐 [n8n 官方網站](https://n8n.io/)
  了解更多功能與文件，掌握最新更新。
