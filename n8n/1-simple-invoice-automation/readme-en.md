> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 Efficient Tool! Invoice Auto-Organizer Robot, Use n8n to Help You Automatically Convert Invoices to Spreadsheets. [![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://www.youtube.com/channel/UCDMJaaMu3nGNc7bNKMAtS7Q)

![Invoice Auto-Organizer Robot](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/1-simple-invoice-automation/cover.png?raw=true)

## 📋 Prerequisites

- n8n v1.0+ installed and running
- API Keys required:
  - ✅ OpenAI API Key (ChatGPT) (required)
  - ✅ Google Service Account (required)
- Other tools:
  - Gmail account with Gmail API enabled
  - Google Drive storage space
  - Google Sheets spreadsheet permissions

## Author Information

* **Author:** AlexHsieh
* **Platform:** n8n (You can import the `.json` file into your own n8n to view the complete workflow)

---

## 📌 Feature Introduction

This AI automation tool can automatically organize and manage invoices in emails. Main features include:

* ✅ **Automatically download electronic invoices** and save them to Google Drive for future management
* ✅ **Use ChatGPT to parse invoice content** and summarize them into an invoice list
* ✅ **Custom Gmail filtering rules** to automatically tag processed emails
* ✅ **Google Sheets integration** to ensure all invoice information is centrally managed

---

## 🔧 How It Works

1. **Receive & Classify:** Use Gmail labels and ChatGPT to automatically classify and organize invoices from different vendors.
2. **Download & Store:** When Gmail receives qualifying invoice emails, n8n automatically triggers PDF download and saves to Google Drive.
3. **Content Parse & Export:** Use ChatGPT to convert PDF information into structured JSON format and output to Google Sheets for future queries.
4. **Auto Update & Management:** The system automatically updates data, avoids duplicate processing, and maintains email system cleanliness by marking processing status.

This automated workflow can significantly improve invoice management efficiency, making tedious organizing work easy and efficient!

---

## 🚀 Download Resources

[n8n Link](https://n8n.io/)
[n8n Deploy Zeabur Link](https://zeabur.com/referral?referralCode=qwedsazxc78)