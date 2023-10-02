Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB021E523
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:49 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5334f8a40e2so4519276a12.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269228; x=1696874028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIcOLQi7rOEZO2zRfMF5D3C/NLGqqczvIFQ3scs6Ros=;
        b=YVUeCyde1PgnmeuK0mnJ16YK56S4+z4IO2Z4SMa9vu6Gjqx8KkheAPFhUyOhXEt5oM
         d7OZiOk5K2K4/dAuqMdmMlZGAlCfCYtFkuEnImJFetl+qfXa6MUQ05eYLwxQ1LEUytjS
         vv0Z/zUo3J80DV76oXWqpgg46eBYrxKyxdXkJXIMejRH0zj0sHayxDYTsbqbSx3NeY++
         bHm+HdRu4UZrkKdYkZZIXt/5zHHPXpckYBaXUJ99OdSnsZ1MRB15XdZd7MviTesriSBp
         O+ABTNIWAfS6uxVtbCnGxPMy+tcqjVBy8wqTjw0eAYQNkYlc31IB+E1IcB3wfdyE6OI8
         /Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269228; x=1696874028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIcOLQi7rOEZO2zRfMF5D3C/NLGqqczvIFQ3scs6Ros=;
        b=oiPdGuE2aEIDjMATz+CiTWSs9CT3MAn+W4YK73xjL0dVXlDYX89ksvFZYJhGmKfNl7
         pxBcY0y3TT4rAbakdHz4IPfBcxcVWj+HSNElzDxVTkYoBwpJxMlbvrhtaapph01e94il
         XoQ3HVVq56aMX9oQuryn0s3XlzghWqsvU2QCr75CERd1GS8orOJYAxkMNKX7zK8pY3mD
         4hI+M0JcYzSM0BkuH2wuVnI6t37uKC7g5pk53UIpktWM9hbwfJzpBamf7js6c0hYY2DM
         7zgTxxxRW4Xy6RCsa2l1Mk0KghBG3EJzK5nvkPG25a0BzpKh9NTs2KG8dP12MJSEnAzK
         zqOQ==
X-Gm-Message-State: AOJu0YxwQDs7yszUx5oRSF7N9++wixRm/4KE+Npfk3+LZ2BnmYzGOY2V
	H1p8M6B41AClHftO+mAGzI/XDnh45Gw=
X-Google-Smtp-Source: AGHT+IFiIdAwKQO22SOdobp677I3ry+U9Ko94xzyH8SLb9QIjxzjD2SHLIyvLGR1CzUtGqCLzS1OZw==
X-Received: by 2002:a05:6402:2792:b0:51a:4d46:4026 with SMTP id b18-20020a056402279200b0051a4d464026mr9627644ede.0.1696269227733;
        Mon, 02 Oct 2023 10:53:47 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id e6-20020a056402104600b00536e03f62bcsm5772882edu.59.2023.10.02.10.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:47 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:45 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: rtl8192e: Remove unused/constant parameter
 mesh_flag and shutdown
Message-ID: <5a8f87165b10fd93e3e2fad83ff3380c9f4f22b2.1696266965.git.philipp.g.hortmann@gmail.com>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

Remove parameters mesh_flag and shutdown of function
rtllib_softmac_stop_protocol(). mesh_flag is unused. shutdown is always
true.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 3 +--
 drivers/staging/rtl8192e/rtllib_softmac.c    | 5 ++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 1f3a2bee247f..4e9a0138ce55 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -655,7 +655,7 @@ static int _rtl92e_sta_down(struct net_device *dev, bool shutdownrf)
 	_rtl92e_cancel_deferred_work(priv);
 	cancel_delayed_work(&priv->rtllib->hw_wakeup_wq);
 
-	rtllib_softmac_stop_protocol(priv->rtllib, 0, true);
+	rtllib_softmac_stop_protocol(priv->rtllib);
 	spin_lock_irqsave(&priv->rf_ps_lock, flags);
 	while (priv->rf_change_in_progress) {
 		spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
@@ -1763,7 +1763,7 @@ void rtl92e_commit(struct net_device *dev)
 
 	if (priv->up == 0)
 		return;
-	rtllib_softmac_stop_protocol(priv->rtllib, 0, true);
+	rtllib_softmac_stop_protocol(priv->rtllib);
 	rtl92e_irq_disable(dev);
 	rtl92e_stop_adapter(dev, true);
 	_rtl92e_up(dev);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index bf4ec38efa35..65f29afa81be 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1705,8 +1705,7 @@ void rtllib_DisableNetMonitorMode(struct net_device *dev, bool bInitState);
 void rtllib_EnableIntelPromiscuousMode(struct net_device *dev, bool bInitState);
 void rtllib_DisableIntelPromiscuousMode(struct net_device *dev,
 					bool bInitState);
-void rtllib_softmac_stop_protocol(struct rtllib_device *ieee,
-				  u8 mesh_flag, u8 shutdown);
+void rtllib_softmac_stop_protocol(struct rtllib_device *ieee);
 void rtllib_softmac_start_protocol(struct rtllib_device *ieee, u8 mesh_flag);
 
 void rtllib_reset_queue(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 777338fd2664..1a086f0ff10d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2279,12 +2279,11 @@ struct sk_buff *rtllib_get_beacon(struct rtllib_device *ieee)
 }
 EXPORT_SYMBOL(rtllib_get_beacon);
 
-void rtllib_softmac_stop_protocol(struct rtllib_device *ieee, u8 mesh_flag,
-				  u8 shutdown)
+void rtllib_softmac_stop_protocol(struct rtllib_device *ieee)
 {
 	rtllib_stop_scan_syncro(ieee);
 	mutex_lock(&ieee->wx_mutex);
-	rtllib_stop_protocol(ieee, shutdown);
+	rtllib_stop_protocol(ieee, true);
 	mutex_unlock(&ieee->wx_mutex);
 }
 EXPORT_SYMBOL(rtllib_softmac_stop_protocol);
-- 
2.42.0

