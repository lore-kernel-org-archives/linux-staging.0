Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02A46B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:20:21 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id vm8so63686626ejc.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9PMUN06RhbNHE4qDKcXN4Xb3hE+7IHkXvclZTL5rZs=;
        b=UFwvfEY6RgPL6bTmbwMM6X804QbJ95a78/+fsEiD5IN1BGpQRN7OsCxJDytCyzjwwr
         UaniCR6F9hseOhz3D74EkQQkron6+fHd6Fk06RT59CNiA4AoD0Ef8mlipOtkBQVu5q76
         kGOTwN/hC8X2Hly5SlAwGRZRczxlB+VhJp12Iv7QHAVZ4SGi1sRnuJEjfdkLv4wdD4lG
         nr+NFUnlkmgKRJS/iuTdkCSuDpyBzcjt/6h/e0Ns19aRr8RWSyvt3oBJlkoGwGvlWBCv
         z65mRlOdhHj6dEonzrPklK8RgHXQPIM3opUOB+BIETQQeFH0OoBdhmJdmUIlme3+9Xvv
         +CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9PMUN06RhbNHE4qDKcXN4Xb3hE+7IHkXvclZTL5rZs=;
        b=AUKPN6Mv6EjZR89FiX4wdCOqpgvEm6SAwZF9XzUj3sGj8OIuOS9LyJkrNApnGa91ZC
         JkcJKLEVL8jZOrpzt7w8Yk0iuqTnjwRRvKIfRUt2OwGJlTLT27BB25YMXDBLiAr4LrkF
         Aa/LVoitbHeSJu/OqSE/PyBA9Y7yJ9qn+f3oiTJkpSWLX/6Y33KDtx8wr76qWBgiQEbG
         ++WgeUqxjIyMUEJ5IrS1KWqJGQ9OHp13qta3D+WLoWeImQTXwnIy//dB3UDOu34YlDW6
         L2OzKxGjPJRAZvclIu9uiHKRxN2ppvp5z9l1dn9TxWSCCMFjIvcbFApTDcFE/qJClV9r
         hRXA==
X-Gm-Message-State: AFqh2krP+7Rw1FBTvs0jFiNNICgSIrWuMldNT9Jlt0t6M2FSrtk6EAXa
	CQsNuBCVplQv2V7TAr5nFA4=
X-Google-Smtp-Source: AMrXdXvmY1wWNoeCogxM3MvtEhpje1snWXE5Hb+XnxmRK3ALTBI4yeNoKNzBxYRvEOAbq3kb4Ogi8w==
X-Received: by 2002:a17:906:9c85:b0:7c0:d7af:fce3 with SMTP id fj5-20020a1709069c8500b007c0d7affce3mr16969500ejc.1.1673814020184;
        Sun, 15 Jan 2023 12:20:20 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id p21-20020a056402045500b0048aff8b5b70sm10601967edw.67.2023.01.15.12.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:20:19 -0800 (PST)
Date: Sun, 15 Jan 2023 21:20:18 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Rename rateCountDi.., ContinueDif..
 and TxCounter
Message-ID: <c1e168e60a987ae64b64490c04ad79fd0f2f7583.1673812849.git.philipp.g.hortmann@gmail.com>
References: <cover.1673812849.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673812849.git.philipp.g.hortmann@gmail.com>

Rename variable rateCountDiffRecord to rate_count_diff_rec,
ContinueDiffCount to continue_diff_count and TxCounter to tx_counter to
avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  4 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  6 ++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 26 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index ebf1fa5ec295..1f0c53dcbb2d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -2154,10 +2154,10 @@ bool rtl92e_is_tx_stuck(struct net_device *dev)
 	bool	bStuck = false;
 	u16	RegTxCounter = rtl92e_readw(dev, 0x128);
 
-	if (priv->TxCounter == RegTxCounter)
+	if (priv->tx_counter == RegTxCounter)
 		bStuck = true;
 
-	priv->TxCounter = RegTxCounter;
+	priv->tx_counter = RegTxCounter;
 
 	return bStuck;
 }
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index af377f7c7f7b..be87bb9da6cc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -510,8 +510,8 @@ struct r8192_priv {
 
 	bool		bfsync_processing;
 	u32		rate_record;
-	u32		rateCountDiffRecord;
-	u32		ContinueDiffCount;
+	u32		rate_count_diff_rec;
+	u32		continue_diff_count;
 	bool		bswitch_fsync;
 	u8		framesync;
 	u32		framesyncC34;
@@ -520,7 +520,7 @@ struct r8192_priv {
 	u32		reset_count;
 
 	enum reset_type rst_progress;
-	u16		TxCounter;
+	u16		tx_counter;
 	u16		rx_ctr;
 	bool		bResetInProgress;
 	bool		force_reset;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 9789cdd8ac15..2a570c28e694 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -2008,31 +2008,31 @@ static void _rtl92e_dm_fsync_timer_callback(struct timer_list *t)
 					  priv->rate_record;
 		else
 			rate_count_diff = rate_count - priv->rate_record;
-		if (rate_count_diff < priv->rateCountDiffRecord) {
+		if (rate_count_diff < priv->rate_count_diff_rec) {
 
-			u32 DiffNum = priv->rateCountDiffRecord -
+			u32 DiffNum = priv->rate_count_diff_rec -
 				      rate_count_diff;
 			if (DiffNum >=
 			    priv->rtllib->fsync_seconddiff_ratethreshold)
-				priv->ContinueDiffCount++;
+				priv->continue_diff_count++;
 			else
-				priv->ContinueDiffCount = 0;
+				priv->continue_diff_count = 0;
 
-			if (priv->ContinueDiffCount >= 2) {
+			if (priv->continue_diff_count >= 2) {
 				bSwitchFromCountDiff = true;
-				priv->ContinueDiffCount = 0;
+				priv->continue_diff_count = 0;
 			}
 		} else {
-			priv->ContinueDiffCount = 0;
+			priv->continue_diff_count = 0;
 		}
 
 		if (rate_count_diff <=
 		    priv->rtllib->fsync_firstdiff_ratethreshold) {
 			bSwitchFromCountDiff = true;
-			priv->ContinueDiffCount = 0;
+			priv->continue_diff_count = 0;
 		}
 		priv->rate_record = rate_count;
-		priv->rateCountDiffRecord = rate_count_diff;
+		priv->rate_count_diff_rec = rate_count_diff;
 		if (priv->undecorated_smoothed_pwdb >
 		    priv->rtllib->fsync_rssi_threshold &&
 		    bSwitchFromCountDiff) {
@@ -2073,7 +2073,7 @@ static void _rtl92e_dm_fsync_timer_callback(struct timer_list *t)
 			rtl92e_writeb(dev, 0xC36, 0x5c);
 			rtl92e_writeb(dev, 0xC3e, 0x96);
 		}
-		priv->ContinueDiffCount = 0;
+		priv->continue_diff_count = 0;
 		rtl92e_writel(dev, rOFDM0_RxDetector2, 0x465c52cd);
 	}
 }
@@ -2114,7 +2114,7 @@ static void _rtl92e_dm_end_sw_fsync(struct net_device *dev)
 		rtl92e_writeb(dev, 0xC3e, 0x96);
 	}
 
-	priv->ContinueDiffCount = 0;
+	priv->continue_diff_count = 0;
 	rtl92e_writel(dev, rOFDM0_RxDetector2, 0x465c52cd);
 }
 
@@ -2125,8 +2125,8 @@ static void _rtl92e_dm_start_sw_fsync(struct net_device *dev)
 	u32 rate_bitmap;
 
 	priv->rate_record = 0;
-	priv->ContinueDiffCount = 0;
-	priv->rateCountDiffRecord = 0;
+	priv->continue_diff_count = 0;
+	priv->rate_count_diff_rec = 0;
 	priv->bswitch_fsync  = false;
 
 	if (priv->rtllib->mode == WIRELESS_MODE_N_24G) {
-- 
2.39.0

