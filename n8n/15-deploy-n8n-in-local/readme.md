> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 0 成本 n8n 工作流，本地電腦一鍵部署 n8n＋ngrok 幫你服務公開存取｜EP15｜🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/E_cqlz7VGgs)

![n8n 部署影片封面](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/15-deploy-n8n-in-local/cover.png?raw=true)

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n（您可以將 `.json` 文件導入自己的 n8n 來查看完整流程）
* **注意事項：** `.json` 文件中已移除所有 API 金鑰

---

## basic 基本版 n8n 部署

[專案連結](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/basic)

## public 進階版 n8n 部署 （ngrok 可進行公開存取）

[專案連結](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/public)

## 📌 功能介紹

如何在本地端以「0成本」快速部署 n8n 工作流，配合 docker compose 工具快速建立
運用 ngrok 讓服務公開存取
Step by Step的教學讓初學者也能快速上手

* 🛠️ **快速部署**：只需 3 分鐘完成 n8n 本地端環境設置
* 🔧 **公開 docker 範本**：直接一鍵使用，方便快速
* 🌐 **服務公開存取**：使用 ngrok 將工作流對外開放
* 🔄 **工作流演示**：實測匯入測試 Workflow 並檢查運作狀況

> ⚠ **注意：** 確保在安全環境下進行部署及測試，服務暴露請注意安全問題

---

## 🔧 運作方式

1. **下載專案**：從 GitHub 獲取所需資源並安裝 docker compose
2. **啟動服務**：快速啟動本地的 n8n 環境，完整介面輕鬆操作
3. **匯入範例 Workflow**：運用 n8n 提供的介面測試 Webhook 操作
4. **對外公開**：運用 ngrok 線上代理，將本地 API 分享至外部網絡
