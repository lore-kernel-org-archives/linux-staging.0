Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0F87470
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:17:11 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so12184792wms.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i70DTnDEYlAPFNMlsy77ER5Ex4KrEjMwWGefFgQrQXI=;
        b=PyWvU7nUk2rGi22Zc5hlgfbaq38OGk+lrbZrXef06Pf0n283Ees61QTioCzRNMmVYC
         vUtQPFICskJtu5vnsMbQMLg2ESOyNUL/PR2DUpPSpBUVjzuM+WL58n93hjUMkS+q1QP5
         QMHj43kBMyTnWJ1GlEk1a9g/KspmfdQoVOSC+QkNfAo0AD77SsjmzdO4bhncJvZDyLBP
         hLfQRG/RcyY6lENvAfBFCWr4N5h+hqj1VB+b/P7biV+1QOAZoYM5Xys4mYdsuT3Mregp
         PTnAEd0Up2WigfNhHVTWE2mDGTMUSibYk61cgAfhMuNm3M1gBK29MI5v+/6QWsNKSXIt
         4ITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i70DTnDEYlAPFNMlsy77ER5Ex4KrEjMwWGefFgQrQXI=;
        b=wN4KEC7dur4SjkaxNdShwyXY5E9iIsUGyxCMsUND41Fabqgg2XNHDDzcMjZKIirw1P
         WwwMF+IfKpM+8uddHfg1tXLl7kCgk0sx3U3yPAUos0unKoK1sV8stLdKdmZH1ghxC+s2
         CPE1vQzGbXxKSBQ22ngEiqes9hq/Uepj0WLVySffS4lflPdrR5Vs7tknEGB+rj5smzAL
         MfQDgFComxfwiuIwX1lUTTLTp1Cwtc80iDqO3ulyP53aISRHOK/yGdjsgSIXg+/nNMPN
         eXLSKwD/DGIP6YeSmmfC4rUx+YwQnFfb2H01/2saGVnwWD31EpY/tAobECTHObkiudkd
         VMuA==
X-Gm-Message-State: AO0yUKXqovy7grz2WxQTF/vawC4Yx5RNSpJCYar+bk8e8nfDZol7Qv56
	azzCxOQ/RwI5Ss88E+bRUE8=
X-Google-Smtp-Source: AK7set8tFu75GALUJtIt9nqTGUR3s1qDUrafgpvKFIxSk1/S4omOLfCGJh0pNgB8HYq/UUo1h7gdCw==
X-Received: by 2002:a05:600c:1d06:b0:3db:2063:425e with SMTP id l6-20020a05600c1d0600b003db2063425emr4689402wms.1.1675793829439;
        Tue, 07 Feb 2023 10:17:09 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003de77597f16sm15428928wmo.21.2023.02.07.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:17:08 -0800 (PST)
Date: Tue, 7 Feb 2023 19:17:07 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Rename Enable, cck_Rx_path and
 SS_TH_low
Message-ID: <740487e2fd8b98bfcaa8af2e398b9aa7e320fef8.1675792435.git.philipp.g.hortmann@gmail.com>
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

Rename variables Enable to enable, cck_Rx_path to cck_rx_path and
SS_TH_low to ss_th_low to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 55e03eaf9219..5e9a0e9653de 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1720,7 +1720,7 @@ void rtl92e_dm_rf_pathcheck_wq(void *data)
 		else
 			priv->brfpath_rxenable[i] = false;
 	}
-	if (!DM_RxPathSelTable.Enable)
+	if (!DM_RxPathSelTable.enable)
 		return;
 
 	_rtl92e_dm_rx_path_sel_byrssi(dev);
@@ -1731,8 +1731,8 @@ static void _rtl92e_dm_init_rx_path_selection(struct net_device *dev)
 	u8 i;
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	DM_RxPathSelTable.Enable = 1;
-	DM_RxPathSelTable.SS_TH_low = RX_PATH_SEL_SS_TH_LOW;
+	DM_RxPathSelTable.enable = 1;
+	DM_RxPathSelTable.ss_th_low = RX_PATH_SEL_SS_TH_LOW;
 	DM_RxPathSelTable.diff_TH = RX_PATH_SEL_DIFF_TH;
 	if (priv->customer_id == RT_CID_819X_NETCORE)
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_2;
@@ -1769,7 +1769,7 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 		return;
 
 	if (!cck_Rx_Path_initialized) {
-		DM_RxPathSelTable.cck_Rx_path = (rtl92e_readb(dev, 0xa07)&0xf);
+		DM_RxPathSelTable.cck_rx_path = (rtl92e_readb(dev, 0xa07)&0xf);
 		cck_Rx_Path_initialized = 1;
 	}
 
@@ -1901,7 +1901,7 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 			update_cck_rx_path = 1;
 	}
 
-	if (tmp_min_rssi < DM_RxPathSelTable.SS_TH_low && disabled_rf_cnt < 2) {
+	if (tmp_min_rssi < DM_RxPathSelTable.ss_th_low && disabled_rf_cnt < 2) {
 		if ((tmp_max_rssi - tmp_min_rssi) >=
 		     DM_RxPathSelTable.diff_TH) {
 			DM_RxPathSelTable.rf_enable_rssi_th[min_rssi_index] =
@@ -1921,10 +1921,10 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 	}
 
 	if (update_cck_rx_path) {
-		DM_RxPathSelTable.cck_Rx_path = (cck_default_Rx<<2) |
+		DM_RxPathSelTable.cck_rx_path = (cck_default_Rx<<2) |
 						(cck_optional_Rx);
 		rtl92e_set_bb_reg(dev, rCCK0_AFESetting, 0x0f000000,
-				  DM_RxPathSelTable.cck_Rx_path);
+				  DM_RxPathSelTable.cck_rx_path);
 	}
 
 	if (DM_RxPathSelTable.disabledRF) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 86974abea19c..a9fa984c25ac 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -125,11 +125,11 @@ enum dm_dig_cs_ratio {
 };
 
 struct drx_path_sel {
-	u8		Enable;
+	u8		enable;
 	u8		cck_method;
-	u8		cck_Rx_path;
+	u8		cck_rx_path;
 
-	u8		SS_TH_low;
+	u8		ss_th_low;
 	u8		diff_TH;
 	u8		disabledRF;
 	u8		reserved;
-- 
2.39.1

