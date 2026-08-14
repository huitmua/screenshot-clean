# 截图自动清理 · 灵动岛倒计时版（v2.7）

> 最新版本：**v2.7**（2026-08-15）｜基于 v1.4 注入方案扩展：在原有"切后台自动从最近任务栏消失"基础上，新增 **HyperOS 灵动岛倒计时** 全套功能。
> 适用设备：Redmi / 小米（HyperOS / MIUI，Android 15/16，水滴屏灵动岛）

---

## ✨ 特性总览

### 🆕 v2.7 新增（灵动岛倒计时）
- ✅ **截图后自动进入删除倒计时**（默认 60 秒，可在应用内设置时长）
- ✅ **HyperOS 灵动岛实时显示**（水滴屏位置，媒体岛样式）
- ✅ **三键布局**：上一曲 = 保留截图 / 下一曲 = 立即删除
- ✅ **倒计时结束自动删除**
- ✅ **可视化进度条实时同步**：与已过去时间逐秒同步，左侧数字 = 已播放时间（递增），右侧数字 = 设定总时长（固定，跟随软件设置）
- ✅ **操作 Toast 气泡反馈**：已删除 / 已保留 / 删除失败
- ✅ **多截图排队**：连续截图时自动排队，前一个倒计时完成后再开始下一个
- ✅ **删除失败提示**：文件缺失/删除失败时弹出气泡，不再静默失败

### 原有 v1.4 特性（保留）
- ✅ 切后台 3 秒自动从最近任务栏移除（任何 ROM 都生效）
- ✅ 后台服务（截图监控 / 自动清理）持续运行
- ✅ 无需 root、无需刷机、不修改系统任何代码
- ✅ 附完整 smali 注入源码 + 构建工具链，可自行修改

---

## 📦 包内文件

| 目录 | 文件 | 说明 |
|---|---|---|
| `01_成品APK/` | `app-v2.7-signed.apk` | **最新 v2.7 成品**（已注入+已签名，可直接安装） |
| `01_成品APK/` | `app-v1.4-signed.apk` | 旧版 v1.4（仅任务栏隐藏，对照/回退用） |
| `02_原版APK/` | `截图自动清理.apk` | 原始未修改版（恢复/对照用） |
| `03_签名文件/` | `debug.keystore` | 签名证书（密码 `android`，别名 `androiddebugkey`） |
| `04_注入源码/` | `Notifier.smali` | **v2.7**：倒计时通知 + MediaSession + 灵动岛三键 + 进度条 |
| `04_注入源码/` | `DeleteManager.smali` | **v2.7**：删除任务管理 + 多截图排队 + Toast 气泡 |
| `04_注入源码/` | `CountdownMediaCallback.smali` | **v2.7**：三键回调（下一首=删除 / 上一首=保留） |
| `04_注入源码/` | `MainActivity.smali` | v1.4：onStop + finishAndRemoveTask（任务栏隐藏） |
| `04_注入源码/` | `MainActivity$$ExternalSyntheticLambda7.smali` | v1.4：延迟移除 Runnable |
| `05_修改后dex/` | `classes2.dex` | **v2.7** 修改重编译后的 dex（可直替换） |
| `06_工具脚本/` | `restore_original.sh` | 恢复原版脚本 |
| `04_构建脚本/` | `BuildDex.java` | dex 重编译工具（apktool + smali 重新打包） |

---

## 🧩 v2.7 技术原理（灵动岛倒计时）

### 媒体岛（Media Island）机制
应用通过 **MediaSession + MediaStyle 通知** 伪装成"音乐播放器"，让 HyperOS 的媒体岛接管显示：
- `MediaSession.setActive(true)` + `setPlaybackState()`（state=PLAYING, speed=1.0）
- `setMetadata()` 注入标题（"倒计时 00:59"）、歌手（截图文件名）、时长（`METADATA_KEY_DURATION` = 设定秒数）
- 三键按钮：**下一首**（ACTION_SKIP_TO_NEXT）= 立即删除、**上一首**（ACTION_SKIP_TO_PREVIOUS）= 保留取消

### 进度条实时同步
- 每秒调用 `updatePlaybackState(session, deadlineMs, totalMs)`：`position = totalMs - (deadlineMs - now)`（已播放时间）
- SystemUI 的 SeekBarViewModel 通过 MediaController 回调 + 每秒轮询（`checkPlaybackPosition`）自动刷新进度条与数字

### 多截图排队
- `DeleteManager` 增加 `pendingPath / pendingName / pendingDelay` 字段：新截图到来时若已有任务在执行，则暂存为 pending，当前任务完成（删除/保留/超时）后自动启动下一个倒计时

### 操作气泡（Toast）
- 删除成功 / 保留成功 / 删除失败 三处均调用系统 Toast（应用侧实现，与媒体岛互不干扰）

---

## ⚠️ 注意事项（重要）

1. **进度条左右数字布局由 SystemUI 写死**：左侧 = 已播放时间（递增 0:00 → 设定时长），右侧 = 设定总时长（固定）。这是系统媒体岛的固定布局（与标准音乐播放器一致），**无法在应用侧交换左右**，请知悉。
2. **必须使用小米/HyperOS 系统**：灵动岛（媒体岛）为 HyperOS 特性，其他 ROM（ColorOS/OriginOS 等）不会显示。
3. **三键语义**：中间播放键为空缺；**下一曲 = 立即删除**，**上一曲 = 保留**（与原版两键方案语义一致）。
4. **倒计时期间删除其他截图**：本倒计时只针对触发它的那张截图，不影响其他图片。
5. **覆盖安装**：升级/覆盖安装必须使用**同一签名**（仓库内置 debug.keystore），否则需先卸载。
6. **通知权限**：首次运行需允许通知权限（媒体通知需要通知权限才能显示在媒体岛）。
7. **后台存活**：需在系统设置中允许自启动 + 省电策略"无限制"（配合 v1.4 任务栏隐藏方案）。
8. **录音/屏幕录制**：灵动岛显示期间不要使用屏幕录制（会截断媒体岛动画，属系统行为）。

---

## 📱 安装（3 步搞定）

1. 下载 `01_成品APK/app-v2.7-signed.apk`
2. 安装（首次需允许"安装未知应用"）
3. 打开应用 → 允许通知权限 → 设置倒计时时长 → 截一张图测试：顶部灵动岛应出现倒计时，60 秒后自动删除该截图

---

## 🔧 自己修改源码（进阶）

1. 获取原版 APK（`02_原版APK/截图自动清理.apk` 或商店原版）
2. `java -jar apktool.jar d app.apk` 解包
3. 将 `04_注入源码/` 下的 smali 放入 `smali_classes2/com/screenshotclean/app/`
4. `java -jar apktool.jar b` 重编译
5. 用 `04_构建脚本/BuildDex.java`（或 apktool 自带流程）重新生成/替换 `classes2.dex`
6. `apksigner sign --ks debug.keystore` 签名（密码 `android`）

---

## 📱 实测设备

- Redmi K80（HyperOS，Android 16，水滴屏）— v2.7 全功能实测通过

---

## 🛠 恢复原版

- 安装 `02_原版APK/截图自动清理.apk`（或运行 `06_工具脚本/restore_original.sh` 辅助）

---

## 📜 安全与免责

- 本仓库所有 APK 均使用公开的 debug.keystore 签名，仅供学习与个人使用
- 修改版应用行为与官方无关，使用风险自负
