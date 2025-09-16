# n8n + Qdrant 向量資料庫 RAG 系統

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁體中文](./README.md)

本資料夾包含整合 n8n、Qdrant 向量資料庫和 Ollama 的 RAG (Retrieval-Augmented Generation) 系統配置。此系統支援文件向量化儲存、語義搜尋和智能問答功能。

## 系統架構

- **n8n**: 工作流程自動化平台，負責協調 RAG 流程
- **Qdrant**: 高性能向量資料庫，用於儲存和檢索文件向量
- **PostgreSQL**: n8n 的後端資料庫
- **Ollama** (選用): 本地大型語言模型服務

## 環境變數說明

### PostgreSQL 設定
- `POSTGRES_USER`: 資料庫使用者名稱（預設：n8n）
- `POSTGRES_PASSWORD`: 資料庫密碼（預設：n8npass）
- `POSTGRES_DB`: 資料庫名稱（預設：n8n）
- `POSTGRES_PORT`: 資料庫連接埠（預設：5432）

### n8n 設定
- `N8N_PORT`: n8n 服務連接埠（預設：5678）
- `N8N_BASIC_AUTH_USER`: n8n 登入使用者名稱（預設：admin）
- `N8N_BASIC_AUTH_PASSWORD`: n8n 登入密碼（預設：adminpass）
- `N8N_HOST`: n8n 主機名稱（預設：localhost）
- `WEBHOOK_URL`: Webhook 基礎 URL（預設：http://localhost:5678）

### Qdrant 設定
- `QDRANT_PORT`: Qdrant HTTP API 連接埠（預設：6333）
- `QDRANT_GRPC_PORT`: Qdrant gRPC 連接埠（預設：6334）
- `QDRANT_LOG_LEVEL`: 日誌等級（預設：INFO）
- `QDRANT_API_KEY`: API 認證金鑰（選用，生產環境建議設定）

### Ollama 設定
- `OLLAMA_MODEL_PATH`: 模型儲存路徑（預設：/root/.ollama）

## 快速開始

1. **複製環境變數檔案**

```bash
cp .env.example .env
# 編輯 .env 檔案，設定必要的參數
# 注意：生產環境請設定 QDRANT_API_KEY 以啟用 API 認證
```

2. **啟動所有服務**

```bash
docker-compose up -d
```

3. **驗證服務狀態**

```bash
# 檢查服務是否正常運行
docker-compose ps

# n8n: http://localhost:5678
# Qdrant: http://localhost:6333
# PostgreSQL: localhost:5432
```

## Qdrant 向量資料庫使用說明

### 1. Qdrant 基本概念

- **Collection**: 向量集合，類似資料表，用於儲存相關的向量資料
- **Point**: 向量資料點，包含向量值和可選的 payload（元資料）
- **Vector**: 數值陣列，代表文件或資料的語義特徵
- **Payload**: 與向量關聯的元資料（如文件內容、來源、時間戳等）

### 2. Qdrant API 範例

#### 建立 Collection

```bash
# 無 API 金鑰（開發環境）
curl -X PUT http://localhost:6333/collections/documents \
  -H 'Content-Type: application/json' \
  -d '{
    "vectors": {
      "size": 1536,
      "distance": "Cosine"
    }
  }'

# 使用 API 金鑰（生產環境）
curl -X PUT http://localhost:6333/collections/documents \
  -H 'Content-Type: application/json' \
  -H 'api-key: ${QDRANT_API_KEY}' \
  -d '{
    "vectors": {
      "size": 1536,
      "distance": "Cosine"
    }
  }'
```

#### 插入向量資料

```bash
# 無 API 金鑰（開發環境）
curl -X PUT http://localhost:6333/collections/documents/points \
  -H 'Content-Type: application/json' \
  -d '{
    "points": [
      {
        "id": 1,
        "vector": [0.05, 0.61, 0.76, ...],
        "payload": {
          "content": "這是文件內容",
          "source": "document.pdf",
          "page": 1
        }
      }
    ]
  }'

# 使用 API 金鑰（生產環境）
curl -X PUT http://localhost:6333/collections/documents/points \
  -H 'Content-Type: application/json' \
  -H 'api-key: ${QDRANT_API_KEY}' \
  -d '{
    "points": [
      {
        "id": 1,
        "vector": [0.05, 0.61, 0.76, ...],
        "payload": {
          "content": "這是文件內容",
          "source": "document.pdf",
          "page": 1
        }
      }
    ]
  }'
```

#### 搜尋相似向量

```bash
# 無 API 金鑰（開發環境）
curl -X POST http://localhost:6333/collections/documents/points/search \
  -H 'Content-Type: application/json' \
  -d '{
    "vector": [0.2, 0.1, 0.9, ...],
    "limit": 5,
    "with_payload": true
  }'

# 使用 API 金鑰（生產環境）
curl -X POST http://localhost:6333/collections/documents/points/search \
  -H 'Content-Type: application/json' \
  -H 'api-key: ${QDRANT_API_KEY}' \
  -d '{
    "vector": [0.2, 0.1, 0.9, ...],
    "limit": 5,
    "with_payload": true
  }'
```

## 在 n8n 中整合 Qdrant

### 1. 使用 n8n 的 Qdrant 節點

n8n 提供原生的 Qdrant 節點，支援以下操作：

- **Document Store**: 儲存文件並自動產生向量
- **Vector Store**: 直接儲存向量資料
- **Retrieve**: 檢索相似文件或向量

### 2. 建立 RAG 工作流程範例

#### 步驟 1: 文件向量化流程

```
1. 觸發器節點（Webhook/Schedule）
2. 讀取文件（Files/HTTP Request）
3. 文字分割節點（Text Splitter）
4. 向量化節點（OpenAI Embeddings）
5. Qdrant Document Store 節點
```

#### 步驟 2: 問答流程

```
1. Webhook 觸發器（接收使用者問題）
2. 向量化使用者問題（OpenAI Embeddings）
3. Qdrant Retrieve 節點（檢索相關文件）
4. 構建 Prompt（Code 節點）
5. LLM 生成回答（OpenAI/Ollama）
6. 回傳結果（Webhook Response）
```

### 3. Qdrant 節點設定

在 n8n 中設定 Qdrant 連線：

1. **Host**: `qdrant` (Docker 網路內部) 或 `localhost` (外部連線)
2. **Port**: `6333`
3. **API Key**: 如果設定了 `QDRANT_API_KEY`，需要在 n8n 的 Qdrant 憑證中填入
4. **Collection Name**: 自訂名稱（如 `documents`）
5. **Vector Size**: 根據使用的 Embedding 模型（OpenAI: 1536, Ollama: 依模型而定）

### 4. 使用 HTTP Request 節點操作 Qdrant

如果需要更靈活的操作，可使用 HTTP Request 節點：

```json
{
  "method": "POST",
  "url": "http://qdrant:6333/collections/{{$node.parameters.collection}}/points/search",
  "headers": {
    "Content-Type": "application/json"
  },
  "body": {
    "vector": "{{$json.embedding}}",
    "limit": 5,
    "with_payload": true
  }
}
```

## 常見問題

### Qdrant 相關

1. **無法連接 Qdrant**
   - 確認 Docker 容器是否運行中：`docker ps | grep qdrant`
   - 檢查埠號是否正確（預設 6333）
   - 在 n8n 內部使用服務名稱 `qdrant` 而非 `localhost`

2. **Collection 建立失敗**
   - 檢查向量維度是否與 Embedding 模型匹配
   - OpenAI text-embedding-ada-002: 1536 維
   - 其他模型請查詢相關文件

3. **搜尋結果不準確**
   - 確認使用相同的 Embedding 模型進行索引和查詢
   - 調整搜尋參數（如 limit、score_threshold）
   - 考慮重新索引資料

### n8n 整合問題

1. **Qdrant 節點找不到**
   - 確認 n8n 版本支援 Qdrant（需要較新版本）
   - 可使用 HTTP Request 節點作為替代方案

2. **向量化速度慢**
   - 考慮批次處理文件
   - 使用本地 Embedding 模型（如 Ollama）減少 API 呼叫

## 進階設定

### 效能優化

1. **Qdrant 記憶體配置**
   - 編輯 docker-compose.yml 增加記憶體限制
   ```yaml
   qdrant:
     mem_limit: 4g
     mem_reservation: 2g
   ```

2. **批次索引優化**
   - 使用批次插入而非單筆插入
   - 建議批次大小：100-1000 個向量

3. **持久化設定**
   - Qdrant 資料預設儲存在 Docker volume
   - 備份：`docker run --rm -v qdrant_data:/data -v $(pwd):/backup busybox tar czf /backup/qdrant-backup.tar.gz /data`

### 安全性設定

1. **Qdrant API 金鑰**（生產環境）
   - 在 `.env` 檔案中設定 `QDRANT_API_KEY`
   - API 金鑰會自動傳遞給 Qdrant 容器
   - 當設定 API 金鑰後，所有 API 請求都需要包含認證標頭：
   ```bash
   curl -H "api-key: your_api_key" http://localhost:6333/collections
   ```

2. **網路隔離**
   - 生產環境建議將 Qdrant 放在內部網路
   - 僅允許 n8n 容器存取

## 完整 RAG 範例工作流程

### 使用案例：知識庫問答系統

1. **資料準備階段**
   - 收集文件（PDF、Word、網頁）
   - 切分文件為適當大小的片段（建議 500-1000 字元）
   - 產生每個片段的向量表示

2. **建立索引**
   - 建立 Qdrant collection
   - 批次插入文件向量和元資料
   - 建立必要的索引以加速搜尋

3. **查詢處理**
   - 接收使用者問題
   - 向量化問題
   - 搜尋最相關的 K 個文件片段
   - 組合上下文並生成回答

4. **持續優化**
   - 收集使用者反饋
   - 調整相似度閾值
   - 定期更新知識庫

## 相關資源

### Qdrant
* [Qdrant 官方文件](https://qdrant.tech/documentation/)
* [Qdrant Python Client](https://github.com/qdrant/qdrant-client)
* [Qdrant REST API](https://qdrant.github.io/qdrant/redoc/index.html)

### n8n RAG 整合
* [n8n AI 節點文件](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain/)
* [n8n Qdrant 節點](https://docs.n8n.io/integrations/builtin/cluster-nodes/sub-nodes/n8n-nodes-langchain.vectorstoreqdrant/)

### Ollama（選用）
* [Ollama 官方文件](https://github.com/ollama/ollama)
* [Ollama 模型庫](https://ollama.com/library)
