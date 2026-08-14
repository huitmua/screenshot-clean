.class public Lcom/screenshotclean/app/DeleteManager;
.super Ljava/lang/Object;
.source "DeleteManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/screenshotclean/app/DeleteManager$Task;
    }
.end annotation


# static fields
.field private static final AGGREGATE_THRESHOLD:I = 0x5

.field private static instance:Lcom/screenshotclean/app/DeleteManager;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final handler:Landroid/os/Handler;

.field private final notifier:Lcom/screenshotclean/app/Notifier;

.field private final tasks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/screenshotclean/app/DeleteManager$Task;",
            ">;"
        }
    .end annotation
.end field

.field private final ticker:Ljava/lang/Runnable;
# v2.7: 排队机制 - 等待中的任务（前一个倒计时未完成时暂存）
.field private pendingPath:Ljava/lang/String;
.field private pendingName:Ljava/lang/String;
.field private pendingDelay:J


# direct methods
.method static bridge synthetic -$$Nest$fgethandler(Lcom/screenshotclean/app/DeleteManager;)Landroid/os/Handler;
    .registers 1

    iget-object p0, p0, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetnotifier(Lcom/screenshotclean/app/DeleteManager;)Lcom/screenshotclean/app/Notifier;
    .registers 1

    iget-object p0, p0, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettasks(Lcom/screenshotclean/app/DeleteManager;)Ljava/util/Map;
    .registers 1

    iget-object p0, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mexecuteDelete(Lcom/screenshotclean/app/DeleteManager;Lcom/screenshotclean/app/DeleteManager$Task;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/DeleteManager;->executeDelete(Lcom/screenshotclean/app/DeleteManager$Task;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "c"    # Landroid/content/Context;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    .line 25
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    .line 28
    new-instance v0, Lcom/screenshotclean/app/DeleteManager$1;

    invoke-direct {v0, p0}, Lcom/screenshotclean/app/DeleteManager$1;-><init>(Lcom/screenshotclean/app/DeleteManager;)V

    iput-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->ticker:Ljava/lang/Runnable;

    .line 74
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;

    .line 75
    new-instance v0, Lcom/screenshotclean/app/Notifier;

    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/screenshotclean/app/Notifier;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;

    .line 76
    return-void
.end method

.method private executeDelete(Lcom/screenshotclean/app/DeleteManager$Task;)V
    .registers 10
    .param p1, "t"    # Lcom/screenshotclean/app/DeleteManager$Task;

    .line 117
    iget-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    iget-object v1, p1, Lcom/screenshotclean/app/DeleteManager$Task;->path:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    iget-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->ticker:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 120
    :cond_16
    const/4 v0, 0x0

    .line 125
    .local v0, "ok":Z
    :try_start_17
    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, "_data=?"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/String;

    iget-object v6, p1, Lcom/screenshotclean/app/DeleteManager$Task;->path:Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {v1, v2, v3, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_2d} :catch_33

    .line 129
    .local v1, "rows":I
    if-lez v1, :cond_30

    goto :goto_31

    :cond_30
    move v4, v7

    :goto_31
    move v0, v4

    .line 132
    .end local v1    # "rows":I
    goto :goto_35

    .line 130
    :catch_33
    move-exception v1

    .line 131
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .line 135
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_35
    if-nez v0, :cond_4c

    .line 137
    :try_start_37
    new-instance v1, Ljava/io/File;

    iget-object v2, p1, Lcom/screenshotclean/app/DeleteManager$Task;->path:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 138
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_49

    .line 139
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v2
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_48} :catch_4a

    move v0, v2

    .line 143
    .end local v1    # "f":Ljava/io/File;
    :cond_49
    goto :goto_4c

    .line 141
    :catch_4a
    move-exception v1

    .line 142
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .line 146
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4c
    :goto_4c
    if-eqz v0, :cond_58

    .line 147
    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;

    iget-object v2, p1, Lcom/screenshotclean/app/DeleteManager$Task;->path:Ljava/lang/String;

    iget-object v3, p1, Lcom/screenshotclean/app/DeleteManager$Task;->name:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/screenshotclean/app/Notifier;->showDeleted(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_61

    .line 149
    :cond_58
    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;

    iget-object v2, p1, Lcom/screenshotclean/app/DeleteManager$Task;->path:Ljava/lang/String;

    iget-object v3, p1, Lcom/screenshotclean/app/DeleteManager$Task;->name:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/screenshotclean/app/Notifier;->showFailed(Ljava/lang/String;Ljava/lang/String;)V
    # v2.7: 删除失败气泡
    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;
    const-string v2, "删除失败"
    const/4 v3, 0x0
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v1
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 151
    :goto_61
    # v2.7: 前一个任务完成 -> 启动排队中的任务
    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->pendingPath:Ljava/lang/String;
    if-eqz v1, :cond_nopending
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->pendingName:Ljava/lang/String;
    iget-wide v3, p0, Lcom/screenshotclean/app/DeleteManager;->pendingDelay:J
    const/4 v5, 0x0
    iput-object v5, p0, Lcom/screenshotclean/app/DeleteManager;->pendingPath:Ljava/lang/String;
    iput-object v5, p0, Lcom/screenshotclean/app/DeleteManager;->pendingName:Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/screenshotclean/app/DeleteManager;->schedule(Ljava/lang/String;Ljava/lang/String;J)V
    :cond_nopending
    return-void
.end method

.method public static declared-synchronized get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;
    .registers 3
    .param p0, "c"    # Landroid/content/Context;

    const-class v0, Lcom/screenshotclean/app/DeleteManager;

    monitor-enter v0

    .line 79
    :try_start_3
    sget-object v1, Lcom/screenshotclean/app/DeleteManager;->instance:Lcom/screenshotclean/app/DeleteManager;

    if-nez v1, :cond_e

    new-instance v1, Lcom/screenshotclean/app/DeleteManager;

    invoke-direct {v1, p0}, Lcom/screenshotclean/app/DeleteManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/screenshotclean/app/DeleteManager;->instance:Lcom/screenshotclean/app/DeleteManager;

    .line 80
    :cond_e
    sget-object v1, Lcom/screenshotclean/app/DeleteManager;->instance:Lcom/screenshotclean/app/DeleteManager;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v0

    return-object v1

    .line 78
    .end local p0    # "c":Landroid/content/Context;
    :catchall_12
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public activeCount()I
    .registers 2

    .line 88
    iget-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public cancel(Ljava/lang/String;)V
    .registers 10
    .param p1, "path"    # Ljava/lang/String;

    .line 108
    iget-object v0, v8, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    invoke-interface {v0, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/screenshotclean/app/DeleteManager$Task;

    .line 109
    .local v0, "t":Lcom/screenshotclean/app/DeleteManager$Task;
    if-nez v0, :cond_b

    return-void

    .line 110
    :cond_b
    iget-object v1, v8, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    iget-object v2, v0, Lcom/screenshotclean/app/DeleteManager$Task;->deleteRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 111
    iget-object v1, v8, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;

    iget-object v2, v0, Lcom/screenshotclean/app/DeleteManager$Task;->name:Ljava/lang/String;

    invoke-virtual {v1, v9, v2}, Lcom/screenshotclean/app/Notifier;->showCancelled(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    iget-object v1, v8, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, v8, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    iget-object v2, v8, Lcom/screenshotclean/app/DeleteManager;->ticker:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 113
    :cond_28
    # v2.7: 已保留气泡
    iget-object v3, v8, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;
    const-string v4, "已保留"
    const/4 v5, 0x0
    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v3
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    # v2.7: 前一个任务完成 -> 启动排队中的任务
    iget-object v3, v8, Lcom/screenshotclean/app/DeleteManager;->pendingPath:Ljava/lang/String;
    if-eqz v3, :cond_nopending
    iget-object v4, v8, Lcom/screenshotclean/app/DeleteManager;->pendingName:Ljava/lang/String;
    iget-wide v5, v8, Lcom/screenshotclean/app/DeleteManager;->pendingDelay:J
    const/4 v7, 0x0
    iput-object v7, v8, Lcom/screenshotclean/app/DeleteManager;->pendingPath:Ljava/lang/String;
    iput-object v7, v8, Lcom/screenshotclean/app/DeleteManager;->pendingName:Ljava/lang/String;
    invoke-virtual {v8, v3, v4, v5, v6}, Lcom/screenshotclean/app/DeleteManager;->schedule(Ljava/lang/String;Ljava/lang/String;J)V
    :cond_nopending
    return-void
.end method

.method public deleteNow(Ljava/lang/String;)V
    .registers 12
    .param p1, "path"    # Ljava/lang/String;
    move-object/from16 v5, p0
    move-object/from16 v8, p1
    iget-object v0, v5, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;
    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/screenshotclean/app/DeleteManager$Task;
    const-string v9, "截图"
    if-nez v0, :cond_b
    goto :do_delete
    :cond_b
    iget-object v9, v0, Lcom/screenshotclean/app/DeleteManager$Task;->name:Ljava/lang/String;
    iget-object v1, v5, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;
    iget-object v2, v0, Lcom/screenshotclean/app/DeleteManager$Task;->deleteRunnable:Ljava/lang/Runnable;
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
    iget-object v1, v5, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;
    invoke-interface {v1, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    iget-object v1, v5, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z
    move-result v1
    if-eqz v1, :cond_26
    iget-object v1, v5, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;
    iget-object v2, v5, Lcom/screenshotclean/app/DeleteManager;->ticker:Ljava/lang/Runnable;
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
    :cond_26
    :do_delete
    const/4 v1, 0x0
    :try_start_27
    iget-object v2, v5, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v2
    sget-object v3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;
    const-string v4, "_data=?"
    const/4 v6, 0x1
    new-array v6, v6, [Ljava/lang/String;
    move-object v7, v8
    const/4 v6, 0x0
    aput-object v7, v6, v6
    invoke-virtual {v2, v3, v4, v6}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    move-result v2
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_3d} :catch_41
    nop
    const/4 v1, 0x1
    goto :goto_42
    :catch_41
    move-exception v2
    const/4 v1, 0x1
    :cond_42
    :goto_42
    nop
    :try_start_44
    new-instance v2, Ljava/io/File;
    move-object v3, v8
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    move-result v3
    if-eqz v3, :cond_58
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    move-result v1
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_55} :catch_56
    goto :goto_58
    :catch_56
    move-exception v2
    const/4 v1, 0x0
    :cond_58
    :goto_58
    move-object/from16 v5, p0
    if-eqz v1, :cond_64
    iget-object v2, v5, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;
    move-object v3, v8
    move-object v4, v9
    invoke-virtual {v2, v3, v4}, Lcom/screenshotclean/app/Notifier;->showDeleted(Ljava/lang/String;Ljava/lang/String;)V
    # v2.7: 已删除气泡
    iget-object v2, v5, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;
    const-string v3, "已删除"
    const/4 v4, 0x0
    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v2
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V
    goto :goto_6d
    :cond_64
    iget-object v2, v5, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;
    move-object v3, v8
    move-object v4, v9
    invoke-virtual {v2, v3, v4}, Lcom/screenshotclean/app/Notifier;->showFailed(Ljava/lang/String;Ljava/lang/String;)V
    # v2.7: 删除失败气泡
    iget-object v2, v5, Lcom/screenshotclean/app/DeleteManager;->ctx:Landroid/content/Context;
    const-string v3, "删除失败"
    const/4 v4, 0x0
    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v2
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V
    :goto_6d
    # v2.7: 前一个任务完成 -> 启动排队中的任务
    iget-object v1, p0, Lcom/screenshotclean/app/DeleteManager;->pendingPath:Ljava/lang/String;
    if-eqz v1, :cond_nopending
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->pendingName:Ljava/lang/String;
    iget-wide v3, p0, Lcom/screenshotclean/app/DeleteManager;->pendingDelay:J
    const/4 v6, 0x0
    iput-object v6, p0, Lcom/screenshotclean/app/DeleteManager;->pendingPath:Ljava/lang/String;
    iput-object v6, p0, Lcom/screenshotclean/app/DeleteManager;->pendingName:Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/screenshotclean/app/DeleteManager;->schedule(Ljava/lang/String;Ljava/lang/String;J)V
    :cond_nopending
    return-void
.end method

.method public notifier()Lcom/screenshotclean/app/Notifier;
    .registers 2

    .line 84
    iget-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;

    return-object v0
.end method

.method public schedule(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 16
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "delayMs"    # J

    .line 93
    if-eqz p1, :cond_4b

    iget-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_4b

    .line 94
    :cond_b
    # v2.7 排队：已有活跃任务 → 暂存 pending，等前一个完成后启动
    iget-object v0, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z
    move-result v0
    if-nez v0, :cond_normal
    iput-object p1, p0, Lcom/screenshotclean/app/DeleteManager;->pendingPath:Ljava/lang/String;
    iput-object p2, p0, Lcom/screenshotclean/app/DeleteManager;->pendingName:Ljava/lang/String;
    iput-wide p3, p0, Lcom/screenshotclean/app/DeleteManager;->pendingDelay:J
    return-void
    :cond_normal
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p3

    .line 95
    .local v0, "deadline":J
    new-instance v10, Lcom/screenshotclean/app/DeleteManager$Task;

    move-object v2, v10

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-wide v6, v0

    move-wide v8, p3

    invoke-direct/range {v2 .. v9}, Lcom/screenshotclean/app/DeleteManager$Task;-><init>(Lcom/screenshotclean/app/DeleteManager;Ljava/lang/String;Ljava/lang/String;JJ)V

    move-object v9, v10

    .line 96
    .local v9, "t":Lcom/screenshotclean/app/DeleteManager$Task;
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    invoke-interface {v2, p1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    iget-object v3, v9, Lcom/screenshotclean/app/DeleteManager$Task;->deleteRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 98
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->notifier:Lcom/screenshotclean/app/Notifier;

    move-object v3, p1

    move-object v4, p2

    move-wide v5, v0

    move-wide v7, p3

    invoke-virtual/range {v2 .. v8}, Lcom/screenshotclean/app/Notifier;->showCountdown(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 100
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->tasks:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4a

    .line 101
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/screenshotclean/app/DeleteManager;->ticker:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 102
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/screenshotclean/app/DeleteManager;->ticker:Ljava/lang/Runnable;

    const-wide/16 v4, 0x1388

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 104
    :cond_4a
    return-void

    .line 93
    .end local v0    # "deadline":J
    .end local v9    # "t":Lcom/screenshotclean/app/DeleteManager$Task;
    :cond_4b
    :goto_4b
    return-void
.end method
