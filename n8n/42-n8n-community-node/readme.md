> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁體中文](./readme.md)

# n8n 社群節點全攻略｜打造專屬 Docker 映像，一次安裝數十種擴充功能

![n8n 社群節點全攻略｜打造專屬 Docker 映像，一次安裝數十種擴充功能](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/42-n8n-community-node/cover.png?raw=true)

---

## 【 3 大影片重點】

* 1️⃣ **如何用 GUI 安裝**：如何直接在後台直接安裝社群節點，簡單直覺。
* 2️⃣ **熱門社群節點攻略**：熱門社群節點前10 名，包含 MCP、LINE Webhook、PDF 處理等必裝節點。
* 3️⃣ **一鍵 Docker 映像製作實戰**：打造 10+ 社群節點的 n8n docker 映像，從 Dockerfile 撰寫、多平台建置到 Docker Hub 發布，一次搞定。

---

## 🎯 目標

* 🚀 學會在 n8n GUI 介面快速安裝社群節點，零技術門檻即可擴充功能。
* 🛠️ 掌握熱門社群節點的實戰應用，打造企業級自動化工作流程。
* 🎓 一鍵建好 10+ 社群節點的 Docker 映像，實現標準化部署。

---

## 🛠️ 對應情境

* 初學者想要快速上手 n8n 社群節點，透過 GUI 介面輕鬆安裝。
* 需要整合 LINE、MCP、PDF 等熱門服務的自動化團隊。
* 企業需要標準化部署，一次打包 10+ 必裝社群節點。
* 開發者想要建立可重複使用的 Docker 映像，加速團隊協作。

---


## 🎥 你可以從影片中獲得

* **GUI 安裝完整教學**：手把手教你在 n8n 後台直接安裝社群節點，3 分鐘搞定。
* **Top 10 社群節點一次打包**：詳解 MCP、LINE Webhook、PDF.co 等必裝節點的實戰應用。
* **Docker 映像一鍵打包**：預裝 10+ 社群節點的 Dockerfile 撰寫與多平台建置技巧。
* **從零到部署完整流程**：包含本地測試、Docker Hub 發布、生產環境配置。

---

## 🌟 10 大熱門 n8n 社群節點

🌟 **[Awesome N8N: Top 100 Community Nodes](https://github.com/restyler/awesome-n8n)**

### 🤖 AI 與智慧整合
* **MCP (Model Context Protocol)**：與 Claude、GPT 等 AI 模型深度整合
* **Tavily AI 搜尋**：智慧網路搜尋引擎整合，提供精準資訊檢索

### 📱 通訊與社群平台
* **LINE Webhook**：完整 LINE 訊息平台整合，支援群組與個人訊息
* **Discord 觸發器**：監聽 Discord 事件，打造社群自動化機器人

### 📄 文件與內容處理
* **PDF.co 整合**：專業 PDF 處理、轉換和編輯功能
* **網頁內容擷取器**：智慧提取網頁資訊，支援動態內容
* **文件生成器**：支援多種格式的專業文件建立

### 🛠️ 實用工具
* **QR Code 生成器**：快速生成與解析 QR Code
* **進階圖片編輯**：支援多種圖片處理操作
* **Ragic 整合**：台灣本土線上資料庫系統連接

---

## 📦 本地測試環境快速啟動

想要使用預裝 10+ 社群節點的環境？只需要三個步驟：

```bash
# 1. 進入社群節點目錄
cd local-ai/community/

# 2. 設置環境變數
cp .env.example .env
# 編輯 .env 設定檔（可使用預設值）

# 3. 啟動完整環境
docker-compose up -d

# 訪問 n8n：http://localhost:5678
# 預設登入：admin/adminpass
```

這個環境包含：
* ✅ n8n 最新版本
* ✅ PostgreSQL 資料庫持久化
* ✅ 預安裝 10+ 熱門社群節點（MCP、LINE、PDF 等）
* ✅ 多平台支援（自動選擇架構）
