# n8n Docker Compose Setup in AWS

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

For running n8n workflow automation tool
This configuration provides the basic setup needed to run n8n containers on AWS with PostgreSQL database.

## Features

* n8n workflow automation platform
* PostgreSQL database for persistent storage
* Environment variable configuration
* Network and file configuration management

## Usage

### 1. Create .env file

Copy the example environment file:

```bash
cd ~/ai-automation-n8n/cloud-ai/aws
cp .env.example .env
```

Edit the `.env` file and set your environment variables:

```bash
vim .env
```

Environment variables:

```
# Database configuration
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8npass
POSTGRES_DB=n8n
POSTGRES_PORT=5432

# n8n configuration
N8N_PORT=5678
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpass
N8N_HOST=localhost (modify to your final domain)
WEBHOOK_URL=http://localhost:5678 (modify to your final domain)
```

### 2. Start services

```bash
docker-compose up -d
```

* **Local access**: http://localhost:5678
* **Public access**: Confirm the IP configured for AWS services

Default credentials:
* Username: admin
* Password: adminpass

You can change these credentials in the `.env` file.

### 3. Stop services

```bash
docker-compose down
```

To remove all data files:

```bash
docker-compose down -v
```

## Environment Variables

| Variable | Description | Default Value |
|----------|-------------|---------|
| POSTGRES_USER | PostgreSQL username | n8n |
| POSTGRES_PASSWORD | PostgreSQL password | change_this_password |
| POSTGRES_DB | PostgreSQL database name | n8n |
| POSTGRES_PORT | PostgreSQL port | 5432 |
| N8N_PORT | n8n web interface port | 5678 |
| N8N_BASIC_AUTH_USER | n8n basic authentication username | admin |
| N8N_BASIC_AUTH_PASSWORD | n8n basic authentication password | change_this_password |