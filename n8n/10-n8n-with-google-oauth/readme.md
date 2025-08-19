> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# [2025最新] 5分鐘設定 n8n + Google OAuth｜🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/V-iT-HbBOew)

![n8n with Google OAuth](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/10-n8n-with-google-oauth/cover.png?raw=true)

5 分鐘完成 Google 服務的 OAuth 權限設定，並設定 n8n Google 服務權限

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n（您可以將 `.json` 文件導入自己的 n8n 來查看完整流程）
* **注意事項：** `.json` 文件中已移除所有 API 金鑰

---

## 📌 功能介紹

詳細講解如何將 `n8n` 與 Google 的多個服務整合。
5 分鐘設定 Google OAuth 以確保能訪問 Google Sheet、Docs、Drive、Calendar 及 Gmail 等服務。

*  ✅ **google 專案設置**：逐步操作如何在 Google Cloud 進行 OAuth 的設定。
*  ✅ **API整合**：確保每個 API 的啟用與必要的憑證生成。
*  ✅ **Google 服務 Oauth 權限設定**：n8n 服務權限安裝設定。

> ⚠ **注意：** 前提是操作需在已開通 Google Cloud 服務的情況下進行。

---

## 🔧 運作方式

1. **創建 Google 專案及啟用 API**
   - 登入 Google Cloud 控制台並建立新專案。
   - 啟用所需的 Google API 來支援 n8n。

2. **設定 OAuth 同意畫面**
   - 填寫應用程式細節並指定授權網域。

3. **建立 OAuth 客戶端 ID**
   - 設定網頁應用程式並記下生成的客戶端 ID 和密碼。

4. **設定資料存取範圍**
   - 指定必須的 OAuth 資訊範圍，以確保能訪問所需的 Google 服務。

5. **在 n8n 建立 Google OAuth 憑證**


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
