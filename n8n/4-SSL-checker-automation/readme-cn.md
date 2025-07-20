> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 IT 省力工具！SSL 证书管理与证书过期通知自动化[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/VVXYiKapIKg)

![SSL 证书管理](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/4-SSL-checker-automation/cover.png?raw=true)

## 作者信息

* **作者：** AlexHsieh
* **平台：** n8n（您可以将 `.json` 文件导入自己的 n8n 来查看完整流程）

---

## 📌 功能介绍

此 IT 自动化工具帮助用户管理 SSL 证书过期通知，确保网站的 SSL 证书不会过期。主要功能包括：

* ✅ **SSL 证书监控与管理**（定期检查与更新 SSL 证书信息）
* ✅ **过期通知**（在 SSL 证书即将过期时自动发送提醒电子邮件）

> ⚠ **注意：** 确保所有 SSL 证书的信息都是最新的，避免证书过期问题。

---

## 🔧 运作方式

1. **准备网域名单** ：手动或自动撷取所有网域，储存在 Google Sheet
2. **查询SSL 证书信息** ：使用 `sslcheck.io` 查询证书状态，确认每个网站的 SSL 状况
3. **设置过期提醒机制** ：当 SSL 证书少于 7 天即将过期时，自动发送邮件给相关人员提醒更新证书
4. **更新至 Google Sheet** ：自动更新并储存查询结果，确保 SSL 证书信息纪录完整

通过这个流程，使用者可以轻松与高效得维护所有 SSL 证书，再也不用担心因为过期而造成的网站中断。

---

## 🚀 下载资源

[n8n 链接](https://n8n.io/)
[n8n 部署 zeabur 链接](https://zeabur.com/referral?referralCode=qwedsazxc78)