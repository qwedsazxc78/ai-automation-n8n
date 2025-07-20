# n8n 基本 Docker Compose 設置，加上 ngrok 可進行公開存取

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

用於運行 n8n 工作流自動化工具
此配置為在本地運行 n8n 容器所需的基礎設置，並搭配 PostgreSQL 資料庫和 ngrok 進行公開存取。

## 功能特點

* n8n 工作流自動化平台
* PostgreSQL 資料庫用於持久化儲存
* ngrok 用於安全的公開存取
* 環境變數配置
* 網路和檔案配置管理

## 使用方法

### 1. 創建 .env 檔案

複製範例環境檔案：

```bash
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
POSTGRES_PASSWORD=your_secure_password
POSTGRES_DB=n8n
POSTGRES_PORT=5432

# n8n 配置
N8N_PORT=5678
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=your_secure_password
N8N_PROTOCOL=https

# ngrok 配置
NGROK_AUTHTOKEN=your_ngrok_authtoken
NGROK_REGION=us  # 選項：us, eu, au, ap, sa, jp, in
```

### 2. 獲取 ngrok 認證令牌

1. 在 [ngrok.com](https://ngrok.com) 註冊一個免費帳戶
2. 從 ngrok 儀表板獲取您的認證令牌
3. 將其添加到您的 `.env` 檔案中

### 3. 啟動服務

```bash
docker-compose up -d
```

### 4. 訪問 n8n

* **本地訪問**：http://localhost:5678
* **公開存取**：ngrok URL 將顯示在 ngrok 後台中：

預設憑證：
* 用戶名：admin
* 密碼：adminpass

可以在 `.env` 檔案中更改這些憑證。

重啟 n8n 容器，改變 URL：

```bash
docker-compose restart n8n
```

### 5. 停止服務

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
| N8N_PROTOCOL | Webhook URL 的協議 | https |
| NGROK_AUTHTOKEN | 您的 ngrok 認證令牌 | - |
| NGROK_SUBDOMAIN | 自定義子域名（付費帳戶） | - |
| NGROK_PUBLIC_URL  | 對外網域 | https://domain |

## 生產環境安全考量

* 在 `.env` 檔案中更改所有預設密碼
* 使用強大且唯一的密碼
* 考慮在生產環境中，使用密鑰管理解決方案
* 使用基本認證限制對 n8n 服務的訪問
