🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# 如何用n8n达成产品影片自动化，n8n step by step教学 | ChatGPT-Image-1 + runway | 🔥 省力工具[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/Aixy9qH9K98)

为零基础或自动化爱好者设计，n8n结合AI图片生成GPT-Image-1与影片生成工具Runway
结合产生end-to-end的全自动产品行销影片工作流
每一步均有图文解说与错误排除经验，帮助你深入理解流程
马上开始用这个自动化工作流，帮你节省工作时间！

![产品影片自动化教学](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/22-n8n-product-video-automation/cover.png?raw=true)

## 作者信息

* **作者：** Alexhsieh
* **平台：** n8n（自动化流程设计，支持外部工具API整合）
* **注意事项：** 本流程范例已去除所有私人API密钥

---

## 📌 功能介绍

这支教学影片将完整示范如何利用n8n结合ChatGPT-Image-1以及Runway，从头到尾自动产生高质感产品影片。只需准备一张产品图片及简单叙述，即可自动完成下列任务：

* ✅ 上传产品图片、产品名称、产品描述
* ✅ 利用GPT-Image-1修改并生成全新产品渲染图
* ✅ 用Runway API自动产生具有动态与特效的产品展示影片
* ✅ 生成成果自动发送Email，并备份影片到Google Drive

> 不论是个人卖家或品牌团队，都能轻松应用于商品上架、社群宣传与行销素材生成！

---

## 🔧 运作方式

以step by step教学方式，带领你从零打造产品影片的自动化流程，包含以下步骤：

1. **表单纪录**: 利用n8n前端表单，简单输入及上传产品图片、名称、描述，数据自动记录并进入workflow。
2. **图片处理AI自动化**: 通过AI Agent（ChatGPT-Image-1），自动生成优化后渲染图。图片先上云端，再用API产生产品专业级图片。
3. **Runway产生产品展示影片**: 使用Runway的API，依据生成图片及文字描述，以自动化方式建立产品行销影片。
4. **Email通知 & google drive备份**: 任务完成后，系统自动email通知、附产品影片链接。最终成果自动同步备份至Google Drive，便于查阅管理。

---

## ⏩ 参考模版与实用细节

* 采用step by step分步骤说明，每一步皆附实作诀窍、错误排除与API权限设定提醒。
* 示范范例包含咖啡保温杯、日本木质汤匙等商品，适合跟做练习。
* 参考目录的两个范例影像与提示词prompt

> 小提醒：Runway API呼叫需开通付费帐号，Google Drive权限需设定共享，确保流程可自动存取。