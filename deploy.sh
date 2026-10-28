#!/usr/bin/env bash
set -euo pipefail
# OpenBot 桌面安装包脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/nightly-labs/openbot#install
# 更新日期：2026-10-27
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

mkdir -p ~/openbot && cd ~/openbot
curl -fL -o OpenBot-setup.exe "https://github.com/nightly-labs/openbot/releases/download/v0.52.1/OpenBot-0.52.1-x64.exe"
echo "574b099f2e56764e437f7a89f511de8c591f328ad23c915c6e0ed32f015d7266  OpenBot-setup.exe" | shasum -a 256 -c -
echo "校验通过：运行安装包，首次启动会要求确认权限"

echo ""

echo "安装完成：首次启动会要求确认权限，再在设置里接入 Codex、Claude 或其它模型的凭据"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/nightly-labs/openbot#install"
