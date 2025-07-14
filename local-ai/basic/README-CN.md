# n8n 基本 Docker Compose 设置

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

用于运行 n8n 工作流自动化工具
此配置为在本地运行 n8n 容器所需的基础设置，并搭配 PostgreSQL 数据库。

## 功能特点

* n8n 工作流自动化平台
* PostgreSQL 数据库用于持久化存储
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
POSTGRES_PASSWORD=n8npass
POSTGRES_DB=n8n
POSTGRES_PORT=5432

# n8n 配置
N8N_PORT=5678
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpass
N8N_HOST=localhost
WEBHOOK_URL=http://localhost:5678
```

### 2. 启动服务

```bash
docker-compose up -d
```

* **本地访问**：http://localhost:5678
* **公开访问**：ngrok URL 将显示在 ngrok 容器日志中：

默认凭证：
* 用户名：admin
* 密码：adminpass

可以在 `.env` 文件中更改这些凭证。

### 3. 停止服务

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
| N8N_BASIC_AUTH_PASSWORD | n8n 基本认证密码 | change_this_password | |