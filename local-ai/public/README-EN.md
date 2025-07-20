# n8n Basic Docker Compose Setup with ngrok for Public Access

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./README-EN.md) | [🇨🇳 简体中文](./README-CN.md) | [🇹🇼 繁体中文](./README.md)

For running n8n workflow automation tool
This configuration provides the basic setup needed to run n8n containers locally with PostgreSQL database and ngrok for public access.

## Features

* n8n workflow automation platform
* PostgreSQL database for persistent storage
* ngrok for secure public access
* Environment variable configuration
* Network and file configuration management

## Usage

### 1. Create .env file

Copy the example environment file:

```bash
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
POSTGRES_PASSWORD=your_secure_password
POSTGRES_DB=n8n
POSTGRES_PORT=5432

# n8n configuration
N8N_PORT=5678
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=your_secure_password
N8N_PROTOCOL=https

# ngrok configuration
NGROK_AUTHTOKEN=your_ngrok_authtoken
NGROK_REGION=us  # Options: us, eu, au, ap, sa, jp, in
```

### 2. Get ngrok authentication token

1. Register a free account at [ngrok.com](https://ngrok.com)
2. Get your authentication token from the ngrok dashboard
3. Add it to your `.env` file

### 3. Start services

```bash
docker-compose up -d
```

### 4. Access n8n

* **Local access**: http://localhost:5678
* **Public access**: ngrok URL will be displayed in the ngrok dashboard:

Default credentials:
* Username: admin
* Password: adminpass

You can change these credentials in the `.env` file.

Restart n8n container to update URL:

```bash
docker-compose restart n8n
```

### 5. Stop services

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
| N8N_PROTOCOL | Protocol for webhook URLs | https |
| NGROK_AUTHTOKEN | Your ngrok authentication token | - |
| NGROK_SUBDOMAIN | Custom subdomain (paid account) | - |
| NGROK_PUBLIC_URL | Public domain | https://domain |

## Production Security Considerations

* Change all default passwords in the `.env` file
* Use strong and unique passwords
* Consider using a secrets management solution in production
* Restrict access to n8n services using basic authentication