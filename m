Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81D35380A
	for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 20:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="MG31bFW4"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3ba2dc0f6b7so3140289b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703535799; x=1704140599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRNgt5in1rawwI1Ihf7aE8qeFKHIp2oRP3X2LuU5NhE=;
        b=MG31bFW4ibmbaJwuoPOjwNvAfkHUVwVjXeQlxycIOr4snBLuXK8bWCK+DQkdCZofWR
         Ez3yk41oOqMZ26c+Z/JReobYOTWUQg3vo2H/+0h6G0Ozvw9HyxBXEriNiIDE93twwETY
         YCKIhTcWqq37QwOWkFyQ3ZTuMvkcFTNVAdhWEN1TZxd60+uCzw45f0u8mrOKgxWqCbev
         a0n8kHZbbpa+X+6/JnAroMetx2L8gm50Dir9aPPc+B+zonjN4/l351duE8xJxwr5/LiA
         i2ygi5y/lVZOKqwp9yqMTJw6NNy1Ed0z0GgscTHEztKj0ebG7H0l/ZMGBzwg0GPH2vSt
         hQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703535800; x=1704140600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRNgt5in1rawwI1Ihf7aE8qeFKHIp2oRP3X2LuU5NhE=;
        b=H+cYLegnrFpAM7W1dUr5iIq7pnzgUqGznYWV8nwosvQDCjHCG8sb6jif8EIjCq6IsT
         Sd0j8tcuuBb7f5JdJZAH5Zj+AF1IXyvbdrAh0X1hB8kHQc/OiX8qPPSy1OaGIgLsZisP
         BhrvxAeGYy7hoN5qjzmqBmzKAFABLOSHMVE3ThVwZ+PFmvqoZlxsjI4lOYmpIGND30zH
         PZRZF76EEbQxu9sv+aIpl+Tsd/OUz+8SyTq1gxX2ciCoOERQQwyrnIm0xD420IgiObJk
         FdxPKGMHOYoDeX15pkAdb6DL3D8sGyAq+IEUORk2V4RdKeqss2VIRiuyUHtXC6ZMaRl2
         8LJA==
X-Gm-Message-State: AOJu0Yz7POf1CVu+22PrvfbAaK7TyRUrgxsk2cRxpA4nMhDgo1Pv6j9C
	9ucl794VcoI3uMvdg7c1RWaihXayIQVCjg==
X-Google-Smtp-Source: AGHT+IGRcrm6u0JMPHJWKCUqhE7w8h2cxF1+5nYlprKEs39W2EOhlnY8braepw2LXGqq5M8LEfR9VQ==
X-Received: by 2002:a05:6808:1649:b0:3bb:89d2:4e13 with SMTP id az9-20020a056808164900b003bb89d24e13mr6579254oib.25.1703535799745;
        Mon, 25 Dec 2023 12:23:19 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090aaa9100b0028be5732f01sm8741246pjq.0.2023.12.25.12.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 12:23:19 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/6] Staging: rtl8192e: Rename variable NumTxOkInPeriod
Date: Mon, 25 Dec 2023 12:23:10 -0800
Message-Id: <20231225202314.31869-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225202314.31869-1-tdavies@darkphysics.net>
References: <20231225202314.31869-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable NumTxOkInPeriod to num_tx_ok_in_period to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 16 ++++++++--------
 drivers/staging/rtl8192e/rtllib.h            |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 5107d06a9fd0..b2c56e2099ce 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -972,11 +972,11 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	}
 	if ((ieee->link_state == MAC80211_LINKED) && (ieee->iw_mode == IW_MODE_INFRA)) {
 		if (ieee->link_detect_info.NumRxOkInPeriod > 100 ||
-		ieee->link_detect_info.NumTxOkInPeriod > 100)
+		ieee->link_detect_info.num_tx_ok_in_period > 100)
 			bBusyTraffic = true;
 
 		if (ieee->link_detect_info.NumRxOkInPeriod > 4000 ||
-		    ieee->link_detect_info.NumTxOkInPeriod > 4000) {
+		    ieee->link_detect_info.num_tx_ok_in_period > 4000) {
 			bHigherBusyTraffic = true;
 			if (ieee->link_detect_info.NumRxOkInPeriod > 5000)
 				bHigherBusyRxTraffic = true;
@@ -985,7 +985,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 		}
 
 		if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
-		    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
+		    ieee->link_detect_info.num_tx_ok_in_period) > 8) ||
 		    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2))
 			bEnterPS = false;
 		else
@@ -1004,7 +1004,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	}
 
 	ieee->link_detect_info.NumRxOkInPeriod = 0;
-	ieee->link_detect_info.NumTxOkInPeriod = 0;
+	ieee->link_detect_info.num_tx_ok_in_period = 0;
 	ieee->link_detect_info.NumRxUnicastOkInPeriod = 0;
 	ieee->link_detect_info.bBusyTraffic = bBusyTraffic;
 
@@ -1773,22 +1773,22 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		tasklet_schedule(&priv->irq_rx_tasklet);
 
 	if (inta & IMR_BKDOK) {
-		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
+		priv->rtllib->link_detect_info.num_tx_ok_in_period++;
 		_rtl92e_tx_isr(dev, BK_QUEUE);
 	}
 
 	if (inta & IMR_BEDOK) {
-		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
+		priv->rtllib->link_detect_info.num_tx_ok_in_period++;
 		_rtl92e_tx_isr(dev, BE_QUEUE);
 	}
 
 	if (inta & IMR_VIDOK) {
-		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
+		priv->rtllib->link_detect_info.num_tx_ok_in_period++;
 		_rtl92e_tx_isr(dev, VI_QUEUE);
 	}
 
 	if (inta & IMR_VODOK) {
-		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
+		priv->rtllib->link_detect_info.num_tx_ok_in_period++;
 		_rtl92e_tx_isr(dev, VO_QUEUE);
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index bace5dabf860..b56a8e1ce474 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1118,7 +1118,7 @@ struct rt_link_detect {
 	u16				SlotNum;
 	u16				SlotIndex;
 
-	u32				NumTxOkInPeriod;
+	u32				num_tx_ok_in_period;
 	u32				NumRxOkInPeriod;
 	u32				NumRxUnicastOkInPeriod;
 	bool				bBusyTraffic;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 196eacc7a768..80e4e5b8de89 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1150,7 +1150,7 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 	if (unicast) {
 		if (ieee->link_state == MAC80211_LINKED) {
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
-			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
+			    ieee->link_detect_info.num_tx_ok_in_period) > 8) ||
 			    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
 				ieee->leisure_ps_leave(ieee->dev);
 			}
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 3bff95a93650..b30533f92b53 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2076,7 +2076,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 	ieee->link_detect_info.SlotNum = 2;
 	ieee->link_detect_info.NumRecvBcnInPeriod = 0;
 	ieee->link_detect_info.NumRecvDataInPeriod = 0;
-	ieee->link_detect_info.NumTxOkInPeriod = 0;
+	ieee->link_detect_info.num_tx_ok_in_period = 0;
 	ieee->link_detect_info.NumRxOkInPeriod = 0;
 	ieee->link_detect_info.NumRxUnicastOkInPeriod = 0;
 	ieee->bIsAggregateFrame = false;
-- 
2.39.2

