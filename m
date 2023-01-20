Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA3613A
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 20:18:16 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b7so5838970wrt.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 12:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+SU2+uXQhTiSFcXfZwoK7cDeG3Nmwib98E2dexqroc=;
        b=A9/0gWrlgCXVEsXeV6JMFbxrkJYkZxNM5SRAIdCqtCkLkm/1IFj3dafc1ZTFwYLWsV
         kdnV02KU0u7tl8r1Aa1WUXqyKSslcmQHna3IMvCAJW/b4+RHOeEpdMMKTnFeDS0McaDb
         QVe5t+nJ95nElVUjEhmn+mGiig3Pz1iYg1LZBTsXbPlTun1AEcTbeelTc+mlVv3J6PYB
         +kUM89ghduEliDUtPJdufn2/tvVZiHLYCKEV2tuaka5sT9B3D2jr1Hr50JPCBReGPIJ0
         dhbLFaSZ7cHFN9tvrIDP4lHiJygBiXV7uq/6dvy0tC9bdZadIT5rLdnDIq3ipppbxnmN
         J+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+SU2+uXQhTiSFcXfZwoK7cDeG3Nmwib98E2dexqroc=;
        b=j1WZbmxJXnvETJebAULz/p6AUEZt1HKAd2mwApsLAqeANFxro/ZIJ/tpJjZ2DyFYyY
         Lw54zSGivxnY3Iy14XhTXuwbHiIgm+B4l/93zlZ3ZO5Tt8s97P5yRfiHNGRPYbPUXEoS
         2rLHFj09SbA81sXNpufCcOOLt6HPqP9sb5XUWKtzJ+Ij5salfq946aELC7zkr53xSZt3
         ymctog9I3+l/Ow0Ayqp/T74u7Ew+8nkaz2qOYgn5FEkuwTPt9MSXZYnUkRGBhLFdFPRW
         WnayMlPhx/8sX0fRkqY98rQL+3RVNt2gKfETgQLUFM37kh1UV5ULYU0FCNrZS3QQmKw1
         JWQA==
X-Gm-Message-State: AFqh2koru4I2ArCyimHGV9TlXGU86lzlgIgz2frZIWlri9lCVWJWVPGP
	gQMYkxh9yxtbFolXLRnHF1s=
X-Google-Smtp-Source: AMrXdXtbJIi/QXUNGmcHN7kUdo7IWKChMeDCRQmR1o7GPsQRUxAbsF1DyEU+WOPme+Qd6MTMIqzU7A==
X-Received: by 2002:adf:fa4e:0:b0:2bd:e8bd:79c7 with SMTP id y14-20020adffa4e000000b002bde8bd79c7mr2464032wrr.1.1674245894734;
        Fri, 20 Jan 2023 12:18:14 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bdbde1d3absm827528wrs.78.2023.01.20.12.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 12:18:14 -0800 (PST)
Date: Fri, 20 Jan 2023 21:18:12 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: rtl8192e: Remove zeroed arrays
 tx_pwr_level_cck_a and friends
Message-ID: <b88e6bdd5569ac651692074060fba6f79c68c687.1674244819.git.philipp.g.hortmann@gmail.com>
References: <cover.1674244819.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674244819.git.philipp.g.hortmann@gmail.com>

The arrays tx_pwr_level_cck_a, tx_pwr_level_ofdm_24g_a,
tx_pwr_level_cck_c and tx_pwr_level_ofdm_24g_c are initialized to zero
and never changed. Delete the upper named arrays and set the variables
directly to zero to avoid useless code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  7 -------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 11 +++++------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  4 ----
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index fdf37c56066c..b721bb72007d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -425,13 +425,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			priv->thermal_meter[1] = (priv->eeprom_thermal_meter &
 						     0xf0) >> 4;
 		} else if (priv->epromtype == EEPROM_93C56) {
-
-			for (i = 0; i < 14; i++) {
-				priv->tx_pwr_level_cck_a[i] = 0;
-				priv->tx_pwr_level_ofdm_24g_a[i] = 0;
-				priv->tx_pwr_level_cck_c[i] = 0;
-				priv->tx_pwr_level_ofdm_24g_c[i] = 0;
-			}
 			priv->legacy_ht_tx_pwr_diff =
 				 priv->eeprom_legacy_ht_tx_pwr_diff;
 			priv->antenna_tx_pwr_diff[0] = 0;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index ff66a97b8763..33e3435b50b2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -594,14 +594,13 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 		powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g[channel - 1];
 	} else if (priv->epromtype == EEPROM_93C56) {
 		if (priv->rf_type == RF_1T2R) {
-			powerlevel = priv->tx_pwr_level_cck_c[channel - 1];
-			powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g_c[channel - 1];
+			powerlevel = 0;
+			powerlevelOFDM24G = 0;
 		} else if (priv->rf_type == RF_2T4R) {
-			powerlevel = priv->tx_pwr_level_cck_a[channel - 1];
-			powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g_a[channel - 1];
+			powerlevel = 0;
+			powerlevelOFDM24G = 0;
 
-			ant_pwr_diff = priv->tx_pwr_level_ofdm_24g_c[channel - 1]
-				       - priv->tx_pwr_level_ofdm_24g_a[channel - 1];
+			ant_pwr_diff = 0;
 
 			ant_pwr_diff &= 0xf;
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 596693fbee4c..59049ad349e0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -464,11 +464,7 @@ struct r8192_priv {
 
 	u32 mcs_tx_pwr_level_org_offset[6];
 	u8 tx_pwr_level_cck[14];
-	u8 tx_pwr_level_cck_a[14];
-	u8 tx_pwr_level_cck_c[14];
 	u8 tx_pwr_level_ofdm_24g[14];
-	u8 tx_pwr_level_ofdm_24g_a[14];
-	u8 tx_pwr_level_ofdm_24g_c[14];
 	u8 legacy_ht_tx_pwr_diff;
 	u8 antenna_tx_pwr_diff[3];
 
-- 
2.39.0

