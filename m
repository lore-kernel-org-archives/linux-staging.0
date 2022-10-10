Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A35C82
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 19:04:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id h205-20020a1c21d6000000b003c6bf423c71so49415wmh.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w13NLnUhg/us0UA07lnpLNoiEoB5Fcr+rg1qRGe/I/I=;
        b=WdSOZA7Xn0kkGvplBHSuUSOJurkY3g1eFpjrF97yY4pQOQblRYz3165UYEkLqxo3wl
         3vkI7/SfXtR2rUPTQzKBgDCh2Eio/Lt7bMpQNXZceb973+kphNPUTLLc4ur6P+4pdg/2
         pAqDj7TP6+5GAzK8ycFDCPLuFtnY/ulVkPYkj09nZG8ylks0gUQsp3eOvFiYqjNMQD5B
         E6SltHPKtoxUlpikTGVRhhECzhCcoQdjNbMKUIk3zWy8vXkF65t1zgZkVH3mGUSzo3xG
         +36loII2N2t89nyuuc6hKBIlQ5oFmcdMxCh09y43PsxtF07o3PCIPwBnNgV4/uPC1mkc
         BUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w13NLnUhg/us0UA07lnpLNoiEoB5Fcr+rg1qRGe/I/I=;
        b=D/dT8b6la/Xefcy/fDLbbHHaetJpup7n37zq8mxhCnFtyu9COOR1xoigr9pr2r23g3
         f3XSMfFeJymgc1HkN3EFXgFheww8fcQJAMII3dzBx+4I7RRKN9TSnRaHMq/tpSkY4Na0
         hlGQEKvb3nlAksuw1/9AJ6jV8qIB8P7TDhxKsMW6Mk/QmuSjMxliR0pjVdyxhLEuA33L
         kSQoyR0qRhaELrtpLv6VuRNKcbOV/RrX6qhzhZe7pjgfyn77IPylnYyk1v0rt+hqP2su
         FmMmEN8ywU0qBkmcwjSttEa4yrKHmoSQ09Y0Sy2MsbSywkZoLR4KFW0XakXBM/rKWrNW
         7YjA==
X-Gm-Message-State: ACrzQf0fT8NjFXhUJKcHlEo+i0BZZTywtTttRM25QutE0PxygR+5uj1N
	x6sggtRXDGujEXMBnAeioyMwer6tpey9W0zeRsk=
X-Google-Smtp-Source: AMsMyM6n6qS2ckUIQuoH02c3ULfdda34a5gcwP2kIQFo9nLxGgg0hJSsUCsFKLORU10WTJyx2kOdng==
X-Received: by 2002:a7b:c84f:0:b0:3b4:84c1:1e7 with SMTP id c15-20020a7bc84f000000b003b484c101e7mr21182908wml.12.1665428685365;
        Mon, 10 Oct 2022 12:04:45 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id j38-20020a05600c1c2600b003b3365b38f9sm10753380wms.10.2022.10.10.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:04:44 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH 2/3] staging: rtl8192e: Rename RateAdap...20M, RateAdap...40M, VeryLowRSSI
Date: Mon, 10 Oct 2022 20:04:38 +0100
Message-Id: <20221010190439.13131-3-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010190439.13131-1-dragan.m.cvetic@gmail.com>
References: <20221010190439.13131-1-dragan.m.cvetic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename macros: VeryLowRSSI to VERI_LOW_RSSI,
RateAdaptiveTH_Low_20M to RATE_ADAPTIVE_TH_LOW_20M and
RateAdaptiveTH_Low_40M to RATE_ADAPTIVE_TH_LOW_40M
to avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 10 +++++-----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     |  8 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 3a2e89f6f683..a0d918899392 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -2113,17 +2113,17 @@ bool rtl92e_is_rx_stuck(struct net_device *dev)
 		rx_chk_cnt = 0;
 	} else if ((priv->undecorated_smoothed_pwdb < (RATE_ADAPTIVE_TH_HIGH + 5))
 	  && (((priv->CurrentChannelBW != HT_CHANNEL_WIDTH_20) &&
-	  (priv->undecorated_smoothed_pwdb >= RateAdaptiveTH_Low_40M))
+	  (priv->undecorated_smoothed_pwdb >= RATE_ADAPTIVE_TH_LOW_40M))
 	  || ((priv->CurrentChannelBW == HT_CHANNEL_WIDTH_20) &&
-	  (priv->undecorated_smoothed_pwdb >= RateAdaptiveTH_Low_20M)))) {
+	  (priv->undecorated_smoothed_pwdb >= RATE_ADAPTIVE_TH_LOW_20M)))) {
 		if (rx_chk_cnt < 2)
 			return bStuck;
 		rx_chk_cnt = 0;
 	} else if ((((priv->CurrentChannelBW != HT_CHANNEL_WIDTH_20) &&
-		  (priv->undecorated_smoothed_pwdb < RateAdaptiveTH_Low_40M)) ||
+		  (priv->undecorated_smoothed_pwdb < RATE_ADAPTIVE_TH_LOW_40M)) ||
 		((priv->CurrentChannelBW == HT_CHANNEL_WIDTH_20) &&
-		 (priv->undecorated_smoothed_pwdb < RateAdaptiveTH_Low_20M))) &&
-		priv->undecorated_smoothed_pwdb >= VeryLowRSSI) {
+		 (priv->undecorated_smoothed_pwdb < RATE_ADAPTIVE_TH_LOW_20M))) &&
+		priv->undecorated_smoothed_pwdb >= VERI_LOW_RSSI) {
 		if (rx_chk_cnt < 4)
 			return bStuck;
 		rx_chk_cnt = 0;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index fab427e3597e..c7ce1cab619d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -285,12 +285,12 @@ void rtl92e_init_adaptive_rate(struct net_device *dev)
 
 	pra->ratr_state = DM_RATR_STA_MAX;
 	pra->high2low_rssi_thresh_for_ra = RATE_ADAPTIVE_TH_HIGH;
-	pra->low2high_rssi_thresh_for_ra20M = RateAdaptiveTH_Low_20M+5;
-	pra->low2high_rssi_thresh_for_ra40M = RateAdaptiveTH_Low_40M+5;
+	pra->low2high_rssi_thresh_for_ra20M = RATE_ADAPTIVE_TH_LOW_20M + 5;
+	pra->low2high_rssi_thresh_for_ra40M = RATE_ADAPTIVE_TH_LOW_40M + 5;
 
 	pra->high_rssi_thresh_for_ra = RATE_ADAPTIVE_TH_HIGH + 5;
-	pra->low_rssi_thresh_for_ra20M = RateAdaptiveTH_Low_20M;
-	pra->low_rssi_thresh_for_ra40M = RateAdaptiveTH_Low_40M;
+	pra->low_rssi_thresh_for_ra20M = RATE_ADAPTIVE_TH_LOW_20M;
+	pra->low_rssi_thresh_for_ra40M = RATE_ADAPTIVE_TH_LOW_40M;
 
 	if (priv->CustomerID == RT_CID_819x_Netcore)
 		pra->ping_rssi_enable = 1;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index bf96eb25d808..a643ff5ad597 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -30,9 +30,9 @@
 #define		RX_PATH_SELECTION_DIFF_TH		18
 
 #define		RATE_ADAPTIVE_TH_HIGH			50
-#define		RateAdaptiveTH_Low_20M		30
-#define		RateAdaptiveTH_Low_40M		10
-#define		VeryLowRSSI					15
+#define		RATE_ADAPTIVE_TH_LOW_20M		30
+#define		RATE_ADAPTIVE_TH_LOW_40M		10
+#define		VERI_LOW_RSSI				15
 
 #define		WAIotTHVal						25
 
-- 
2.25.1

