Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F749467
	for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 13:56:53 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-98282432cfdso46823966b.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687010212; x=1689602212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyvbzIni4wgZcmkEUFqYkqtBiqFXP5/UM0SCkXhdxz4=;
        b=S4ZD5v1sudtTnq74OafYco/0ZajVLhBI0w7gMovgBWVI8v67SC+HvybiUrx9Rlpofk
         Oa3aVFdFlI0MurUEp2+gw0NgVJASVn4qu57mrdsWOfxTHs64Zx14UVzXcESRG3Cwt1xj
         YELJXg6cM+ChmvlYehcJqBe2F4bV5JeDZMYJ6YKlzoqmFwRA4i1oNQB6fjj5rZocPfl/
         O3c3679Hc1f6oSvpJnOD6PGgq0w3Y2s2YO7v3myIUjC7Bq7ScnRvCi4CrHIPFgm0rcgV
         vtWiBtkbduqW3lMdshDrn/ww8A/YK8U/i3/z7X1V1jsLa1hoCsI0v5FUNs5UmS4Bwim3
         QtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687010212; x=1689602212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyvbzIni4wgZcmkEUFqYkqtBiqFXP5/UM0SCkXhdxz4=;
        b=IwQjFKXHsOxIdopYFsjcFCs1SKxN3onVYnqJL/JPu9VO3xICu8tUVc2cBRPRYt6TlD
         b5Epp0XRRJ6CFb7MCNyInP4WMRfysPUAG2r2DxFOFsHsWh9FuUFHk//hUIBzRBy20x1Y
         bTZTIRV2v3xH/h/kM6Kd2dO9O1YnZad7/yxZCJ26QmUaS+MARi4sUunp3WsaZfB9JJHe
         E90eEOltNQv+DxtitbFNHtWWoklurdt4XlUPx2uef7Od3G6dLx947ft72fp6FCIynd9f
         P3wcFzWpTkCGB6Q7yYhC/NnWqBfw3eJoxICNJz7OVqRVdbCAhKZfQowTMKJipfxb1Brb
         xerw==
X-Gm-Message-State: AC+VfDz01lJUp+ZKDgwfriNL3SE6hWaa/PZe+xoxVV2oa9y0lWTcowRb
	/aReXwiaPn+g6cwXQW5KnEI=
X-Google-Smtp-Source: ACHHUZ553q2dcRrCz+WfQiH+IcpAzQIzg3nb6h3C8SURetbeoFdHrj7Lk9z2Boc+cX4BiwxkR6R9pg==
X-Received: by 2002:a17:906:7293:b0:975:c046:dd34 with SMTP id b19-20020a170906729300b00975c046dd34mr4017909ejl.1.1687010211924;
        Sat, 17 Jun 2023 06:56:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090607c800b00982bb85e8e4sm3147197ejc.18.2023.06.17.06.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 06:56:51 -0700 (PDT)
Date: Sat, 17 Jun 2023 15:56:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] staging: rtl8192e: Remove unsupported modes IEEE_N_5G
 and IEEE_A
Message-ID: <40c5b21654376348144280dbe45203140c6e6807.1687007788.git.philipp.g.hortmann@gmail.com>
References: <cover.1687007788.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687007788.git.philipp.g.hortmann@gmail.com>

Remove unsupported modes IEEE_N_5G and IEEE_A as those are not supported
by hardware and are not offered by user software. Remove resulting dead
code and unused defines.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ----
 drivers/staging/rtl8192e/rtl819x_HTProc.c      | 2 --
 drivers/staging/rtl8192e/rtllib.h              | 8 ++------
 drivers/staging/rtl8192e/rtllib_rx.c           | 4 +---
 drivers/staging/rtl8192e/rtllib_softmac.c      | 6 ++----
 drivers/staging/rtl8192e/rtllib_softmac_wx.c   | 2 +-
 6 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index f030e06f16f6..10dc1c4e9913 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1816,9 +1816,6 @@ void rtl92e_update_ratr_table(struct net_device *dev)
 	rtl92e_config_rate(dev, &rate_config);
 	ratr_value = rate_config | *pMcsRate << 12;
 	switch (ieee->mode) {
-	case IEEE_A:
-		ratr_value &= 0x00000FF0;
-		break;
 	case IEEE_B:
 		ratr_value &= 0x0000000F;
 		break;
@@ -1827,7 +1824,6 @@ void rtl92e_update_ratr_table(struct net_device *dev)
 		ratr_value &= 0x00000FF7;
 		break;
 	case IEEE_N_24G:
-	case IEEE_N_5G:
 		if (ieee->ht_info->peer_mimo_ps == 0)
 			ratr_value &= 0x0007F007;
 		else
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index fe30a291e64c..9cbe229a601f 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -424,14 +424,12 @@ static u8 HT_PickMCSRate(struct rtllib_device *ieee, u8 *pOperateMCS)
 	}
 
 	switch (ieee->mode) {
-	case IEEE_A:
 	case IEEE_B:
 	case IEEE_G:
 		for (i = 0; i <= 15; i++)
 			pOperateMCS[i] = 0;
 		break;
 	case IEEE_N_24G:
-	case IEEE_N_5G:
 		pOperateMCS[0] &= RATE_ADPT_1SS_MASK;
 		pOperateMCS[1] &= RATE_ADPT_2SS_MASK;
 		pOperateMCS[3] &= RATE_ADPT_MCS32_MASK;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b4fad9bf0f03..c789f7a9d3c6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -309,9 +309,7 @@ enum rt_op_mode {
 };
 
 #define aSifsTime						\
-	 (((priv->rtllib->current_network.mode == IEEE_A)	\
-	|| (priv->rtllib->current_network.mode == IEEE_N_24G)	\
-	|| (priv->rtllib->current_network.mode == IEEE_N_5G)) ? 16 : 10)
+	 ((priv->rtllib->current_network.mode == IEEE_N_24G) ? 16 : 10)
 
 #define MGMT_QUEUE_NUM 5
 
@@ -1724,12 +1722,10 @@ struct rtllib_device {
 	u8 priv[];
 };
 
-#define IEEE_A	    (1<<0)
 #define IEEE_B	    (1<<1)
 #define IEEE_G	    (1<<2)
 #define IEEE_N_24G		  (1<<4)
-#define	IEEE_N_5G		  (1<<5)
-#define IEEE_MODE_MASK    (IEEE_A|IEEE_B|IEEE_G)
+#define IEEE_MODE_MASK    (IEEE_B | IEEE_G)
 
 /* Generate a 802.11 header */
 
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 36dace010203..cb13964b5181 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2329,9 +2329,7 @@ static inline int rtllib_network_init(
 	}
 
 	if (network->bssht.bd_support_ht) {
-		if (network->mode == IEEE_A)
-			network->mode = IEEE_N_5G;
-		else if (network->mode & (IEEE_G | IEEE_B))
+		if (network->mode & (IEEE_G | IEEE_B))
 			network->mode = IEEE_N_24G;
 	}
 	if (rtllib_is_empty_essid(network->ssid, network->ssid_len))
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 821ca86b8bcd..438bf0d48b75 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -181,9 +181,7 @@ static u8 MgntQuery_MgntFrameTxRate(struct rtllib_device *ieee)
 		rate = ieee->basic_rate & 0x7f;
 
 	if (rate == 0) {
-		if (ieee->mode == IEEE_A ||
-		   ieee->mode == IEEE_N_5G ||
-		   (ieee->mode == IEEE_N_24G && !ht_info->bCurSuppCCK))
+		if (ieee->mode == IEEE_N_24G && !ht_info->bCurSuppCCK)
 			rate = 0x0c;
 		else
 			rate = 0x02;
@@ -2577,7 +2575,7 @@ static void rtllib_start_ibss_wq(void *data)
 	}
 
 	netdev_info(ieee->dev, "%s(): ieee->mode = %d\n", __func__, ieee->mode);
-	if ((ieee->mode == IEEE_N_24G) || (ieee->mode == IEEE_N_5G))
+	if (ieee->mode == IEEE_N_24G)
 		HTUseDefaultSetting(ieee);
 	else
 		ieee->ht_info->bCurrentHTSupport = false;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index d6d90e6ba2d3..6013ae7c6abf 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -489,7 +489,7 @@ int rtllib_wx_get_name(struct rtllib_device *ieee, struct iw_request_info *info,
 {
 	const char *b = ieee->modulation & RTLLIB_CCK_MODULATION ? "b" : "";
 	const char *g = ieee->modulation & RTLLIB_OFDM_MODULATION ? "g" : "";
-	const char *n = ieee->mode & (IEEE_N_24G | IEEE_N_5G) ? "n" : "";
+	const char *n = ieee->mode & (IEEE_N_24G) ? "n" : "";
 
 	scnprintf(wrqu->name, sizeof(wrqu->name), "802.11%s%s%s", b, g, n);
 	return 0;
-- 
2.40.1

