Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFBD7FC
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:04:11 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-988a4a7be58so31133966b.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 23:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687586649; x=1690178649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5G3FVlCyqn63CYhl0DzmSuIziSgLL1eeoVVmuGLO64=;
        b=JFTgUaF0Iyqv+0trbfpYbYGVikT6eeHoKAhZtKqeseNVl9T4VSML3k/8pEOFWj3fKh
         VxaJtDipH9I+57zVWPG+/PwielTptyDOdsS4Itmgw6kOUG6RXItX2j/vEpfJBxPZPDdo
         hu43ISwB6SbfxoCvNS/yXTcscWUR6LYM5XLqpuqETwpHk8eE5YYSUJcJhGNvLml8bd+i
         mOE3JQGVUgfbL/yfHo9uqnQljyMLbifAVBDE2RwnTlAzlKvwWwaxzLnbwrDysyDuLbHi
         Fj2U1F5Qfk/7TbtQ3V9RhmzAVzHt4Qxf1WrtQzncyQYGTlD/m6Mr5E1DM84JUR6/RoUI
         eMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586649; x=1690178649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5G3FVlCyqn63CYhl0DzmSuIziSgLL1eeoVVmuGLO64=;
        b=kCPyqMpIsKmdTtGVxEOtW0Q2gF8wQnD/XhmGUNE9SVFZ75YdX8Bb4R1QOwiqWagV0/
         Oip/OyKbEXC3kzAe4RGWNnSOdB8HHJUsZR11uIleAK/toruwA3UDo9J4BgBDMj5ti3/H
         sS8czDodDK6UhaDfGBOjYMz2wFtuKl1IXBaFeyePya8+7RU1ouB9qaX++iGYvhO/3pWC
         iE9q6ZAnSd+K4oIrDdj3GJqDZa0vzEzQ2z8MsYot6Zb6/CiItWe3PfIqY7/Mq9o3EIMZ
         FC02Am9vdx0OwRdyBUHL02r93dH8Z5JMdu/mgUwH9Ri0bqwdepI1r6rL0znKUms3KJSm
         k+Cw==
X-Gm-Message-State: AC+VfDwdc7wApQ7cPPZuJuJpsuSNXyIVwdOlT0/PcuQw8iUI6x2id3Q9
	d1YG6Z3IZex2JSSa98buGB0m6X3dD1o=
X-Google-Smtp-Source: ACHHUZ6QolQYsLgTtmwGbQQDdtdhMMzk4sp85rd9nFBWiuD41+Qe/TDRy5Vye9p5XMLG0xsmesR5+w==
X-Received: by 2002:a17:906:7a5e:b0:987:6960:36c6 with SMTP id i30-20020a1709067a5e00b00987696036c6mr15024649ejo.5.1687586649126;
        Fri, 23 Jun 2023 23:04:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id qq28-20020a17090720dc00b009891da61b1asm501984ejb.44.2023.06.23.23.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:04:07 -0700 (PDT)
Date: Sat, 24 Jun 2023 08:04:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] staging: rtl8192e: Remove variable modulation as it is
 constant
Message-ID: <ebd543d097a65f105078c71faceaed2a4d5e7b55.1687583718.git.philipp.g.hortmann@gmail.com>
References: <cover.1687583718.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687583718.git.philipp.g.hortmann@gmail.com>

ieee->modulation is initialized to 3 and then unchanged. All evaluations
will result accordingly. Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |   2 -
 drivers/staging/rtl8192e/rtllib.h            |   1 -
 drivers/staging/rtl8192e/rtllib_softmac.c    | 121 ++++++++-----------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |   4 +-
 4 files changed, 50 insertions(+), 78 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 4447489a16ea..cb0753f6fb18 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -804,8 +804,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rtllib->iw_mode = IW_MODE_INFRA;
 	priv->rtllib->active_scan = 1;
 	priv->rtllib->be_scan_inprogress = false;
-	priv->rtllib->modulation = RTLLIB_CCK_MODULATION |
-				   RTLLIB_OFDM_MODULATION;
 	priv->rtllib->host_encrypt = 1;
 	priv->rtllib->host_decrypt = 1;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e3ce4431d460..fdb7990130b5 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1492,7 +1492,6 @@ struct rtllib_device {
 
 	int short_slot;
 	int mode;       /* A, B, G */
-	int modulation; /* CCK, OFDM */
 
 	/* used for forcing the ibss workqueue to terminate
 	 * without wait for the syncro scan to terminate
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 425d4acbcdf0..c1e5127f5251 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -35,12 +35,8 @@ static unsigned int rtllib_MFIE_rate_len(struct rtllib_device *ieee)
 {
 	unsigned int rate_len = 0;
 
-	if (ieee->modulation & RTLLIB_CCK_MODULATION)
-		rate_len = RTLLIB_CCK_RATE_LEN + 2;
-
-	if (ieee->modulation & RTLLIB_OFDM_MODULATION)
-
-		rate_len += RTLLIB_OFDM_RATE_LEN + 2;
+	rate_len = RTLLIB_CCK_RATE_LEN + 2;
+	rate_len += RTLLIB_OFDM_RATE_LEN + 2;
 
 	return rate_len;
 }
@@ -53,14 +49,12 @@ static void rtllib_MFIE_Brate(struct rtllib_device *ieee, u8 **tag_p)
 {
 	u8 *tag = *tag_p;
 
-	if (ieee->modulation & RTLLIB_CCK_MODULATION) {
-		*tag++ = MFIE_TYPE_RATES;
-		*tag++ = 4;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_1MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_2MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_5MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_11MB;
-	}
+	*tag++ = MFIE_TYPE_RATES;
+	*tag++ = 4;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_1MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_2MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_5MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_11MB;
 
 	/* We may add an option for custom rates that specific HW
 	 * might support
@@ -72,18 +66,17 @@ static void rtllib_MFIE_Grate(struct rtllib_device *ieee, u8 **tag_p)
 {
 	u8 *tag = *tag_p;
 
-	if (ieee->modulation & RTLLIB_OFDM_MODULATION) {
-		*tag++ = MFIE_TYPE_RATES_EX;
-		*tag++ = 8;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_6MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_9MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_12MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_18MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_24MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_36MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_48MB;
-		*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_54MB;
-	}
+	*tag++ = MFIE_TYPE_RATES_EX;
+	*tag++ = 8;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_6MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_9MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_12MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_18MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_24MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_36MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_48MB;
+	*tag++ = RTLLIB_BASIC_RATE_MASK | RTLLIB_OFDM_RATE_54MB;
+
 	/* We may add an option for custom rates that specific HW might
 	 * support
 	 */
@@ -1465,8 +1458,7 @@ static void rtllib_associate_complete_wq(void *data)
 
 	netif_carrier_on(ieee->dev);
 	ieee->is_roaming = false;
-	if (rtllib_is_54g(&ieee->current_network) &&
-	   (ieee->modulation & RTLLIB_OFDM_MODULATION)) {
+	if (rtllib_is_54g(&ieee->current_network)) {
 		ieee->rate = 108;
 		netdev_info(ieee->dev, "Using G rates:%d\n", ieee->rate);
 	} else {
@@ -1652,9 +1644,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				schedule_delayed_work(
 					   &ieee->associate_procedure_wq, 0);
 			} else {
-				if (rtllib_is_54g(&ieee->current_network) &&
-				    (ieee->modulation &
-				     RTLLIB_OFDM_MODULATION)) {
+				if (rtllib_is_54g(&ieee->current_network)) {
 					ieee->rate = 108;
 					ieee->set_wireless_mode(ieee->dev, WIRELESS_MODE_G);
 					netdev_info(ieee->dev,
@@ -2526,47 +2516,34 @@ static void rtllib_start_ibss_wq(void *data)
 		if (!ieee->wap_set)
 			eth_random_addr(ieee->current_network.bssid);
 
-		if (ieee->modulation & RTLLIB_CCK_MODULATION) {
-			ieee->current_network.rates_len = 4;
-
-			ieee->current_network.rates[0] =
-				 RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_1MB;
-			ieee->current_network.rates[1] =
-				 RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_2MB;
-			ieee->current_network.rates[2] =
-				 RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_5MB;
-			ieee->current_network.rates[3] =
-				 RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_11MB;
-
-		} else {
-			ieee->current_network.rates_len = 0;
-		}
-
-		if (ieee->modulation & RTLLIB_OFDM_MODULATION) {
-			ieee->current_network.rates_ex_len = 8;
-
-			ieee->current_network.rates_ex[0] =
-						 RTLLIB_OFDM_RATE_6MB;
-			ieee->current_network.rates_ex[1] =
-						 RTLLIB_OFDM_RATE_9MB;
-			ieee->current_network.rates_ex[2] =
-						 RTLLIB_OFDM_RATE_12MB;
-			ieee->current_network.rates_ex[3] =
-						 RTLLIB_OFDM_RATE_18MB;
-			ieee->current_network.rates_ex[4] =
-						 RTLLIB_OFDM_RATE_24MB;
-			ieee->current_network.rates_ex[5] =
-						 RTLLIB_OFDM_RATE_36MB;
-			ieee->current_network.rates_ex[6] =
-						 RTLLIB_OFDM_RATE_48MB;
-			ieee->current_network.rates_ex[7] =
-						 RTLLIB_OFDM_RATE_54MB;
-
-			ieee->rate = 108;
-		} else {
-			ieee->current_network.rates_ex_len = 0;
-			ieee->rate = 22;
-		}
+		ieee->current_network.rates_len = 4;
+		ieee->current_network.rates[0] =
+			RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_1MB;
+		ieee->current_network.rates[1] =
+			RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_2MB;
+		ieee->current_network.rates[2] =
+			RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_5MB;
+		ieee->current_network.rates[3] =
+			RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_11MB;
+
+		ieee->current_network.rates_ex_len = 8;
+		ieee->current_network.rates_ex[0] =
+			RTLLIB_OFDM_RATE_6MB;
+		ieee->current_network.rates_ex[1] =
+			RTLLIB_OFDM_RATE_9MB;
+		ieee->current_network.rates_ex[2] =
+			RTLLIB_OFDM_RATE_12MB;
+		ieee->current_network.rates_ex[3] =
+			RTLLIB_OFDM_RATE_18MB;
+		ieee->current_network.rates_ex[4] =
+			RTLLIB_OFDM_RATE_24MB;
+		ieee->current_network.rates_ex[5] =
+			RTLLIB_OFDM_RATE_36MB;
+		ieee->current_network.rates_ex[6] =
+			RTLLIB_OFDM_RATE_48MB;
+		ieee->current_network.rates_ex[7] =
+			RTLLIB_OFDM_RATE_54MB;
+		ieee->rate = 108;
 
 		ieee->current_network.qos_data.supported = 0;
 		ieee->set_wireless_mode(ieee->dev, WIRELESS_MODE_G);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 2de63d1f2009..1a7575ab9d6d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -487,11 +487,9 @@ EXPORT_SYMBOL(rtllib_wx_set_rawtx);
 int rtllib_wx_get_name(struct rtllib_device *ieee, struct iw_request_info *info,
 		       union iwreq_data *wrqu, char *extra)
 {
-	const char *b = ieee->modulation & RTLLIB_CCK_MODULATION ? "b" : "";
-	const char *g = ieee->modulation & RTLLIB_OFDM_MODULATION ? "g" : "";
 	const char *n = ieee->mode & (WIRELESS_MODE_N_24G) ? "n" : "";
 
-	scnprintf(wrqu->name, sizeof(wrqu->name), "802.11%s%s%s", b, g, n);
+	scnprintf(wrqu->name, sizeof(wrqu->name), "802.11bg%s", n);
 	return 0;
 }
 EXPORT_SYMBOL(rtllib_wx_get_name);
-- 
2.41.0

