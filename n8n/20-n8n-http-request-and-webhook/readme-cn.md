🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 8分钟最速入门n8n API请求与Webhook | 原理与使用方法一次理解 | 🧠 省力知识库[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/l5-s6h2iY_M)

适合初学者及任何需要理解API、自动化监控、消息即时通报流程的开发者
跟着操作范例一步到位，不只学观念也会应用！

![8分钟最速入门n8n API请求与Webhook](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/20-n8n-http-request-and-webhook/cover.png?raw=true)

## 作者信息

* **作者：** Alexhsieh
* **平台：** n8n（支持导入`.json`查看完整自动化流程）
* **注意事项：** 范例未含任何私密API密钥

---

## 📌 功能介绍

8分钟掌握API请求（HTTP Request）与Webhook的运作原理与概念
在n8n的实际使用方式！

* ✅ 什么是API与API请求？运作概念一次通透理解
* ✅ n8n如何自动发送API请求并收录状态结果
* ✅ 什么是Webhook？运作概念与如何主动接收即时回报
* ✅ n8n webhook如何接收外界请求
* ✅ 体验最简单范例：网站健康监控与及时通知

---

## 🔧 运作方式

1. **API请求原理**
    - 以生活化范例（麦当劳点餐）对照说明，帮助快速入门
    - 认识RESTful API五大方法：GET、POST、PUT、PATCH、DELETE
2. **n8n API请求Demo**
    - 利用n8n的HTTP Request节点，对服务发送健康检查请求
    - 服务器回传JSON格式状态（如：{""status"": ""OK""}）
    - 串接Google Sheets，自动记录请求结果、时间与回应内容
    - 可设定排程自动执行，打造网站健康监控
3. **Webhook运作原理**
    - 比喻说明（如叫车服务Uber/Line Taxi）易于理解
    - Server主动回报，达到低延迟及即时性，节省用户端轮询
4. **n8n Webhook实作Demo**
    - 手把手设定n8n Webhook Node，监听指定健康检查URL
    - 客户端呼叫时，即时回应健康与频道描述信息
    - 支持JSON回应、状态码设定，随时监测线上状态