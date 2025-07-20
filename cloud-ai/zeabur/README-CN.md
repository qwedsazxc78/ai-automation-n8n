# Zeabur n8n 部署

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

## 📋 部署说明

此目录包含 Zeabur 平台的 n8n 部署配置。

### 📁 文件说明

* `n8n.yaml` - Zeabur 部署模板配置
* `deploy.sh` - 部署脚本
* `README.md` - 繁体中文说明文件
* `README-EN.md` - 英文说明文件
* `README-CN.md` - 简体中文说明文件

### 🚀 快速部署

#### 一键部署按钮（推荐）

[![Deploy on Zeabur](https://zeabur.com/button.svg)](https://zeabur.com/templates/0TUVZ7?referralCode=qwedsazxc78)

### ⚙️ 配置说明

部署模板包含以下服务：

* **n8n**: 主要工作流程自动化平台
* **PostgreSQL**: 数据库服务
* **Redis**: 缓存服务（可选）

### 🔧 环境变量

主要环境变量配置：

* `N8N_BASIC_AUTH_USER`: n8n 登录用户名
* `N8N_BASIC_AUTH_PASSWORD`: n8n 登录密码
* `POSTGRES_USER`: PostgreSQL 用户名
* `POSTGRES_PASSWORD`: PostgreSQL 密码
* `POSTGRES_DB`: PostgreSQL 数据库名

### 📝 注意事项

1. **账号注册**: 如果没有 Zeabur 账号，需要先注册
2. **推荐码**: 使用推荐码 `qwedsazxc78` 可获得额外使用额度
3. **费用**: Zeabur 采用按用量计费，约 $5/月起
4. **SSL**: Zeabur 自动提供 SSL 证书

### 🔗 相关链接

* [Zeabur 官方网站](https://zeabur.com/)
* [n8n 官方文档](https://docs.n8n.io/)
* [项目 GitHub](https://github.com/qwedsazxc78/ai-automation-n8n)

### 🆘 支持

如果遇到问题，请参考：

* [Zeabur 文档](https://zeabur.com/docs)
* [n8n 社区](https://community.n8n.io/)
* [项目 Issues](https://github.com/qwedsazxc78/ai-automation-n8n/issues)
