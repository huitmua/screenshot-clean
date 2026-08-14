.class public Lcom/screenshotclean/app/Notifier;
.super Ljava/lang/Object;
.source "Notifier.java"


# static fields
.field private static final ACTION_CANCEL:Ljava/lang/String; = "com.screenshotclean.app.CANCEL"

.field public static final CHANNEL_ID:Ljava/lang/String; = "screenshot_clean"

.field private static final EXTRA_PATH:Ljava/lang/String; = "path"

.field public static final NOTIF_SERVICE:I = 0x1

.field private static sMediaSession:Landroid/media/session/MediaSession;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final nm:Landroid/app/NotificationManager;


# direct methods
.method public static synthetic $r8$lambda$djgswijafJBvdIKieyNO2yL6wx4(Lcom/screenshotclean/app/Notifier;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/screenshotclean/app/Notifier;->lambda$showDeleted$0(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "c"    # Landroid/content/Context;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    .line 24
    iget-object v0, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    .line 25
    invoke-direct {p0}, Lcom/screenshotclean/app/Notifier;->ensureChannel()V

    .line 26
    return-void
.end method

.method private ensureChannel()V
    .registers 5

    .line 29
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "\u622a\u56fe\u81ea\u52a8\u6e05\u7406"

    const/4 v2, 0x4

    const-string v3, "screenshot_clean"

    invoke-direct {v0, v3, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 31
    .local v0, "ch":Landroid/app/NotificationChannel;
    const-string v1, "\u65b0\u622a\u56fe\u5012\u8ba1\u65f6\u5220\u9664\u901a\u77e5"

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 32
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->enableLights(Z)V

    .line 33
    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 34
    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 35
    return-void
.end method

.method private ensureMediaSession()Landroid/media/session/MediaSession;
    .registers 5
    sget-object v0, Lcom/screenshotclean/app/Notifier;->sMediaSession:Landroid/media/session/MediaSession;
    if-nez v0, :cond_ret

    move-object v3, p0
    new-instance v0, Landroid/media/session/MediaSession;
    iget-object v1, v3, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;
    const-string v2, "scc_countdown"
    invoke-direct {v0, v1, v2}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V
    sput-object v0, Lcom/screenshotclean/app/Notifier;->sMediaSession:Landroid/media/session/MediaSession;

:cond_ret
    return-object v0
.end method

.method public static format(J)Ljava/lang/String;
    .registers 12
    .param p0, "totalSec"    # J

    .line 153
    const-wide/16 v0, 0xe10

    div-long v2, p0, v0

    .line 154
    .local v2, "h":J
    rem-long v0, p0, v0

    const-wide/16 v4, 0x3c

    div-long/2addr v0, v4

    .line 155
    .local v0, "m":J
    rem-long v4, p0, v4

    .line 156
    .local v4, "s":J
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-lez v6, :cond_2a

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    filled-new-array {v7, v8, v9}, [Ljava/lang/Object;

    move-result-object v7

    const-string v8, "%d:%02d:%02d"

    invoke-static {v6, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 157
    :cond_2a
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    filled-new-array {v7, v8}, [Ljava/lang/Object;

    move-result-object v7

    const-string v8, "%02d:%02d"

    invoke-static {v6, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public static idFor(Ljava/lang/String;)I
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x7fffffff

    and-int/2addr v0, v1

    const/high16 v1, 0x1000000

    or-int/2addr v0, v1

    return v0
.end method

.method private synthetic lambda$showDeleted$0(Ljava/lang/String;)V
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .line 133
    iget-object v0, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    invoke-static {p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method


# virtual methods
.method public cancel(Ljava/lang/String;)V
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .line 149
    iget-object v0, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    invoke-static {p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    sget-object v2, Lcom/screenshotclean/app/Notifier;->sMediaSession:Landroid/media/session/MediaSession;

    if-eqz v2, :cond_skip

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/media/session/MediaSession;->setActive(Z)V

    :cond_skip
    .line 150
    return-void
.end method

.method public serviceNotification()Landroid/app/Notification;
    .registers 6

    .line 44
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-class v2, Lcom/screenshotclean/app/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 45
    .local v0, "i":Landroid/content/Intent;
    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const/4 v2, 0x0

    const/high16 v3, 0xc000000

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 47
    .local v1, "pi":Landroid/app/PendingIntent;
    new-instance v2, Landroid/app/Notification$Builder;

    iget-object v3, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v4, "screenshot_clean"

    invoke-direct {v2, v3, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget v3, Lcom/screenshotclean/app/R$drawable;->ic_stat_shot:I

    .line 48
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v4, Lcom/screenshotclean/app/R$string;->service_notif_title:I

    .line 49
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v4, Lcom/screenshotclean/app/R$string;->service_notif_text:I

    .line 50
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 51
    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 52
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 53
    const-string v3, "#1E6FFF"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 54
    invoke-virtual {v2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    .line 47
    return-object v2
.end method

.method public showAggregate(IJLjava/lang/String;)V
    .registers 14
    .param p1, "count"    # I
    .param p2, "soonestDeadlineMs"    # J
    .param p4, "firstName"    # Ljava/lang/String;

    .line 88
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-class v2, Lcom/screenshotclean/app/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 89
    .local v0, "open":Landroid/content/Intent;
    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const v2, 0x9001

    const/high16 v3, 0xc000000

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 92
    .local v1, "openPi":Landroid/app/PendingIntent;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, p2, v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 93
    .local v2, "remainSec":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \u5f20\u622a\u56fe\u5f85\u81ea\u52a8\u5220\u9664\uff0c\u6700\u65e9\u5c06\u4e8e "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2, v3}, Lcom/screenshotclean/app/Notifier;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \u540e\u5220\u9664"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 94
    .local v4, "text":Ljava/lang/String;
    if-eqz p4, :cond_63

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\uff08\u5982 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\uff09"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 96
    :cond_63
    new-instance v5, Landroid/app/Notification$Builder;

    iget-object v6, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v7, "screenshot_clean"

    invoke-direct {v5, v6, v7}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget v6, Lcom/screenshotclean/app/R$drawable;->ic_stat_shot:I

    .line 97
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u622a\u56fe\u81ea\u52a8\u6e05\u7406 \u00b7 "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u4e2a\u5f85\u5220\u9664\u4efb\u52a1"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 98
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 99
    invoke-virtual {v5, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    new-instance v6, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v6}, Landroid/app/Notification$BigTextStyle;-><init>()V

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n\n\u8bf7\u5728\u5e94\u7528\u5185\u9010\u4e2a\u53d6\u6d88\u4e0d\u9700\u8981\u5220\u9664\u7684\u622a\u56fe\uff0c\u6216\u8c03\u6574\u5220\u9664\u5ef6\u8fdf\u3002"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 100
    invoke-virtual {v6, v7}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 102
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 103
    const-string v6, "#1E6FFF"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 104
    invoke-virtual {v5, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 105
    invoke-virtual {v5}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    .line 106
    .local v5, "n":Landroid/app/Notification;
    iget-object v6, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    const v7, 0x9002

    invoke-virtual {v6, v7, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 107
    return-void
.end method

.method public showCancelled(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .line 111
    new-instance v0, Landroid/app/Notification$Builder;

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v2, "screenshot_clean"

    invoke-direct {v0, v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget v1, Lcom/screenshotclean/app/R$drawable;->ic_stat_shot:I

    .line 112
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v2, Lcom/screenshotclean/app/R$string;->notif_cancelled_title:I

    .line 113
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  \u00b7  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v3, Lcom/screenshotclean/app/R$string;->notif_cancelled_text:I

    .line 114
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 115
    const-string v1, "#1E6FFF"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 116
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 117
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 118
    .local v0, "n":Landroid/app/Notification;
    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    invoke-static {p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 119
    return-void
.end method

.method public showCountdown(Ljava/lang/String;Ljava/lang/String;JJ)V
    .registers 30
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "deadlineMs"    # J
    .param p5, "totalMs"    # J

    .line 59
    move-object/from16 v0, p0

    move-wide/from16 v1, p3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long v3, v1, v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    const-wide/16 v7, 0x0

    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    .line 60
    .local v3, "remainSec":J
    div-long v5, p5, v5

    .line 62
    .local v5, "totalSec":J
    new-instance v7, Landroid/content/Intent;

    iget-object v8, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-class v9, Lcom/screenshotclean/app/CancelReceiver;

    invoke-direct {v7, v8, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 63
    const-string v8, "com.screenshotclean.app.CANCEL"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    .line 64
    const-string v8, "path"

    move-object/from16 v9, p1

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    .line 65
    .local v7, "cancel":Landroid/content/Intent;
    iget-object v8, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    invoke-static/range {p1 .. p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v10

    const/high16 v11, 0xc000000

    invoke-static {v8, v10, v7, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 68
    .local v8, "cancelPi":Landroid/app/PendingIntent;
    new-instance v10, Landroid/content/Intent;

    iget-object v12, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-class v13, Lcom/screenshotclean/app/CountdownActivity;

    invoke-direct {v10, v12, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 69
    .local v10, "open":Landroid/content/Intent;
    const-string v12, "path"

    move-object/from16 v13, p1

    invoke-virtual {v10, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v10

    const-string v12, "name"

    move-object/from16 v13, p2

    invoke-virtual {v10, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v10

    const-string v12, "deadline"

    invoke-virtual {v10, v12, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v10

    const-string v12, "total"

    invoke-virtual {v10, v12, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v10

    iget-object v12, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    invoke-static/range {p1 .. p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v13

    invoke-static {v12, v13, v10, v11}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v11

    .line 72
    .local v11, "openPi":Landroid/app/PendingIntent;
    new-instance v12, Landroid/app/Notification$Builder;

    iget-object v13, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v14, "screenshot_clean"

    invoke-direct {v12, v13, v14}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget v13, Lcom/screenshotclean/app/R$drawable;->ic_stat_shot:I

    .line 73
    invoke-virtual {v12, v13}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v12

    iget-object v13, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v14, Lcom/screenshotclean/app/R$string;->notif_delete_title:I

    .line 74
    invoke-virtual {v13, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\u5012\u8ba1\u65f6 "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {v3, v4}, Lcom/screenshotclean/app/Notifier;->format(J)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v14, p2

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v15, "  \u00b7  "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 75
    invoke-static {v3, v4}, Lcom/screenshotclean/app/Notifier;->format(J)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v12

    long-to-int v13, v5

    move-object v15, v10

    .end local v10    # "open":Landroid/content/Intent;
    .local v15, "open":Landroid/content/Intent;
    sub-long v9, v5, v3

    long-to-int v9, v9

    .line 76
    const/4 v10, 0x0

    invoke-virtual {v12, v13, v9, v10}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 77
    invoke-virtual {v9, v1, v2}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 78
    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 79
    const-string v13, "#1E6FFF"

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v9, v13}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 80
    invoke-virtual {v9, v11}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    iget-object v13, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v12, Lcom/screenshotclean/app/R$string;->notif_cancel_action:I

    .line 81
    invoke-virtual {v13, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v10, v12, v8}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    new-instance v13, Landroid/content/Intent;

    iget-object v14, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-class v15, Lcom/screenshotclean/app/DeleteNowReceiver;

    invoke-direct {v13, v14, v15}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v14, "com.screenshotclean.app.DELETE_NOW"

    invoke-virtual {v13, v14}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v13

    const-string v14, "path"

    move-object/from16 v15, p1

    invoke-virtual {v13, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v13

    iget-object v14, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    invoke-static/range {p1 .. p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v15

    add-int/lit8 v15, v15, 0x1

    const/high16 v2, 0xc000000

    invoke-static {v14, v15, v13, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    const-string v14, "\u7acb\u5373\u5220\u9664"

    invoke-virtual {v9, v10, v14, v13}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 82
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 83
    invoke-virtual {v9, v10}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v9

    const-string v7, "transport"

    invoke-virtual {v9, v7}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;



    move-result-object v9


    sget-object v7, Lcom/screenshotclean/app/Notifier;->sMediaSession:Landroid/media/session/MediaSession;

    if-nez v7, :cond_ms

    new-instance v7, Landroid/media/session/MediaSession;

    iget-object v8, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v10, "scc_countdown"

    invoke-direct {v7, v8, v10}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v7, Lcom/screenshotclean/app/Notifier;->sMediaSession:Landroid/media/session/MediaSession;

    iget-object v8, v0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;
    new-instance v10, Lcom/screenshotclean/app/CountdownMediaCallback;
    invoke-direct {v10, v8}, Lcom/screenshotclean/app/CountdownMediaCallback;-><init>(Landroid/content/Context;)V
    invoke-virtual {v7, v10}, Landroid/media/session/MediaSession;->setCallback(Landroid/media/session/MediaSession$Callback;)V
    :cond_ms


    move-object/from16 v15, p1
    sput-object v15, Lcom/screenshotclean/app/CountdownMediaCallback;->sPath:Ljava/lang/String;
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/media/session/MediaSession;->setActive(Z)V
    # --- v2.6: 音乐岛模式（三键布局 + 进度条），更新 PlaybackState ---
    # 重新加载 deadlineMs（v1-v2 在中间被 invoke 清除，必须从 p3 重取）
    move-wide/from16 v1, p3
    move-wide/from16 v5, p5
    invoke-static {v7, v1, v2, v5, v6}, Lcom/screenshotclean/app/Notifier;->updatePlaybackState(Landroid/media/session/MediaSession;JJ)V


    new-instance v8, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v8}, Landroid/media/MediaMetadata$Builder;-><init>()V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u5012\u8ba1\u65f6 "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v3, v4}, Lcom/screenshotclean/app/Notifier;->format(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "android.media.metadata.TITLE"

    invoke-virtual {v8, v11, v10}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v8

    const-string v11, "android.media.metadata.ARTIST"

    move-object/from16 v10, p2

    invoke-virtual {v8, v11, v10}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v8

    const-string v11, "android.media.metadata.DURATION"

    invoke-virtual {v8, v11, v5, v6}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;

    move-result-object v8

    invoke-virtual {v8}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    new-instance v8, Landroid/app/Notification$MediaStyle;

    invoke-direct {v8}, Landroid/app/Notification$MediaStyle;-><init>()V

    invoke-virtual {v7}, Landroid/media/session/MediaSession;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/app/Notification$MediaStyle;->setMediaSession(Landroid/media/session/MediaSession$Token;)Landroid/app/Notification$MediaStyle;

    move-result-object v8

    invoke-virtual {v9, v8}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 83
    invoke-virtual {v9}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v9

    .line 84
    # --- 注入 android.compactActions=[0,1] 让媒体岛显示通知按钮 ---
    iget-object v10, v9, Landroid/app/Notification;->extras:Landroid/os/Bundle;
    const-string v11, "android.compactActions"
    const/4 v12, 0x2
    new-array v12, v12, [I
    const/4 v13, 0x0
    const/4 v14, 0x0
    aput v14, v12, v13
    const/4 v13, 0x1
    const/4 v14, 0x1
    aput v14, v12, v13
    invoke-virtual {v10, v11, v12}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V
    iget-object v10, v0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    invoke-static/range {p1 .. p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v10, v12, v9}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 85
    return-void
.end method

.method public showDeleted(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .line 123
    new-instance v0, Landroid/app/Notification$Builder;

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v2, "screenshot_clean"

    invoke-direct {v0, v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget v1, Lcom/screenshotclean/app/R$drawable;->ic_stat_shot:I

    .line 124
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v2, Lcom/screenshotclean/app/R$string;->notif_deleted_title:I

    .line 125
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  \u00b7  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v3, Lcom/screenshotclean/app/R$string;->notif_deleted_text:I

    .line 126
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 127
    const-string v1, "#1E6FFF"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 128
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 129
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 130
    .local v0, "n":Landroid/app/Notification;
    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    invoke-static {p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 132
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/screenshotclean/app/Notifier$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1}, Lcom/screenshotclean/app/Notifier$$ExternalSyntheticLambda0;-><init>(Lcom/screenshotclean/app/Notifier;Ljava/lang/String;)V

    const-wide/16 v3, 0xbb8

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 134
    return-void
.end method

.method public showFailed(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .line 138
    new-instance v0, Landroid/app/Notification$Builder;

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    const-string v2, "screenshot_clean"

    invoke-direct {v0, v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget v1, Lcom/screenshotclean/app/R$drawable;->ic_stat_shot:I

    .line 139
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v2, Lcom/screenshotclean/app/R$string;->notif_failed_title:I

    .line 140
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  \u00b7  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/screenshotclean/app/Notifier;->ctx:Landroid/content/Context;

    sget v3, Lcom/screenshotclean/app/R$string;->notif_failed_text:I

    .line 141
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 142
    const-string v1, "#FF5252"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 143
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 144
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 145
    .local v0, "n":Landroid/app/Notification;
    iget-object v1, p0, Lcom/screenshotclean/app/Notifier;->nm:Landroid/app/NotificationManager;

    invoke-static {p1}, Lcom/screenshotclean/app/Notifier;->idFor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 146
    return-void
.end method
# v2.7: position = 已播放时间（total - 剩余），进度条音乐播放样式从空到满
.method private static updatePlaybackState(Landroid/media/session/MediaSession;JJ)V
    .registers 14
    .param p0, "session"    # Landroid/media/session/MediaSession;
    .param p1, "deadlineMs"    # J
    .param p3, "totalMs"    # J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    sub-long v2, p1, v0
    sub-long v2, p3, v2
    new-instance v4, Landroid/media/session/PlaybackState$Builder;
    invoke-direct {v4}, Landroid/media/session/PlaybackState$Builder;-><init>()V
    const/4 v5, 0x3
    const/high16 v6, 0x3f800000
    invoke-virtual {v4, v5, v2, v3, v6}, Landroid/media/session/PlaybackState$Builder;->setState(IJF)Landroid/media/session/PlaybackState$Builder;
    move-result-object v4
    const-wide/16 v6, 0x30
    invoke-virtual {v4, v6, v7}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;
    move-result-object v4
    invoke-virtual {v4}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;
    move-result-object v4
    invoke-virtual {p0, v4}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V
    return-void
.end method

