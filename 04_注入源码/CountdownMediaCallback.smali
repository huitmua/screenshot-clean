.class public Lcom/screenshotclean/app/CountdownMediaCallback;
.super Landroid/media/session/MediaSession$Callback;


# static fields
.field public static sPath:Ljava/lang/String;


# instance fields
.field private ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/media/session/MediaSession$Callback;-><init>()V

    iput-object p1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public onCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 4

    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;

    if-eqz v0, :cond_2

    const-string v1, "delete"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v2, "cancel"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;

    invoke-static {v3}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/screenshotclean/app/DeleteManager;->deleteNow(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;

    invoke-static {p0}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/screenshotclean/app/DeleteManager;->cancel(Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onSkipToNext()V
    .locals 2

    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/screenshotclean/app/DeleteManager;->deleteNow(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onSkipToPrevious()V
    .locals 2

    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/screenshotclean/app/DeleteManager;->cancel(Ljava/lang/String;)V
    :cond_0
    return-void
.end method
.method public onPlay()V
    .locals 2
    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;
    if-eqz v0, :cond_0
    iget-object v1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;
    invoke-static {v1}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;
    move-result-object v1
    invoke-virtual {v1, v0}, Lcom/screenshotclean/app/DeleteManager;->resumeTask(Ljava/lang/String;)V
    :cond_0
    return-void
.end method
.method public onPause()V
    .locals 2
    sget-object v0, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;
    if-eqz v0, :cond_0
    iget-object v1, p0, Lcom/screenshotclean/app/CountdownMediaCallback;->ctx:Landroid/content/Context;
    invoke-static {v1}, Lcom/screenshotclean/app/DeleteManager;->get(Landroid/content/Context;)Lcom/screenshotclean/app/DeleteManager;
    move-result-object v1
    invoke-virtual {v1, v0}, Lcom/screenshotclean/app/DeleteManager;->pauseTask(Ljava/lang/String;)V
    :cond_0
    return-void
.end method
