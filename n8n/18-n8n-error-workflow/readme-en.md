> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# Learn n8n Error Handling Workflow in 8 Minutes! 3 Major Notification Methods - LINE, Email, Google Sheet to Monitor 99% of Errors in Real Time｜🧠 Efficient Knowledge Base [![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/Yt0gVZX_OGQ)

![n8n Error Handling Workflow](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/18-n8n-error-workflow/cover.png?raw=true)

## Author Information

* **Author:** Alexhsieh
* **Platform:** n8n (You can import the `.json` file into your own n8n environment to view the complete workflow and settings)
* **Note:** All API keys and personal information have been removed from the sample file, please fill in your own when using

---

## 📌 Feature Introduction

This n8n Error Workflow is applicable to any n8n automation script and process, helping you monitor and catch 99% of workflow exceptions in real time!

* ✅ **Email (HTML Email) Real-time Notification**: Automatically send HTML emails containing error type and detailed messages to quickly identify problem sources.
* ✅ **Google Sheet Complete Records**: Record all execution details of each error occurrence in Google Sheet for long-term tracking, report statistics, and problem archiving.
* ✅ **LINE Messenger Real-time Push**: When critical errors occur, immediately push to LINE, allowing you to monitor system status anytime, anywhere, and react quickly!

---

## 🔧 How It Works

1. **Workflow Error Handling Setup**: Workflow must be switched to Active and configured with Error Workflow. Only when officially enabled can error notifications be automatically triggered.
2. **Simulate Error Generation**: Use Schedule Trigger to send an HTTP Request with intentionally invalid URL every 30 seconds to simulate real error scenarios.
3. **Multi-channel Notification Process**:
   - **Email Notification**: When errors occur, automatically send HTML emails with custom subjects and clear content marking all error details.
   - **Google Sheet Records**: Use Google Sheet to synchronously record error occurrence time, Workflow name, URL, execution ID, and error content.
   - **LINE Real-time Push**: Integrate LINE Messaging API to push messages containing error summary and tracking links, ensuring no errors are missed!
4. **Flexible Combination**: Choose single or combined use of different channels based on notification urgency and purpose.

---

## 🚀 Notification Method Selection Recommendations

* Need immediate response ➔ Choose LINE!
* Reduce interference, routine recording ➔ Use Email.
* Want long-term statistics, maintenance management ➔ Google Sheet.

> ⏰ **Reminder:** When testing, remember to "enable workflow" rather than just pressing the test button, otherwise Error Workflow won't activate! For LINE integration, please refer to the complete tutorial from the previous episode. [![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/HJKDHJ5x1F0)

---

## Extended Learning Resources

* [n8n Official Documentation](https://docs.n8n.io/)
* [Previous Episode: Learn n8n LINE Messenger API Integration in 8 Minutes](https://youtu.be/HJKDHJ5x1F0)
* [Google Sheet API Tutorial](https://developers.google.com/sheets/api)