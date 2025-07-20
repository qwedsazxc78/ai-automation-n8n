> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 🔥 省力工具！逐字稿跟srt字幕档自动转换机器人，用n8n帮你音频档自动转好转满｜免费模板下载[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/CzeYiRmV45M)

![🔥 省力工具](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/2-auto-translate-subtitle-automation/cover.png?raw=true)

## 作者信息

* **作者：** AlexHsieh
* **平台：** n8n（可导入`.json`文件查看详细流程）

---

## 📌 功能介绍

这个 n8n 自动化工具能够将音频文件，转换为文字逐字稿以及SRT字幕档，提供以下功能：

* ✅ **逐字稿转换：** 使用AI自动生成逐字稿，适合会议记录
* ✅ **字幕生成：** 自动生成SRT字幕，适合影片编辑
* ✅ **文件夹管理：** 将所有处理后的文件组织到指定文件夹

* [Opena AI Speech to text 说明文件](https://platform.openai.com/docs/guides/speech-to-text)

---

## 🔧 运作方式

1. **建立工作文件夹：** 在Google Drive设置专用文件夹以处理每个阶段
2. **自动触发流程：** 上传音频档后，自动触发整个转录流程
3. **逐字稿生成：** 使用OpenAI Whisper API进行语音转文字，并且利用 gpt-4o 再次校正逐字稿
4. **SRT档生成：** 将音档转换为SRT文件以便于字幕使用
5. **文件分类与储存：** 将所有完成的工作移至完成文件文件夹，帮助辨识工作完成

通过这个流程，我们能够快速且准确地自动化音频转档作业，非常适合企业内部文件处理以及影片字幕制作。
这套工具让每一次处理都更加轻松方便！

---

## 🚀 下载资源

[n8n 链接](https://n8n.io/)
[n8n 部署 zeabur 链接](https://zeabur.com/referral?referralCode=qwedsazxc78)