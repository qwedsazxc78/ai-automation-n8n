# n8n 基本 Docker Compose 设置，加上 ngrok 可进行公开访问

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

用于运行 n8n 工作流自动化工具
此配置为在本地运行 n8n 容器所需的基础设置，并搭配 PostgreSQL 数据库和 ngrok 进行公开访问。

## 功能特点

* n8n 工作流自动化平台
* PostgreSQL 数据库用于持久化存储
* ngrok 用于安全的公开访问
* 环境变量配置
* 网络和文件配置管理

## 使用方法

### 1. 创建 .env 文件

复制示例环境文件：

```bash
cp .env.example .env
```

编辑 `.env` 文件并设置你的环境变量：

```bash
   vim .env
```

环境变量：

```
# 数据库配置
POSTGRES_USER=n8n
POSTGRES_PASSWORD=your_secure_password
POSTGRES_DB=n8n
POSTGRES_PORT=5432

# n8n 配置
N8N_PORT=5678
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=your_secure_password
N8N_PROTOCOL=https

# ngrok 配置
NGROK_AUTHTOKEN=your_ngrok_authtoken
NGROK_REGION=us  # 选项：us, eu, au, ap, sa, jp, in
```

### 2. 获取 ngrok 认证令牌

1. 在 [ngrok.com](https://ngrok.com) 注册一个免费账户
2. 从 ngrok 仪表板获取您的认证令牌
3. 将其添加到您的 `.env` 文件中

### 3. 启动服务

```bash
docker-compose up -d
```

### 4. 访问 n8n

* **本地访问**：http://localhost:5678
* **公开访问**：ngrok URL 将显示在 ngrok 后台中：

默认凭证：
* 用户名：admin
* 密码：adminpass

可以在 `.env` 文件中更改这些凭证。

重启 n8n 容器，改变 URL：

```bash
docker-compose restart n8n
```

### 5. 停止服务

```bash
docker-compose down
```

要移除所有数据文件：

```bash
docker-compose down -v
```

## 环境变量

| 变量 | 描述 | 默认值 |
|----------|-------------|---------|
| POSTGRES_USER | PostgreSQL 用户名 | n8n |
| POSTGRES_PASSWORD | PostgreSQL 密码 | change_this_password |
| POSTGRES_DB | PostgreSQL 数据库名称 | n8n |
| POSTGRES_PORT | PostgreSQL 端口 | 5432 |
| N8N_PORT | n8n 网页界面端口 | 5678 |
| N8N_BASIC_AUTH_USER | n8n 基本认证用户名 | admin |
| N8N_BASIC_AUTH_PASSWORD | n8n 基本认证密码 | change_this_password |
| N8N_PROTOCOL | Webhook URL 的协议 | https |
| NGROK_AUTHTOKEN | 您的 ngrok 认证令牌 | - |
| NGROK_SUBDOMAIN | 自定义子域名（付费账户） | - |
| NGROK_PUBLIC_URL  | 对外网域 | https://domain |

## 生产环境安全考量

* 在 `.env` 文件中更改所有默认密码
* 使用强大且唯一的密码
* 考虑在生产环境中，使用密钥管理解决方案
* 使用基本认证限制对 n8n 服务的访问