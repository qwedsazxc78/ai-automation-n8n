> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 8分钟学会用 n8n 串接 LINE Message API 与 Webhook 实战教学｜打造个人 AI 助理｜🧠 省力知识库

[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/HJKDHJ5x1F0)

![cover](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/17-n8n-line-message-api/cover.png?raw=true)

## 作者信息

* **作者：** Alexhsieh
* **平台：** n8n（可直接导入范例流程 `.json` 文件至自己的 n8n 环境进行学习与实作）
* **注意事项：** `.json` 范例档已移除所有关键 API 密钥，请自行填入专属信息

---

## 📌 功能介绍

运用 n8n 串接 LINE Message API，打造属于自己的 LINE 个人助理！

* ✅ **主动发送 LINE 信息**：如何传信息给自己，后续发送自定义信息
* ✅ **实作 Webhook 互动**：即时接收与回应 LINE 用户信息
* ✅ **Line官方帐号注册与串接流程**：带你完成 LINE Channel、官方帐号申请、Token 取得与设定

---

## 🔧 运作方式

1. **申请与设定 LINE Message API**：注册 LINE Developers 帐号，建立 Provider 与 Channel，申请 LINE 官方帐号并设定对应信息
2. **取得 Channel Token 与设定授权**：于 LINE 后台复制 Channel Access Token，并于 n8n 设定正确的授权 Header
3. **主动推播信息给指定用户**：透过 n8n Workflow 输入 User ID 及信息内容，实现自动推送通知
4. **Webhook 设定与测试**：配置 Webhook URL，启用 webhook，测试 n8n 是否正确收到 LINE 事件并即时回应

> 🔑 **小提醒**：Webhook 设定时，Test URL 仅于测试工作流时启用，Production URL 则持续监听事件。

---

## 参考资料与延伸学习

* [LINE api 文档](https://developers.line.biz/en/docs/messaging-api/overview/)
* [LINE 开发者后台](https://developers.line.biz/console/)
* [LINE 官方帐号管理](https://manager.line.biz/)

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
