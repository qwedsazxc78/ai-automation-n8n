# n8n 社群節點 Docker 映像

支援多平台的 Docker 映像，內建多種社群節點擴充 n8n 功能。本映像遵循 [n8n 官方社群節點安裝指南](https://docs.n8n.io/integrations/community-nodes/installation/manual-install/)。

## ⚠️ 重要注意事項

### 資料持久化與社群節點

如果您已有掛載資料卷的 n8n 實例，**新建置的映像不會覆蓋現有的社群節點配置**。原因如下：

```yaml
volumes:
  - n8n_data:/home/node/.n8n  # 現有資料會保持不變
```

**環境支援說明：**
- ✅ **Docker Compose**：完全支援，正常運作
- ⚠️ **Kubernetes**：PVC 無法在多個 n8n Pod 間共享，可能有相容性問題

### 🔍 驗證社群節點安裝

請使用以下方法確認社群節點是否正確安裝：

**方法 1：使用容器終端**
```bash
# 進入容器
docker exec -it <container-name> sh

# 檢查社群節點目錄
cd /home/node/.n8n/nodes
ls -la

# 查看 package.json 內容
cat package.json
```

**方法 2：通過 Docker Compose**
```bash
# 檢查社群節點安裝狀態
docker-compose exec n8n ls -la /home/node/.n8n/nodes/
docker-compose exec n8n cat /home/node/.n8n/nodes/package.json
```

**預期結果：**
您應該看到類似以下的 package.json 內容：
```json
{
  "dependencies": {
    "@tavily/core": "^0.5.11",
    "n8n-nodes-discord-trigger": "^0.8.0",
    "n8n-nodes-document-generator": "^1.0.10",
    "n8n-nodes-edit-image-plus": "^0.1.10",
    "n8n-nodes-linewebhook": "^0.1.50",
    "n8n-nodes-mcp": "^0.1.29",
    "n8n-nodes-pdfco": "^1.0.6",
    "n8n-nodes-qrcode": "^0.1.0",
    "n8n-nodes-ragic": "^2.3.1",
    "n8n-nodes-webpage-content-extractor": "^0.1.3"
  }
}
```

**若社群節點未正確安裝：**
1. 清除現有資料卷：`docker-compose down -v`
2. 重新建置映像並啟動服務
3. 再次驗證安裝結果

## 功能特點

* **多平台支援**：支援 AMD64 (Intel/AMD) 和 ARM64 (Apple Silicon) 架構，Docker 會自動選擇合適的版本
* **社群節點整合**：依照官方 n8n 標準方法預裝擴充套件 (`~/.n8n/nodes`)
* **彈性配置**：使用環境變數輕鬆調整 n8n 版本、節點和映像標籤
* **PostgreSQL 資料庫**：內建資料庫持久化支援，適合生產環境使用
* **本地測試優先**：不需 Docker Hub 帳號即可本地建置和測試
* **Docker Compose 完整配置**：提供完整的 docker-compose.yml 設定檔

## 預設社群節點

本映像已預裝以下常用社群節點：

### 核心整合節點
* **n8n-nodes-mcp** - MCP (Model Context Protocol) 節點，讓您輕鬆串接 AI 模型
* **n8n-nodes-linewebhook** - LINE 訊息平台 webhook 整合，支援完整的 LINE 機器人功能
* **n8n-nodes-ragic** - [Ragic](https://www.ragic.com/) 線上資料庫整合，簡化資料管理流程

### 推薦額外節點

#### 通訊與社群
* **n8n-nodes-discord-trigger** - Discord 觸發器節點，監聽 Discord 事件與訊息

#### 文件處理
* **n8n-nodes-document-generator** - 文件生成器，支援多種格式的文件建立
* **n8n-nodes-pdfco** - PDF.co 整合，提供 PDF 處理、轉換和編輯功能
* **n8n-nodes-webpage-content-extractor** - 網頁內容擷取器，智慧提取網頁資訊

#### 工具與實用程式
* **n8n-nodes-qrcode** - QR Code 生成與解析節點
* **n8n-nodes-edit-image-plus** - 進階圖片編輯功能，支援多種圖片處理操作
* **@tavily/core** - Tavily AI 搜尋引擎整合，提供智慧網路搜尋功能

### 探索更多社群節點

想要找到更多強大的社群節點嗎？

🌟 **[Awesome N8N: Top 100 Community Nodes](https://github.com/restyler/awesome-n8n)**

這份精選清單收錄了超過 100 個優質社群節點：
- AI/ML 服務整合
- 社交媒體平台
- 雲端儲存服務
- 資料庫連接器
- 通訊工具
- 實在有夠多！

## 快速開始

### 選項 1：使用預建映像（最快速）

```bash
# 拉取映像（Docker 會自動選擇合適的架構）
docker pull your-dockerhub-username/n8n-community:latest

# 啟動 n8n 服務
docker run -p 5678:5678 your-dockerhub-username/n8n-community:latest
```

### 選項 2：本地建置和測試（推薦開發者使用）

```bash
# 1. 複製並設定環境變數
cp .env.example .env
# 編輯 .env 檔案，調整您的設定

# 2. 執行本地建置（不需要 Docker Hub 帳號）
./build.sh
# 輸入 1 選擇本地測試模式

# 3. 啟動服務
docker-compose up -d

# 4. 開啟瀏覽器訪問 n8n
# 網址：http://localhost:5678
# 預設帳號密碼：admin/adminpass
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
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic"

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
# 情境 1：本地開發測試
./build.sh
> 請選擇 (1 或 2): 1
# 將為您目前的系統架構建置映像

# 情境 2：發布至 Docker Hub
./build.sh
> 請選擇 (1 或 2): 2
# 需要先執行 docker login
# 會同時建置 AMD64 和 ARM64 版本
```

## Docker Compose 完整配置

提供的 `docker-compose.yml` 包含：
* n8n 主服務（已內建社群節點）
* PostgreSQL 資料庫服務
* 資料持久化卷設定
* 容器網路配置
* 完整環境變數支援

### 常用指令

```bash
# 啟動所有服務
docker-compose up -d

# 查看 n8n 執行日誌
docker-compose logs -f n8n

# 停止服務（保留資料）
docker-compose down

# 完全清除（包含資料卷）
docker-compose down -v
```

## 運作原理

### Dockerfile 架構說明

1. **基礎映像**：使用 `n8nio/n8n:${N8N_VERSION}`（版本可調整）
2. **節點安裝**：在 `~/.n8n/nodes` 目錄下安裝社群節點
3. **權限設定**：確保 node 使用者擁有正確的檔案權限
4. **套件安裝**：以 node 使用者身份執行 `npm install`

本作法完全遵照 n8n 官方手動安裝社群節點的標準流程。

### 社群節點管理

編輯 .env 檔案中的 `COMMUNITY_NODES` 變數即可新增或移除節點：

```env
# 單一節點
COMMUNITY_NODES="n8n-nodes-mcp"

# 多個節點（預設配置）
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic"

# 添加自訂節點
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic n8n-nodes-your-custom"
```

#### 常用社群節點範例

```env
# AI/LLM 整合
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-openai-assistant n8n-nodes-langchain @tavily/core"

# 台灣本地服務
COMMUNITY_NODES="n8n-nodes-linewebhook n8n-nodes-ragic"

# 文件與內容處理
COMMUNITY_NODES="n8n-nodes-document-generator n8n-nodes-pdfco n8n-nodes-webpage-content-extractor"

# 社群平台整合
COMMUNITY_NODES="n8n-nodes-discord-trigger n8n-nodes-linewebhook"

# 圖像與媒體處理
COMMUNITY_NODES="n8n-nodes-qrcode n8n-nodes-edit-image-plus"

# 資料庫與 API
COMMUNITY_NODES="n8n-nodes-mongodb n8n-nodes-graphql n8n-nodes-redis"

# 完整功能套組（包含所有推薦節點）
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic n8n-nodes-discord-trigger n8n-nodes-qrcode n8n-nodes-webpage-content-extractor n8n-nodes-document-generator n8n-nodes-pdfco @tavily/core n8n-nodes-edit-image-plus"
```

💡 **小技巧**：到 [Awesome N8N](https://github.com/restyler/awesome-n8n) 探索更多優質節點！

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

### 建置問題解決

```bash
# 確認 Docker 服務狀態
docker version

# 驗證 buildx 工具是否安裝
docker buildx version

# 遇到問題時，重置建置器
docker buildx rm n8n-multiplatform
```

### 社群節點載入問題

```bash
# 確認節點安裝狀態
docker exec n8n-container ls -la /home/node/.n8n/nodes

# 查看相關錯誤訊息
docker-compose logs n8n | grep -i "node"
```

### 腳本輸入問題

建置腳本會自動清除輸入的多餘空格。若遇到問題，請確保只輸入數字 "1" 或 "2"，避免輸入其他字元。

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

## Docker Compose 使用指南

### PostgreSQL 資料庫整合

1. **初始化環境設定**：
```bash
cp .env.example .env
# 編輯 .env 檔案，設定您的參數
```

2. **啟動全部服務**：
```bash
docker-compose up -d
```

3. **存取 n8n 管理介面**：
* 網址：http://localhost:5678
* 預設帳號/密碼：admin/adminpass（可在 .env 修改）

4. **停止服務選項**：
```bash
# 保留資料
docker-compose down

# 完全清除（包含資料卷）
docker-compose down -v
```

## 環境變數

| 變數 | 描述 | 預設值 |
|----------|-------------|---------|
| `DOCKER_USERNAME` | Docker Hub 使用者名稱 | 建置時必需 |
| `IMAGE_NAME` | Docker 映像名稱 | `n8n-community` |
| `IMAGE_TAG` | Docker 映像標籤 | `latest` |
| `N8N_VERSION` | n8n 基礎映像版本 | `1.109.2` |
| `COMMUNITY_NODES` | 空格分隔的節點列表 | `n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic` |
| `PLATFORMS` | 建置平台 | `linux/amd64,linux/arm64` |
| `POSTGRES_USER` | PostgreSQL 使用者名稱 | `n8n` |
| `POSTGRES_PASSWORD` | PostgreSQL 密碼 | `n8npass` |
| `N8N_BASIC_AUTH_USER` | n8n 登入使用者名稱 | `admin` |
| `N8N_BASIC_AUTH_PASSWORD` | n8n 登入密碼 | `adminpass` |

## 系統需求

### 建置映像最低需求
* Docker 20.10 或更高版本
* Docker buildx 工具
* Docker Hub 帳號（發布時需要）

## 常見問題與解決方案

### 映像建置相關
* 確認 buildx 安裝：`docker buildx version`
* Docker Hub 登入：`docker login`
* 查看建置器清單：`docker buildx ls`

### 執行階段問題
* 檢查映像架構：`docker image inspect your-username/n8n-community:latest | grep Architecture`
* 查看容器日誌：`docker logs container-name`
* 驗證連接埠狀態：`lsof -i :5678`
