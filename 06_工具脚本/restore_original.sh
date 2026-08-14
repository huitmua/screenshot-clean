#!/bin/bash
# ============================================================
# 一键恢复原版 · 截图自动清理 (com.screenshotclean.app)
# 用法：电脑连接手机（开启USB调试）后执行：
#   bash restore_original.sh
# 或指定 adb：ADB=/path/to/adb bash restore_original.sh
# 注意：注入版使用 debug 签名，与原版签名不同，
#       无法直接覆盖安装，必须卸载（应用数据会清空）。
# ============================================================
set -e
ADB="${ADB:-adb}"
DIR="$(cd "$(dirname "$0")/.." && pwd)"
ORIGINAL="$DIR/02_原版APK/截图自动清理.apk"
PKG=com.screenshotclean.app

command -v "$ADB" >/dev/null 2>&1 || { echo "错误：未找到 adb，请先安装 Android SDK Platform-Tools"; exit 1; }
[ -f "$ORIGINAL" ] || { echo "错误：找不到原版 APK: $ORIGINAL"; exit 1; }

echo "[1/3] 检查设备连接..."
"$ADB" get-state >/dev/null

echo "[2/3] 卸载注入版（数据将被清空）..."
"$ADB" uninstall $PKG || true

echo "[3/3] 安装原版..."
"$ADB" install "$ORIGINAL"

echo "✅ 完成！原版 v1.2 已恢复。请重新授予：通知 / 媒体 / 所有文件 / 电池白名单权限。"
