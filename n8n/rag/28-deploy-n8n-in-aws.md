> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)
# 免費部署 n8n 到 AWS！Lightsail + Cloudflare 快速搞定｜Lightsail 3 個月 0 元購，新手也能輕鬆上手[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/VsYy-1CHtns)

![cover](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/28-deploy-n8n-in-aws/cover.png?raw=true)

---

## aws 基本版 n8n 部署

[專案連結](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/cloud-ai/aws)

## 🎯 目標

透過 AWS LightSail，以及 Cloudflare DNS 服務，手把手教你免費部署 n8n 自動化工具到雲端！
完整過程從設定 AWS LightSail VM、Docker 一鍵安裝、域名綁定到 HTTPS 安全加密，
全面提升自動化專案的可靠性與專業度。

---

## 🏷️ 對應情境

* 想把 n8n 建置到 AWS 雲端，享受隨時擴充、超穩定的自動化環境
* 預算有限，希望善用 AWS Lightsail 免費額度、降低運維成本
* 需要自己的網址、安全 HTTPS 存取工作流（如業務自動化、Webhook 串接、API 自動任務）

---

## 📍 你可以從影片中獲得

* Step by Step 新手也能懂的 n8n 雲端自動化部署流程
* AWS Lightsail VM 建置、設定固定 IP、防火牆設定全攻略
* 如何用 Docker Compose 只需一行指令快速安裝 n8n
* Cloudflare 註冊、DNS 設定與綁定自己網域名
* 以 HTTPS 安全加密部署服務，讓自動化更專業，配合 Nginx 強化安全與彈性
* 新手最常遇到的設定疑問、錯誤提示及實務解法
* Docker 與 Nginx 的進階運作理解，並學習雲端跨平台應用的部署小技巧 ⚡️

---

## 🚀 簡易流程大綱

1. 申請 AWS 帳號、啟用 Lightsail 並建立 VM（建議選 Tokyo，Ubuntu 24.04、$7/1GB）
2. 為 VM 綁定靜態 IP，設置 Firewall 開啟 443 port
3. 用 SSH 連線，安裝 Docker 環境與權限，git clone 預設專案檔案
4. 執行 `docker compose up`，自動啟動 n8n 及 Nginx 服務
5. 註冊 Cloudflare，設定 DNS，把你自己的網域解析到剛剛的 VM IP
6. 調整 Docker Compose/.env 設定你的網域名稱，重啟服務即可

---

## 📝 注意小撇步

* Lightsail 新註冊免費三個月，適合測試與新手
* n8n 開 HTTPS 預設自簽憑證，Cloudflare 域名聯動建議開 Proxy 增加安全
* 下次要換雲端平台（如 GCP, Azure），整體架構同理可遷移
* 有問題可加入影片說明中的 Skool 社群互助解惑

---

## 🚀 快速上手 n8n 自動化資源懶人包

### 🎓 學習與社群

* 🔗 [加入 AI 學習社群 (Skool)](https://www.skool.com/ai-brain-alex/about?ref=5dde9b20e8e7432aa9a01df6e89685f4)
  和上百位 AI / n8n 自動化愛好者一起學習、交流與成長！

### 📚 教學資源

* 🎥 [n8n AI 自動化工作流：從基礎到進階實戰](https://youtube.com/playlist?list=PLUf88uk7T54I83MBdbuXgUuA8rVklF4FA&si=wHsQw8YJu-erSdLd)
  YouTube 系列教學，邊看邊做快速上手！
* ⏱️ [碎片化時間學習 n8n](https://youtube.com/playlist?list=PLUf88uk7T54Iv6LV2NFgdTghaX2cPhtgH&si=G3gj2qn179ZFUqAZ)
  每天5分鐘學習，自動化養成沒負擔。

### 🛠️ 部署與工具

* 🧩 [zeabur n8n 部署模板 (隨時更新)](https://zeabur.com/zh-TW/templates/0TUVZ7?referralCode=qwedsazxc78)
  零架設壓力，點擊部署即可使用，適合初學者與進階用戶。
* 🌐 [n8n 官方網站](https://n8n.io/)
  了解更多功能與文件，掌握最新更新。
