🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁体中文](./readme.md)

# OpenAI推出ChatGPT购物搜索助理！n8n AI Agent能做到一样的购物搜索功能吗？ChatGPT Shopping Search｜🧠 省力知识库[![YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/5pkLFXLQp6U)

![OpenAI推出ChatGPT购物搜索助理](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/21-n8n-shopping-search-agent/cover.png?raw=true)

## 作者信息

* **作者：** Alexhsieh
* **平台：** n8n/ChatGPT
* **注意事项：** `.json` 模板内已移除所有API密钥

---

## 📌 功能介绍

全面剖析OpenAI最新推出的ChatGPT购物搜索助理功能
并对比n8n AI Agent在购物搜索场景的使用。

**主要测试包括：**

* ✅ 在ChatGPT界面内一键搜索国内外电商商品（如Amazon、Momo等）
* ✅ 自动生成商品清单、比价表，并直出导购链接
* ✅ 提供商品特色、标签、价格、评分、即时推荐
* ✅ 新增商品轮播、商品标签、AI自动推荐等互动体验
* ✅ n8n Search Agent实际使用Web Search/HTTP API，自动找出指定需求的商品信息

---

## 🔧 运作方式

### ChatGPT购物助理运作流程

1. **用户输入商品需求**：如「请找300美金的飞行夹克」
2. **串联OpenAI Search**：电商网站，主动推荐清单、比价、价格与特色
3. **前端UI**：呈现商品轮播、标签、价格、说明及导购链接
4. **数据来源**：为结构化SEO/网络第三方通路串接，并即时更新
5. **开放商家商品数据自由上传**：自动收录于OpenAI的推荐清单

### n8n AI Agent购物搜索运作流程 -> 用户体验不赢

1. **串接OpenAI Web Search API**：利用HTTP Request节点串接OpenAI Web Search API，根据用户指令直接发出查询
2. **AI Agent**：回传符合搜索条件的商品列表或API信息（如关键字、价格、卖家等）
3. **整合搜索回传**：自动整理为文字列表/摘要，无前端轮播或互动UI