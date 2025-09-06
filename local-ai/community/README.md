# n8n 社群節點 Docker 映像

多平台 Docker 映像，擴展 n8n 並加入社群節點，遵循 [n8n 官方社群節點安裝方法](https://docs.n8n.io/integrations/community-nodes/installation/manual-install/)。

## 功能特點

* **多平台支援**：支援 AMD64 (Intel/AMD) 和 ARM64 (Apple Silicon) - Docker 自動選擇正確架構
* **社群節點**：使用官方 n8n 方法預先安裝擴充套件 (`~/.n8n/nodes`)
* **彈性配置**：透過環境變數自訂 n8n 版本、節點和映像標籤
* **PostgreSQL 整合**：具備資料庫持久化，可用於生產環境
* **本地測試**：無需 Docker Hub 即可在本地建置和測試
* **Docker Compose 就緒**：包含完整的 docker-compose.yml 設置

## 快速開始

### 選項 1：使用預建映像

```bash
# 拉取並執行（Docker 自動選擇架構）
docker pull your-dockerhub-username/n8n-community:latest
docker run -p 5678:5678 your-dockerhub-username/n8n-community:latest
```

### 選項 2：本地建置和測試

```bash
# 1. 設置環境
cp .env.example .env
# 編輯 .env 設定檔

# 2. 本地建置（無需 Docker Hub 登入）
./build.sh
# 選擇選項 1 進行本地測試

# 3. 使用 docker-compose 執行
docker-compose up -d

# 4. 訪問 n8n
# http://localhost:5678
# 預設登入：admin/adminpass
```

## 配置

### 環境變數 (.env)

```env
# Docker 映像配置
DOCKER_USERNAME=your-dockerhub-username
IMAGE_NAME=n8n-community
IMAGE_TAG=latest

# n8n 基礎映像版本
N8N_VERSION=1.109.2

# 社群節點（空格分隔）
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook"

# 建置平台
PLATFORMS=linux/amd64,linux/arm64

# PostgreSQL 配置
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8npass
POSTGRES_DB=n8n

# n8n 認證
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpass
```

## 建置腳本

### build.sh / build.bat

兩個腳本都提供兩個選項：

1. **本地建置**（無需 Docker Hub 登入）
   * 僅為當前架構建置
   * 建立本地映像用於測試
   * 適合開發使用

2. **多平台推送**（需要 Docker Hub）
   * 為 AMD64 和 ARM64 建置
   * 推送至 Docker Hub
   * 建立多平台清單

### 使用範例

```bash
# 本地測試（建議用於開發）
./build.sh
輸入選擇 (1 或 2): 1

# 多平台發布
./build.sh
輸入選擇 (1 或 2): 2
# 需要 Docker Hub 登入
```

## Docker Compose

包含的 `docker-compose.yml` 提供：
* n8n 與社群節點（使用 .env 中的映像）
* PostgreSQL 資料庫
* 持久化儲存卷
* 網路配置
* 環境變數支援

### 指令

```bash
# 啟動服務
docker-compose up -d

# 查看日誌
docker-compose logs -f n8n

# 停止服務
docker-compose down

# 移除所有資料
docker-compose down -v
```

## 運作原理

### Dockerfile 結構

1. **基礎映像**：使用 `n8nio/n8n:${N8N_VERSION}`（可配置）
2. **節點安裝**：建立 `~/.n8n/nodes` 目錄
3. **權限**：設置 node 使用者的正確擁有權
4. **安裝**：以 node 使用者在正確目錄執行 `npm i`

這遵循 n8n 官方文件的手動社群節點安裝方法。

### 社群節點

透過編輯 .env 中的 `COMMUNITY_NODES` 來新增或移除節點：

```env
# 單一節點
COMMUNITY_NODES="n8n-nodes-mcp"

# 多個節點
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-your-custom"
```

### 更新 n8n 版本

只需在 .env 中更改 `N8N_VERSION`：

```env
# 更新至最新版本
N8N_VERSION=1.110.0
```

## 架構支援

| 平台 | 架構 | 支援 |
|----------|-------------|---------|
| macOS (Apple Silicon) | ARM64 | ✅ 原生 |
| macOS (Intel) | AMD64 | ✅ 原生 |
| Linux | AMD64 | ✅ 原生 |
| Linux | ARM64 | ✅ 原生 |
| Windows | AMD64 | ✅ 透過 Docker Desktop |
| Windows | ARM64 | ✅ 透過 Docker Desktop |

## 疑難排解

### 建置問題

```bash
# 檢查 Docker 是否運行中
docker version

# 檢查 buildx 是否可用
docker buildx version

# 如需要，重置建置器
docker buildx rm n8n-multiplatform
```

### 社群節點無法載入

```bash
# 驗證節點是否已安裝
docker exec n8n-container ls -la /home/node/.n8n/nodes

# 檢查 n8n 日誌
docker-compose logs n8n | grep -i "node"
```

### 輸入處理問題

建置腳本會修剪使用者輸入的空白字元。如果遇到問題，請確保只輸入 "1" 或 "2"，不要有額外字元。

## 檔案結構

```
community/
├── Dockerfile           # 多階段建置，支援 ARG
├── docker-compose.yml   # 完整的 n8n + PostgreSQL 設置
├── build.sh            # Unix/Linux/macOS 建置腳本
├── build.bat           # Windows 建置腳本
├── .env.example        # 配置範本
└── README.md           # 本檔案
```

## Docker Compose 使用方法

### 使用 PostgreSQL 資料庫

1. **設置環境**：
```bash
cp .env.example .env
# 編輯 .env 設定您的憑證
```

2. **啟動服務**：
```bash
docker-compose up -d
```

3. **訪問 n8n**：
* 本地：http://localhost:5678
* 預設憑證：admin/adminpass（在 .env 中設定）

4. **停止服務**：
```bash
docker-compose down
# 移除資料卷：docker-compose down -v
```

## 環境變數

| 變數 | 描述 | 預設值 |
|----------|-------------|---------|
| `DOCKER_USERNAME` | Docker Hub 使用者名稱 | 建置時必需 |
| `IMAGE_NAME` | Docker 映像名稱 | `n8n-community` |
| `IMAGE_TAG` | Docker 映像標籤 | `latest` |
| `N8N_VERSION` | n8n 基礎映像版本 | `1.109.2` |
| `COMMUNITY_NODES` | 空格分隔的節點列表 | `n8n-nodes-mcp n8n-nodes-linewebhook` |
| `PLATFORMS` | 建置平台 | `linux/amd64,linux/arm64` |
| `POSTGRES_USER` | PostgreSQL 使用者名稱 | `n8n` |
| `POSTGRES_PASSWORD` | PostgreSQL 密碼 | `n8npass` |
| `N8N_BASIC_AUTH_USER` | n8n 登入使用者名稱 | `admin` |
| `N8N_BASIC_AUTH_PASSWORD` | n8n 登入密碼 | `adminpass` |

## 系統需求

建置映像需要：
* Docker 20.10+
* Docker buildx
* Docker Hub 帳號

執行映像需要：
* Docker 20.10+
* 建議 2GB+ RAM

## 疑難排解

### 建置問題
* 確保 Docker buildx 已安裝：`docker buildx version`
* 登入 Docker Hub：`docker login`
* 檢查可用的建置器：`docker buildx ls`

### 執行時問題
* 驗證映像架構：`docker image inspect your-username/n8n-community:latest | grep Architecture`
* 檢查容器日誌：`docker logs container-name`
* 確保端口可用：`lsof -i :5678`

## 支援

* n8n 文件：https://docs.n8n.io
* 社群論壇：https://community.n8n.io
* 本專案：建置問題請建立 issue
