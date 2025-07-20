> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# [2025 Latest] 5-Minute Setup n8n + Google OAuth | 🧠 Effortless Knowledge Base [![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/V-iT-HbBOew)

![n8n with Google OAuth](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/10-n8n-with-google-oauth/cover.png?raw=true)

Complete Google service OAuth permission setup in 5 minutes and configure n8n Google service permissions.

## Author Information

* **Author:** Alexhsieh
* **Platform:** n8n (You can import the `.json` file into your own n8n to view the complete workflow)
* **Note:** All API keys have been removed from the `.json` file

---

## 📌 Feature Overview

Detailed explanation of how to integrate `n8n` with multiple Google services.
5-minute setup of Google OAuth to ensure access to Google Sheet, Docs, Drive, Calendar, and Gmail services.

*  ✅ **Google Project Setup**: Step-by-step operations on how to configure OAuth in Google Cloud.
*  ✅ **API Integration**: Ensure each API is enabled and necessary credentials are generated.
*  ✅ **Google Service OAuth Permission Setup**: n8n service permission installation and configuration.

> ⚠ **Note:** Prerequisites require operations to be performed under an already activated Google Cloud service.

---

## 🔧 How It Works

1. **Create Google Project and Enable APIs**
   - Log into Google Cloud Console and create a new project.
   - Enable required Google APIs to support n8n.

2. **Configure OAuth Consent Screen**
   - Fill in application details and specify authorized domains.

3. **Create OAuth Client ID**
   - Configure web application and record the generated client ID and secret.

4. **Configure Data Access Scopes**
   - Specify required OAuth information scopes to ensure access to needed Google services.

5. **Create Google OAuth Credentials in n8n**