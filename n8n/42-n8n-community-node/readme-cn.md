> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁體中文](./readme.md)

# n8n 社区节点全攻略｜打造专属 Docker 镜像，一次安装数十种扩展功能

![n8n 社区节点全攻略｜打造专属 Docker 镜像，一次安装数十种扩展功能](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/42-n8n-community-node/cover.png?raw=true)

---

## 【 3 大视频重点】

* 1️⃣ **如何用 GUI 安装**：如何直接在后台直接安装社区节点，简单直观。
* 2️⃣ **热门社区节点攻略**：热门社区节点前10 名，包含 MCP、LINE Webhook、PDF 处理等必装节点。
* 3️⃣ **一键 Docker 镜像制作实战**：打造 10+ 社区节点的 n8n docker 镜像，从 Dockerfile 编写、多平台构建到 Docker Hub 发布，一次搞定。

---

## 🎯 目标

* 🚀 学会在 n8n GUI 界面快速安装社区节点，零技术门槛即可扩展功能。
* 🛠️ 掌握热门社区节点的实战应用，打造企业级自动化工作流程。
* 🎓 一键建立包含 10+ 社区节点的 Docker 镜像，实现标准化部署。

---

## 🛠️ 对应场景

* 快速上手 n8n 社区节点，通过 GUI 界面轻松安装。
* 需要热门社区节点整合 LINE、MCP、PDF 等热门服务的自动化团队。
* 企业需要标准化部署，一次打包 10+ 必装社区节点。
* 开发者想要建立可重复使用的 Docker 镜像，加速团队协作。

---


## 🎥 你可以从视频中获得

* **GUI 安装完整教学**：手把手教你在 n8n 后台直接安装社区节点，3 分钟搞定。
* **Top 10 社区节点一次打包**：详解 MCP、LINE Webhook、PDF.co 等必装节点的实战应用。
* **Docker 镜像一键打包**：预装 10+ 社区节点的 Dockerfile 编写与多平台构建技巧。
* **从零到部署完整流程**：包含本地测试、Docker Hub 发布、生产环境配置。

---

## 🌟 10 大热门 n8n 社区节点

🌟 **[Awesome N8N: Top 100 Community Nodes](https://github.com/restyler/awesome-n8n)**

### 🤖 AI 与智能整合
* **MCP (Model Context Protocol)**：与 Claude、GPT 等 AI 模型深度整合
* **Tavily AI 搜索**：智能网络搜索引擎整合，提供精准信息检索

### 📱 通讯与社群平台
* **LINE Webhook**：完整 LINE 消息平台整合，支持群组与个人消息
* **Discord 触发器**：监听 Discord 事件，打造社群自动化机器人

### 📄 文档与内容处理
* **PDF.co 整合**：专业 PDF 处理、转换和编辑功能
* **网页内容提取器**：智能提取网页信息，支持动态内容
* **文档生成器**：支持多种格式的专业文档创建

### 🛠️ 实用工具
* **QR Code 生成器**：快速生成与解析 QR Code
* **高级图片编辑**：支持多种图片处理操作
* **Ragic 整合**：台湾本土在线数据库系统连接

---

## 📦 本地测试环境快速启动

想要使用预装 10+ 社区节点的环境？只需要三个步骤：

```bash
# 1. 进入社区节点目录
cd local-ai/community/

# 2. 设置环境变量
cp .env.example .env
# 编辑 .env 配置文件（可使用默认值）

# 3. 启动完整环境
docker-compose up -d

# 访问 n8n：http://localhost:5678
# 默认登录：admin/adminpass
```

这个环境包含：
* ✅ n8n 最新版本
* ✅ PostgreSQL 数据库持久化
* ✅ 预安装 10+ 热门社区节点（MCP、LINE、PDF 等）
* ✅ 多平台支持（自动选择架构）