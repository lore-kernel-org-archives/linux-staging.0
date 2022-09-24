Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7117B
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:04:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id b35so4542892edf.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=5MWN7wULTG9J6qm7GHbwlY2627vVnidsrjKrrOkFmCY=;
        b=d6UuLG4UrhH8Ffcq1TAXSn4SJY9b89SbhMqve7sPhe6zDnRCtTNgmNpkP1MRZCqFJ1
         cfAnjHggl5DaOBXKJgfFUxkiPM/0nn+OczYFy6hHy4cLD6AxXqbZmNPiKb4t/GM+g5J+
         wUCgKlPol/cOZybTN+DHRXbi/+F/I7RUls98yJ7BeLRyeu4BxSuBU+QAA0yYV6LDz088
         G+q7GQta75pi948Cm0ZSMKryduuIDbudGGwjICwy9TuLh28My/EyaDnZQHfya3oRJwbn
         yira2XZuZYbXN2T5Im1gPPvZyXp6dpXPUjD+M4dVzNj72jVk/qVeIVMBl1S2ZQmhXHaH
         2Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5MWN7wULTG9J6qm7GHbwlY2627vVnidsrjKrrOkFmCY=;
        b=72vhF/yJ1BCGVo3U/K2R6PIJxMe8DdPZdjyEdJD2Vy/gSfM7jUF44XTJwmCWWlc3Ci
         b8NJ9VdmAjqt5bLI4nWhHxOfPIvahDrhkjaQmX2Jp7EJYE4rxpNi74LJbXX0/GVZqbUR
         XoX5wvKajAjNo9nY+zJBp/Uh07IOiqagZlzOvMlN/7C/fRI6p27fYur4Q4PTGskZ0pYl
         IGoSfP5+LbjNpVVrqomprSEKPfajKQReeQe1FiD/4EmoXig1uGFGhJguwHcAZUxLO4/O
         hAcP+eqqoLeeb6gKcEvfI8UrhnfUdMDPjgODHj0IbIsE/S4QF/Jg0T0SIjpICsUK8QOS
         On+A==
X-Gm-Message-State: ACrzQf2oloSuBjthxBSoZtv5JT6hBYjH8MHtQ9z6rQldLBMXoynh1ASr
	RzYDECUIGV8+y5Xb0S+EMO8=
X-Google-Smtp-Source: AMsMyM5zYss1HirJsMob9TrryvOtli9I/6XCuwxRaPFR5YF5m5DtGfWzcktKSKaIOd3TxZd8KDhxrw==
X-Received: by 2002:a50:ed05:0:b0:456:d6fe:d800 with SMTP id j5-20020a50ed05000000b00456d6fed800mr8215871eds.101.1664057062418;
        Sat, 24 Sep 2022 15:04:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id v9-20020a170906858900b00773dbdd8205sm5846657ejx.168.2022.09.24.15.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:04:21 -0700 (PDT)
Date: Sun, 25 Sep 2022 00:04:19 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] staging: rtl8192e: Remove unused variables
 ForcedAMSDUMaxSize, ...
Message-ID: <0f3e63030511f72dbadc0368fd5e2dbd3ff84e07.1664055213.git.philipp.g.hortmann@gmail.com>
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

Remove unused variables that are may just once written but never read
ForcedAMSDUMaxSize, PeerBandwidth, SwBwStep, bIsPeerBcm and
bAcceptAddbaReq to avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 11 -----------
 drivers/staging/rtl8192e/rtl819x_HTProc.c |  4 ----
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 3d5dc60d2912..76bc9c5a6d83 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -138,8 +138,6 @@ struct rt_hi_throughput {
 	u8 forced_mpdu_density;
 
 	enum ht_aggre_mode ForcedAMSDUMode;
-	u16				ForcedAMSDUMaxSize;
-
 	u8 forced_short_gi;
 
 	u8 current_op_mode;
@@ -149,11 +147,7 @@ struct rt_hi_throughput {
 
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
 	u8 cur_tx_bw40mhz;
-	u8				PeerBandwidth;
-
 	u8 sw_bw_in_progress;
-	u8				SwBwStep;
-
 	u8 reg_rt2rt_aggregation;
 	u8				RT2RT_HT_Mode;
 	u8 current_rt2rt_aggregation;
@@ -165,17 +159,12 @@ struct rt_hi_throughput {
 	u8 rx_reorder_win_size;
 	u8 rx_reorder_pending_time;
 	u16 rx_reorder_drop_counter;
-
-	u8				bIsPeerBcm;
-
 	u8				IOTPeer;
 	u32 iot_action;
 	u8 iot_ra_func;
 
 	u8	bWAIotBroadcom;
 	u8	WAIotTH;
-
-	u8				bAcceptAddbaReq;
 } __packed;
 
 struct bss_ht {
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index a038a8c1504f..4a3bd49ce81a 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -70,9 +70,6 @@ static u8 LINKSYS_MARVELL_4400N[3] = {0x00, 0x14, 0xa4};
 void HTUpdateDefaultSetting(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
-
-	pHTInfo->bAcceptAddbaReq = 1;
-
 	pHTInfo->bRegShortGI20MHz = 1;
 	pHTInfo->bRegShortGI40MHz = 1;
 
@@ -603,7 +600,6 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	if (pHTInfo->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
 		pHTInfo->bCurrentAMPDUEnable = false;
 		pHTInfo->ForcedAMSDUMode = HT_AGG_FORCE_ENABLE;
-		pHTInfo->ForcedAMSDUMaxSize = 7935;
 	}
 	pHTInfo->cur_rx_reorder_enable = pHTInfo->reg_rx_reorder_enable;
 
-- 
2.37.3

