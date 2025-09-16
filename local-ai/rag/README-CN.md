# n8n + Qdrant 向量数据库 RAG 系统

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁體中文](./README.md)

本文件夹包含整合 n8n、Qdrant 向量数据库和 Ollama 的 RAG (Retrieval-Augmented Generation) 系统配置。此系统支持文档向量化存储、语义搜索和智能问答功能。

## 系统架构

- **n8n**: 工作流程自动化平台，负责协调 RAG 流程
- **Qdrant**: 高性能向量数据库，用于存储和检索文档向量
- **PostgreSQL**: n8n 的后端数据库
- **Ollama** (可选): 本地大型语言模型服务

## 环境变量说明

### PostgreSQL 设置
- `POSTGRES_USER`: 数据库用户名（默认：n8n）
- `POSTGRES_PASSWORD`: 数据库密码（默认：n8npass）
- `POSTGRES_DB`: 数据库名称（默认：n8n）
- `POSTGRES_PORT`: 数据库连接端口（默认：5432）

### n8n 设置
- `N8N_PORT`: n8n 服务连接端口（默认：5678）
- `N8N_BASIC_AUTH_USER`: n8n 登录用户名（默认：admin）
- `N8N_BASIC_AUTH_PASSWORD`: n8n 登录密码（默认：adminpass）
- `N8N_HOST`: n8n 主机名称（默认：localhost）
- `WEBHOOK_URL`: Webhook 基础 URL（默认：http://localhost:5678）

### Qdrant 设置
- `QDRANT_PORT`: Qdrant HTTP API 连接端口（默认：6333）
- `QDRANT_GRPC_PORT`: Qdrant gRPC 连接端口（默认：6334）
- `QDRANT_LOG_LEVEL`: 日志级别（默认：INFO）
- `QDRANT_API_KEY`: API 认证密钥（可选，生产环境建议设置）

### Ollama 设置
- `OLLAMA_MODEL_PATH`: 模型存储路径（默认：/root/.ollama）

## 快速开始

1. **复制环境变量文件**

```bash
cp .env.example .env
# 编辑 .env 文件，设置必要的参数
# 注意：生产环境请设置 QDRANT_API_KEY 以启用 API 认证
```

2. **启动所有服务**

```bash
docker-compose up -d
```

3. **验证服务状态**

```bash
# 检查服务是否正常运行
docker-compose ps

# n8n: http://localhost:5678
# Qdrant: http://localhost:6333
# PostgreSQL: localhost:5432
```

## Qdrant 向量数据库使用说明

### 1. Qdrant 基本概念

- **Collection**: 向量集合，类似数据表，用于存储相关的向量数据
- **Point**: 向量数据点，包含向量值和可选的 payload（元数据）
- **Vector**: 数值数组，代表文档或数据的语义特征
- **Payload**: 与向量关联的元数据（如文档内容、来源、时间戳等）

### 2. Qdrant API 示例

#### 创建 Collection

```bash
# 无 API 密钥（开发环境）
curl -X PUT http://localhost:6333/collections/documents \
  -H 'Content-Type: application/json' \
  -d '{
    "vectors": {
      "size": 1536,
      "distance": "Cosine"
    }
  }'

# 使用 API 密钥（生产环境）
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

#### 插入向量数据

```bash
# 无 API 密钥（开发环境）
curl -X PUT http://localhost:6333/collections/documents/points \
  -H 'Content-Type: application/json' \
  -d '{
    "points": [
      {
        "id": 1,
        "vector": [0.05, 0.61, 0.76, ...],
        "payload": {
          "content": "这是文档内容",
          "source": "document.pdf",
          "page": 1
        }
      }
    ]
  }'

# 使用 API 密钥（生产环境）
curl -X PUT http://localhost:6333/collections/documents/points \
  -H 'Content-Type: application/json' \
  -H 'api-key: ${QDRANT_API_KEY}' \
  -d '{
    "points": [
      {
        "id": 1,
        "vector": [0.05, 0.61, 0.76, ...],
        "payload": {
          "content": "这是文档内容",
          "source": "document.pdf",
          "page": 1
        }
      }
    ]
  }'
```

#### 搜索相似向量

```bash
# 无 API 密钥（开发环境）
curl -X POST http://localhost:6333/collections/documents/points/search \
  -H 'Content-Type: application/json' \
  -d '{
    "vector": [0.2, 0.1, 0.9, ...],
    "limit": 5,
    "with_payload": true
  }'

# 使用 API 密钥（生产环境）
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

### 1. 使用 n8n 的 Qdrant 节点

n8n 提供原生的 Qdrant 节点，支持以下操作：

- **Document Store**: 存储文档并自动生成向量
- **Vector Store**: 直接存储向量数据
- **Retrieve**: 检索相似文档或向量

### 2. 创建 RAG 工作流程示例

#### 步骤 1: 文档向量化流程

```
1. 触发器节点（Webhook/Schedule）
2. 读取文档（Files/HTTP Request）
3. 文本分割节点（Text Splitter）
4. 向量化节点（OpenAI Embeddings）
5. Qdrant Document Store 节点
```

#### 步骤 2: 问答流程

```
1. Webhook 触发器（接收用户问题）
2. 向量化用户问题（OpenAI Embeddings）
3. Qdrant Retrieve 节点（检索相关文档）
4. 构建 Prompt（Code 节点）
5. LLM 生成回答（OpenAI/Ollama）
6. 返回结果（Webhook Response）
```

### 3. Qdrant 节点设置

在 n8n 中设置 Qdrant 连接：

1. **Host**: `qdrant` (Docker 网络内部) 或 `localhost` (外部连接)
2. **Port**: `6333`
3. **API Key**: 如果设置了 `QDRANT_API_KEY`，需要在 n8n 的 Qdrant 凭证中填入
4. **Collection Name**: 自定义名称（如 `documents`）
5. **Vector Size**: 根据使用的 Embedding 模型（OpenAI: 1536, Ollama: 依模型而定）

### 4. 使用 HTTP Request 节点操作 Qdrant

如果需要更灵活的操作，可使用 HTTP Request 节点：

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

## 常见问题

### Qdrant 相关

1. **无法连接 Qdrant**
   - 确认 Docker 容器是否运行中：`docker ps | grep qdrant`
   - 检查端口号是否正确（默认 6333）
   - 在 n8n 内部使用服务名称 `qdrant` 而非 `localhost`

2. **Collection 创建失败**
   - 检查向量维度是否与 Embedding 模型匹配
   - OpenAI text-embedding-ada-002: 1536 维
   - 其他模型请查询相关文档

3. **搜索结果不准确**
   - 确认使用相同的 Embedding 模型进行索引和查询
   - 调整搜索参数（如 limit、score_threshold）
   - 考虑重新索引数据

### n8n 整合问题

1. **Qdrant 节点找不到**
   - 确认 n8n 版本支持 Qdrant（需要较新版本）
   - 可使用 HTTP Request 节点作为替代方案

2. **向量化速度慢**
   - 考虑批次处理文档
   - 使用本地 Embedding 模型（如 Ollama）减少 API 调用

## 进阶设置

### 性能优化

1. **Qdrant 内存配置**
   - 编辑 docker-compose.yml 增加内存限制
   ```yaml
   qdrant:
     mem_limit: 4g
     mem_reservation: 2g
   ```

2. **批次索引优化**
   - 使用批次插入而非单笔插入
   - 建议批次大小：100-1000 个向量

3. **持久化设置**
   - Qdrant 数据默认存储在 Docker volume
   - 备份：`docker run --rm -v qdrant_data:/data -v $(pwd):/backup busybox tar czf /backup/qdrant-backup.tar.gz /data`

### 安全性设置

1. **Qdrant API 密钥**（生产环境）
   - 在 `.env` 文件中设置 `QDRANT_API_KEY`
   - API 密钥会自动传递给 Qdrant 容器
   - 当设置 API 密钥后，所有 API 请求都需要包含认证标头：
   ```bash
   curl -H "api-key: your_api_key" http://localhost:6333/collections
   ```

2. **网络隔离**
   - 生产环境建议将 Qdrant 放在内部网络
   - 仅允许 n8n 容器访问

## 完整 RAG 示例工作流程

### 使用案例：知识库问答系统

1. **数据准备阶段**
   - 收集文档（PDF、Word、网页）
   - 切分文档为适当大小的片段（建议 500-1000 字符）
   - 生成每个片段的向量表示

2. **创建索引**
   - 创建 Qdrant collection
   - 批次插入文档向量和元数据
   - 创建必要的索引以加速搜索

3. **查询处理**
   - 接收用户问题
   - 向量化问题
   - 搜索最相关的 K 个文档片段
   - 组合上下文并生成回答

4. **持续优化**
   - 收集用户反馈
   - 调整相似度阈值
   - 定期更新知识库

## 相关资源

### Qdrant
- [Qdrant 官方文档](https://qdrant.tech/documentation/)
- [Qdrant Python Client](https://github.com/qdrant/qdrant-client)
- [Qdrant REST API](https://qdrant.github.io/qdrant/redoc/index.html)

### n8n RAG 整合
- [n8n AI 节点文档](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain/)
- [n8n Qdrant 节点](https://docs.n8n.io/integrations/builtin/cluster-nodes/sub-nodes/n8n-nodes-langchain.vectorstoreqdrant/)

### Ollama（可选）
- [Ollama 官方文档](https://github.com/ollama/ollama)
- [Ollama 模型库](https://ollama.com/library)