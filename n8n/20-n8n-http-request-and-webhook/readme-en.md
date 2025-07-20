🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 8-Minute Quick Start to n8n API Requests and Webhooks | Understanding Principles and Usage Methods at Once | 🧠 省力知識庫[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/l5-s6h2iY_M)

Perfect for beginners and any developers who need to understand API, automation monitoring, and real-time message notification processes
Follow the practical examples step by step, not only learning concepts but also applying them!

![8-Minute Quick Start to n8n API Requests and Webhooks](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/20-n8n-http-request-and-webhook/cover.png?raw=true)

## Author Information

* **Author:** Alexhsieh
* **Platform:** n8n (supports importing `.json` to view complete automation processes)
* **Note:** Examples do not contain any private API keys

---

## 📌 Feature Introduction

Master the operating principles and concepts of API requests (HTTP Request) and Webhooks in 8 minutes
and their practical usage in n8n!

* ✅ What are APIs and API requests? Understanding the operating concepts thoroughly at once
* ✅ How n8n automatically sends API requests and records status results
* ✅ What is a Webhook? Operating concepts and how to actively receive real-time reports
* ✅ How n8n webhooks receive external requests
* ✅ Experience the simplest example: Website health monitoring and timely notifications

---

## 🔧 How It Works

1. **API Request Principles**
    - Use everyday examples (McDonald's ordering) for comparison to help quick learning
    - Learn the five major RESTful API methods: GET, POST, PUT, PATCH, DELETE
2. **n8n API Request Demo**
    - Use n8n's HTTP Request node to send health check requests to services
    - Server returns JSON format status (e.g., {""status"": ""OK""})
    - Connect to Google Sheets to automatically record request results, time, and response content
    - Can set scheduled automatic execution to create website health monitoring
3. **Webhook Operating Principles**
    - Metaphorical explanation (like ride-hailing services Uber/Line Taxi) for easy understanding
    - Server actively reports back, achieving low latency and real-time performance, saving client polling
4. **n8n Webhook Implementation Demo**
    - Step-by-step setup of n8n Webhook Node to monitor specified health check URL
    - When client calls, immediately respond with health and channel description information
    - Supports JSON response, status code settings, monitoring online status anytime