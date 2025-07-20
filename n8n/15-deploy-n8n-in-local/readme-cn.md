> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 0 成本 n8n 工作流，本地电脑一键部署 n8n＋ngrok 帮你服务公开存取｜EP15｜🧠 省力知识库[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/E_cqlz7VGgs)

![n8n 部署影片封面](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/15-deploy-n8n-in-local/cover.png?raw=true)

## 作者信息

* **作者：** Alexhsieh
* **平台：** n8n（您可以将 `.json` 文件导入自己的 n8n 来查看完整流程）
* **注意事项：** `.json` 文件中已移除所有 API 密钥

---

## basic 基本版 n8n 部署

[项目连接](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/basic)

## public 进阶版 n8n 部署 （ngrok 可进行公开存取）

[项目连接](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/public)

## 📌 功能介绍

如何在本地端以「0成本」快速部署 n8n 工作流，配合 docker compose 工具快速建立
运用 ngrok 让服务公开存取
Step by Step的教学让初学者也能快速上手

* 🛠️ **快速部署**：只需 3 分钟完成 n8n 本地端环境设置
* 🔧 **公开 docker 范本**：直接一键使用，方便快速
* 🌐 **服务公开存取**：使用 ngrok 将工作流对外开放
* 🔄 **工作流演示**：实测汇入测试 Workflow 并检查运作状况

> ⚠ **注意：** 确保在安全环境下进行部署及测试，服务暴露请注意安全问题

---

## 🔧 运作方式

1. **下载项目**：从 GitHub 获取所需资源并安装 docker compose
2. **启动服务**：快速启动本地的 n8n 环境，完整界面轻松操作
3. **汇入范例 Workflow**：运用 n8n 提供的界面测试 Webhook 操作
4. **对外公开**：运用 ngrok 线上代理，将本地 API 分享至外部网络