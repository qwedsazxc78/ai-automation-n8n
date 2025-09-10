# n8n 社群節點 Docker 映像

多平台 Docker 映像，擴展 n8n 並加入社群節點，遵循 [n8n 官方社群節點安裝方法](https://docs.n8n.io/integrations/community-nodes/installation/manual-install/)。

## ⚠️ 重要注意事項

### 資料持久化與社群節點

如果您已經使用過 n8n 並掛載了資料卷，**新建置的映像將無法覆蓋已存在的社群節點配置**。這是因為：

```yaml
volumes:
  - n8n_data:/home/node/.n8n  # 現有資料會保持不變
```

**環境差異說明：**
- ✅ **Docker Compose**：完全支援，可正常運作
- ⚠️ **Kubernetes**：PVC 無法在多個 n8n Pod 間共享，可能造成問題

### 🔍 驗證社群節點安裝

要確認社群節點是否正確安裝，請按照以下步驟：

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

**如果社群節點未正確安裝：**
1. 清除現有資料卷：`docker-compose down -v`
2. 重新建置映像並啟動服務
3. 再次驗證安裝結果

## 功能特點

* **多平台支援**：支援 AMD64 (Intel/AMD) 和 ARM64 (Apple Silicon) - Docker 自動選擇正確架構
* **社群節點**：使用官方 n8n 方法預先安裝擴充套件 (`~/.n8n/nodes`)
* **彈性配置**：透過環境變數自訂 n8n 版本、節點和映像標籤
* **PostgreSQL 整合**：具備資料庫持久化，可用於生產環境
* **本地測試**：無需 Docker Hub 即可在本地建置和測試
* **Docker Compose 就緒**：包含完整的 docker-compose.yml 設置

## 預設社群節點

本映像預設包含以下社群節點：

### 核心整合節點
* **n8n-nodes-mcp** - MCP (Model Context Protocol) 節點，用於與 AI 模型整合
* **n8n-nodes-linewebhook** - LINE 訊息平台 webhook 整合節點
* **n8n-nodes-ragic** - [Ragic](https://www.ragic.com/) 整合節點，用於連接 Ragic 線上資料庫系統

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

想要發現更多強大的社群節點？請查看：

🌟 **[Awesome N8N: Top 100 Community Nodes](https://github.com/restyler/awesome-n8n)**

這個精選列表包含超過 100 個社群節點，涵蓋各種整合：
- AI/ML 服務整合
- 社交媒體平台
- 雲端儲存服務
- 資料庫連接器
- 通訊工具
- 以及更多...

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

💡 **提示**：從 [Awesome N8N](https://github.com/restyler/awesome-n8n) 尋找更多節點！

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
| `COMMUNITY_NODES` | 空格分隔的節點列表 | `n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic` |
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
