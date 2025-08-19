> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 IT 省力工具！SSL 证书管理与证书过期通知自动化[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/VVXYiKapIKg)

![SSL 证书管理](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/4-SSL-checker-automation/cover.png?raw=true)

## 作者信息

* **作者：** AlexHsieh
* **平台：** n8n（您可以将 `.json` 文件导入自己的 n8n 来查看完整流程）

---

## 📌 功能介绍

此 IT 自动化工具帮助用户管理 SSL 证书过期通知，确保网站的 SSL 证书不会过期。主要功能包括：

* ✅ **SSL 证书监控与管理**（定期检查与更新 SSL 证书信息）
* ✅ **过期通知**（在 SSL 证书即将过期时自动发送提醒电子邮件）

> ⚠ **注意：** 确保所有 SSL 证书的信息都是最新的，避免证书过期问题。

---

## 🔧 运作方式

1. **准备网域名单** ：手动或自动撷取所有网域，储存在 Google Sheet
2. **查询SSL 证书信息** ：使用 `sslcheck.io` 查询证书状态，确认每个网站的 SSL 状况
3. **设置过期提醒机制** ：当 SSL 证书少于 7 天即将过期时，自动发送邮件给相关人员提醒更新证书
4. **更新至 Google Sheet** ：自动更新并储存查询结果，确保 SSL 证书信息纪录完整

通过这个流程，使用者可以轻松与高效得维护所有 SSL 证书，再也不用担心因为过期而造成的网站中断。

---

## 🚀 下载资源

[n8n 链接](https://n8n.io/)
[n8n 部署 zeabur 链接](https://zeabur.com/referral?referralCode=qwedsazxc78)

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
