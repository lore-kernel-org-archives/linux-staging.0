Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5863D79D2
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Hpd8xO7W"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bbbc6bcc78so328361b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520574; x=1705125374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCaFmMfTT0KeM0sPMid+19JPonrhplA7ayvF2V4ouF0=;
        b=Hpd8xO7Wguj0iHK35j70XsUvlX+TDOjD1djK/s02ZGNOHXu/CtQGzU8Thfo3PO/OvB
         p6n9uHluLObtsqMyp38ruTuNsNLnTuH6HfInruKqRtI1MTFGFqT3vaqycBwc7F2UHjic
         JHIWRwXI8BRNVTsHJxkibVNL1vINz4zefcAgLMkDkFwIPXGLEKeA68E9mxTc9/vsv5O8
         iSQFrA0xfFh1xkm8IqU0+94kpA+VOpOTsFHfzgrrR/2lWtG9rVj6Uog/67EfWs1FSlKa
         bz2rB7ebaXqZr6KwK4anI8jE79E4NvugLWmu6cmStzd3w45SPVMdEM/6yAk580L2wVER
         Tnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520574; x=1705125374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCaFmMfTT0KeM0sPMid+19JPonrhplA7ayvF2V4ouF0=;
        b=e8X6SL5CF9jPS+upRhAJ6TaUdRLoDefllwKJCEANEaNTMQcpB3ZzJ7HCbnnkmfGFE2
         YUTd0oXCwln9uR695sXfc6ADC+9iiMioIsNqKRl8KhBGtamtA++EMejy4aYRzd0D4N6N
         4zBBRN32BjQRW6SM8ouJyVkVeyWppBCpAorgTio4ThVyTHyH0sH71h6GM6o0EzvtW9X5
         tlGWiHPwQ0sH1+iYcea9EPdsMZwiEd6464A83QAyxL8LBZPghVQCFwa+54PKvrMt/rRT
         fwTA7PgkcgaSSF0xIe23MnF48VX14xLaFLqn0LnfMqNcHLCeJ1O4rJoouFhZLIjkB7K1
         dPeA==
X-Gm-Message-State: AOJu0YyGiQWJUFGroi5+SfpKrVAwiUV+wuofOdSz5t3QQmVV2IOvp3IY
	2qqGkNlvOWJdqqOLjtmUra1FWoI2XYEWNhijIrmsrkxJRv8=
X-Google-Smtp-Source: AGHT+IFrmqa7SBMfBk0qNb4wPdBlq5qkztpRMC2RF0ugZEME+gjlhTRpsZNeeZiXm21q9OTWjxRPrw==
X-Received: by 2002:a05:6808:3088:b0:3bb:bf36:35ae with SMTP id bl8-20020a056808308800b003bbbf3635aemr712500oib.43.1704520574550;
        Fri, 05 Jan 2024 21:56:14 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:14 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/21] Staging: rtl8192e: Rename variable bBusyTraffic
Date: Fri,  5 Jan 2024 21:55:43 -0800
Message-Id: <20240106055556.430948-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bBusyTraffic to busy_traffic to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index c9d7484fe1cd..16ce207f5bd7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -943,7 +943,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	unsigned long flags;
 	struct rt_pwr_save_ctrl *psc = (struct rt_pwr_save_ctrl *)
 					(&priv->rtllib->pwr_save_ctrl);
-	bool bBusyTraffic = false;
+	bool busy_traffic = false;
 	bool	bHigherBusyTraffic = false;
 	bool	bHigherBusyRxTraffic = false;
 	bool bEnterPS = false;
@@ -973,7 +973,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	if ((ieee->link_state == MAC80211_LINKED) && (ieee->iw_mode == IW_MODE_INFRA)) {
 		if (ieee->link_detect_info.num_rx_ok_in_period > 100 ||
 		ieee->link_detect_info.num_tx_ok_in_period > 100)
-			bBusyTraffic = true;
+			busy_traffic = true;
 
 		if (ieee->link_detect_info.num_rx_ok_in_period > 4000 ||
 		    ieee->link_detect_info.num_tx_ok_in_period > 4000) {
@@ -1006,7 +1006,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	ieee->link_detect_info.num_rx_ok_in_period = 0;
 	ieee->link_detect_info.num_tx_ok_in_period = 0;
 	ieee->link_detect_info.NumRxUnicastOkInPeriod = 0;
-	ieee->link_detect_info.bBusyTraffic = bBusyTraffic;
+	ieee->link_detect_info.busy_traffic = busy_traffic;
 
 	ieee->link_detect_info.bHigherBusyTraffic = bHigherBusyTraffic;
 	ieee->link_detect_info.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 4c884c5277f9..5fd44d0c4b1d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -253,7 +253,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 	rt_state = priv->rtllib->rf_power_state;
 	if (!priv->up)
 		return -ENETDOWN;
-	if (priv->rtllib->link_detect_info.bBusyTraffic)
+	if (priv->rtllib->link_detect_info.busy_traffic)
 		return -EAGAIN;
 
 	if (wrqu->data.flags & IW_SCAN_THIS_ESSID) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 9d6704fc86ff..d127528e7932 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1121,7 +1121,7 @@ struct rt_link_detect {
 	u32				num_tx_ok_in_period;
 	u32				num_rx_ok_in_period;
 	u32				NumRxUnicastOkInPeriod;
-	bool				bBusyTraffic;
+	bool				busy_traffic;
 	bool				bHigherBusyTraffic;
 	bool				bHigherBusyRxTraffic;
 };
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 85e6e727bec7..40d6ae15b246 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1734,7 +1734,7 @@ rtllib_rx_deauth(struct rtllib_device *ieee, struct sk_buff *skb)
 		ieee->link_state = RTLLIB_ASSOCIATING;
 		ieee->softmac_stats.reassoc++;
 		ieee->is_roaming = true;
-		ieee->link_detect_info.bBusyTraffic = false;
+		ieee->link_detect_info.busy_traffic = false;
 		rtllib_disassociate(ieee);
 		RemovePeerTS(ieee, header->addr2);
 		if (!(ieee->rtllib_ap_sec_type(ieee) &
-- 
2.39.2

