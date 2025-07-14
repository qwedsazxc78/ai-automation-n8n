> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 省力工具！逐字稿跟srt字幕檔自動轉換機器人，用n8n幫你音訊檔自動轉好轉滿｜免費模板下載[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/CzeYiRmV45M)

![🔥 省力工具](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/2-auto-translate-subtitle-automation/cover.png?raw=true)

## 作者資訊

* **作者：** AlexHsieh
* **平台：** n8n（可導入`.json`文件查看詳細流程）

---

## 📌 功能介紹

這個 n8n 自動化工具能夠將音訊檔案，轉換為文字逐字稿以及SRT字幕檔，提供以下功能：

* ✅ **逐字稿轉換：** 使用AI自動生成逐字稿，適合會議記錄
* ✅ **字幕生成：** 自動生成SRT字幕，適合影片編輯
* ✅ **資料夾管理：** 將所有處理後的文件組織到指定資料夾

* [Opena AI Speech to text 說明文件](https://platform.openai.com/docs/guides/speech-to-text)

---

## 🔧 運作方式

1. **建立工作資料夾：** 在Google Drive設置專用資料夾以處理每個階段
2. **自動觸發流程：** 上傳音訊檔後，自動觸發整個轉錄流程
3. **逐字稿生成：** 使用OpenAI Whisper API進行語音轉文字，並且利用 gpt-4o 再次校正逐字稿
4. **SRT檔生成：** 將音檔轉換為SRT文件以便於字幕使用
5. **檔案分類與存儲：** 將所有完成的工作移至完成檔案資料夾，幫助辨識工作完成

透過這個流程，我們能夠快速且準確地自動化音訊轉檔作業，非常適合企業內部文件處理以及影片字幕製作。
這套工具讓每一次處理都更加輕鬆方便！

---

## 🚀 下載資源

[n8n 連結](https://n8n.io/)
[n8n 部署 zeabur 連結](https://zeabur.com/referral?referralCode=qwedsazxc78)
