> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 IT 省力工具！SSL 憑證管理與憑證過期通知自動化[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/VVXYiKapIKg)

![SSL 憑證管理](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/4-SSL-checker-automation/cover.png?raw=true)

## 作者資訊

* **作者：** AlexHsieh
* **平台：** n8n（您可以將 `.json` 文件導入自己的 n8n 來查看完整流程）

---

## 📌 功能介紹

此 IT 自動化工具幫助用戶管理 SSL 憑證過期通知，確保網站的 SSL 憑證不會過期。主要功能包括：

* ✅ **SSL 憑證監控與管理**（定期檢查與更新 SSL 憑證資訊）
* ✅ **過期通知**（在 SSL 憑證即將過期時自動發送提醒電子郵件）

> ⚠ **注意：** 確保所有 SSL 憑證的資訊都是最新的，避免憑證過期問題。

---

## 🔧 運作方式

1. **準備網域名單** ：手動或自動擷取所有網域，儲存在 Google Sheet
2. **查詢SSL 憑證資訊** ：使用 `sslcheck.io` 查詢憑證狀態，確認每個網站的 SSL 狀況
3. **設定過期提醒機制** ：當 SSL 憑證少於 7 天即將過期時，自動發送郵件給相關人員提醒更新憑證
4. **更新至 Google Sheet** ：自動更新並儲存查詢結果，確保 SSL 憑證資訊紀錄完整

透過這個流程，使用者可以輕鬆與高效得維護所有 SSL 憑證，再也不用擔心因為過期而造成的網站中斷。

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
