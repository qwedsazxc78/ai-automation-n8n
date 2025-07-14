# Ollama 本地部署

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

本資料夾包含在本地運行 Ollama 的相關配置和指令。Ollama 是一個用於在本地運行大型語言模型的工具。

## 快速開始

1. **安裝 Ollama**

```bash
   # macOS/Linux
   curl -fsSL https://ollama.com/install.sh | sh

   # 或直接從官網下載: https://ollama.com/download
   ```

2. **啟動 Ollama 服務**

```bash
   ollama serve
   ```

3. **下載模型**

```bash
   ollama pull mistral
   ollama pull deepseek-r1
   ollama pull gemma3
   ```

## API 使用範例

### 檢查版本

```bash
curl http://localhost:11434/api/version
```

### 生成文字回應（英文）

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```

### 生成文字回應（中文）

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "為何天空是藍色的？",
  "stream": false
}'
```

## 與 n8n 整合

在 n8n 工作流程中使用 Ollama：

1. 使用 HTTP Request 節點
2. 設定 URL: `http://localhost:11434/api/generate`
3. 方法: POST
4. Body 格式: JSON
5. Body 內容範例：

```json
   {
     "model": "deepseek-r1",
     "prompt": "{{ $json.prompt }}",
     "stream": false
   }
   ```

## 可用模型

* **mistral**: 輕量級但功能強大的模型
* **deepseek-r1**: DeepSeek 的推理模型，支援中英文
* **gemma3**: Google 的開源模型

## 常見問題

1. **連線被拒絕**
   * 確認 Ollama 服務是否正在運行
   * 檢查防火牆設定

2. **模型下載失敗**
   * 確認網路連線
   * 檢查硬碟空間（某些模型需要數 GB 空間）

3. **回應速度慢**
   * 首次使用模型需要載入時間
   * 考慮使用較小的模型或升級硬體

## 進階設定

### 更改預設埠

```bash
OLLAMA_HOST=0.0.0.0:8080 ollama serve
```

### 設定 GPU 加速（NVIDIA）

```bash
# 確認已安裝 CUDA
nvidia-smi

# Ollama 會自動偵測並使用 GPU
```

## 相關資源

* [Ollama 官方文件](https://github.com/ollama/ollama)
* [模型庫](https://ollama.com/library)
* [API 文件](https://github.com/ollama/ollama/blob/main/docs/api.md)
