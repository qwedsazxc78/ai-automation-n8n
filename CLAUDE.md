# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an n8n workflow automation educational repository featuring 34+ AI-powered automation examples. The project demonstrates various use cases from invoice processing to AI agent integrations, primarily documented in Traditional Chinese for the Chinese-speaking community.

## Document Agents for Enhanced Readiness

### 1. Document Generator Agent

When asked to create or enhance documentation with minimal changes:

**Primary Goals:**
* Preserve existing structure and content
* Add only essential missing information
* Maintain consistency with existing documentation style
* Focus on user readability and quick comprehension

**Document Enhancement Checklist:**
1. **Quick Start Section**: Ensure users can get started within 2 minutes
2. **Prerequisites**: Clear list of required tools/dependencies
3. **Common Use Cases**: 3-5 practical examples
4. **Troubleshooting**: Top 5 common issues and solutions
5. **Visual Aids**: Suggest where diagrams/screenshots would help

**Minimal Change Principles:**
* Add clarifying examples rather than rewriting sections
* Insert helpful tips in existing sections
* Use inline comments for technical clarifications
* Preserve original author's voice and terminology

### 2. Reader Agent for Document Quality Check

When validating documentation readiness, simulate a new user perspective:

**Reader Agent Checklist:**
1. **First Impression Test** (30 seconds)
   - Can I understand what this project does?
   - Is the value proposition clear?
   - Do I know where to start?

2. **Setup Validation** (5 minutes)
   - Are all commands copy-pasteable?
   - Do environment variables have clear examples?
   - Is there a "hello world" test to verify setup?

3. **Navigation Test**
   - Can I find specific features/workflows easily?
   - Are related documents cross-referenced?
   - Is the table of contents helpful?

4. **Comprehension Check**
   - Would a junior developer understand this?
   - Are technical terms explained on first use?
   - Do examples progress from simple to complex?

**Reader Agent Output Format:**

```
Document Readiness Score: [1-10]
- Clarity: [score] - [brief explanation]
- Completeness: [score] - [brief explanation]
- Usability: [score] - [brief explanation]

Top 3 Improvements Needed:
1. [Specific actionable item]
2. [Specific actionable item]
3. [Specific actionable item]
```

## Key Commands

### Local Development

```bash
# Start basic local n8n instance with PostgreSQL
cd local-ai/basic
docker-compose up -d

# Start local n8n with public access (ngrok)
cd local-ai/public
docker-compose up -d

# Stop services
docker-compose down
```

### Cloud Deployment

```bash
# AWS deployment
cd cloud-ai/aws
./startup.sh

# Zeabur deployment
cd cloud-ai/zeabur
./deploy.sh
```

### Utility Scripts

```bash
# Aggregate all workflow content for analysis
cd n8n/scripts
./put-all-to-GPT.sh
```

## Architecture & Structure

### Directory Organization

* **`/n8n/`**: Contains 34 workflow examples, each in its own directory (e.g.,   `1-simple-invoice-automation/`)
  + Each workflow directory includes:
    - `automation.json`: n8n workflow definition
    - `readme.md`: Workflow description and instructions
    - `cover.png`: Visual representation
* **`/local-ai/`**: Local deployment configurations
  + `basic/`: Simple local setup
  + `public/`: Local setup with ngrok for external access
* **`/cloud-ai/`**: Cloud deployment configurations
  + `aws/`: AWS deployment with nginx SSL termination
  + `zeabur/`: Zeabur platform deployment
* **`/docs/`**: Documentation images and assets

### Deployment Architecture

* **Local**: Docker Compose with n8n + PostgreSQL
* **AWS**: n8n + PostgreSQL + nginx reverse proxy with SSL
* **Public Access**: ngrok integration for exposing local instances

### Key Integration Points

* **AI Services**: OpenAI, Claude, Google Gemini, xAI Grok
* **Communication**: LINE Message API, email services
* **Voice AI**: Retell integration
* **Video Generation**: Google Veo3
* **MCP (Model Context Protocol)**: Multiple examples demonstrating MCP server integration

## Working with Workflows

When creating or modifying n8n workflows:
1. Follow the existing directory structure: `n8n/{number}-{workflow-name}/`
2. Include required files: `automation.json`, `readme.md`, `cover.png`
3. Document workflows in Traditional Chinese to maintain consistency
4. Export workflows using n8n's JSON format

## Environment Configuration

Each deployment directory contains `.env.example` files with required variables:
* Database credentials (POSTGRES_USER, POSTGRES_PASSWORD)
* n8n authentication (N8N_BASIC_AUTH_USER, N8N_BASIC_AUTH_PASSWORD)
* Service URLs and ports
* SSL certificate paths (for AWS deployment)

## Important Notes

* This is an educational repository - workflows demonstrate concepts rather than production-ready solutions
* No formal testing framework exists - test workflows manually in n8n interface
* Primary documentation language is Traditional Chinese
* Community resources available at: https://www.skool.com/ai-automation-n8n-hk

## Practical Examples for Document Agents

### Example: Enhancing a Workflow README (Document Generator)

**Current State:**

```markdown
# Invoice Automation
This workflow processes invoices automatically.
```

**Enhanced with Minimal Changes:**

```markdown
# Invoice Automation
This workflow processes invoices automatically.

**Quick Start:** Import `automation.json` into n8n and configure OpenAI credentials.

**Prerequisites:** n8n v1.0+, OpenAI API key

**Common Use Case:** Automatically extract invoice data from emails and update spreadsheets.
```

### Example: Reader Agent Assessment

**For the main README.md:**

```
Document Readiness Score: 8/10
- Clarity: 9/10 - Clear project purpose and well-organized workflow list
- Completeness: 7/10 - Missing quick start guide for beginners
- Usability: 8/10 - Good navigation but needs English summary for wider audience

Top 3 Improvements Needed:
1. Add 5-minute quick start guide at the beginning
2. Include troubleshooting section for common n8n setup issues
3. Add English summary for non-Chinese speakers
```
