Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29787470
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:17:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so1245550wmp.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3HK2Y0LG1NQWI87IVm7GfhefNnAh5k+/ABvdKRfjFo=;
        b=cybvnBPiPauEWITYLfCHY0LN8tvTQQ8oQRU/yu3Of6VFsWKxn2GkiepP66EasbFI9S
         qbU/ouqaXYlke0hCL65o9zSlZew5gpsxaIF9aEz7GCyU8iGNuHRBIZhyz/izEf4lnauV
         HaibjChZSUxHY9oq35PHl0PTcQnZqZD0R5CeOiWgM9KUI8bLTe0zdLhFzj64OHzixZKK
         KIYpuWR50vzFJdQBYJmCY8Y1kbTpcZ95TElmVxy1aiJCNkkPInoSD9Qpu9kepg2d4AW8
         0XlbTEbCc2QWMJ12sXj/QDuP+JZeC2S8gEa/DJ9jZx0U/4+ETuOqj+26UgBoiUq4et21
         PgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3HK2Y0LG1NQWI87IVm7GfhefNnAh5k+/ABvdKRfjFo=;
        b=PwiF6VYCP9QQ0iGuLJGF7ZLj2gLkP2U6KK4OBNaPPl6OmFWJb3LF2H6C5LM2Yjd/iZ
         DVU3GBDcaQONwBbDRcLOjNjUXojVcdqzgeJTz/HTWyPliG8X4c6u+8jOe09+AIT7PHiw
         IPkR77Z1eYxMBpkNkhnDsy+gUgHgl2FWa+V4HJmt93wWPAGb0Ek54z6xqROVF+whwdtw
         BcPBxw0CcfbvJLlEyOYwdtQ1pfdOgS88KENFl1gEV7iCdx8/Axn2I7/NBxY2Gmjo41yG
         5Dd77/sBWDA4LV2iDLCkbSW5E3Bjvhh+eZlTbJftANq9kzfFvbEzblz7IdMSUhdMMtvv
         ob2w==
X-Gm-Message-State: AO0yUKXsrmZkKkDBZC2464zpxwVCjGXU3mQlkMOXeVt902O/Pe9k5QaQ
	DpvLwRM2a4hVUn6u/jozK9A=
X-Google-Smtp-Source: AK7set/hLQGnN/cGBokuzI5GR+W4Po7BVsvAJa0drsRzFUBUzNoROTd6D/YtyAvTwRebk3BMsH/xFQ==
X-Received: by 2002:a05:600c:3106:b0:3dd:1cd3:5d75 with SMTP id g6-20020a05600c310600b003dd1cd35d75mr4899140wmo.0.1675793837184;
        Tue, 07 Feb 2023 10:17:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c44c900b003dc4fd6e624sm7726803wmo.19.2023.02.07.10.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:17:16 -0800 (PST)
Date: Tue, 7 Feb 2023 19:17:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Rename diff_TH and disabledRF
Message-ID: <2b95586ed460f90c98721a429aced1ffaf258e49.1675792435.git.philipp.g.hortmann@gmail.com>
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

Rename variables diff_TH to diff_th and disabledRF to disabled_rf to
avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 5e9a0e9653de..911cfecd50cb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1733,12 +1733,12 @@ static void _rtl92e_dm_init_rx_path_selection(struct net_device *dev)
 
 	DM_RxPathSelTable.enable = 1;
 	DM_RxPathSelTable.ss_th_low = RX_PATH_SEL_SS_TH_LOW;
-	DM_RxPathSelTable.diff_TH = RX_PATH_SEL_DIFF_TH;
+	DM_RxPathSelTable.diff_th = RX_PATH_SEL_DIFF_TH;
 	if (priv->customer_id == RT_CID_819X_NETCORE)
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_2;
 	else
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_1;
-	DM_RxPathSelTable.disabledRF = 0;
+	DM_RxPathSelTable.disabled_rf = 0;
 	for (i = 0; i < 4; i++) {
 		DM_RxPathSelTable.rf_rssi[i] = 50;
 		DM_RxPathSelTable.cck_pwdb_sta[i] = -64;
@@ -1773,8 +1773,8 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 		cck_Rx_Path_initialized = 1;
 	}
 
-	DM_RxPathSelTable.disabledRF = 0xf;
-	DM_RxPathSelTable.disabledRF &= ~(rtl92e_readb(dev, 0xc04));
+	DM_RxPathSelTable.disabled_rf = 0xf;
+	DM_RxPathSelTable.disabled_rf &= ~(rtl92e_readb(dev, 0xc04));
 
 	if (priv->rtllib->mode == WIRELESS_MODE_B)
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_2;
@@ -1903,7 +1903,7 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 
 	if (tmp_min_rssi < DM_RxPathSelTable.ss_th_low && disabled_rf_cnt < 2) {
 		if ((tmp_max_rssi - tmp_min_rssi) >=
-		     DM_RxPathSelTable.diff_TH) {
+		     DM_RxPathSelTable.diff_th) {
 			DM_RxPathSelTable.rf_enable_rssi_th[min_rssi_index] =
 				 tmp_max_rssi+5;
 			rtl92e_set_bb_reg(dev, rOFDM0_TRxPathEnable,
@@ -1927,9 +1927,9 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 				  DM_RxPathSelTable.cck_rx_path);
 	}
 
-	if (DM_RxPathSelTable.disabledRF) {
+	if (DM_RxPathSelTable.disabled_rf) {
 		for (i = 0; i < 4; i++) {
-			if ((DM_RxPathSelTable.disabledRF>>i) & 0x1) {
+			if ((DM_RxPathSelTable.disabled_rf >> i) & 0x1) {
 				if (tmp_max_rssi >=
 				    DM_RxPathSelTable.rf_enable_rssi_th[i]) {
 					rtl92e_set_bb_reg(dev,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index a9fa984c25ac..1c2eb7ac52ce 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -130,8 +130,8 @@ struct drx_path_sel {
 	u8		cck_rx_path;
 
 	u8		ss_th_low;
-	u8		diff_TH;
-	u8		disabledRF;
+	u8		diff_th;
+	u8		disabled_rf;
 	u8		reserved;
 
 	u8		rf_rssi[4];
-- 
2.39.1

