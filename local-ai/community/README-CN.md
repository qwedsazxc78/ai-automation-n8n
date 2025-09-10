# n8n 社区节点 Docker 镜像

支持多平台的 Docker 镜像，内置多种社区节点扩充 n8n 功能。本镜像遵循 [n8n 官方社区节点安装指南](https://docs.n8n.io/integrations/community-nodes/installation/manual-install/)。

## ⚠️ 重要注意事项

### 数据持久化与社区节点

如果您已有挂载数据卷的 n8n 实例，**新构建的镜像不会覆盖现有的社区节点配置**。原因如下：

```yaml
volumes:
  - n8n_data:/home/node/.n8n  # 现有数据会保持不变
```

**环境支持说明：**
- ✅ **Docker Compose**：完全支持，正常运行
- ⚠️ **Kubernetes**：PVC 无法在多个 n8n Pod 间共享，可能有兼容性问题

### 🔍 验证社区节点安装

请使用以下方法确认社区节点是否正确安装：

**方法 1：使用容器终端**
```bash
# 进入容器
docker exec -it <container-name> sh

# 检查社区节点目录
cd /home/node/.n8n/nodes
ls -la

# 查看 package.json 内容
cat package.json
```

**方法 2：通过 Docker Compose**
```bash
# 检查社区节点安装状态
docker-compose exec n8n ls -la /home/node/.n8n/nodes/
docker-compose exec n8n cat /home/node/.n8n/nodes/package.json
```

**预期结果：**
您应该看到类似以下的 package.json 内容：
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

**若社区节点未正确安装：**
1. 清除现有数据卷：`docker-compose down -v`
2. 重新构建镜像并启动服务
3. 再次验证安装结果

## 功能特点

* **多平台支持**：支持 AMD64 (Intel/AMD) 和 ARM64 (Apple Silicon) 架构，Docker 会自动选择合适的版本
* **社区节点整合**：依照官方 n8n 标准方法预装扩展插件 (`~/.n8n/nodes`)
* **弹性配置**：使用环境变量轻松调整 n8n 版本、节点和镜像标签
* **PostgreSQL 数据库**：内置数据库持久化支持，适合生产环境使用
* **本地测试优先**：不需 Docker Hub 账号即可本地构建和测试
* **Docker Compose 完整配置**：提供完整的 docker-compose.yml 配置文件

## 预设社区节点

本镜像已预装以下常用社区节点：

### 核心整合节点
* **n8n-nodes-mcp** - MCP (Model Context Protocol) 节点，让您轻松串接 AI 模型
* **n8n-nodes-linewebhook** - LINE 消息平台 webhook 整合，支持完整的 LINE 机器人功能
* **n8n-nodes-ragic** - [Ragic](https://www.ragic.com/) 在线数据库整合，简化数据管理流程

### 推荐额外节点

#### 通讯与社群
* **n8n-nodes-discord-trigger** - Discord 触发器节点，监听 Discord 事件与消息

#### 文档处理
* **n8n-nodes-document-generator** - 文档生成器，支持多种格式的文档创建
* **n8n-nodes-pdfco** - PDF.co 整合，提供 PDF 处理、转换和编辑功能
* **n8n-nodes-webpage-content-extractor** - 网页内容提取器，智能提取网页信息

#### 工具与实用程序
* **n8n-nodes-qrcode** - QR Code 生成与解析节点
* **n8n-nodes-edit-image-plus** - 高级图片编辑功能，支持多种图片处理操作
* **@tavily/core** - Tavily AI 搜索引擎整合，提供智能网络搜索功能

### 探索更多社区节点

想要找到更多强大的社区节点吗？

🌟 **[Awesome N8N: Top 100 Community Nodes](https://github.com/restyler/awesome-n8n)**

这份精选清单收录了超过 100 个优质社区节点：
- AI/ML 服务整合
- 社交媒体平台
- 云端存储服务
- 数据库连接器
- 通讯工具
- 实在有够多！

## 快速开始

### 选项 1：使用预建镜像（最快速）

```bash
# 拉取镜像（Docker 会自动选择合适的架构）
docker pull your-dockerhub-username/n8n-community:latest

# 启动 n8n 服务
docker run -p 5678:5678 your-dockerhub-username/n8n-community:latest
```

### 选项 2：本地构建和测试（推荐开发者使用）

```bash
# 1. 复制并设置环境变量
cp .env.example .env
# 编辑 .env 文件，调整您的设置

# 2. 执行本地构建（不需要 Docker Hub 账号）
./build.sh
# 输入 1 选择本地测试模式

# 3. 启动服务
docker-compose up -d

# 4. 打开浏览器访问 n8n
# 网址：http://localhost:5678
# 默认账号密码：admin/adminpass
```

## 配置

### 环境变量 (.env)

```env
# Docker 镜像配置
DOCKER_USERNAME=your-dockerhub-username
IMAGE_NAME=n8n-community
IMAGE_TAG=latest

# n8n 基础镜像版本
N8N_VERSION=1.109.2

# 社区节点（空格分隔）
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic"

# 构建平台
PLATFORMS=linux/amd64,linux/arm64

# PostgreSQL 配置
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8npass
POSTGRES_DB=n8n

# n8n 认证
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpass
```

## 构建脚本

### build.sh / build.bat

两个脚本都提供两个选项：

1. **本地构建**（无需 Docker Hub 登录）
   * 仅为当前架构构建
   * 创建本地镜像用于测试
   * 适合开发使用

2. **多平台推送**（需要 Docker Hub）
   * 为 AMD64 和 ARM64 构建
   * 推送至 Docker Hub
   * 创建多平台清单

### 使用范例

```bash
# 场景 1：本地开发测试
./build.sh
> 请选择 (1 或 2): 1
# 将为您当前的系统架构构建镜像

# 场景 2：发布至 Docker Hub
./build.sh
> 请选择 (1 或 2): 2
# 需要先执行 docker login
# 会同时构建 AMD64 和 ARM64 版本
```

## Docker Compose 完整配置

提供的 `docker-compose.yml` 包含：
* n8n 主服务（已内置社区节点）
* PostgreSQL 数据库服务
* 数据持久化卷设置
* 容器网络配置
* 完整环境变量支持

### 常用指令

```bash
# 启动所有服务
docker-compose up -d

# 查看 n8n 执行日志
docker-compose logs -f n8n

# 停止服务（保留数据）
docker-compose down

# 完全清除（包含数据卷）
docker-compose down -v
```

## 运行原理

### Dockerfile 架构说明

1. **基础镜像**：使用 `n8nio/n8n:${N8N_VERSION}`（版本可调整）
2. **节点安装**：在 `~/.n8n/nodes` 目录下安装社区节点
3. **权限设置**：确保 node 用户拥有正确的文件权限
4. **套件安装**：以 node 用户身份执行 `npm install`

本方法完全遵照 n8n 官方手动安装社区节点的标准流程。

### 社区节点管理

编辑 .env 文件中的 `COMMUNITY_NODES` 变量即可新增或移除节点：

```env
# 单一节点
COMMUNITY_NODES="n8n-nodes-mcp"

# 多个节点（默认配置）
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic"

# 添加自定义节点
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic n8n-nodes-your-custom"
```

#### 常用社区节点范例

```env
# AI/LLM 整合
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-openai-assistant n8n-nodes-langchain @tavily/core"

# 台湾本地服务
COMMUNITY_NODES="n8n-nodes-linewebhook n8n-nodes-ragic"

# 文档与内容处理
COMMUNITY_NODES="n8n-nodes-document-generator n8n-nodes-pdfco n8n-nodes-webpage-content-extractor"

# 社群平台整合
COMMUNITY_NODES="n8n-nodes-discord-trigger n8n-nodes-linewebhook"

# 图像与媒体处理
COMMUNITY_NODES="n8n-nodes-qrcode n8n-nodes-edit-image-plus"

# 数据库与 API
COMMUNITY_NODES="n8n-nodes-mongodb n8n-nodes-graphql n8n-nodes-redis"

# 完整功能套组（包含所有推荐节点）
COMMUNITY_NODES="n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic n8n-nodes-discord-trigger n8n-nodes-qrcode n8n-nodes-webpage-content-extractor n8n-nodes-document-generator n8n-nodes-pdfco @tavily/core n8n-nodes-edit-image-plus"
```

💡 **小技巧**：到 [Awesome N8N](https://github.com/restyler/awesome-n8n) 探索更多优质节点！

### 更新 n8n 版本

只需在 .env 中更改 `N8N_VERSION`：

```env
# 更新至最新版本
N8N_VERSION=1.110.0
```

## 架构支持

| 平台 | 架构 | 支持 |
|----------|-------------|---------| 
| macOS (Apple Silicon) | ARM64 | ✅ 原生 |
| macOS (Intel) | AMD64 | ✅ 原生 |
| Linux | AMD64 | ✅ 原生 |
| Linux | ARM64 | ✅ 原生 |
| Windows | AMD64 | ✅ 通过 Docker Desktop |
| Windows | ARM64 | ✅ 通过 Docker Desktop |

## 疑难排解

### 构建问题解决

```bash
# 确认 Docker 服务状态
docker version

# 验证 buildx 工具是否安装
docker buildx version

# 遇到问题时，重置构建器
docker buildx rm n8n-multiplatform
```

### 社区节点加载问题

```bash
# 确认节点安装状态
docker exec n8n-container ls -la /home/node/.n8n/nodes

# 查看相关错误信息
docker-compose logs n8n | grep -i "node"
```

### 脚本输入问题

构建脚本会自动清除输入的多余空格。若遇到问题，请确保只输入数字 "1" 或 "2"，避免输入其他字符。

## 文件结构

```
community/
├── Dockerfile           # 多阶段构建，支持 ARG
├── docker-compose.yml   # 完整的 n8n + PostgreSQL 设置
├── build.sh            # Unix/Linux/macOS 构建脚本
├── build.bat           # Windows 构建脚本
├── .env.example        # 配置模板
└── README.md           # 本文件
```

## Docker Compose 使用指南

### PostgreSQL 数据库整合

1. **初始化环境设置**：
```bash
cp .env.example .env
# 编辑 .env 文件，设置您的参数
```

2. **启动全部服务**：
```bash
docker-compose up -d
```

3. **访问 n8n 管理界面**：
* 网址：http://localhost:5678
* 默认账号/密码：admin/adminpass（可在 .env 修改）

4. **停止服务选项**：
```bash
# 保留数据
docker-compose down

# 完全清除（包含数据卷）
docker-compose down -v
```

## 环境变量

| 变量 | 描述 | 默认值 |
|----------|-------------|---------| 
| `DOCKER_USERNAME` | Docker Hub 用户名 | 构建时必需 |
| `IMAGE_NAME` | Docker 镜像名称 | `n8n-community` |
| `IMAGE_TAG` | Docker 镜像标签 | `latest` |
| `N8N_VERSION` | n8n 基础镜像版本 | `1.109.2` |
| `COMMUNITY_NODES` | 空格分隔的节点列表 | `n8n-nodes-mcp n8n-nodes-linewebhook n8n-nodes-ragic` |
| `PLATFORMS` | 构建平台 | `linux/amd64,linux/arm64` |
| `POSTGRES_USER` | PostgreSQL 用户名 | `n8n` |
| `POSTGRES_PASSWORD` | PostgreSQL 密码 | `n8npass` |
| `N8N_BASIC_AUTH_USER` | n8n 登录用户名 | `admin` |
| `N8N_BASIC_AUTH_PASSWORD` | n8n 登录密码 | `adminpass` |

## 系统需求

### 构建镜像最低需求
* Docker 20.10 或更高版本
* Docker buildx 工具
* Docker Hub 账号（发布时需要）

### 执行环境建议
* Docker 20.10 或更高版本
* 内存 2GB 以上

## 常见问题与解决方案

### 镜像构建相关
* 确认 buildx 安装：`docker buildx version`
* Docker Hub 登录：`docker login`
* 查看构建器清单：`docker buildx ls`

### 执行阶段问题
* 检查镜像架构：`docker image inspect your-username/n8n-community:latest | grep Architecture`
* 查看容器日志：`docker logs container-name`
* 验证端口状态：`lsof -i :5678`

## 支持

* n8n 文档：https://docs.n8n.io
* 社区论坛：https://community.n8n.io
* 本项目：构建问题请创建 issue