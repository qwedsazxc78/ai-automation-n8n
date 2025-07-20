# Ollama Local Deployment

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

This folder contains configuration and instructions for running Ollama locally. Ollama is a tool for running large language models locally.

## Quick Start

1. **Install Ollama**

```bash
# macOS/Linux
curl -fsSL https://ollama.com/install.sh | sh

# Or download directly from the official website: https://ollama.com/download
```

2. **Start Ollama service**

```bash
ollama serve
```

3. **Download models**

```bash
ollama pull mistral
ollama pull deepseek-r1
ollama pull gemma3
```

## API Usage Examples

### Check version

```bash
curl http://localhost:11434/api/version
```

### Generate text response (English)

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```

### Generate text response (Chinese)

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "為何天空是藍色的？",
  "stream": false
}'
```

## Integration with n8n

To use Ollama in n8n workflows:

1. Use HTTP Request node
2. Set URL: `http://localhost:11434/api/generate`
3. Method: POST
4. Body format: JSON
5. Body content example:

```json
{
  "model": "deepseek-r1",
  "prompt": "{{ $json.prompt }}",
  "stream": false
}
```

## Available Models

* **mistral**: Lightweight but powerful model
* **deepseek-r1**: DeepSeek's reasoning model, supports Chinese and English
* **gemma3**: Google's open-source model

## Common Issues

1. **Connection refused**
   * Confirm Ollama service is running
   * Check firewall settings

2. **Model download failed**
   * Confirm network connection
   * Check disk space (some models require several GB of space)

3. **Slow response**
   * First-time model usage requires loading time
   * Consider using smaller models or upgrading hardware

## Advanced Settings

### Change default port

```bash
OLLAMA_HOST=0.0.0.0:8080 ollama serve
```

### Configure GPU acceleration (NVIDIA)

```bash
# Confirm CUDA is installed
nvidia-smi

# Ollama will automatically detect and use GPU
```

## Related Resources

* [Ollama Official Documentation](https://github.com/ollama/ollama)
* [Model Library](https://ollama.com/library)
* [API Documentation](https://github.com/ollama/ollama/blob/main/docs/api.md)