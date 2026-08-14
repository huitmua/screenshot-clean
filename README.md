# 截图自动清理 · 切后台自动从最近任务栏消失

> 注入版 APK 方案：应用切到后台 **3 秒后自动从系统最近任务栏（Recents）消失**，但后台清理服务继续运行。
> 附带完整注入源码，可自行修改、重新构建。

## ✨ 特性

- ✅ 切后台 3 秒自动从最近任务栏移除（任何 ROM 都生效）
- ✅ 后台服务（截图监控 / 自动清理）持续运行，不受影响
- ✅ 无需 root、无需刷机、不修改系统任何代码
- ✅ 完全可逆：恢复原版 APK 即可
- ✅ 附完整 smali 注入源码 + 工具链命令，可自己改

## 🤔 为什么要做这个？

原版应用切后台后会一直留在最近任务栏，有两个痛点：

1. **任务栏不干净** —— 每次上滑多任务都能看到它
2. **容易被误杀** —— 用户习惯性"上滑清理"，后台监控服务被终止，截图自动清理功能失效

## 🧩 原理（特别要讲的点）

### 标准方案在 HyperOS 上失效

给 AndroidManifest 加 `android:excludeFromRecents="true"` 后**实测无效**：小米 HyperOS (V816, Android 15) 的 recents **不遵守**这个标志。对照组实验实锤：用 `FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS` 启动腾讯 QQ，QQ 照样出现在最近任务栏。

### 本方案：底层强制删除

改为在 MainActivity 的 `onStop()`（切后台回调）中延迟 **3 秒**调用 `finishAndRemoveTask()`——这是系统底层接口（`ActivityTaskManagerService.removeTask`），**任何 ROM 都无法忽略**（MIUI 自己的清理后台功能也依赖它）。

| 方案 | 时机 | ROM 兼容性 |
|---|---|---|
| `excludeFromRecents` | 创建任务时 | ❌ HyperOS 无视 |
| `finishAndRemoveTask` | 切后台后主动删除 | ✅ 底层强制，全 ROM 有效 |

延迟 3 秒是为了避免应用跳转系统页面（如权限页）时误移除；选 `onStop` 而非 `onPause`，是因为 `onPause` 触发太频繁（任何弹窗都会触发），`onStop` 才是"真正离开前台"的信号。

## 📥 下载

**最新成品 APK 请到 Releases 页面下载**：

👉 https://github.com/huitmua/screenshot-clean/releases

仓库内文件结构：

| 目录 | 文件 | 说明 |
|---|---|---|
| `01_成品APK/` | `app-v1.4-signed.apk` | ✅ **已注入 + 已签名成品，直接安装即可用** |
| `02_原版APK/` | `截图自动清理.apk` | 原始未修改版（对照 / 恢复用） |
| `03_签名文件/` | `debug.keystore` | 签名证书（密码 `android`，自行构建用） |
| `04_注入源码/` | `MainActivity.smali` 等 | 注入后的源码，可自己改 |
| `05_修改后dex/` | `classes2.dex` | 修改后的主 dex，可直接替换进 APK |
| `06_工具脚本/` | `restore_original.sh` | 恢复原版辅助脚本 |

## 📱 安装（3 步搞定）

1. 下载 `01_成品APK/app-v1.4-signed.apk`（或从 Releases 下载）
2. 安装：首次提示"未知来源"时允许；小米系需在 **设置 → 更多安全设置 → 安装未知应用** 开启
3. 打开应用，一次性授予权限：通知、媒体/文件读取；建议加入**电池优化白名单**（设置 → 应用 → 省电策略 → 无限制），避免后台被杀

**安装即生效**：打开应用 → 按 Home 切后台 → 3 秒后应用自动从最近任务栏消失，但清理服务继续在后台运行。

## 🔧 自己修改源码（进阶）

注入核心在 `04_注入源码/`，逻辑就两段：

**① 新增 `MainActivity$$ExternalSyntheticLambda7.smali`**（Runnable，调用删除任务）：

```smali
.class public final synthetic Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;

# instance fields
.field public final synthetic f$0:Lcom/screenshotclean/app/MainActivity;

# direct methods
.method public synthetic constructor <init>(Lcom/screenshotclean/app/MainActivity;)V
    .registers 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda7;->f$0:Lcom/screenshotclean/app/MainActivity;
    return-void
.end method

# virtual methods
.method public final run()V
    .registers 2
    iget-object v0, p0, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda7;->f$0:Lcom/screenshotclean/app/MainActivity;
    invoke-virtual {v0}, Lcom/screenshotclean/app/MainActivity;->finishAndRemoveTask()V
    return-void
.end method
```

**② MainActivity.smali 末尾追加 `onStop`**（切后台 3 秒后执行删除）：

```smali
.method protected onStop()V
    .registers 6
    .line 57
    invoke-super {p0}, Landroid/app/Activity;->onStop()V
    # Remove task from recents after 3s (HyperOS ignores excludeFromRecents)
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v2, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda7;
    invoke-direct {v2, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda7;-><init>(Lcom/screenshotclean/app/MainActivity;)V
    const-wide/16 v3, 0xbb8
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    return-void
.end method
```

**重新构建工具链**（baksmali → 注入 → smali → 重建 APK → apksigner）：

```bash
# 1. 反编译
java -jar baksmali.jar d app.apk -o smali_out
# 2. 注入（新增上面两段代码）
# 3. 重编译
java -jar smali.jar a smali_out -o classes2_new.dex
# 4. 重建 APK（替换 classes2.dex，剔除 META-INF/ 旧签名）
# 5. 签名
apksigner sign --ks debug.keystore --ks-pass pass:android \
  --key-pass pass:android --out app-v1.4-signed.apk app-v1.4.apk
```

> 💡 只想换设备不想改逻辑？直接用 `05_修改后dex/classes2.dex` 走第 4、5 步替换即可，跳过 smali 流程。

## 📱 实测设备

| 项目 | 值 |
|---|---|
| 设备 | Redmi（小米系） |
| 系统 | HyperOS V816 / MIUI |
| Android | 15（SDK 36） |
| 架构 | arm64 |
| 安全状态 | SELinux Enforcing、无 root |
| 目标应用 | 截图自动清理（com.screenshotclean.app） |

**实测结论**：切后台 3 秒后任务自动移除 ✅；进程与前台服务（MonitorService）持续存活，截图监控/自动删除不受影响 ✅。

## ⚠️ 换设备注意事项

1. 需要 Android 8+（minSdk=26），成品 APK 直接安装即可测试
2. `removeTask` 是系统底层标准 API，ColorOS / OriginOS 等同样依赖它，大概率直接生效
3. 新设备需重新授权：通知、媒体/文件、电池优化白名单、自启动管理（小米系）
4. 副作用：应用运行中跳系统页面（如权限设置页）时，3 秒后任务整体移除（含设置页），属正常行为
5. 因 debug 签名与原版不同，**恢复原版需卸载重装**（应用数据会清空）

## 🛠 恢复原版

先卸载注入版，再安装 `02_原版APK/截图自动清理.apk`（或参考 `06_工具脚本/restore_original.sh`）。

## 📜 安全与免责

- 本方案仅修改 **APK 层**（dex 注入），未动手机系统任何代码，无 root、无刷机
- `debug.keystore` 为调试签名（密码 `android`），公开仅供自行构建验证
- **请只从本仓库官方 Releases 下载成品**，警惕来路不明的二次打包 APK
- 修改版 APK 与原版签名不同，覆盖安装会提示签名冲突属正常现象

---

如果这个方案对你有帮助，欢迎 Star ⭐ 或提 Issue 交流。
