# OpenBot 桌面安装包脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/nightly-labs/openbot#install
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\openbot" | Out-Null
Set-Location "$env:USERPROFILE\openbot"
curl.exe -L --fail -o OpenBot-setup.exe "https://github.com/nightly-labs/openbot/releases/download/v0.52.1/OpenBot-0.52.1-x64.exe"
if ((Get-FileHash OpenBot-setup.exe -Algorithm SHA256).Hash.ToLower() -ne '574b099f2e56764e437f7a89f511de8c591f328ad23c915c6e0ed32f015d7266') { throw 'SHA256 校验失败，请重新下载' }
Start-Process -FilePath (Join-Path $PWD 'OpenBot-setup.exe')

Write-Host ''

Write-Host '安装完成：首次启动会要求确认权限，再在设置里接入 Codex、Claude 或其它模型的凭据'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/nightly-labs/openbot#install'
