# n8n + Qdrant Vector Database RAG System

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁體中文](./README.md)

This folder contains the configuration for a RAG (Retrieval-Augmented Generation) system integrating n8n, Qdrant vector database, and Ollama. The system supports document vectorization storage, semantic search, and intelligent Q&A functionality.

## System Architecture

- **n8n**: Workflow automation platform that coordinates RAG processes
- **Qdrant**: High-performance vector database for storing and retrieving document vectors
- **PostgreSQL**: Backend database for n8n
- **Ollama** (Optional): Local large language model service

## Environment Variables

### PostgreSQL Configuration
- `POSTGRES_USER`: Database username (default: n8n)
- `POSTGRES_PASSWORD`: Database password (default: n8npass)
- `POSTGRES_DB`: Database name (default: n8n)
- `POSTGRES_PORT`: Database port (default: 5432)

### n8n Configuration
- `N8N_PORT`: n8n service port (default: 5678)
- `N8N_BASIC_AUTH_USER`: n8n login username (default: admin)
- `N8N_BASIC_AUTH_PASSWORD`: n8n login password (default: adminpass)
- `N8N_HOST`: n8n hostname (default: localhost)
- `WEBHOOK_URL`: Webhook base URL (default: http://localhost:5678)

### Qdrant Configuration
- `QDRANT_PORT`: Qdrant HTTP API port (default: 6333)
- `QDRANT_GRPC_PORT`: Qdrant gRPC port (default: 6334)
- `QDRANT_LOG_LEVEL`: Log level (default: INFO)
- `QDRANT_API_KEY`: API authentication key (optional, recommended for production)

### Ollama Configuration
- `OLLAMA_MODEL_PATH`: Model storage path (default: /root/.ollama)

## Quick Start

1. **Copy environment variables file**

```bash
cp .env.example .env
# Edit .env file to set necessary parameters
# Note: For production environments, set QDRANT_API_KEY to enable API authentication
```

2. **Start all services**

```bash
docker-compose up -d
```

3. **Verify service status**

```bash
# Check if services are running properly
docker-compose ps

# n8n: http://localhost:5678
# Qdrant: http://localhost:6333
# PostgreSQL: localhost:5432
```

## Qdrant Vector Database Usage Guide

### 1. Basic Qdrant Concepts

- **Collection**: Vector collection, similar to a table, used to store related vector data
- **Point**: Vector data point, containing vector values and optional payload (metadata)
- **Vector**: Numerical array representing semantic features of documents or data
- **Payload**: Metadata associated with vectors (such as document content, source, timestamps, etc.)

### 2. Qdrant API Examples

#### Create Collection

```bash
# Without API key (development environment)
curl -X PUT http://localhost:6333/collections/documents \
  -H 'Content-Type: application/json' \
  -d '{
    "vectors": {
      "size": 1536,
      "distance": "Cosine"
    }
  }'

# With API key (production environment)
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

#### Insert Vector Data

```bash
# Without API key (development environment)
curl -X PUT http://localhost:6333/collections/documents/points \
  -H 'Content-Type: application/json' \
  -d '{
    "points": [
      {
        "id": 1,
        "vector": [0.05, 0.61, 0.76, ...],
        "payload": {
          "content": "This is document content",
          "source": "document.pdf",
          "page": 1
        }
      }
    ]
  }'

# With API key (production environment)
curl -X PUT http://localhost:6333/collections/documents/points \
  -H 'Content-Type: application/json' \
  -H 'api-key: ${QDRANT_API_KEY}' \
  -d '{
    "points": [
      {
        "id": 1,
        "vector": [0.05, 0.61, 0.76, ...],
        "payload": {
          "content": "This is document content",
          "source": "document.pdf",
          "page": 1
        }
      }
    ]
  }'
```

#### Search Similar Vectors

```bash
# Without API key (development environment)
curl -X POST http://localhost:6333/collections/documents/points/search \
  -H 'Content-Type: application/json' \
  -d '{
    "vector": [0.2, 0.1, 0.9, ...],
    "limit": 5,
    "with_payload": true
  }'

# With API key (production environment)
curl -X POST http://localhost:6333/collections/documents/points/search \
  -H 'Content-Type: application/json' \
  -H 'api-key: ${QDRANT_API_KEY}' \
  -d '{
    "vector": [0.2, 0.1, 0.9, ...],
    "limit": 5,
    "with_payload": true
  }'
```

## Integrating Qdrant in n8n

### 1. Using n8n's Qdrant Nodes

n8n provides native Qdrant nodes supporting the following operations:

- **Document Store**: Store documents and automatically generate vectors
- **Vector Store**: Directly store vector data
- **Retrieve**: Retrieve similar documents or vectors

### 2. Creating RAG Workflow Example

#### Step 1: Document Vectorization Process

```
1. Trigger Node (Webhook/Schedule)
2. Read Documents (Files/HTTP Request)
3. Text Splitter Node
4. Vectorization Node (OpenAI Embeddings)
5. Qdrant Document Store Node
```

#### Step 2: Q&A Process

```
1. Webhook Trigger (receive user questions)
2. Vectorize User Question (OpenAI Embeddings)
3. Qdrant Retrieve Node (retrieve relevant documents)
4. Build Prompt (Code Node)
5. LLM Generate Answer (OpenAI/Ollama)
6. Return Result (Webhook Response)
```

### 3. Qdrant Node Configuration

Configure Qdrant connection in n8n:

1. **Host**: `qdrant` (inside Docker network) or `localhost` (external connection)
2. **Port**: `6333`
3. **API Key**: If `QDRANT_API_KEY` is set, enter it in n8n's Qdrant credentials
4. **Collection Name**: Custom name (e.g., `documents`)
5. **Vector Size**: Based on the embedding model used (OpenAI: 1536, Ollama: varies by model)

### 4. Using HTTP Request Node to Operate Qdrant

For more flexible operations, use the HTTP Request node:

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

## Common Issues

### Qdrant Related

1. **Cannot connect to Qdrant**
   - Confirm Docker container is running: `docker ps | grep qdrant`
   - Check if port number is correct (default 6333)
   - Use service name `qdrant` instead of `localhost` inside n8n

2. **Collection creation failed**
   - Check if vector dimensions match the embedding model
   - OpenAI text-embedding-ada-002: 1536 dimensions
   - For other models, consult relevant documentation

3. **Inaccurate search results**
   - Confirm using the same embedding model for indexing and querying
   - Adjust search parameters (e.g., limit, score_threshold)
   - Consider re-indexing data

### n8n Integration Issues

1. **Qdrant node not found**
   - Confirm n8n version supports Qdrant (requires newer version)
   - Use HTTP Request node as an alternative

2. **Slow vectorization speed**
   - Consider batch processing documents
   - Use local embedding models (like Ollama) to reduce API calls

## Advanced Configuration

### Performance Optimization

1. **Qdrant Memory Allocation**
   - Edit docker-compose.yml to add memory limits
   ```yaml
   qdrant:
     mem_limit: 4g
     mem_reservation: 2g
   ```

2. **Batch Indexing Optimization**
   - Use batch inserts instead of single inserts
   - Recommended batch size: 100-1000 vectors

3. **Persistence Configuration**
   - Qdrant data is stored in Docker volume by default
   - Backup: `docker run --rm -v qdrant_data:/data -v $(pwd):/backup busybox tar czf /backup/qdrant-backup.tar.gz /data`

### Security Configuration

1. **Qdrant API Key** (Production Environment)
   - Set `QDRANT_API_KEY` in `.env` file
   - API key will be automatically passed to Qdrant container
   - When API key is set, all API requests need to include authentication header:
   ```bash
   curl -H "api-key: your_api_key" http://localhost:6333/collections
   ```

2. **Network Isolation**
   - In production, place Qdrant in internal network
   - Only allow access from n8n container

## Complete RAG Example Workflow

### Use Case: Knowledge Base Q&A System

1. **Data Preparation Phase**
   - Collect documents (PDF, Word, web pages)
   - Split documents into appropriate sized chunks (recommended 500-1000 characters)
   - Generate vector representation for each chunk

2. **Create Index**
   - Create Qdrant collection
   - Batch insert document vectors and metadata
   - Create necessary indexes to accelerate search

3. **Query Processing**
   - Receive user questions
   - Vectorize questions
   - Search for K most relevant document chunks
   - Combine context and generate answer

4. **Continuous Optimization**
   - Collect user feedback
   - Adjust similarity thresholds
   - Regularly update knowledge base

## Related Resources

### Qdrant
- [Qdrant Official Documentation](https://qdrant.tech/documentation/)
- [Qdrant Python Client](https://github.com/qdrant/qdrant-client)
- [Qdrant REST API](https://qdrant.github.io/qdrant/redoc/index.html)

### n8n RAG Integration
- [n8n AI Node Documentation](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain/)
- [n8n Qdrant Node](https://docs.n8n.io/integrations/builtin/cluster-nodes/sub-nodes/n8n-nodes-langchain.vectorstoreqdrant/)

### Ollama (Optional)
- [Ollama Official Documentation](https://github.com/ollama/ollama)
- [Ollama Model Library](https://ollama.com/library)