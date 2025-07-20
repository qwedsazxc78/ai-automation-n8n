# Ollama 本地部署

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

本文件夹包含在本地运行 Ollama 的相关配置和指令。Ollama 是一个用于在本地运行大型语言模型的工具。

## 快速开始

1. **安装 Ollama**

```bash
   # macOS/Linux
   curl -fsSL https://ollama.com/install.sh | sh

   # 或直接从官网下载: https://ollama.com/download
   ```

2. **启动 Ollama 服务**

```bash
   ollama serve
   ```

3. **下载模型**

```bash
   ollama pull mistral
   ollama pull deepseek-r1
   ollama pull gemma3
   ```

## API 使用示例

### 检查版本

```bash
curl http://localhost:11434/api/version
```

### 生成文字回应（英文）

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```

### 生成文字回应（中文）

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "为何天空是蓝色的？",
  "stream": false
}'
```

## 与 n8n 集成

在 n8n 工作流程中使用 Ollama：

1. 使用 HTTP Request 节点
2. 设定 URL: `http://localhost:11434/api/generate`
3. 方法: POST
4. Body 格式: JSON
5. Body 内容示例：

```json
   {
     "model": "deepseek-r1",
     "prompt": "{{ $json.prompt }}",
     "stream": false
   }
   ```

## 可用模型

* **mistral**: 轻量级但功能强大的模型
* **deepseek-r1**: DeepSeek 的推理模型，支持中英文
* **gemma3**: Google 的开源模型

## 常见问题

1. **连接被拒绝**
   * 确认 Ollama 服务是否正在运行
   * 检查防火墙设定

2. **模型下载失败**
   * 确认网络连接
   * 检查硬盘空间（某些模型需要数 GB 空间）

3. **回应速度慢**
   * 首次使用模型需要载入时间
   * 考虑使用较小的模型或升级硬件

## 进阶设定

### 更改默认端口

```bash
OLLAMA_HOST=0.0.0.0:8080 ollama serve
```

### 设定 GPU 加速（NVIDIA）

```bash
# 确认已安装 CUDA
nvidia-smi

# Ollama 会自动检测并使用 GPU
```

## 相关资源

* [Ollama 官方文档](https://github.com/ollama/ollama)
* [模型库](https://ollama.com/library)
* [API 文档](https://github.com/ollama/ollama/blob/main/docs/api.md)