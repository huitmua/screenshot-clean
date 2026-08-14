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
