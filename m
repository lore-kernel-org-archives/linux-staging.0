Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91815C84
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 19:05:05 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id f11so18366170wrm.6
        for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 12:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u66d4gjKNtms7xvlqoMK63zmLP+C7g2LDeJcUhLQ22I=;
        b=qxvWQGFsTkFf1HLFF466+XdlCHjrAmLwknkZdc0PpSAcvXVh3lVvnLBSx5TyJ4ok3i
         JZhbl9FOR7etysuSnHyEOv8/Y4HGx9W6RMvhCcgqijXq4HlmDsMOuLHPlFF7NLhcXx58
         +bs/vR8Rgvi5932Tra6oCDdmsF2M4P/bmlXrmkameBj37UpbMj7yv+4Id61aZF9U5Lao
         l06VZbvAmZ843CI+x6H9aA1d46aIc8QR6wMZBpHes0ygvovGwN9mBV1kzWVEbYehCG89
         gPkqqQt7G1zYyIsol9eFl2xg9C3Puc/2hK7D5mUHJc8IRUf4np15qYfCK+9BH2j3sigR
         S90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u66d4gjKNtms7xvlqoMK63zmLP+C7g2LDeJcUhLQ22I=;
        b=qX9tWSTCxLOQRSq5YWdrMJAPN3diEBWMGU6pIOKfb57F7WKqUv3w2jlooXXKiATHgC
         m90JObIpLrVUBtC2hTjHxvuXdSvBjFovwCfJnthiGBfel2QlAqX1H9BYxVGK9lFOvlNY
         OnYoyAct6fYbIuHhcwty6aG7akAqOAv4xxJw6lMGa0HTP+0d2Ihh+e7vLeuU/+Aw6iVj
         qyusaHuXB4Y4Tc6S73vPCC6BQCbbMstI4TyZLjmc+DdRul16y2TW6PqMmv2N9IrH1x7p
         JMYpkJJtvorV/R2KR3GDIJBX/z6pbn+GOA48ALH/btwbrJByj4oJIWTNu73quRewXWSg
         4UVA==
X-Gm-Message-State: ACrzQf3dqzz2D53fxTPUZA5EkT7fgZVjJTRKKpJcWDKKd5B4PZc1XQRG
	lf+9m88k+QE5Vgr8VpQWvnI=
X-Google-Smtp-Source: AMsMyM4wEdUgFERfkLq6ZOeJTZJg8U9/PRvCi1Fh7U3Id5WTJilJyt+Up+119YlMa44ktQawR7G8mg==
X-Received: by 2002:adf:c713:0:b0:22a:3670:b08d with SMTP id k19-20020adfc713000000b0022a3670b08dmr12602132wrg.175.1665428704060;
        Mon, 10 Oct 2022 12:05:04 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id i29-20020a1c541d000000b003c41144b3cfsm8650140wmb.20.2022.10.10.12.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:05:03 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH 2/3] staging: rtl8192e: Rename Enable, cck_Rx_path and disabledRF
Date: Mon, 10 Oct 2022 20:04:56 +0100
Message-Id: <20221010190457.13199-3-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
References: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
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
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 20 ++++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 3e7affb3f812..24d97bd5f821 100644
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
 	DM_RxPathSelTable.SS_TH_low = RX_PATH_SELECTION_SS_TH_LOW;
 	DM_RxPathSelTable.diff_TH = RX_PATH_SELECTION_DIFF_TH;
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
index daabe21da5b7..4eabc313d71e 100644
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

