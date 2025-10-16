> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)
# 🔥 省力工具！OpenAI 最新圖片模型 GPT-image-1 登場！如何打造電商商品圖片，建立圖片靈感來源 AI Agent [![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/DCjv00f6lXI)

![OpenAI GPT-image-1 電商品圖 AI Agent](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/cover.png?raw=true)

## 📋 必要條件 Prerequisites

- n8n v1.0+ 已安裝並運行
- API Keys 需求:
  - ✅ OpenAI API Key (GPT-image-1, DALL·E 2/3) (必需)
  - ✅ LINE Message API Token (必需)
  - ✅ Google Service Account (必需)
- 其他工具:
  - LINE 開發者帳戶
  - Google Drive 儲存空間
  - Webhook 接收端點設定

## 作者資訊

* **作者：** Alexhsieh
* **平台：** n8n（可導入 .json 檔案了解完整流程）
* **注意事項：** 範例為學習用途，API 金鑰及機密資料未公開

---

## 📌 功能介紹

這次的省力工具串接 OpenAI 最新圖片生成模型 GPT-image-1
專為「電商商品圖片」設計打造的 AI Agent，幫助大家思考圖片生成靈感：

* ✅ 以 LINE 輸入商品描述，一鍵生成商品圖片
* ✅ 支援多種模型 DALL·E 2/3、GPT-image-1 生成圖片，自由切換
* ✅ 自動同步生成圖片至 Google Drive，方便後續雲端存取與管理
* ✅ 全程自動化，利用 prompt 提示詞，即可產製多風格商用圖片初版
* ✅ LINE 以終爲始，用 LINE 快速瀏覽生成圖片，讓靈感不丟失！

---

## 生成圖片範例與參考

生成規則：

* 商品種類與樣式
* 使用商品的模特
* 相關場景

### 商品1 - 紅色洋裝

```bash
請生成紅色的洋裝商品
25-30歲的亞洲女性
在晴朗的海邊
```

![商品1 - 紅色洋裝1](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample1-1.png?raw=true)

![商品1 - 紅色洋裝2](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample1-2.png?raw=true)

### 商品2 - 太陽眼鏡

```bash
請生成帥氣的太陽眼鏡商品
35-40歲的歐洲男性
在地鐵站
```

![商品1 - 太陽眼鏡1](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample2-1.png?raw=true)

![商品1 - 太陽眼鏡2](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/19-image-generate-ai-agent/Sample2-2.png?raw=true)

---

## 🔧 運作方式

1. **明確圖片情境訊息輸入**：透過 LINE、n8n workflow 或其他介面，輸入您的商品描述（例如：請生成紅色的洋裝商品，25-30歲的亞洲女性，在晴朗的海邊）。
2. **Webhook 接收**：n8n自動偵測訊息，透過 Webhook 收集描述文字。
3. **AI Prompt 建構**：系統將輸入內容組裝為 AI 理解所需的英文 prompt，並依需求創建圖片生成指令。
4. **調用生成 API**：用正確參數呼叫圖片生成 API，設定生成張數、畫質等。
5. **自動接收生成圖檔**：API 回傳圖片（Base64 編碼），n8n流程自動轉換為 PNG/JPG 圖檔。
6. **雲端同步與通知**：完成圖片自動上傳至 Google Drive，生成下載與預覽網址，同步推播信息回 LINE 助理（含圖片與 Google Drive 連結）。

> 💡 無論任何商品、任何風格，只需輸入描述內容，便能打造屬於你的商品圖！只要儲值黃金靠 AI！


---

## 🚀 快速上手 n8n 自動化資源懶人包

### 🎓 學習與社群

* 🔗 [加入 AI 學習社群 (Skool)](https://www.skool.com/ai-brain-alex/about?ref=5dde9b20e8e7432aa9a01df6e89685f4)
  建立學習 AI 與 n8n 的學習路徑，無痛上手！
* 🔗 [加入 Line 社群一起搞懂 AI](https://line.me/ti/g2/ZypIgLSzVPweRBgBqKvaRU10WEmnotuZOr7Lpg)
  互相幫助前進！打造自己的 AI 自動化場景！

### 📚 教學資源

* 🎥 [n8n AI 自動化工作流：從基礎到進階實戰](https://youtube.com/playlist?list=PLUf88uk7T54I83MBdbuXgUuA8rVklF4FA&si=wHsQw8YJu-erSdLd)
  YouTube 系列教學，邊看邊做快速上手！
* ⏱️ [碎片化時間學習 n8n](https://youtube.com/playlist?list=PLUf88uk7T54Iv6LV2NFgdTghaX2cPhtgH&si=G3gj2qn179ZFUqAZ)
  每天5分鐘學習，自動化養成沒負擔。

### 🛠️ 部署與工具

* 🧩 [zeabur n8n 部署模板 (隨時更新)](https://zeabur.com/zh-TW/templates/0TUVZ7?referralDesktop=qwedsazxc78)
  零架設壓力，點擊部署即可使用，適合初學者與進階用戶。
* 🌐 [n8n 官方網站](https://n8n.io/)
  了解更多功能與文件，掌握最新更新。
