# Zeabur n8n 部署

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

## 📋 部署說明

此目錄包含 Zeabur 平台的 n8n 部署配置。

### 📁 檔案說明

* `n8n.yaml` - Zeabur 部署範本配置
* `deploy.sh` - 部署腳本
* `README.md` - 繁體中文說明文件
* `README-EN.md` - 英文說明文件
* `README-CN.md` - 簡體中文說明文件

### 🚀 快速部署

#### 一鍵部署按鈕（推薦）

[![Deploy on Zeabur](https://zeabur.com/button.svg)](https://zeabur.com/templates/0TUVZ7?referralCode=qwedsazxc78)

### ⚙️ 配置說明

部署範本包含以下服務：

* **n8n**: 主要工作流程自動化平台
* **PostgreSQL**: 資料庫服務
* **Redis**: 快取服務（選用）

### 🔧 環境變數

主要環境變數配置：

* `N8N_BASIC_AUTH_USER`: n8n 登入使用者名稱
* `N8N_BASIC_AUTH_PASSWORD`: n8n 登入密碼
* `POSTGRES_USER`: PostgreSQL 使用者名稱
* `POSTGRES_PASSWORD`: PostgreSQL 密碼
* `POSTGRES_DB`: PostgreSQL 資料庫名稱

### 📝 注意事項

1. **帳號註冊**: 如果沒有 Zeabur 帳號，需要先註冊
2. **推薦碼**: 使用推薦碼 `qwedsazxc78` 可獲得額外使用額度
3. **費用**: Zeabur 採用按用量計費，約 $5/月起
4. **SSL**: Zeabur 自動提供 SSL 憑證

### 🔗 相關連結

* [Zeabur 官方網站](https://zeabur.com/)
* [n8n 官方文件](https://docs.n8n.io/)
* [專案 GitHub](https://github.com/qwedsazxc78/ai-automation-n8n)

### 🆘 支援

如果遇到問題，請參考：

* [Zeabur 文件](https://zeabur.com/docs)
* [n8n 社群](https://community.n8n.io/)
* [專案 Issues](https://github.com/qwedsazxc78/ai-automation-n8n/issues)
