> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 省力工具！发票自动整理机器人，用 n8n 帮你把发票自动变表单。[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://www.youtube.com/channel/UCDMJaaMu3nGNc7bNKMAtS7Q)

![发票自动整理机器人](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/1-simple-invoice-automation/cover.png?raw=true)

## 📋 必要条件 Prerequisites

- n8n v1.0+ 已安装并运行
- API Keys 需求:
  - ✅ OpenAI API Key (ChatGPT) (必需)
  - ✅ Google Service Account (必需)
- 其他工具:
  - Gmail 账户并启用 Gmail API
  - Google Drive 储存空间
  - Google Sheets 试算表权限

## 作者信息

* **作者：** AlexHsieh
* **平台：** n8n（可以将 `.json` 文件导入自己的 n8n 来查看完整流程）

---

## 📌 功能介绍

这款 AI 自动化工具能够自动整理并管理电子邮件中的发票。主要功能包括：

* ✅ **自动下载电子发票** 并储存到 Google Drive 中供后续管理
* ✅ **使用 ChatGPT 解析发票内容** 并汇总成发票清单
* ✅ **自定义 Gmail 筛选规则** 以自动标签处理过的邮件
* ✅ **整合 Google 试算表**，确保所有发票信息集中管理

---

## 🔧 运作方式

1. **接收与分类：** 利用 Gmail 标签和 ChatGPT，自动分类并整理来自不同供应商的发票。
2. **下载与储存：** 当 Gmail 收到符合条件的发票邮件时，利用 n8n 自动触发下载 PDF 并储存到 Google Drive。
3. **内容解析与汇出：** 使用 ChatGPT 将 PDF 中的信息转换为结构化的 JSON 格式，并将其输出到 Google 试算表供未来查询。
4. **自动更新与管理：** 系统自动更新数据，避免重复处理，并通过标示处理状态以保持邮件系统的整洁。

这套自动化流程能大幅提升发票管理的效率，让繁琐的整理工作变得轻松有效率！

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
