.class public Lcom/screenshotclean/app/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static final REQ_PERM:I = 0x64


# instance fields
.field private etDelay:Landroid/widget/EditText;

.field private prefs:Lcom/screenshotclean/app/Prefs;

.field private tvCount:Landroid/widget/TextView;

.field private tvStatus:Landroid/widget/TextView;


# direct methods
.method public static synthetic $r8$lambda$6TGqcI4h4N9LVsCizWgvO2VonMI(Lcom/screenshotclean/app/MainActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/MainActivity;->lambda$onCreate$2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$beYIHK9kIJA3qs1UZ-emi-F7Q88(Lcom/screenshotclean/app/MainActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/MainActivity;->lambda$onCreate$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$iCQ-oQBocWdAyV9BL_rqx_qKbQQ(Lcom/screenshotclean/app/MainActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/MainActivity;->lambda$onCreate$6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$iDrgNa62d0N0irR6B8o5Ffcetpk(Lcom/screenshotclean/app/MainActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/MainActivity;->lambda$onCreate$3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$iW6aSArcxnva1BQVDsGvt89gthQ(Lcom/screenshotclean/app/MainActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/MainActivity;->lambda$onCreate$4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$m5MYox4Nr3_GTBZinn15ecTd4M4(Lcom/screenshotclean/app/MainActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/MainActivity;->lambda$onCreate$5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ruVJa1kFx2AFMgoUwLrEY5st9GM(Lcom/screenshotclean/app/MainActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/MainActivity;->lambda$onCreate$1(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private isServiceRunning()Z
    .registers 6

    .line 70
    const-string v0, "activity"

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 71
    .local v0, "am":Landroid/app/ActivityManager;
    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 72
    .local v2, "info":Landroid/app/ActivityManager$RunningServiceInfo;
    const-class v3, Lcom/screenshotclean/app/MonitorService;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v2, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 73
    const/4 v1, 0x1

    return v1

    .line 75
    .end local v2    # "info":Landroid/app/ActivityManager$RunningServiceInfo;
    :cond_32
    goto :goto_12

    .line 76
    :cond_33
    const/4 v1, 0x0

    return v1
.end method

.method private synthetic lambda$onCreate$0(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .line 43
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->startMonitoring()V

    return-void
.end method

.method private synthetic lambda$onCreate$1(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .line 44
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->stopMonitoring()V

    return-void
.end method

.method private synthetic lambda$onCreate$2(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .line 45
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->saveDelay()V

    return-void
.end method

.method private synthetic lambda$onCreate$3(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .line 46
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->requestNotifPerm()V

    return-void
.end method

.method private synthetic lambda$onCreate$4(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .line 47
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->requestMediaPerm()V

    return-void
.end method

.method private synthetic lambda$onCreate$5(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .line 48
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->requestAllFilesPerm()V

    return-void
.end method

.method private synthetic lambda$onCreate$6(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .line 49
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->requestBatteryWhitelist()V

    return-void
.end method

.method private refreshStatus()V
    .registers 7

    .line 59
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->isServiceRunning()Z

    move-result v0

    .line 60
    .local v0, "running":Z
    iget-object v1, p0, Lcom/screenshotclean/app/MainActivity;->tvStatus:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 61
    const-string v2, "\u25cf \u76d1\u63a7\u8fd0\u884c\u4e2d"

    goto :goto_d

    .line 62
    :cond_b
    const-string v2, "\u25cb \u76d1\u63a7\u672a\u8fd0\u884c"

    .line 60
    :goto_d
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget-object v1, p0, Lcom/screenshotclean/app/MainActivity;->tvStatus:Landroid/widget/TextView;

    if-eqz v0, :cond_17

    const-string v2, "#1E8E3E"

    goto :goto_19

    :cond_17
    const-string v2, "#B3261E"

    :goto_19
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    invoke-static {p0}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/screenshotclean/app/DeleteManager;->activeCount()I

    move-result v1

    .line 65
    .local v1, "active":I
    iget-object v2, p0, Lcom/screenshotclean/app/MainActivity;->tvCount:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u5f53\u524d\u5f85\u5220\u9664\u4efb\u52a1\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u4e2a\n\u5220\u9664\u5ef6\u8fdf\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/screenshotclean/app/MainActivity;->prefs:Lcom/screenshotclean/app/Prefs;

    .line 66
    invoke-virtual {v4}, Lcom/screenshotclean/app/Prefs;->getDelayMin()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u5206\u949f"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 65
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    return-void
.end method

.method private requestAllFilesPerm()V
    .registers 5

    .line 129
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    if-lt v0, v1, :cond_49

    .line 130
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_3f

    .line 132
    :try_start_d
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 133
    invoke-virtual {p0}, Lcom/screenshotclean/app/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 134
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_32} :catch_33

    .end local v0    # "i":Landroid/content/Intent;
    goto :goto_3e

    .line 135
    :catch_33
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/screenshotclean/app/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 137
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3e
    goto :goto_52

    .line 139
    :cond_3f
    const-string v0, "\u5df2\u62e5\u6709\u6240\u6709\u6587\u4ef6\u8bbf\u95ee\u6743\u9650"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_52

    .line 142
    :cond_49
    const-string v0, "\u5f53\u524d\u7cfb\u7edf\u65e0\u9700\u8be5\u6743\u9650\uff08Android 10 \u53ca\u4ee5\u4e0b\uff09"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 144
    :goto_52
    return-void
.end method

.method private requestBatteryWhitelist()V
    .registers 6

    .line 147
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 148
    .local v0, "pm":Landroid/os/PowerManager;
    if-eqz v0, :cond_46

    invoke-virtual {p0}, Lcom/screenshotclean/app/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_46

    .line 150
    :try_start_14
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "package:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 151
    invoke-virtual {p0}, Lcom/screenshotclean/app/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 152
    .local v1, "i":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/screenshotclean/app/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_39} :catch_3a

    .end local v1    # "i":Landroid/content/Intent;
    goto :goto_45

    .line 153
    :catch_3a
    move-exception v1

    .line 154
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "\u8bf7\u5728\u7cfb\u7edf\u8bbe\u7f6e\u4e2d\u5173\u95ed\u672c\u5e94\u7528\u7684\u7535\u6c60\u4f18\u5316"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 155
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_45
    goto :goto_50

    .line 157
    :cond_46
    const-string v1, "\u5df2\u5728\u767d\u540d\u5355\u4e2d"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 159
    :goto_50
    return-void
.end method

.method private requestMediaPerm()V
    .registers 4

    .line 121
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/16 v2, 0x64

    if-lt v0, v1, :cond_12

    .line 122
    const-string v0, "android.permission.READ_MEDIA_IMAGES"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lcom/screenshotclean/app/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_1c

    .line 123
    :cond_12
    nop

    .line 124
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lcom/screenshotclean/app/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    .line 126
    :goto_1c
    return-void
.end method

.method private requestNotifPerm()V
    .registers 4

    .line 108
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-lt v0, v1, :cond_23

    .line 109
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_19

    .line 111
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/screenshotclean/app/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_2c

    .line 113
    :cond_19
    const-string v0, "\u901a\u77e5\u6743\u9650\u5df2\u6388\u4e88"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_2c

    .line 116
    :cond_23
    const-string v0, "\u5f53\u524d\u7cfb\u7edf\u65e0\u9700\u8be5\u6743\u9650"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 118
    :goto_2c
    return-void
.end method

.method private saveDelay()V
    .registers 6

    .line 98
    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/screenshotclean/app/MainActivity;->etDelay:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 99
    .local v1, "min":J
    const-wide/16 v3, 0x1

    cmp-long v3, v1, v3

    if-gez v3, :cond_1b

    const-wide/16 v1, 0x1

    .line 100
    :cond_1b
    iget-object v3, p0, Lcom/screenshotclean/app/MainActivity;->prefs:Lcom/screenshotclean/app/Prefs;

    invoke-virtual {v3, v1, v2}, Lcom/screenshotclean/app/Prefs;->setDelayMin(J)V

    .line 101
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u5df2\u4fdd\u5b58\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u5206\u949f\uff08\u4e0b\u6b21\u622a\u56fe\u751f\u6548\uff09"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_40
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_40} :catch_41

    .line 104
    .end local v1    # "min":J
    goto :goto_4b

    .line 102
    :catch_41
    move-exception v1

    .line 103
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string v2, "\u8bf7\u8f93\u5165\u6709\u6548\u6570\u5b57"

    invoke-static {p0, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 105
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :goto_4b
    return-void
.end method

.method private startMonitoring()V
    .registers 4

    .line 80
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/screenshotclean/app/MonitorService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 81
    .local v0, "i":Landroid/content/Intent;
    nop

    .line 82
    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 86
    const-string v1, "\u76d1\u63a7\u5df2\u542f\u52a8"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 87
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->refreshStatus()V

    .line 88
    return-void
.end method

.method private stopMonitoring()V
    .registers 3

    .line 91
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/screenshotclean/app/MonitorService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->stopService(Landroid/content/Intent;)Z

    .line 92
    const-string v0, "\u76d1\u63a7\u5df2\u505c\u6b62"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 93
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->refreshStatus()V

    .line 94
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 34
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    sget v0, Lcom/screenshotclean/app/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->setContentView(I)V

    .line 36
    new-instance v0, Lcom/screenshotclean/app/Prefs;

    invoke-direct {v0, p0}, Lcom/screenshotclean/app/Prefs;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/screenshotclean/app/MainActivity;->prefs:Lcom/screenshotclean/app/Prefs;

    .line 38
    sget v0, Lcom/screenshotclean/app/R$id;->tv_status:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/screenshotclean/app/MainActivity;->tvStatus:Landroid/widget/TextView;

    .line 39
    sget v0, Lcom/screenshotclean/app/R$id;->tv_count:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/screenshotclean/app/MainActivity;->tvCount:Landroid/widget/TextView;

    .line 40
    sget v0, Lcom/screenshotclean/app/R$id;->et_delay:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/screenshotclean/app/MainActivity;->etDelay:Landroid/widget/EditText;

    .line 41
    iget-object v0, p0, Lcom/screenshotclean/app/MainActivity;->etDelay:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/screenshotclean/app/MainActivity;->prefs:Lcom/screenshotclean/app/Prefs;

    invoke-virtual {v1}, Lcom/screenshotclean/app/Prefs;->getDelayMin()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 43
    sget v0, Lcom/screenshotclean/app/R$id;->btn_start:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcom/screenshotclean/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    sget v0, Lcom/screenshotclean/app/R$id;->btn_stop:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda1;-><init>(Lcom/screenshotclean/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    sget v0, Lcom/screenshotclean/app/R$id;->btn_save:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda2;-><init>(Lcom/screenshotclean/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    sget v0, Lcom/screenshotclean/app/R$id;->btn_perm_notif:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda3;-><init>(Lcom/screenshotclean/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    sget v0, Lcom/screenshotclean/app/R$id;->btn_perm_media:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda4;-><init>(Lcom/screenshotclean/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    sget v0, Lcom/screenshotclean/app/R$id;->btn_perm_files:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda5;-><init>(Lcom/screenshotclean/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    sget v0, Lcom/screenshotclean/app/R$id;->btn_battery:I

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/MainActivity$$ExternalSyntheticLambda6;-><init>(Lcom/screenshotclean/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 9
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .line 163
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 164
    const/4 v0, 0x1

    .line 165
    .local v0, "allOk":Z
    array-length v1, p3

    const/4 v2, 0x0

    move v3, v2

    :goto_7
    if-ge v3, v1, :cond_11

    aget v4, p3, v3

    .line 166
    .local v4, "r":I
    if-eqz v4, :cond_e

    const/4 v0, 0x0

    .line 165
    .end local v4    # "r":I
    :cond_e
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 168
    :cond_11
    if-eqz v0, :cond_16

    const-string v1, "\u6743\u9650\u5df2\u6388\u4e88"

    goto :goto_18

    :cond_16
    const-string v1, "\u90e8\u5206\u6743\u9650\u672a\u6388\u4e88"

    :goto_18
    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 169
    return-void
.end method

.method protected onResume()V
    .registers 1
    .line 54
    invoke-super {p0}, Landroid/app/Activity;->onResume()V
    .line 55
    invoke-direct {p0}, Lcom/screenshotclean/app/MainActivity;->refreshStatus()V
    .line 56
    return-void
.end method

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
