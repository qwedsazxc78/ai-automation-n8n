> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)
# 8 分鐘最速入門 n8n API 請求與 Ｗebook ｜原理與使用方法一次理解｜🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/l5-s6h2iY_M)

適合初學者及任何需要理解 API、自動化監控、訊息即時通報流程的開發者
跟著操作範例一步到位，不只學觀念也會應用！

![8 分鐘最速入門 n8n API 請求與 Webhook](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/20-n8n-http-request-and-webhook/cover.png?raw=true)

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n（支援匯入 `.json` 查看完整自動化流程）
* **注意事項：** 範例未含任何私密 API 金鑰

---

## 📌 功能介紹

8 分鐘掌握 API 請求（HTTP Request）與 Webhook 的運作原理與概念
在 n8n 的實際使用方式！

* ✅ 什麼是 API 與 API 請求？運作概念一次通透理解
* ✅ n8n 如何自動發送 API 請求並收錄狀態結果
* ✅ 什麼是 Webhook？運作概念與如何主動接收即時回報
* ✅ n8n webhook 如何接收外界請求
* ✅ 體驗最簡單範例：網站健康監控與及時通知

---

## 🔧 運作方式

1. **API 請求原理**
    - 以生活化範例（麥當勞點餐）對照說明，幫助快速入門
    - 認識 RESTful API 五大方法：GET、POST、PUT、PATCH、DELETE
2. **n8n API 請求 Demo**
    - 利用 n8n 的 HTTP Request 節點，對服務發送健康檢查請求
    - 伺服器回傳 JSON 格式狀態（如：{""status"": ""OK""}）
    - 串接 Google Sheets，自動記錄請求結果、時間與回應內容
    - 可設定排程自動執行，打造網站健康監控
3. **Webhook 運作原理**
    - 比喻說明（如叫車服務 Uber/Line Taxi）易於理解
    - Server 主動回報，達到低延遲及即時性，節省用戶端輪詢
4. **n8n Webhook 實作 Demo**
    - 手把手設定 n8n Webhook Node，監聽指定健康檢查 URL
    - 客戶端呼叫時，即時回應健康與頻道描述資訊
    - 支援 JSON 回應、狀態碼設定，隨時監測線上狀態
