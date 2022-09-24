Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE07B
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:03:53 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id m3so4431762eda.12
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=eP06qnbCwxGVtciyiHBHP8FAxePB4HjgZ+xJDoorIoU=;
        b=K8w1XgAMjxjat1n8IG/jP6N000U9JPzKgvv3GitU6ECmkSsbyVMl2lfwA4+p+hGrfi
         e9d9M1KV5zPRVnS/k6Z7GVkkLZynn57tg40ILsdURjO+sBsgyk130Sff6p60agBYn8Oa
         7EPhtqBgRgA17D6RRjqcvmRMhY74jAjb3u/Jkh2ja6ixXmYxQfH2AB8L0c8XqNW1p2OF
         jw5BRakkawk+yOBLm1tf9sFTqfxw3xOhnsHWBrvOLDLjrHm1s15PsGRDcK6rfnZH3j+y
         KopqdvEKiNHgyp7PH3xD5PllgXtgT6/629Hykwj/WuZxvr88elXhNeTzTxqX6zwobw43
         jeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=eP06qnbCwxGVtciyiHBHP8FAxePB4HjgZ+xJDoorIoU=;
        b=ao/RFCluogZfJ/1I21u4z7lEmsL3VhWE0PuYKZS56UICeEXcAWit1Y8r/iUODBhJen
         d9TKue2mj6ZAWIOd+/GbRC8ZSmQC8V+E3BoYQO1Hyd8AhLROTdkO0Oudd0iZNZVcfN0p
         EOTrjosMTnb1BbxnbZk9//quQjl86KWSfaQE/lfJ9zl7fSoQyLzM2vaSasB0GUS0B4Nd
         /oPHVSxGgxcKH2kTUB1Sk9Q7gp6K9S/7x+WcM6cVzdjdzfNZEkVlIYu6MXxXMiFbQ/P8
         07h5xwL+x2u+GaGxmDhJU4OcN1ujb1tzGh1djH5XGPJnHI9yG61BYKE37VuJpcoimbrU
         3yqg==
X-Gm-Message-State: ACrzQf2KmeeME8ymqrp3RZO72sBcuYZKDvy1w3KwQ66GKzpacPkemgkU
	W5c2GF8i0qX3TOOS0fbdhQc=
X-Google-Smtp-Source: AMsMyM53mrQZtXzxgQuIoVb1KZPCMdFFLkBIqiP4IVJUTIo9wr2lyHC2bED28BhxfgagYrZq1acldg==
X-Received: by 2002:a05:6402:f07:b0:450:bf95:59e9 with SMTP id i7-20020a0564020f0700b00450bf9559e9mr15265805eda.46.1664057031655;
        Sat, 24 Sep 2022 15:03:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906084a00b0073c80d008d5sm5882486ejd.122.2022.09.24.15.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:03:51 -0700 (PDT)
Date: Sun, 25 Sep 2022 00:03:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Rename RxRe...WinSize, RxReorder...
 and RxReorderDr...
Message-ID: <e09ef6e2edc88e32782202589a9230204b547a9c.1664055213.git.philipp.g.hortmann@gmail.com>
References: <cover.1664055213.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664055213.git.philipp.g.hortmann@gmail.com>

Rename variable RxReorderWinSize to rx_reorder_win_size,
RxReorderPendingTime to rx_reorder_pending_time and RxReorderDropCounter
to rx_reorder_drop_counter to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 6 +++---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 2dd08f06fa9f..7380df65959b 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -162,9 +162,9 @@ struct rt_hi_throughput {
 
 	u8 reg_rx_reorder_enable;
 	u8 cur_rx_reorder_enable;
-	u8				RxReorderWinSize;
-	u8				RxReorderPendingTime;
-	u16				RxReorderDropCounter;
+	u8 rx_reorder_win_size;
+	u8 rx_reorder_pending_time;
+	u16 rx_reorder_drop_counter;
 
 	u8				bIsPeerBcm;
 
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index e8fcfa01204b..a7ccdee57a1b 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -101,8 +101,8 @@ void HTUpdateDefaultSetting(struct rtllib_device *ieee)
 	pHTInfo->reg_rt2rt_aggregation = 1;
 
 	pHTInfo->reg_rx_reorder_enable = 1;
-	pHTInfo->RxReorderWinSize = 64;
-	pHTInfo->RxReorderPendingTime = 30;
+	pHTInfo->rx_reorder_win_size = 64;
+	pHTInfo->rx_reorder_pending_time = 30;
 }
 
 static u16 HTMcsToDataRate(struct rtllib_device *ieee, u8 nMcsRate)
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 34b00a76b6bd..05c7e822f372 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -83,7 +83,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 	if (bPktInBuf && (pRxTs->rx_timeout_indicate_seq == 0xffff)) {
 		pRxTs->rx_timeout_indicate_seq = pRxTs->rx_indicate_seq;
 		mod_timer(&pRxTs->rx_pkt_pending_timer,  jiffies +
-			  msecs_to_jiffies(ieee->pHTInfo->RxReorderPendingTime)
+			  msecs_to_jiffies(ieee->pHTInfo->rx_reorder_pending_time)
 			  );
 	}
 	spin_unlock_irqrestore(&(ieee->reorder_spinlock), flags);
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 8ec8aa7d97d4..46d75e925ee9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -569,7 +569,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 	struct rx_reorder_entry *pReorderEntry = NULL;
-	u8 WinSize = pHTInfo->RxReorderWinSize;
+	u8 WinSize = pHTInfo->rx_reorder_win_size;
 	u16 WinEnd = 0;
 	u8 index = 0;
 	bool bMatchWinStart = false, bPktInBuf = false;
@@ -591,7 +591,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 		netdev_dbg(ieee->dev,
 			   "Packet Drop! IndicateSeq: %d, NewSeq: %d\n",
 			   pTS->rx_indicate_seq, SeqNum);
-		pHTInfo->RxReorderDropCounter++;
+		pHTInfo->rx_reorder_drop_counter++;
 		{
 			int i;
 
@@ -755,7 +755,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 		netdev_dbg(ieee->dev, "%s(): SET rx timeout timer\n", __func__);
 		pTS->rx_timeout_indicate_seq = pTS->rx_indicate_seq;
 		mod_timer(&pTS->rx_pkt_pending_timer, jiffies +
-			  msecs_to_jiffies(pHTInfo->RxReorderPendingTime));
+			  msecs_to_jiffies(pHTInfo->rx_reorder_pending_time));
 	}
 	spin_unlock_irqrestore(&(ieee->reorder_spinlock), flags);
 }
-- 
2.37.3

