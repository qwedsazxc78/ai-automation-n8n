> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# Learn to Integrate LINE Message API with n8n and Webhook in 8 Minutes｜Build Personal AI Assistant｜🧠 Efficient Knowledge Base [![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/HJKDHJ5x1F0)

![cover](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/17-n8n-line-message-api/cover.png?raw=true)

## Author Information

* **Author:** Alexhsieh
* **Platform:** n8n (Can directly import sample workflow `.json` file into your own n8n environment for learning and implementation)
* **Note:** All critical API keys have been removed from the sample `.json` file, please fill in your own information

---

## 📌 Feature Introduction

Use n8n to integrate LINE Message API and build your own LINE personal assistant!

* ✅ **Actively Send LINE Messages**: How to send messages to yourself and subsequently send custom messages
* ✅ **Implement Webhook Interaction**: Real-time reception and response to LINE user messages
* ✅ **LINE Official Account Registration and Integration Process**: Guide you through LINE Channel, official account application, Token acquisition and configuration

---

## 🔧 How It Works

1. **Apply for and Configure LINE Message API**: Register LINE Developers account, create Provider and Channel, apply for LINE official account and set corresponding information
2. **Get Channel Token and Set Authorization**: Copy Channel Access Token from LINE backend and set correct authorization Header in n8n
3. **Actively Push Messages to Specific Users**: Input User ID and message content through n8n Workflow to achieve automatic push notifications
4. **Webhook Configuration and Testing**: Configure Webhook URL, enable webhook, test whether n8n correctly receives LINE events and responds in real time

> 🔑 **Reminder**: When setting up Webhook, Test URL is only enabled when testing workflows, while Production URL continuously listens for events.

---

## References and Extended Learning

* [LINE api documentation](https://developers.line.biz/en/docs/messaging-api/overview/)
* [LINE Developers console](https://developers.line.biz/console/)
* [LINE Official Account Manager](https://manager.line.biz/)