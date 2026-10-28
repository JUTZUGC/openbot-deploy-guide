# OpenBot 桌面安装包指南

> 第三方部署指南 · 非 OpenBot 官方仓库。官方项目：[nightly-labs/openbot](https://github.com/nightly-labs/openbot)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/nightly-labs/openbot#install)为准。

[![⚡ 桌面安装包](https://img.shields.io/badge/%E2%9A%A1_%E6%A1%8C%E9%9D%A2%E5%AE%89%E8%A3%85%E5%8C%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#桌面安装包推荐用百度搭子)

## 桌面安装包（推荐：用百度搭子）

> [!TIP]
> 想让几个 AI 像同事一样分工干活？让百度搭子把 OpenBot 装上，每个 Agent 一个工位。

⚠️ 许可证是 PolyForm 非商业 1.0，商业使用需另行授权。项目仍是开发预览版，Agent 默认以完全访问权限运行（不逐条确认），能读写文件、执行命令、控制内置浏览器，请只在可信任务与可备份的目录里使用。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/openbot-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子下载 Windows 安装包并核对 SHA256，然后启动安装，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## OpenBot 是什么？

OpenBot 是开源的2.8k stars，PolyForm 非商业许可，给每个 Agent 独立工作区、消息队列与内置浏览器（协议：PolyForm Noncommercial 1.0.0，<img src="https://img.shields.io/github/stars/nightly-labs/openbot?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一个本地优先的桌面工作台：给每个 AI Agent 分配独立工作区与对话，支持任务队列、文件传递、内置浏览器和 Agent 之间的消息往来，还能接本机的 Claude Code、Codex、Grok 等命令行 Agent。

- 2.8k stars：2026-08 建仓，属于早期但增长快
- 本地优先：数据和工作区都在自己电脑上
- 多 Agent 协作：Agent 之间能发消息、回帖、传文件
- 任务队列：FIFO 排队，支持暂停、恢复、取消、崩溃恢复
- 内置浏览器：Agent 能打开页面并操作
- 多引擎：Codex、Claude Code、Grok、OpenCode、Gemini、Cursor、Cline 都能接

（来源：[官方仓库](https://github.com/nightly-labs/openbot)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 本地优先 | 工作区与数据都在本机 |
| 多 Agent | 自带消息、委派、文件传递 |
| 队列稳 | 崩溃后可恢复 |
| 内置浏览器 | Agent 能操作页面 |
| 引擎多 | 七种 CLI Agent 都能接 |
| 可选计算机操作 | release 内含 cua-driver |

| 需要注意 | 说明 |
|---|---|
| 非商业许可 | 商用需授权 |
| 开发预览版 | 稳定性没保证 |
| 默认完全放权 | Agent 不做逐条确认 |
| 安装包很大 | 250 MB 以上 |
| 仅桌面端 | 没有 Web 版 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
mkdir -p ~/openbot && cd ~/openbot
curl -fL -o OpenBot-setup.exe "https://github.com/nightly-labs/openbot/releases/download/v0.52.1/OpenBot-0.52.1-x64.exe"
echo "574b099f2e56764e437f7a89f511de8c591f328ad23c915c6e0ed32f015d7266  OpenBot-setup.exe" | shasum -a 256 -c -
echo "校验通过：运行安装包，首次启动会要求确认权限"
```

安装包来源：[https://github.com/nightly-labs/openbot/releases/tag/v0.52.1](https://github.com/nightly-labs/openbot/releases/tag/v0.52.1)

## 验证状态

| 场景 | 状态 |
|---|---|
| 仓库元数据核对：2,845 stars、262 forks、2026-08-12 建仓 | 已核对 2026-10-28 |
| 许可证核对：README 徽章与 LICENSE 均为 PolyForm Noncommercial 1.0.0（API 返回 NOASSERTION） | 已核对 2026-10-27 |
| GitHub Trending 日榜 +777 | 已核对 2026-10-27 |
| Release v0.52.1 核对 Windows 包 259.3 MB，SHA256 574b099f...015d7266 | 已核对 2026-10-27 |
| README 确认七个引擎接入方式与默认 danger-full-access 警告 | 已核对 2026-10-27 |
| 未实测安装与多 Agent 协作 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

OpenBot 不是 MCP server，通过 ACP 与各家 CLI Agent 对接；本仓库只负责安装，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\openbot-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 各平台安装包

| 平台 | 文件 | 体积 |
|---|---|---|
| Windows x64 | `OpenBot-0.52.1-x64.exe` | 259.3 MB |
| macOS Apple 芯片 | `OpenBot-0.52.1-arm64.dmg` | 309.8 MB |
| macOS Intel | `OpenBot-0.52.1-x64.dmg` | 318 MB |
| Linux x64 | `OpenBot-0.52.1-x86_64.AppImage` | 283.2 MB |
| Linux arm64 | `OpenBot-0.52.1-arm64.AppImage` | 225.1 MB |

每个包都配了 `SHA256SUMS-*.txt`。

### 首次配置

1. 启动后先读完权限说明并确认
2. 在设置里接入引擎：Codex App Server、Claude Code、Grok CLI、OpenCode、Gemini、Cursor CLI、Cline
3. 填模型提供商；本地 Ollama / LM Studio 会被自动检测
4. 给每个 Agent 建独立工作区，再分配任务

### 能干什么

| 能力 | 说明 |
|---|---|
| 任务队列 | FIFO，可暂停、恢复、取消，进程崩溃也能恢复 |
| Agent 互发消息 | 回复、表态、图片、文件传递 |
| 共享频道 | 一个任务负责人，可显式委派、改派、归档 |
| 内置浏览器 | Agent 能自己打开、检查、操作页面 |
| Computer Use | 可选，通过 release 里的 `cua-driver` 操作桌面 |

### Linux 注意

Ubuntu 23.10+ 与 Debian 13 的用户命名空间受 AppArmor 限制，要装官方配置：

```bash
sudo install -m 0644 build/linux/openbot.apparmor /etc/apparmor.d/openbot
sudo systemctl reload apparmor
```

> ⚠️ 不要用 `--no-sandbox` 启动，那会去掉渲染进程与系统之间的隔离。许可证为非商业，商用前先联系作者。

## 常见坑

- 启动被拦：Windows SmartScreen 选「更多信息 → 仍要运行」
- Agent 乱改文件：先备份，或只在专门的测试目录里跑
- 引擎连不上：确认对应 CLI 已安装并登录，且在 PATH 里
- Linux 起不来：按官方说明装 AppArmor 配置，别用 `--no-sandbox`
- 本地模型没识别：确认 Ollama / LM Studio 正在监听默认端口
- 商业用途：当前许可禁止，需先联系作者拿授权

## 免责声明

本仓库为第三方指南，与 OpenBot 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/nightly-labs/openbot#install)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
