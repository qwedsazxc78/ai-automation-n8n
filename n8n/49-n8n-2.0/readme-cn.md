# n8n 2.0 五大重点功能与无痛升级教学！

![n8n 2.0 五大重点功能与无痛升级教学封面](https://github.com/qwedsazxc78/ai-automation-n8n/blob/main/n8n/49-n8n-2.0/cover.png?raw=true)

> 🌍 **Language / 语言 / 語言**: [🇺🇸 English](./readme-en.md) | [🇨🇳 简体中文](./readme-cn.md) | [🇹🇼 繁體中文](./readme.md)

---

## 【 5 大视频重点一次看 】

1️⃣ **底层基础建设全面升级**：聚焦安全性、可靠度与效能，为长期大规模使用打好「核电厂级」的底层架构。
2️⃣ **更安全的部署流程（Publish / Save 安全气闸）**：告别「一存档就上线」的焦虑，导入草稿 + 发布两阶段，减少胖手指风险！
3️⃣ **子流程（Sub-workflow）重大突破**：子流程终于能「正确等待」节点完成再回传结果，正式支援人工审核与长流程场景。
4️⃣ **UI / UX 细节优化**：节点外观、动画、侧边栏与连接点界面全面更新，操作体验更流畅、更直觉。
5️⃣ **无痛升级与迁移报告机制**：透过 Migration Report 先看风险、再升级，搭配实战教学，让你从 n8n 1.x 平稳切换到 n8n 2.0。

---

## 🎯 目标

* 让你在 **一支视频内掌握 n8n 2.0 核心变更**，知道「为什么要升级」以及「升级后差在哪」。
* 学会 **如何安全地从 1.x 升级到 2.1.1**，并懂得检查 workflow / instance 是否受影响。
* 搞懂 **五大重点：安全性、可靠度、效能、部署流程、子流程行为**，避免升级后踩雷。
* 帮助企业或团队技术负责人，能向内部解释 **n8n 2.0 对资安与运营的实际价值**。

---

## 🛠️ 对应情境

这支视频特别适合：

* 🔐 **内部要过资安审查的团队 / 企业**：需要评估 n8n 是否适合长期自架、是否符合安全与稳定要求。
* 🧩 **已在使用 n8n 1.x 的使用者**：准备升级到 2.0，但担心 breaking changes、数据库与 workflow 兼容问题。
* 🏗️ **正在规划大规模自动化项目的人**：想确认 n8n 2.0 是否适合做为公司级自动化中枢。

---

## 🎥 你可以从视频中获得

### 1. 基础建设：安全性、可靠度与效能的全面升级

* 了解 **n8n 为何在 2.0 版本优先强化底层，而不是堆叠炫炮新功能**。
* 安全性升级重点：
  * 预设关闭高风险任务执行器（特别是 Python Executor）。
  * 禁止节点直接读取自身环境变量，降低敏感信息外泄风险。
  * 部分 `executeCommand` / 任务执行相关能力预设关闭，避免被当成系统级攻击入口。
* 可靠度强化：
  * **移除 MySQL、MariaDB 支援，统一改用 PostgreSQL**，减少边界案例与怪异 bug。
  * 移除 SQLite Legacy Driver，改用新版驱动。
* 效能提升：
  * 官方实测 SQLite 效能可以 **提升到 10 倍**，对高频触发与大量 workflow 的环境特别有感。

👉 你会知道：**为什么官方说这一版是为「长期、企业级使用」打地基**。

---

### 2. 更安全的部署机制：Publish / Save 两段式发布

* 对比 **1.x vs 2.0 的部署流程差异**：
  * 1.x：只要 workflow 是 Active，按下 Save = 立刻上线。
  * 2.0：Save 只是「储存草稿」，还需要再按一次 Publish 才会真正部署。
* 理解「安全气闸」的概念：避免改错节点、错误调整参数就直接影响线上服务。
* 提前知道官方规划：**2026 Q1 将加入 Auto Save 功能**，编辑过程自动储存，不怕忘记按 Save。

👉 看完后，你会懂得如何运用 **草稿 + 发布** 流程，打造更安全的自动化变更流程（类似 CI/CD 的「审核后才部署」概念）。

---

### 3. 子流程重大改版：支援等待与人工审核场景

* 了解 1.x 的问题：
  * 子流程（Sub-workflow）中如果有 **Wait 节点**，主流程在调用后会「立刻回传初始值」，
  * 导致 **无法正确实作人工审核 / 等待外部事件** 的长流程，只能用 workaround 绕路。
* 2.0 的改变：
  * 子流程可以 **真正「等完」Wait / 外部事件，再将最新数据回传给主流程**。
  * 让像「人工审核、表单审批、合约确认」这种流程变得可行、可维护。
* 关键行为更新：
  * **子流程必须先 Publish，才能被其他 workflow 调用。**
  * 旧习惯「建好就用」在 2.0 会踩雷，视频中会示范如何正确设定。

👉 这段看完，你可以放心设计「主流程 + 子流程 + 人工审核 + 等外部事件」的完整工作流。✅

---

### 4. UI / UX 细节优化：操作感受全面升级

* 界面外观看起来没有大改版，但多个细节大幅提升体感：
  * 节点执行时的 **红色处理动画** 更清楚，方便 Debug 与追踪流程。
  * 节点外观更加现代化，线条、配色、状态呈现更清楚。
  * 侧边栏导航体验优化，可以更容易浏览、调整与管理 workflow。
  * 节点连接点（Endpoints）会高亮显示，拖线、连线时更精准不易接错。

👉 若你每天都在用 n8n，这些小细节会让「开发、生产、除错」的整体效率明显提升。🎨

---

### 5. 无痛升级与迁移报告：从风险掌握到实际操作

* 理解为什么升级常常让人焦虑：类似升级 iOS / Android：一方面修补安全漏洞、一方面又怕旧 App 坏掉。
* 视频示范 **n8n 的 Migration Report 功能**：
  * 可以看到 **哪些 workflow / instance 可能会被 2.0 的变更影响**。
  * 针对风险项目逐一修正后，再决定是否升级。
* 实际升级步骤教学（以 2.1.1 为例）：
  1. 在项目的 n8n 设定中选择版本 2.1.1。
  2. 观察 log，确认 DB migration 是否顺利（数据表同步升级）。
  3. 若升级中服务启动失败：
     * 到 Setting 将服务设为 **Suspend（暂停）**。
     * 切换到 2.1.1 后再重新启动服务。
  4. 升级完成后：
     * 刷新版本页面，确认已在 2.1.1。
     * 逐一检查关键 workflow 是否正常运作。
* 若遇到问题：
  * 可依照 Migration Report 提示，分别从 **workflow 层级 / instance 层级** 排错。

👉 看完你会有一个 **清楚且可复制的「无痛升级流程」**，可以放心在测试环境、再到正式环境依序套用。

---

## 🚀 延伸学习与自动化资源

若你看完视频，想把 n8n 2.0 真正用在日常与项目中，可以搭配以下资源：

### 🎓 学习与社群

* 🔗 [加入 AI 学习社群 (Skool)](https://www.skool.com/ai-brain-alex/about?ref=5dde9b20e8e7432aa9a01df6e89685f4)
  建立学习 AI 与 n8n 的系统化路径，不再碎片乱学。
* 🔗 [加入 Line 社群一起搞懂 AI](https://line.me/ti/g2/ZypIgLSzVPweRBgBqKvaRU10WEmnotuZOr7Lpg)
  遇到升级、部署、workflow 设计问题，都能在群组互相交流。

### 📚 教学资源

* 🎥 [n8n AI 自动化工作流：从基础到进阶实战](https://youtube.com/playlist?list=PLUf88uk7T54I83MBdbuXgUuA8rVklF4FA&si=wHsQw8YJu-erSdLd)
  从零到一学会 n8n，搭配 2.0 新版一起实作更完整。
* ⏱️ [碎片化时间学习 n8n](https://youtube.com/playlist?list=PLUf88uk7T54Iv6LV2NFgdTghaX2cPhtgH&si=G3gj2qn179ZFUqAZ)
  每天 5 分钟，把自动化变成习惯。
* 🚀 [AI 高效生产力](https://www.youtube.com/playlist?list=PLUf88uk7T54KokZQSM_YRJHtou-GxucZ2)
  结合 AI 工具 + n8n，打造个人与团队的工作效率系统。

### 🛠️ 部署与工具

* 🧩 [Zeabur n8n 部署模板（随时更新）](https://zeabur.com/zh-TW/templates/0TUVZ7?referralDesktop=qwedsazxc78)
  不想自己架服务器？一键部署 n8n，适合初学者到进阶使用者。
* 🌐 [n8n 官方网站](https://n8n.io/)
  查看最新版本、Release Note、文件与社群资源。

---

## 🐳 本地 Docker 升级至 n8n 2.0

若你使用本项目的 **local-ai/basic** 进行本地部署，可以参考以下步骤升级至 n8n 2.0：

### 📁 本地部署资源

* 📂 [local-ai/basic](https://github.com/qwedsazxc78/ai-automation-n8n/tree/main/local-ai/basic) - 本地 Docker Compose 部署设定

### 🔄 升级步骤

```bash
# 1. 进入 local-ai/basic 目录
cd local-ai/basic

# 2. 停止现有服务
docker-compose down

# 3. 拉取最新 n8n 镜像（包含 2.0 版本）
docker pull n8nio/n8n:latest

# 4. 或指定特定版本（例如 2.1.1）
# docker pull n8nio/n8n:2.1.1

# 5. 重新启动服务
docker-compose up -d

# 6. 查看升级日志，确认 DB migration 是否顺利
docker-compose logs -f n8n
```

### ⚠️ 升级前注意事项

1. **备份数据**：升级前建议先备份 PostgreSQL 数据库与 n8n volume
   ```bash
   # 备份 PostgreSQL 数据
   docker exec n8n-postgres pg_dump -U n8n n8n > backup_$(date +%Y%m%d).sql
   ```

2. **确认兼容性**：n8n 2.0 移除了 MySQL/MariaDB 支援，本项目的 local-ai/basic 已使用 PostgreSQL，可直接升级

3. **检查 Migration Report**：升级后登入 n8n，查看是否有任何 workflow 受到影响

4. **测试关键 workflow**：升级完成后，逐一测试重要的自动化流程

### 🎯 指定版本升级

若要升级至特定版本，修改 `docker-compose.yml` 中的镜像标签：

```yaml
# 原本（使用最新版）
image: n8nio/n8n:latest

# 改为指定版本
image: n8nio/n8n:2.1.1
```

然后执行：

```bash
docker-compose up -d --force-recreate
```
