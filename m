Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E68F58
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 17:15:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id h8so75844069ede.8
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 10:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679505315; x=1682097315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JECvJ/K7E4yzQQFzJdiJ4lI6M7UJm3etUVtp/7RJfO0=;
        b=RaG65SripXOXd4P3RbaRyrmMRcCS9zYqhLN6j/FlAQWC1wRroz9Ff/XrT553zzAXlD
         7LA6vkW0tDf7AQCHomMUHYm4LS6Do6sLr+AI/00gYo1mxPFFdyFVMgpG/InrtmjAVrlI
         r70mGV+LG3qkAcPAzEuE4AuEYOrKOKLXXvoBW5+YgkbY8/6Nhj8yOpK274zlL03E9HKe
         FSt+0xQDGlhF4YUmR0MFm7vgy/OUGs9QJ6VQsJjjPgUC1ydjxfj2CHhTJ+yJIrkOSg4P
         XqkA/j7jPZxlnlDUlbMrjz3yVJ7NIRmJKVN/qVHZHYbc5Cvr14wO5t4gVtVc9lMR5TtQ
         +Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505315; x=1682097315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JECvJ/K7E4yzQQFzJdiJ4lI6M7UJm3etUVtp/7RJfO0=;
        b=VKO7M6l+wH8Go7yakTrGKIxpPzgD5c0zfWtn7bU+sXZ6Jxb8eXhnoEUi+Fq8ZSUeaB
         s3QoQ+Z+1JgBBWhm33/TKR0W0DWPksX5OF1LU0QkXKsysifJP51u93hanoDqrYM29+2i
         ODU8NA35M+j/Pbz+BBmwoxfaFzfiOTVyWZtkDidAFCc+mgW5ssI4WjKSr6fesXNCOlTB
         3xXxxYbKAHOVJ4/GupLNysa84ScISXy1Etmq+e24F2zK631MVm/ZwhsrDctLLiX1iLpu
         F8tT7vYrpB6yankmVUMbbTKwUiVxYAxdM0m6CN6tgsiQEc5SBAzDnQVQ6LIwdpenR2xj
         P+hA==
X-Gm-Message-State: AO0yUKXlMi6stQha6ZwmhbsnsJwTMAk+OsZZ9yb2rwP7ln0pAPWUYMQu
	/8CNqMWT5ZufppcUtveXmH8=
X-Google-Smtp-Source: AK7set8ffGT/kzRNoSw203vZvPePb4caVvJ5GhXeIIkpX3RqcxMuKVYvyHUI+Lr8bYt8bpsU8IKhgA==
X-Received: by 2002:a17:906:100a:b0:933:fa42:7e36 with SMTP id 10-20020a170906100a00b00933fa427e36mr6543719ejm.5.1679505314948;
        Wed, 22 Mar 2023 10:15:14 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y70-20020a50bb4c000000b004fa380a14e7sm8109199ede.77.2023.03.22.10.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:15:14 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:15:12 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] staging: rtl8192e: Replace macro INIT_WORK_RSL with
 standard macro
Message-ID: <71879ccda54d57078f47c70cdba90ae2234adc91.1679504314.git.philipp.g.hortmann@gmail.com>
References: <cover.1679504314.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679504314.git.philipp.g.hortmann@gmail.com>

Replace macro INIT_WORK_RSL with standard macro INIT_WORK to increase
readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 +++----
 drivers/staging/rtl8192e/rtllib.h            | 2 --
 drivers/staging/rtl8192e/rtllib_softmac.c    | 6 ++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a2263c41c6c8..ea07b350b62a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -890,14 +890,13 @@ static void _rtl92e_init_priv_task(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	INIT_WORK_RSL(&priv->reset_wq, (void *)_rtl92e_restart, dev);
-	INIT_WORK_RSL(&priv->rtllib->ips_leave_wq, (void *)rtl92e_ips_leave_wq,
-		      dev);
+	INIT_WORK(&priv->reset_wq, (void *)_rtl92e_restart);
+	INIT_WORK(&priv->rtllib->ips_leave_wq, (void *)rtl92e_ips_leave_wq);
 	INIT_DELAYED_WORK(&priv->watch_dog_wq, (void *)_rtl92e_watchdog_wq_cb);
 	INIT_DELAYED_WORK(&priv->txpower_tracking_wq, (void *)rtl92e_dm_txpower_tracking_wq);
 	INIT_DELAYED_WORK(&priv->rfpath_check_wq, (void *)rtl92e_dm_rf_pathcheck_wq);
 	INIT_DELAYED_WORK(&priv->update_beacon_wq, (void *)_rtl92e_update_beacon);
-	INIT_WORK_RSL(&priv->qos_activate, (void *)_rtl92e_qos_activate, dev);
+	INIT_WORK(&priv->qos_activate, (void *)_rtl92e_qos_activate);
 	INIT_DELAYED_WORK(&priv->rtllib->hw_wakeup_wq, (void *)rtl92e_hw_wakeup_wq);
 	INIT_DELAYED_WORK(&priv->rtllib->hw_sleep_wq, (void *)rtl92e_hw_sleep_wq);
 	tasklet_setup(&priv->irq_rx_tasklet, _rtl92e_irq_rx_tasklet);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 8cbefa6dfd6e..aa39f8b2bf09 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -62,8 +62,6 @@
 #define IW_CUSTOM_MAX	256	/* In bytes */
 #endif
 
-#define INIT_WORK_RSL(x, y, z) INIT_WORK(x, y)
-
 #define container_of_work_rsl(x, y, z) container_of(x, y, z)
 #define container_of_dwork_rsl(x, y, z)				\
 	container_of(to_delayed_work(x), y, z)
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c442fc98283d..91fb5f150a00 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2998,13 +2998,11 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 
 	INIT_DELAYED_WORK(&ieee->link_change_wq, (void *)rtllib_link_change_wq);
 	INIT_DELAYED_WORK(&ieee->start_ibss_wq, (void *)rtllib_start_ibss_wq);
-	INIT_WORK_RSL(&ieee->associate_complete_wq,
-		      (void *)rtllib_associate_complete_wq, ieee);
+	INIT_WORK(&ieee->associate_complete_wq, (void *)rtllib_associate_complete_wq);
 	INIT_DELAYED_WORK(&ieee->associate_procedure_wq, (void *)rtllib_associate_procedure_wq);
 	INIT_DELAYED_WORK(&ieee->softmac_scan_wq, (void *)rtllib_softmac_scan_wq);
 	INIT_DELAYED_WORK(&ieee->associate_retry_wq, (void *)rtllib_associate_retry_wq);
-	INIT_WORK_RSL(&ieee->wx_sync_scan_wq, (void *)rtllib_wx_sync_scan_wq,
-		      ieee);
+	INIT_WORK(&ieee->wx_sync_scan_wq, (void *)rtllib_wx_sync_scan_wq);
 
 	mutex_init(&ieee->wx_mutex);
 	mutex_init(&ieee->scan_mutex);
-- 
2.39.2

