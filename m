Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02363C05
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 15:15:12 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w18so9161882wro.7
        for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Jgkn6OfqAyiEvejOypPSqSRTA/MOiZm5EcEVKn+2uE=;
        b=dbVeY+pFbc93fi6B+PvXj7os/miItIpZVlnucda0Fd2zzyiYAt2TvIePXqEMjSvusf
         QqZ88STDB4oEiMWKyvZECvam0+iJMIz2qSnk7O/ZDmlg93MIsbnpCkkkcCku0HN82yOV
         W3d7KiONyFs058InLsf1aEF3is1wOLkpbxQ3JO4WxQ+DHRwtDD4A88K1JjdnaSYFQ+49
         3Izx3ByU9rss31y0m71cFLsSUKAss5vCrJ4n6bJkVqqaNL7x/7jwi2ATflkLo2fY1Fgo
         D55HhPPdKObHkJUhn4L6DBAUKTXsPrbTH58HAOBhgulI2kKqFDZSUN00ccKKGgXkcC4P
         MBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Jgkn6OfqAyiEvejOypPSqSRTA/MOiZm5EcEVKn+2uE=;
        b=H0Yy4xMas+gyjjeLwcq0vSypJWPnC7/WRmAhQMvB3KXkbGTlL9iRLxR49TsgG7p38T
         Ko5cm/h9hQdRCSQ+FXn9eSFFX/YHo5rTjq849T/Zgo2UM2iqekHi1m5C2ff+gGf6TZhX
         gNkHddRBioGdCBqEqDiH3uqpgSaB52TNR97fiszmU1r3ZnR1BnFUanFTwHi8JRuK4wVH
         ReJ6t0QWDzQrvzeVHVcCWr2NZGcfqDo6QCnigVPxmOhc/TC3b4+yDvgFmugM4OyPi5hG
         ZgJnhMjeJMScwe/te9/fvLkGiZW/9lAnUyWYPPf7x+dEqQAME8aEbkADRQPCr3Tex0ac
         WGLA==
X-Gm-Message-State: ACrzQf2AM/A8A7O0qPmFih093tt9qSwOzykaWWlYokDQh31M69E1PsR9
	Plt4+CrV+3lZ+YktTQRWiPs=
X-Google-Smtp-Source: AMsMyM76AfMy1/i7k6UmUfVSFR/wa+eF52h2NJwOzra8RnbUAKp3Pd8mdgAbyZyptZXcx6PS3xREiQ==
X-Received: by 2002:adf:f501:0:b0:22c:cbea:240a with SMTP id q1-20020adff501000000b0022ccbea240amr16201520wro.78.1666451710929;
        Sat, 22 Oct 2022 08:15:10 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id e14-20020a5d4e8e000000b0023655e51c14sm3802472wru.32.2022.10.22.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 08:15:10 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH v2] staging: rtl8192e: Rename Enable, cck_Rx_path and disabledRF
Date: Sat, 22 Oct 2022 16:15:06 +0100
Message-Id: <20221022151506.63725-1-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Enable to enable, cck_Rx_path to cck_rx_path and
disabledRF to disabled_rf to avoid CamelCase which is not accepted
by checkpatch.

Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
---
v1 -> v2: Rebase to latest version to avoid merge conflicts.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 20 ++++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index c9e495538e2c..4a65868270a4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1722,7 +1722,7 @@ void rtl92e_dm_rf_pathcheck_wq(void *data)
 		else
 			priv->brfpath_rxenable[i] = false;
 	}
-	if (!DM_RxPathSelTable.Enable)
+	if (!DM_RxPathSelTable.enable)
 		return;
 
 	_rtl92e_dm_rx_path_sel_byrssi(dev);
@@ -1733,14 +1733,14 @@ static void _rtl92e_dm_init_rx_path_selection(struct net_device *dev)
 	u8 i;
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	DM_RxPathSelTable.Enable = 1;
+	DM_RxPathSelTable.enable = 1;
 	DM_RxPathSelTable.SS_TH_low = RxPathSelection_SS_TH_low;
 	DM_RxPathSelTable.diff_TH = RxPathSelection_diff_TH;
 	if (priv->CustomerID == RT_CID_819x_Netcore)
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_2;
 	else
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_1;
-	DM_RxPathSelTable.disabledRF = 0;
+	DM_RxPathSelTable.disabled_rf = 0;
 	for (i = 0; i < 4; i++) {
 		DM_RxPathSelTable.rf_rssi[i] = 50;
 		DM_RxPathSelTable.cck_pwdb_sta[i] = -64;
@@ -1771,12 +1771,12 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 		return;
 
 	if (!cck_Rx_Path_initialized) {
-		DM_RxPathSelTable.cck_Rx_path = (rtl92e_readb(dev, 0xa07)&0xf);
+		DM_RxPathSelTable.cck_rx_path = (rtl92e_readb(dev, 0xa07)&0xf);
 		cck_Rx_Path_initialized = 1;
 	}
 
-	DM_RxPathSelTable.disabledRF = 0xf;
-	DM_RxPathSelTable.disabledRF &= ~(rtl92e_readb(dev, 0xc04));
+	DM_RxPathSelTable.disabled_rf = 0xf;
+	DM_RxPathSelTable.disabled_rf &= ~(rtl92e_readb(dev, 0xc04));
 
 	if (priv->rtllib->mode == WIRELESS_MODE_B)
 		DM_RxPathSelTable.cck_method = CCK_Rx_Version_2;
@@ -1923,15 +1923,15 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 	}
 
 	if (update_cck_rx_path) {
-		DM_RxPathSelTable.cck_Rx_path = (cck_default_Rx<<2) |
+		DM_RxPathSelTable.cck_rx_path = (cck_default_Rx<<2) |
 						(cck_optional_Rx);
 		rtl92e_set_bb_reg(dev, rCCK0_AFESetting, 0x0f000000,
-				  DM_RxPathSelTable.cck_Rx_path);
+				  DM_RxPathSelTable.cck_rx_path);
 	}
 
-	if (DM_RxPathSelTable.disabledRF) {
+	if (DM_RxPathSelTable.disabled_rf) {
 		for (i = 0; i < 4; i++) {
-			if ((DM_RxPathSelTable.disabledRF>>i) & 0x1) {
+			if ((DM_RxPathSelTable.disabled_rf>>i) & 0x1) {
 				if (tmp_max_rssi >=
 				    DM_RxPathSelTable.rf_enable_rssi_th[i]) {
 					rtl92e_set_bb_reg(dev,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 1d4d7d98a859..5f210eb375fd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -130,13 +130,13 @@ enum dm_dig_cs_ratio {
 };
 
 struct drx_path_sel {
-	u8		Enable;
+	u8		enable;
 	u8		cck_method;
-	u8		cck_Rx_path;
+	u8		cck_rx_path;
 
 	u8		SS_TH_low;
 	u8		diff_TH;
-	u8		disabledRF;
+	u8		disabled_rf;
 	u8		reserved;
 
 	u8		rf_rssi[4];
-- 
2.25.1

