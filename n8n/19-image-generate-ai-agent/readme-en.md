> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 Efficient Tool! OpenAI's Latest Image Model GPT-image-1 Debuts! How to Create E-commerce Product Images and Build Image Inspiration AI Agent [![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/DCjv00f6lXI)

![OpenAI GPT-image-1 E-commerce Product Image AI Agent](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/cover.png?raw=true)

## 📋 Prerequisites

- n8n v1.0+ installed and running
- API Keys required:
  - ✅ OpenAI API Key (GPT-image-1, DALL·E 2/3) (required)
  - ✅ LINE Message API Token (required)
  - ✅ Google Service Account (required)
- Other tools:
  - LINE Developer account
  - Google Drive storage space
  - Webhook endpoint configuration

## Author Information

* **Author:** Alexhsieh
* **Platform:** n8n (Import .json file to understand complete workflow)
* **Note:** Examples are for learning purposes, API keys and sensitive data are not public

---

## 📌 Feature Introduction

This efficient tool integrates OpenAI's latest image generation model GPT-image-1, specifically designed for "e-commerce product images" to create an AI Agent that helps everyone think about image generation inspiration:

* ✅ Input product descriptions via LINE, generate product images with one click
* ✅ Support multiple models DALL·E 2/3, GPT-image-1 for image generation, freely switchable
* ✅ Automatically sync generated images to Google Drive for convenient cloud access and management
* ✅ Fully automated, using prompt keywords to produce multi-style commercial image drafts
* ✅ LINE as the final destination, quickly browse generated images through LINE, keeping inspiration alive!

---

## Generated Image Examples and References

Generation rules:

* Product type and style
* Model using the product
* Related scenes

### Product 1 - Red Dress

```bash
Please generate a red dress product
25-30 year old Asian female
At a sunny beach
```

![Product 1 - Red Dress 1](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample1-1.png?raw=true)

![Product 1 - Red Dress 2](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample1-2.png?raw=true)

### Product 2 - Sunglasses

```bash
Please generate stylish sunglasses product
35-40 year old European male
At a subway station
```

![Product 1 - Sunglasses 1](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample2-1.png?raw=true)

![Product 1 - Sunglasses 2](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample2-2.png?raw=true)

---

## 🔧 How It Works

1. **Clear Image Context Input**: Through LINE, n8n workflow or other interfaces, input your product description (e.g., "Please generate a red dress product, 25-30 year old Asian female, at a sunny beach").
2. **Webhook Reception**: n8n automatically detects messages and collects description text through Webhook.
3. **AI Prompt Construction**: System assembles input content into English prompt required by AI and creates image generation instructions as needed.
4. **API Generation Call**: Call image generation API with correct parameters, setting generation count, quality, etc.
5. **Automatic Image Reception**: API returns images (Base64 encoded), n8n workflow automatically converts to PNG/JPG files.
6. **Cloud Sync and Notification**: Complete image automatically uploads to Google Drive, generates download and preview URLs, and synchronously pushes information back to LINE assistant (including images and Google Drive links).

> 💡 No matter what product, what style, just input description content to create your own product images! Just top up and rely on AI!