# 截图自动清理 · 灵动岛倒计时版（v2.9）

> 适用设备：Redmi (HyperOS / MIUI，Android 15/16)
> 功能：截图后自动清理 + HyperOS 灵动岛倒计时（水滴屏）

---

## ✨ v2.9 更新内容（本轮）

### 1. 倒计时暂停 / 继续（核心新增）
- 灵动岛媒体控件新增「暂停/继续」能力：
  - 点 **⏸（两条杠）** → 立即暂停：顶部倒计时文字冻结、底部进度条停住、左侧递增数字停住，删除定时器取消（**暂停期间不会删除**）
  - 点 **▶️（三角形）** → 从剩余时间继续倒数，进度条与递增数字恢复走动，跑完剩余时长才删除
  - 暂停/恢复均有 Toast 气泡反馈（「已暂停，剩余 00:5x」/「已继续，剩余 00:4x」）
- 实现：
  - `DeleteManager` 新增 `pauseTask(path)` / `resumeTask(path)`，Task 新增 `paused` / `remainingMs` 字段
  - 暂停时记录剩余毫秒并移除删除定时器；恢复时按剩余毫秒重建 deadline 并重新排队删除定时器
  - `Notifier` 新增 `setCountdownState(deadline, total, paused)` + `updatePlaybackState2(...)`：暂停态下发 `PAUSED + speed=0`（进度条/递增数字冻结），恢复态下发 `PLAYING + speed=1.0`
  - ticker 每秒刷新时跳过已暂停任务（倒计时文字冻结）

### 2. 排队机制（保持不变，天然兼容暂停）
- 前面任务没跑完，后面的倒计时不会开始；**前面暂停多久，后面的就无限期排队等待**
- 排队逻辑零改动：任务完成后自动启动下一个

### 3. 移除「加时」逻辑
- v2.8 的「每次点击 +1 分钟」（addTime）已整体移除，只保留暂停/继续，**总时长、进度条算法、删除判定全部不变**，降低出错风险

---

## 📦 包内文件

| 目录 | 文件 | 说明 |
|---|---|---|
| `01_成品APK/` | `app-v2.9-signed.apk` | 已注入 + 已签名成品，可直接安装（含 v2.7/v2.8 历史版本） |
| `02_修改后dex/` | `classes2.dex` | 修改重编译后的 dex |
| `03_注入源码/` | `Notifier.smali` | 倒计时通知 + MediaSession + 灵动岛三键 + 进度条 + 暂停状态 |
| `03_注入源码/` | `DeleteManager.smali` | 删除任务管理 + 排队 + 暂停/恢复 + Toast |
| `03_注入源码/` | `DeleteManager$Task.smali` | 任务数据（含 paused / remainingMs 字段） |
| `03_注入源码/` | `DeleteManager$1.smali` | 每秒刷新 ticker（暂停任务跳过） |
| `03_注入源码/` | `CountdownMediaCallback.smali` | 三键回调（下一首=删除 / 上一首=保留 / 播放=继续 / 暂停=暂停） |
| `04_构建脚本/` | `BuildDex.java` | dex 重编译工具 |

---

## 🎯 功能清单（完整）

- [x] 截图后自动进入删除倒计时（默认 60 秒，可设置）
- [x] HyperOS 灵动岛显示（水滴屏位置）
- [x] 三键布局：上一曲=保留 / 下一曲=立即删除
- [x] **暂停/继续**：⏸ 冻结倒计时+进度条+递增数字、暂停不删除；▶️ 从剩余继续
- [x] 倒计时结束自动删除（归 0 才删，暂停期间不删）
- [x] 进度条实时同步（左=已播放递增、右=总长固定）
- [x] Toast 气泡（已删除/已保留/删除失败/已暂停/已继续）
- [x] 多截图排队（前面暂停，后面无限期等待）
- [x] 不显示在最近任务栏（finishAndRemoveTask 方案）

---

## 🔨 构建方法（换设备复用）

1. 获取原版「截图自动清理」APK（v1.2+）
2. 用 apktool 解包，将 `03_注入源码/` 的 smali 放入 `smali_classes2/com/screenshotclean/app/`
3. 重编译后用 `04_构建脚本/` 的 BuildDex.java 重新生成 dex
4. 回填 dex 后用 debug.keystore 签名安装（密码 `android`）