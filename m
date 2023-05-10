Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE314AB8
	for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 15:09:31 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64115e652eeso50937728b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683731371; x=1686323371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g/+U69i+oXYARFhfnLN9Kpm6lIKqslW4ET+ngsmdlTA=;
        b=m6+LJ+C98J+VMJZwyIS8bNLITH3vIYwmhU76QbeV60Ni9XrJdFPl24ysp0a9SJHXrN
         ttDHsECNj0XpoY8AhZaOfD1Gct0yfoADGWc/60E8uvTEQpjkI0dhA6K0gv4XlflnvxjJ
         6xb8XyfIuEEm9jJ40iso744+nePhMxLkUJrYSgPaVKQDvCz0fMx7xQhil78gq0HtkDy0
         VXwemSTb0P1JG1L+ZzZNFYR5kfq1Igvaik+go+FYAzx0ZQus7aoUdhdcZSqtd7Zg9Szp
         GIMC8Su1WaOnPew8TBgKO5kkjWcGaUkZvvu3dWA6Brg81kYdHWQt6D+NyZ0RO16VOttJ
         +6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683731371; x=1686323371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/+U69i+oXYARFhfnLN9Kpm6lIKqslW4ET+ngsmdlTA=;
        b=Uv0LLPWljwJW7bTIhC5y3Md3OYMtqV3AFkAW+g2ex0ox/DX6OyHAak8YTBJu+/FLXJ
         5ME3jAx5wNeBQqtFpm/HUXnIFtTEg7gjV3uRAHnW4AIM6oT1tN99yP2reX5k4GsalFsw
         n2euM0/SfC2HiysFDOHHCkYiR5aweqyg7vSHUMSowwGdfF+MSfHzF2Xn/9P9WHzcKDnN
         ARNtu6NSc9y8baLtP50YtcVlkAaCbd27pSU+pvxxO9+hQA75tdigGbK8ABDwh0l/EKYU
         8+q2ze47NlXBYnbtEivk1hanwgzrxUS2SqL1JxeWjAtcwIgdR0N2yIWLnVLIGg2d4skE
         hbQA==
X-Gm-Message-State: AC+VfDw93nSDqVGeqnmb8NAONgTAUbsoRaT1WGLlC8yaVzft4rGkGmux
	vbaJmzOF6CEpopIGrvZ+v0rCgdULQhA=
X-Google-Smtp-Source: ACHHUZ43znpN4GPGFdQLAMPHvVbbEvcH4cZz8x4AHB+vSapQoQWLDQThNumZ5hWAcMFZ0FlWB58xvw==
X-Received: by 2002:a17:90a:db07:b0:250:50c5:cabc with SMTP id g7-20020a17090adb0700b0025050c5cabcmr16937872pjv.3.1683731370599;
        Wed, 10 May 2023 08:09:30 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090ad14f00b0024b6a90741esm13456870pjw.49.2023.05.10.08.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:09:30 -0700 (PDT)
Date: Wed, 10 May 2023 20:39:25 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8192e: Rename tmpOFDMindex and tmpCCKindex
Message-ID: <48098479094e4562fe196cbce813476041a664df.1683730854.git.yogi.kernel@gmail.com>
References: <cover.1683730854.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683730854.git.yogi.kernel@gmail.com>

Rename variable tmpOFDMindex to tmp_ofdm_index and
tmpCCKindex to tmp_cck_index to avoid CamelCase which
is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index af136abc595c..117c0538cf5f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -658,7 +658,7 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 #define ThermalMeterVal	9
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u32 tmp_reg, tmp_cck;
-	u8 tmpOFDMindex, tmpCCKindex, tmpCCK20Mindex, tmpCCK40Mindex, tmpval;
+	u8 tmp_ofdm_index, tmp_cck_index, tmpCCK20Mindex, tmpCCK40Mindex, tmpval;
 	int i = 0, CCKSwingNeedUpdate = 0;
 
 	if (!priv->tx_pwr_tracking_init) {
@@ -689,11 +689,11 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 	priv->thermal_meter[1] = ThermalMeterVal;
 
 	if (priv->thermal_meter[0] >= (u8)tmp_reg) {
-		tmpOFDMindex = tmpCCK20Mindex = 6+(priv->thermal_meter[0] -
+		tmp_ofdm_index = tmpCCK20Mindex = 6+(priv->thermal_meter[0] -
 			      (u8)tmp_reg);
 		tmpCCK40Mindex = tmpCCK20Mindex - 6;
-		if (tmpOFDMindex >= OFDM_TABLE_LEN)
-			tmpOFDMindex = OFDM_TABLE_LEN - 1;
+		if (tmp_ofdm_index >= OFDM_TABLE_LEN)
+			tmp_ofdm_index = OFDM_TABLE_LEN - 1;
 		if (tmpCCK20Mindex >= CCK_TABLE_LEN)
 			tmpCCK20Mindex = CCK_TABLE_LEN - 1;
 		if (tmpCCK40Mindex >= CCK_TABLE_LEN)
@@ -701,18 +701,18 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 	} else {
 		tmpval = (u8)tmp_reg - priv->thermal_meter[0];
 		if (tmpval >= 6) {
-			tmpOFDMindex = 0;
+			tmp_ofdm_index = 0;
 			tmpCCK20Mindex = 0;
 		} else {
-			tmpOFDMindex = 6 - tmpval;
+			tmp_ofdm_index = 6 - tmpval;
 			tmpCCK20Mindex = 6 - tmpval;
 		}
 		tmpCCK40Mindex = 0;
 	}
 	if (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20)
-		tmpCCKindex = tmpCCK40Mindex;
+		tmp_cck_index = tmpCCK40Mindex;
 	else
-		tmpCCKindex = tmpCCK20Mindex;
+		tmp_cck_index = tmpCCK20Mindex;
 
 	priv->rec_cck_20m_idx = tmpCCK20Mindex;
 	priv->rec_cck_40m_idx = tmpCCK40Mindex;
@@ -727,15 +727,15 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 		CCKSwingNeedUpdate = 1;
 	}
 
-	if (priv->cck_index != tmpCCKindex) {
-		priv->cck_index = tmpCCKindex;
+	if (priv->cck_index != tmp_cck_index) {
+		priv->cck_index = tmp_cck_index;
 		CCKSwingNeedUpdate = 1;
 	}
 
 	if (CCKSwingNeedUpdate)
 		rtl92e_dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
-	if (priv->ofdm_index[0] != tmpOFDMindex) {
-		priv->ofdm_index[0] = tmpOFDMindex;
+	if (priv->ofdm_index[0] != tmp_ofdm_index) {
+		priv->ofdm_index[0] = tmp_ofdm_index;
 		rtl92e_set_bb_reg(dev, rOFDM0_XATxIQImbalance, bMaskDWord,
 				  OFDMSwingTable[priv->ofdm_index[0]]);
 	}
-- 
2.34.1

