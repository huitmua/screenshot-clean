.class public Lcom/screenshotclean/app/CountdownMediaCallback;
.super Landroid/media/session/MediaSession$Callback;

# 当前倒计时的截图路径（由 Notifier.showCountdown 每次更新）
.field public static sPath:Ljava/lang/String;

.field private ctx:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    invoke-direct {p0}, Landroid/media/session/MediaSession$Callback;-><init>()V
    iput-object p1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;
    return-void
.end method

.method public onCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 7
    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;
    if-eqz v0, :cond_ret
    const-string v1, "delete"
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_delete
    const-string v2, "cancel"
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :cond_cancel
    goto :cond_ret
    :cond_delete
    iget-object v3, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;
    invoke-static {v3}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;
    move-result-object v3
    invoke-virtual {v3, v0}, Lcom/screenshotclean/app/DeleteManager;->deleteNow(Ljava/lang/String;)V
    goto :cond_ret
    :cond_cancel
    iget-object v4, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;
    invoke-static {v4}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;
    move-result-object v4
    invoke-virtual {v4, v0}, Lcom/screenshotclean/app/DeleteManager;->cancel(Ljava/lang/String;)V
    :cond_ret
    return-void
.end method

.method public onSkipToNext()V
    .registers 3
    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;
    if-eqz v0, :cond_ret
    iget-object v1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;
    invoke-static {v1}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;
    move-result-object v1
    invoke-virtual {v1, v0}, Lcom/screenshotclean/app/DeleteManager;->deleteNow(Ljava/lang/String;)V
    :cond_ret
    return-void
.end method

.method public onSkipToPrevious()V
    .registers 3
    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;
    if-eqz v0, :cond_ret
    iget-object v1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;
    invoke-static {v1}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;
    move-result-object v1
    invoke-virtual {v1, v0}, Lcom/screenshotclean/app/DeleteManager;->cancel(Ljava/lang/String;)V
    :cond_ret
    return-void
.end method
