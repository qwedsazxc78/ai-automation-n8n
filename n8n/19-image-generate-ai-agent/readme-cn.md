> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 省力工具！OpenAI 最新图片模型 GPT-image-1 登场！如何打造电商商品图片，建立图片灵感来源 AI Agent

[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/DCjv00f6lXI)

![OpenAI GPT-image-1 电商品图 AI Agent](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/cover.png?raw=true)

## 📋 必要条件 Prerequisites

- n8n v1.0+ 已安装并运行
- API Keys 需求:
  - ✅ OpenAI API Key (GPT-image-1, DALL·E 2/3) (必需)
  - ✅ LINE Message API Token (必需)
  - ✅ Google Service Account (必需)
- 其他工具:
  - LINE 开发者帐户
  - Google Drive 储存空间
  - Webhook 接收端点设定

## 作者信息

* **作者：** Alexhsieh
* **平台：** n8n（可导入 .json 文件了解完整流程）
* **注意事项：** 范例为学习用途，API 密钥及机密资料未公开

---

## 📌 功能介绍

这次的省力工具串接 OpenAI 最新图片生成模型 GPT-image-1
专为「电商商品图片」设计打造的 AI Agent，帮助大家思考图片生成灵感：

* ✅ 以 LINE 输入商品描述，一键生成商品图片
* ✅ 支持多种模型 DALL·E 2/3、GPT-image-1 生成图片，自由切换
* ✅ 自动同步生成图片至 Google Drive，方便后续云端存取与管理
* ✅ 全程自动化，利用 prompt 提示词，即可产制多风格商用图片初版
* ✅ LINE 以终为始，用 LINE 快速浏览生成图片，让灵感不丢失！

---

## 生成图片范例与参考

生成规则：

* 商品种类与样式
* 使用商品的模特
* 相关场景

### 商品1 - 红色洋装

```bash
请生成红色的洋装商品
25-30岁的亚洲女性
在晴朗的海边
```

![商品1 - 红色洋装1](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample1-1.png?raw=true)

![商品1 - 红色洋装2](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample1-2.png?raw=true)

### 商品2 - 太阳眼镜

```bash
请生成帅气的太阳眼镜商品
35-40岁的欧洲男性
在地铁站
```

![商品1 - 太阳眼镜1](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample2-1.png?raw=true)

![商品1 - 太阳眼镜2](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample2-2.png?raw=true)

---

## 🔧 运作方式

1. **明确图片情境信息输入**：透过 LINE、n8n workflow 或其他介面，输入您的商品描述（例如：请生成红色的洋装商品，25-30岁的亚洲女性，在晴朗的海边）。
2. **Webhook 接收**：n8n自动侦测信息，透过 Webhook 收集描述文字。
3. **AI Prompt 建构**：系统将输入内容组装为 AI 理解所需的英文 prompt，并依需求创建图片生成指令。
4. **调用生成 API**：用正确参数呼叫图片生成 API，设定生成张数、画质等。
5. **自动接收生成图档**：API 回传图片（Base64 编码），n8n流程自动转换为 PNG/JPG 图档。
6. **云端同步与通知**：完成图片自动上传至 Google Drive，生成下载与预览网址，同步推播信息回 LINE 助理（含图片与 Google Drive 连结）。

> 💡 无论任何商品、任何风格，只需输入描述内容，便能打造属于你的商品图！只要储值黄金靠 AI！

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
