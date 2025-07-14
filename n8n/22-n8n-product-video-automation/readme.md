> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)
# 如何用 n8n 達成產品影片自動化，n8n step by step 教學｜ChatGPT-Image-1 + runway｜🔥 省力工具[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/Aixy9qH9K98)

為零基礎或自動化愛好者設計，n8n 結合 AI 圖片生成 GPT-Image-1  與影片產生工具 Runway
結合產生 end-to-end 的全自動產品行銷影片工作流
每一步均有圖文解說與錯誤排除經驗，幫助你深入理解流程
馬上開始用這個自動化工作流，幫你節省工作時間！

![產品影片自動化教學](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/22-n8n-product-video-automation/cover.png?raw=true)

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n（自動化流程設計，支援外部工具 API 整合）
* **注意事項：** 本流程範例已去除所有私人 API 金鑰

---

## 📌 功能介紹

這支教學影片將完整示範如何利用 n8n 結合 ChatGPT-Image-1 以及 Runway，從頭到尾自動產生高質感產品影片。只需準備一張產品圖片及簡單敘述，即可自動完成下列任務：

* ✅ 上傳產品圖片、產品名稱、產品描述
* ✅ 利用 GPT-Image-1 修改並生成全新產品渲染圖
* ✅ 用 Runway API 自動產生具有動態與特效的產品展示影片
* ✅ 生成成果自動發送 Email ，並備份影片到 Google Drive

> 不論是個人賣家或品牌團隊，都能輕鬆應用於商品上架、社群宣傳與行銷素材生成！

---

## 🔧 運作方式

以 step by step 教學方式，帶領你從零打造產品影片的自動化流程，包含以下步驟：

1. **表單紀錄**: 利用 n8n 前端表單，簡單輸入及上傳產品圖片、名稱、描述，資料自動記錄並進入 workflow。
1. **圖片處理 AI 自動化**: 通過 AI Agent（ChatGPT-Image-1），自動生成優化後渲染圖。圖片先上雲端，再用 API 產生產品專業級圖片。
2. **Runway 產生產品展示影片**: 使用 Runway 的 API，依據生成圖片及文字描述，以自動化方式建立產品行銷影片。
3. **Email 通知 & google drive 備份**: 任務完成後，系統自動 email 通知、附產品影片連結。最終成果自動同步備份至 Google Drive，便於查閱管理。

---

## ⏩ 參考模版與實用細節

* 採用 step by step 分步驟說明，每一步皆附實作訣竅、錯誤排除與 API 權限設定提醒。
* 示範範例包含咖啡保溫杯、日本木質湯匙等商品，適合跟做練習。
* 參考目錄的兩個範例影像與提示詞 prompt

> 小提醒：Runway API 呼叫需開通付費帳號，Google Drive 權限需設定共享，確保流程可自動存取。
