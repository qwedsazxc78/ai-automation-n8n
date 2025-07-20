🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# OpenAI Launched ChatGPT Shopping Search Assistant! Can n8n AI Agent Achieve the Same Shopping Search Function? ChatGPT Shopping Search｜🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/5pkLFXLQp6U)

![OpenAI Launched ChatGPT Shopping Search Assistant](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/21-n8n-shopping-search-agent/cover.png?raw=true)

## Author Information

* **Author:** Alexhsieh
* **Platform:** n8n/ChatGPT
* **Note:** All API keys have been removed from the `.json` template

---

## 📌 Feature Introduction

Comprehensive analysis of OpenAI's latest ChatGPT shopping search assistant feature
and comparison with n8n AI Agent in shopping search scenarios.

**Main tests include:**

* ✅ One-click search for domestic and international e-commerce products (such as Amazon, Momo, etc.) within ChatGPT interface
* ✅ Automatically generate product lists, comparison tables, and direct shopping links
* ✅ Provide product features, tags, prices, ratings, and real-time recommendations
* ✅ Add product carousels, product tags, AI automatic recommendations and other interactive experiences
* ✅ n8n Search Agent actually uses Web Search/HTTP API to automatically find product information for specified requirements

---

## 🔧 How It Works

### ChatGPT Shopping Assistant Workflow

1. **User inputs product requirements**: e.g., "Please find a $300 flight jacket"
2. **Connect to OpenAI Search**: E-commerce websites, actively recommend lists, compare prices, prices and features
3. **Frontend UI**: Display product carousels, tags, prices, descriptions and shopping links
4. **Data source**: Structured SEO/third-party online channel integration with real-time updates
5. **Open merchant product data free upload**: Automatically included in OpenAI recommendation list

### n8n AI Agent Shopping Search Workflow -> User experience doesn't win

1. **Connect to OpenAI Web Search API**: Use HTTP Request node to connect to OpenAI Web Search API, and directly issue queries based on user instructions
2. **AI Agent**: Return product list or API information that meets search criteria (such as keywords, prices, sellers, etc.)
3. **Integrate search returns**: Automatically organize into text lists/summaries, no frontend carousel or interactive UI