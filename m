Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0DC7470
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:16:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so1433617wms.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=doEhSZ1ZWSbiqK6262/Gppr2vN+zJ+4OHWK0fM/t0m4=;
        b=qAxhseizMgzVK8VNabQYUHFA3ziy/vYcvzH8KWSUsaUo3DYLl1shUNE+sr+2fzRmH7
         KYKS4lnpBTjhYII9b/fK1L/Aemdod+1Gm9WSIp0/96YUkbM3r5hSxXBqF9ed4GblzWLa
         panLNSe+F53DdZQ0jltsFTUhbXyDPlygRpi3twccEV9tF5ChjncnM25l7/P0CvsBeqL3
         vbySATfC57/aO5KHGy8ghTZsVtravMlSGaCE+FQS7Pdm7fjUEWVvlOwITmEbx2Ntl6I4
         MPIex30S99clE+DnLpMHvGEfp5HBYbn7+8u87USQuIFLf58VQewbklnaPiiO2razeOE8
         3gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doEhSZ1ZWSbiqK6262/Gppr2vN+zJ+4OHWK0fM/t0m4=;
        b=dUv+mntWVK/him5GzzKjnU2LkkIZjuNFoqMS1Mp9ZHet8GiJRyPgw3xzKO2OYUtAA+
         0lQZ7An0HBpxJKUp7QxsY6FTtZe/m1+Pj6eSW3nU8PtKGu3xgL8FTqNBFIQXas6pwxId
         Lud1oB5lG9ZLLuPCpimm0ExOhMAJQ/c96SR31qzmyX+z8WhX5BM+UZlF8H3Z856BefFr
         gg7IsxFbRcKxKmlhJkFgZ792nbiHjanF0mUb44zUf4mQudH47aUItdlm3SOfC2p5mNFt
         iomAUSSWn8+G6j/ovniZEwVpnhsYkW1K9TyQkmT9Excp5MA4oqkOLwZe1GDJpFUECH/w
         wVFw==
X-Gm-Message-State: AO0yUKUuxo9lmze7hP+t3ZsO1mpTNNDM1U1n2wU0PItuMwr7Fve4F3s7
	a0hznAHFE0+WTq30ixEA2Gg=
X-Google-Smtp-Source: AK7set9Nz/9NyyHVkS+wJWMskZhfFaxuUgxeV0zGY79BnbchMKm3M1HjI23WwasptuaSS2XNOR8SEg==
X-Received: by 2002:a05:600c:3b9d:b0:3dc:54da:ba3e with SMTP id n29-20020a05600c3b9d00b003dc54daba3emr4837964wms.3.1675793815912;
        Tue, 07 Feb 2023 10:16:55 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d650e000000b002c3f0e94e94sm3019066wru.14.2023.02.07.10.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:16:55 -0800 (PST)
Date: Tue, 7 Feb 2023 19:16:53 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Rename RxPathSelectio..,
 RateAdaptive.. and RateAdap..
Message-ID: <3fb44a7f8020b898d3f589f16e9be4f555aa9e1e.1675792435.git.philipp.g.hortmann@gmail.com>
References: <cover.1675792435.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675792435.git.philipp.g.hortmann@gmail.com>

Rename constants RxPathSelection_diff_TH to RX_PATH_SEL_DIFF_TH,
RateAdaptiveTH_High to RATE_ADAPTIVE_TH_HIGH and RateAdaptiveTH_Low_20M
to RATE_ADAPTIVE_TH_LOW_20M to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  8 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 10 +++++-----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index a2587300a47a..7e445a168daa 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -2017,20 +2017,20 @@ bool rtl92e_is_rx_stuck(struct net_device *dev)
 	u8		SilentResetRxSoltNum = 4;
 
 	rx_chk_cnt++;
-	if (priv->undecorated_smoothed_pwdb >= (RateAdaptiveTH_High+5)) {
+	if (priv->undecorated_smoothed_pwdb >= (RATE_ADAPTIVE_TH_HIGH + 5)) {
 		rx_chk_cnt = 0;
-	} else if ((priv->undecorated_smoothed_pwdb < (RateAdaptiveTH_High + 5))
+	} else if ((priv->undecorated_smoothed_pwdb < (RATE_ADAPTIVE_TH_HIGH + 5))
 	  && (((priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) &&
 	  (priv->undecorated_smoothed_pwdb >= RateAdaptiveTH_Low_40M))
 	  || ((priv->current_chnl_bw == HT_CHANNEL_WIDTH_20) &&
-	  (priv->undecorated_smoothed_pwdb >= RateAdaptiveTH_Low_20M)))) {
+	  (priv->undecorated_smoothed_pwdb >= RATE_ADAPTIVE_TH_LOW_20M)))) {
 		if (rx_chk_cnt < 2)
 			return bStuck;
 		rx_chk_cnt = 0;
 	} else if ((((priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) &&
 		  (priv->undecorated_smoothed_pwdb < RateAdaptiveTH_Low_40M)) ||
 		((priv->current_chnl_bw == HT_CHANNEL_WIDTH_20) &&
-		 (priv->undecorated_smoothed_pwdb < RateAdaptiveTH_Low_20M))) &&
+		 (priv->undecorated_smoothed_pwdb < RATE_ADAPTIVE_TH_LOW_20M))) &&
 		priv->undecorated_smoothed_pwdb >= VeryLowRSSI) {
 		if (rx_chk_cnt < 4)
 			return bStuck;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 40e6194c6687..739f7c512831 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -282,12 +282,12 @@ void rtl92e_init_adaptive_rate(struct net_device *dev)
 	struct rate_adaptive *pra = &priv->rate_adaptive;
 
 	pra->ratr_state = DM_RATR_STA_MAX;
-	pra->high2low_rssi_thresh_for_ra = RateAdaptiveTH_High;
-	pra->low2high_rssi_thresh_for_ra20M = RateAdaptiveTH_Low_20M+5;
+	pra->high2low_rssi_thresh_for_ra = RATE_ADAPTIVE_TH_HIGH;
+	pra->low2high_rssi_thresh_for_ra20M = RATE_ADAPTIVE_TH_LOW_20M + 5;
 	pra->low2high_rssi_thresh_for_ra40M = RateAdaptiveTH_Low_40M+5;
 
-	pra->high_rssi_thresh_for_ra = RateAdaptiveTH_High+5;
-	pra->low_rssi_thresh_for_ra20M = RateAdaptiveTH_Low_20M;
+	pra->high_rssi_thresh_for_ra = RATE_ADAPTIVE_TH_HIGH + 5;
+	pra->low_rssi_thresh_for_ra20M = RATE_ADAPTIVE_TH_LOW_20M;
 	pra->low_rssi_thresh_for_ra40M = RateAdaptiveTH_Low_40M;
 
 	if (priv->customer_id == RT_CID_819X_NETCORE)
@@ -1733,7 +1733,7 @@ static void _rtl92e_dm_init_rx_path_selection(struct net_device *dev)
 
 	DM_RxPathSelTable.Enable = 1;
 	DM_RxPathSelTable.SS_TH_low = RX_PATH_SEL_SS_TH_LOW;
-	DM_RxPathSelTable.diff_TH = RxPathSelection_diff_TH;
+	DM_RxPathSelTable.diff_TH = RX_PATH_SEL_DIFF_TH;
 	if (priv->customer_id == RT_CID_819X_NETCORE)
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_2;
 	else
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index c41490850713..ea698e894146 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -26,10 +26,10 @@
 #define		DM_DIG_MIN_Netcore			0x12
 
 #define		RX_PATH_SEL_SS_TH_LOW			30
-#define		RxPathSelection_diff_TH			18
+#define		RX_PATH_SEL_DIFF_TH			18
 
-#define		RateAdaptiveTH_High			50
-#define		RateAdaptiveTH_Low_20M		30
+#define		RATE_ADAPTIVE_TH_HIGH			50
+#define		RATE_ADAPTIVE_TH_LOW_20M		30
 #define		RateAdaptiveTH_Low_40M		10
 #define		VeryLowRSSI					15
 
-- 
2.39.1

