> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# [2025最新] 5分钟设定 n8n + Google OAuth｜🧠 省力知识库[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/V-iT-HbBOew)

![n8n with Google OAuth](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/10-n8n-with-google-oauth/cover.png?raw=true)

5 分钟完成 Google 服务的 OAuth 权限设定，并设定 n8n Google 服务权限

## 作者信息

* **作者：** Alexhsieh
* **平台：** n8n（您可以将 `.json` 文件导入自己的 n8n 来查看完整流程）
* **注意事项：** `.json` 文件中已移除所有 API 密钥

---

## 📌 功能介绍

详细讲解如何将 `n8n` 与 Google 的多个服务整合。
5 分钟设定 Google OAuth 以确保能访问 Google Sheet、Docs、Drive、Calendar 及 Gmail 等服务。

*  ✅ **google 专案设置**：逐步操作如何在 Google Cloud 进行 OAuth 的设定。
*  ✅ **API整合**：确保每个 API 的启用与必要的凭证生成。
*  ✅ **Google 服务 Oauth 权限设定**：n8n 服务权限安装设定。

> ⚠ **注意：** 前提是操作需在已开通 Google Cloud 服务的情况下进行。

---

## 🔧 运作方式

1. **创建 Google 专案及启用 API**
   - 登入 Google Cloud 控制台并建立新专案。
   - 启用所需的 Google API 来支持 n8n。

2. **设定 OAuth 同意画面**
   - 填写应用程序细节并指定授权网域。

3. **建立 OAuth 客户端 ID**
   - 设定网页应用程序并记下生成的客户端 ID 和密码。

4. **设定数据存取范围**
   - 指定必须的 OAuth 信息范围，以确保能访问所需的 Google 服务。

5. **在 n8n 建立 Google OAuth 凭证**

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
