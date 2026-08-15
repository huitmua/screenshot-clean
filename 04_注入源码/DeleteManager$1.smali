.class Lcom/screenshotclean/app/DeleteManager$1;
.super Ljava/lang/Object;
.source "DeleteManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/screenshotclean/app/DeleteManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/screenshotclean/app/DeleteManager;


# direct methods
.method constructor <init>(Lcom/screenshotclean/app/DeleteManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/screenshotclean/app/DeleteManager;

    .line 28
    iput-object p1, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 32
    .local v0, "now":J
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-static {v2}, Lcom/screenshotclean/app/DeleteManager;->-$$Nest$fgettasks(Lcom/screenshotclean/app/DeleteManager;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    const/4 v3, 0x5

    if-le v2, v3, :cond_2

    .line 34
    const-wide v2, 0x7fffffffffffffffL

    .line 35
    .local v2, "soonest":J
    const/4 v4, 0x0

    .line 36
    .local v4, "firstName":Ljava/lang/String;
    iget-object v5, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-static {v5}, Lcom/screenshotclean/app/DeleteManager;->-$$Nest$fgettasks(Lcom/screenshotclean/app/DeleteManager;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/screenshotclean/app/DeleteManager$Task;

    .line 37
    .local v6, "t":Lcom/screenshotclean/app/DeleteManager$Task;
    iget-wide v7, v6, Lcom/screenshotclean/app/DeleteManager$Task;->deadline:J

    cmp-long v7, v7, v2

    if-gez v7, :cond_0

    .line 38
    iget-wide v2, v6, Lcom/screenshotclean/app/DeleteManager$Task;->deadline:J

    .line 39
    iget-object v4, v6, Lcom/screenshotclean/app/DeleteManager$Task;->name:Ljava/lang/String;

    .line 41
    .end local v6    # "t":Lcom/screenshotclean/app/DeleteManager$Task;
    :cond_0
    goto :goto_0

    .line 42
    :cond_1
    iget-object v5, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-static {v5}, Lcom/screenshotclean/app/DeleteManager;->-$$Nest$fgetnotifier(Lcom/screenshotclean/app/DeleteManager;)Lcom/screenshotclean/app/Notifier;

    move-result-object v5

    iget-object v6, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-static {v6}, Lcom/screenshotclean/app/DeleteManager;->-$$Nest$fgettasks(Lcom/screenshotclean/app/DeleteManager;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v6

    invoke-virtual {v5, v6, v2, v3, v4}, Lcom/screenshotclean/app/Notifier;->showAggregate(IJLjava/lang/String;)V

    .line 43
    .end local v2    # "soonest":J
    .end local v4    # "firstName":Ljava/lang/String;
    goto :goto_2

    .line 44
    :cond_2
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-static {v2}, Lcom/screenshotclean/app/DeleteManager;->-$$Nest$fgettasks(Lcom/screenshotclean/app/DeleteManager;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/screenshotclean/app/DeleteManager$Task;
    .line 45
    .local v3, "t":Lcom/screenshotclean/app/DeleteManager$Task;
    iget-boolean v4, v3, Lcom/screenshotclean/app/DeleteManager$Task;->paused:Z
    if-nez v4, :goto_1
    iget-object v4, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-static {v4}, Lcom/screenshotclean/app/DeleteManager;->-$$Nest$fgetnotifier(Lcom/screenshotclean/app/DeleteManager;)Lcom/screenshotclean/app/Notifier;

    move-result-object v5

    iget-object v6, v3, Lcom/screenshotclean/app/DeleteManager$Task;->path:Ljava/lang/String;

    iget-object v7, v3, Lcom/screenshotclean/app/DeleteManager$Task;->name:Ljava/lang/String;

    iget-wide v8, v3, Lcom/screenshotclean/app/DeleteManager$Task;->deadline:J

    iget-wide v10, v3, Lcom/screenshotclean/app/DeleteManager$Task;->total:J

    invoke-virtual/range {v5 .. v11}, Lcom/screenshotclean/app/Notifier;->showCountdown(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 46
    .end local v3    # "t":Lcom/screenshotclean/app/DeleteManager$Task;
    goto :goto_1

    .line 48
    :cond_3
    :goto_2
    iget-object v2, p0, Lcom/screenshotclean/app/DeleteManager$1;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-static {v2}, Lcom/screenshotclean/app/DeleteManager;->-$$Nest$fgethandler(Lcom/screenshotclean/app/DeleteManager;)Landroid/os/Handler;

    move-result-object v2

    const-wide/16 v3, 0x3e8

    invoke-virtual {v2, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 49
    return-void
.end method
