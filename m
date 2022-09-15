Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F44C7F
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 20:29:59 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w28so4712024edi.7
        for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=y9AZ5yPTroiJBvhJDLo/B5BMwojZlFfEWtDm17F1H2o=;
        b=gKcrXG508Y7GGiISvf6xps0gJw1MiLbJWci8tBoN0NFKZiy8RXXR15fxug2/MvscW/
         aays0JHzdQ3vwG2L1+KMSarkqy+WhO8hMV9HNU2XtTkIPszTtrXid4LObO7uJhdW2A83
         tseJQ6jPcvB6F9cqpLy1UFYF337eBlQ4DcatUaoSKBjs3kIxsMv2OWxQq5nUvkp+/gkW
         YMm1xFQFFRbcgbi/VRHqYA2FQh0DS+CWl07E+8JlaN94wi9IEa+6ctV7Yq+m1PgKrG+p
         SHkoRG9wvsJvpTBONXQ68u8bvDEDtOQrKu91c642tK1GpDz1OkXsLkvbx1+ikGKFEuvc
         ZiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y9AZ5yPTroiJBvhJDLo/B5BMwojZlFfEWtDm17F1H2o=;
        b=OhKblV12ofj7bfnSRajOEcQK95Zi/uIKdB3kxmc/+ltLgsEOh5616+ITDnZwKKpAt8
         nithshOQicK30rXro092wFZmjxNJ8USb79DaLTzPt0miBwsVMRJHdw/4pVe4Z9d+j6kR
         s5cZJnDALKZ58NYy5FAEaIV4F74GhD6/53mdTis39YDOignmJP6aKHKMnPtrylYi62IS
         46hSwvWbS9pTtKCZ4dLeVLl5HqmSdg+f/LshGLHc12tkvCnkIvsgtWqXufQUHwG0XlGo
         36+KfS4TceGcmozj24jqiUdbOB+PkdHdWM+FRHeCx3JGIUkuCbteMU1Jpk/GawoVbUDy
         MjFw==
X-Gm-Message-State: ACrzQf0mVNfDoSYWrtXthwE+6N9FgZh3uS30f7yfgN6Nhzr184PVSpww
	occbgEhAB9ESdWDL833T+u4=
X-Google-Smtp-Source: AMsMyM7JmiuWn67fftEFKkqPS8BNP2/xzQh97SQlBr9HtoIthWNMA3iryF30oADtYmNKay/PmC0nfA==
X-Received: by 2002:a05:6402:28ca:b0:43b:5235:f325 with SMTP id ef10-20020a05640228ca00b0043b5235f325mr1323816edb.320.1663273798405;
        Thu, 15 Sep 2022 13:29:58 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-43.ip.prioritytelecom.net. [217.105.46.43])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b0072b3406e9c2sm9607295ejb.95.2022.09.15.13.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:29:58 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH 3/5] staging: vt6655: split device_alloc_rx_buf
Date: Thu, 15 Sep 2022 22:29:34 +0200
Message-Id: <311eaa7dabe12d0baeb0af6f85c2b43b20b230a3.1663273218.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663273218.git.namcaov@gmail.com>
References: <cover.1663273218.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function device_alloc_rx_buf does 2 things: allocating rx buffer
and initializing the rx descriptor's values. Split this function into
two, with each does one job.

This split is preparation for implementing correct out-of-memory error
handling.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 79325a693857..27fe28156257 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -133,6 +133,7 @@ static int device_init_td1_ring(struct vnt_private *priv);
 static int  device_rx_srv(struct vnt_private *priv, unsigned int idx);
 static int  device_tx_srv(struct vnt_private *priv, unsigned int idx);
 static bool device_alloc_rx_buf(struct vnt_private *, struct vnt_rx_desc *);
+static void device_init_rx_desc(struct vnt_private *priv, struct vnt_rx_desc *rd);
 static void device_free_rx_buf(struct vnt_private *priv,
 			       struct vnt_rx_desc *rd);
 static void device_init_registers(struct vnt_private *priv);
@@ -615,6 +616,8 @@ static int device_init_rd0_ring(struct vnt_private *priv)
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 			ret = -ENOMEM;
 			goto err_free_rd;
+		} else {
+			device_init_rx_desc(priv, desc);
 		}
 
 		desc->next = &priv->aRD0Ring[(i + 1) % priv->opts.rx_descs0];
@@ -661,6 +664,8 @@ static int device_init_rd1_ring(struct vnt_private *priv)
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 			ret = -ENOMEM;
 			goto err_free_rd;
+		} else {
+			device_init_rx_desc(priv, desc);
 		}
 
 		desc->next = &priv->aRD1Ring[(i + 1) % priv->opts.rx_descs1];
@@ -838,7 +843,10 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 			dev_err(&priv->pcid->dev,
 				"can not allocate rx buf\n");
 			break;
+		} else {
+			device_init_rx_desc(priv, rd);
 		}
+
 		rd->rd0.owner = OWNED_BY_NIC;
 	}
 
@@ -865,15 +873,17 @@ static bool device_alloc_rx_buf(struct vnt_private *priv,
 		rd_info->skb = NULL;
 		return false;
 	}
+	return true;
+}
 
+static void device_init_rx_desc(struct vnt_private *priv, struct vnt_rx_desc *rd)
+{
 	*((unsigned int *)&rd->rd0) = 0; /* FIX cast */
 
 	rd->rd0.res_count = cpu_to_le16(priv->rx_buf_sz);
 	rd->rd0.owner = OWNED_BY_NIC;
 	rd->rd1.req_count = cpu_to_le16(priv->rx_buf_sz);
-	rd->buff_addr = cpu_to_le32(rd_info->skb_dma);
-
-	return true;
+	rd->buff_addr = cpu_to_le32(rd->rd_info->skb_dma);
 }
 
 static void device_free_rx_buf(struct vnt_private *priv,
-- 
2.25.1

