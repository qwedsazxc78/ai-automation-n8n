> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)
# 8分鐘學會用 n8n 串接 LINE Message API 與 Webhook 實戰教學｜打造個人 AI 助理｜🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/HJKDHJ5x1F0)

![cover](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/17-n8n-line-message-api/cover.png?raw=true)

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n（可直接導入範例流程 `.json` 檔案至自己的 n8n 環境進行學習與實作）
* **注意事項：** `.json` 範例檔已移除所有關鍵 API 金鑰，請自行填入專屬資訊

---

## 📌 功能介紹

運用 n8n 串接 LINE Message API，打造屬於自己的 LINE 個人助理！

* ✅ **主動發送 LINE 訊息**：如何傳訊息給自己，後續發送自定義訊息
* ✅ **實作 Webhook 互動**：即時接收與回應 LINE 用戶訊息
* ✅ **Line官方帳號註冊與串接流程**：帶你完成 LINE Channel、官方帳號申請、Token 取得與設定

---

## 🔧 運作方式

1. **申請與設定 LINE Message API**：註冊 LINE Developers 帳號，建立 Provider 與 Channel，申請 LINE 官方帳號並設定對應資訊
2. **取得 Channel Token 與設定授權**：於 LINE 後台複製 Channel Access Token，並於 n8n 設定正確的授權 Header
3. **主動推播訊息給指定用戶**：透過 n8n Workflow 輸入 User ID 及訊息內容，實現自動推送通知
4. **Webhook 設定與測試**：配置 Webhook URL，啟用 webhook，測試 n8n 是否正確收到 LINE 事件並即時回應

> 🔑 **小提醒**：Webhook 設定時，Test URL 僅於測試工作流時啟用，Production URL 則持續監聽事件。

---

## 參考資料與延伸學習

* [LINE api 文件](https://developers.line.biz/en/docs/messaging-api/overview/)
* [LINE 開發者後台](https://developers.line.biz/console/)
* [LINE 官方帳號管理](https://manager.line.biz/)


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
