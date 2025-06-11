# n8n Docker Compose 設置 in AWS

用於運行 n8n 工作流自動化工具
此配置為在 aws 運行 n8n 容器所需的基礎設置，並搭配 PostgreSQL 資料庫。

## 功能特點

* n8n 工作流自動化平台
* PostgreSQL 資料庫用於持久化儲存
* 環境變數配置
* 網路和檔案配置管理

## 使用方法

### 1. 創建 .env 檔案

複製範例環境檔案：

```bash
   cd ~/ai-automation-n8n/cloud-ai/aws
   cp .env.example .env
```

編輯 `.env` 檔案並設置你的環境變數：

```bash
   vim .env
```

環境變數：

```
# 資料庫配置
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8npass
POSTGRES_DB=n8n
POSTGRES_PORT=5432

# n8n 配置
N8N_PORT=5678
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpass
N8N_HOST=localhost (修改為最後的domain)
WEBHOOK_URL=http://localhost:5678 (修改為最後的domain)
```

### 2. 啟動服務

```bash
docker-compose up -d
```

* **本地訪問**：http://localhost:5678
* **公開訪問**：確認 aws 服務配置的 IP

預設憑證：
* 用戶名：admin
* 密碼：adminpass

可以在 `.env` 檔案中更改這些憑證。

### 3. 停止服務

```bash
docker-compose down
```

要移除所有資料檔案：

```bash
docker-compose down -v
```

## 環境變數

| 變數 | 描述 | 預設值 |
|----------|-------------|---------|
| POSTGRES_USER | PostgreSQL 用戶名 | n8n |
| POSTGRES_PASSWORD | PostgreSQL 密碼 | change_this_password |
| POSTGRES_DB | PostgreSQL 資料庫名稱 | n8n |
| POSTGRES_PORT | PostgreSQL 端口 | 5432 |
| N8N_PORT | n8n 網頁界面端口 | 5678 |
| N8N_BASIC_AUTH_USER | n8n 基本認證用戶名 | admin |
| N8N_BASIC_AUTH_PASSWORD | n8n 基本認證密碼 | change_this_password |
