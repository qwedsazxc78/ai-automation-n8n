> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 省力工具！發票自動整理機器人，用 n8n 幫你把發票自動變表單。[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://www.youtube.com/channel/UCDMJaaMu3nGNc7bNKMAtS7Q)

![發票自動整理機器人](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/1-simple-invoice-automation/cover.png?raw=true)

## 📋 必要條件 Prerequisites

- n8n v1.0+ 已安裝並運行
- API Keys 需求:
  - ✅ OpenAI API Key (ChatGPT) (必需)
  - ✅ Google Service Account (必需)
- 其他工具:
  - Gmail 帳戶並啟用 Gmail API
  - Google Drive 儲存空間
  - Google Sheets 試算表權限

## 作者資訊

* **作者：** AlexHsieh
* **平台：** n8n（可以將 `.json` 文件導入自己的 n8n 來查看完整流程）

---

## 📌 功能介紹

這款 AI 自動化工具能夠自動整理並管理電子郵件中的發票。主要功能包括：

* ✅ **自動下載電子發票** 並儲存到 Google Drive 中供後續管理
* ✅ **使用 ChatGPT 解析發票內容** 並匯總成發票清單
* ✅ **自定義 Gmail 篩選規則** 以自動標籤處理過的郵件
* ✅ **整合 Google 試算表**，確保所有發票資訊集中管理

---

## 🔧 運作方式

1. **接收與分類：** 利用 Gmail 標籤和 ChatGPT，自動分類並整理來自不同供應商的發票。
2. **下載與儲存：** 當 Gmail 收到符合條件的發票郵件時，利用 n8n 自動觸發下載 PDF 並儲存到 Google Drive。
3. **內容解析與匯出：** 使用 ChatGPT 將 PDF 中的信息轉換為結構化的 JSON 格式，並將其輸出到 Google 試算表供未來查詢。
4. **自動更新與管理：** 系統自動更新資料，避免重複處理，並通過標示處理狀態以保持郵件系統的整潔。

這套自動化流程能大幅提升發票管理的效率，讓繁瑣的整理工作變得輕鬆有效率！

---

## 🚀 下載資源

[n8n 連結](https://n8n.io/)
[n8n 部署 zeabur 連結](https://zeabur.com/referral?referralCode=qwedsazxc78)


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
