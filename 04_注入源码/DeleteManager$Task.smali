.class Lcom/screenshotclean/app/DeleteManager$Task;
.super Ljava/lang/Object;
.source "DeleteManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/screenshotclean/app/DeleteManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Task"
.end annotation


# instance fields
.field deadline:J

.field final deleteRunnable:Ljava/lang/Runnable;
.field final name:Ljava/lang/String;
.field final path:Ljava/lang/String;
.field paused:Z
.field remainingMs:J
.field final synthetic this$0:Lcom/screenshotclean/app/DeleteManager;
.field total:J

.field total:J


# direct methods
.method constructor <init>(Lcom/screenshotclean/app/DeleteManager;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 1
    .param p1, "this$0"    # Lcom/screenshotclean/app/DeleteManager;
    .param p2, "p"    # Ljava/lang/String;
    .param p3, "n"    # Ljava/lang/String;
    .param p4, "deadline"    # J
    .param p6, "total"    # J

    .line 59
    iput-object p1, p0, Lcom/screenshotclean/app/DeleteManager$Task;->this$0:Lcom/screenshotclean/app/DeleteManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p2, p0, Lcom/screenshotclean/app/DeleteManager$Task;->path:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/screenshotclean/app/DeleteManager$Task;->name:Ljava/lang/String;

    .line 62
    iput-wide p4, p0, Lcom/screenshotclean/app/DeleteManager$Task;->deadline:J

    .line 63
    iput-wide p6, p0, Lcom/screenshotclean/app/DeleteManager$Task;->total:J

    .line 64
    new-instance v0, Lcom/screenshotclean/app/DeleteManager$Task$1;

    invoke-direct {v0, p0, p1}, Lcom/screenshotclean/app/DeleteManager$Task$1;-><init>(Lcom/screenshotclean/app/DeleteManager$Task;Lcom/screenshotclean/app/DeleteManager;)V

    iput-object v0, p0, Lcom/screenshotclean/app/DeleteManager$Task;->deleteRunnable:Ljava/lang/Runnable;

    .line 70
    return-void
.end method
