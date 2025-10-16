> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)
# OpenAI 推出 ChatGPT 購物搜尋助理！n8n AI Agent 能做到一樣的購物搜尋功能嗎？ChatGPT Shopping Search｜🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/5pkLFXLQp6U)

![OpenAI 推出 ChatGPT 購物搜尋助理](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/21-n8n-shopping-search-agent/cover.png?raw=true)

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n/ChatGPT
* **注意事項：** `.json` 範本內已移除所有 API 金鑰

---

## 📌 功能介紹

全面剖析 OpenAI 最新推出的 ChatGPT 購物搜尋助理功能
並對比 n8n AI Agent 在購物搜尋場景的使用。

**主要測試包括：**

* ✅ 在 ChatGPT 介面內一鍵搜尋國內外電商商品（如 Amazon、Momo 等）
* ✅ 自動產生商品清單、比價表，並直出導購連結
* ✅ 提供商品特色、標籤、價格、評分、即時推薦
* ✅ 新增商品輪播、商品標籤、AI 自動推薦等互動體驗
* ✅ n8n Search Agent 實際使用 Web Search/HTTP API，自動找出指定需求的商品資訊

---

## 🔧 運作方式

### ChatGPT 購物助理運作流程

1. **用戶輸入商品需求**：如「請找 300 美金的飛行夾克」
2. **串聯 OpenAI Search**：電商網站，主動推薦清單、比價、價格與特色
3. **前端 UI**：呈現商品輪播、標籤、價格、說明及導購連結
4. **資料來源**：為結構化 SEO/網路第三方通路串接，並即時更新
5. **開放商家商品資料自由上傳**：自動收錄於 Open AI 的推薦清單

### n8n AI Agent 購物搜尋運作流程 -> 用戶體驗不贏

1. **串接 OpenAI Web Search API**：利用 HTTP Request 節點串接 OpenAI Web Search API，根據用戶指令直接發出查詢
2. **AI Agent** ：回傳符合搜尋條件的商品列表或 API 資訊（如關鍵字、價格、賣家等）
3. **整合搜尋回傳**：自動整理為文字列表／摘要，無前端輪播或互動 UI


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
