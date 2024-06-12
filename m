Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA014CDF9
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162565; cv=none; b=QshpQYx4fsYyi0Rd+1xNVMSME6CQECK8rqftggK324tAuxORa4w2dxlxfYWUmi4CRGdza9QB1YUIi28Y2Y6h3vo3QeQlkGepCw15lk/fImOTG8EE06Tnrt79a6Q+hfLLYqOr3MVjEQaPieau95FxUCBGQZEga5OSYkO0ktW7kQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162565; c=relaxed/simple;
	bh=hWiAurK3lrTP0rDgK7hX2BScnXR8rmfbaqqkvHClJ+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BvAM+S8ZfHyScKHQL7YygYKGumpSEI3m0SRnsiD61bFox2jzDvadYuLU+sEY2lie9XIWqQkOKwEz2v/gdnONwribRFitLuh/jH4DsP7vzcaf4ci6VePzUX3lIxmtGlmDtOu7Fa0fVwbu6ldMnfM9+STx2o30cV9gmlnZ3JCmTBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FMeIRqqZ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FMeIRqqZ"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6f99c6f6270so1677376a34.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162563; x=1718767363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BAaKVw7/fbvmr5oqNSLigQILIKiz64CgFfcGxrWE8s=;
        b=FMeIRqqZ2xZgjN5UoSaKICZMamIkOtL19e/nFizpMLZ2kf2ZA8Xp2hBCYCcpRhvPVg
         Rwc/9x/6q6q13ACT3zBmiZSsXftUAYDsVRx6EtjxHyFEoTJRucghNjfLxLx2jctKgrzw
         GyYOVTtIhSeBopo/w1rPRo+PwItpgl71R5qUm4agiBrDk+pkEXYsFRojMZGJFWz6uu16
         FmCxHOEQFCFkA0F/oR8I7lFffKmkrg0JjUvs4gz4b043nPSlv1MyehNwqF0k8JeYsUY0
         jvFlQ/Ud8Lq8bQmN/FeirKSssFlo2ZoiZhF8PfJJU9f1yVRNrED8I8hGFNMkX2lf0CbG
         IUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162563; x=1718767363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BAaKVw7/fbvmr5oqNSLigQILIKiz64CgFfcGxrWE8s=;
        b=Qz6IDVTdV8aqh9eejEQ3uanTVFTD4RtPj5EnWZeef33KaFCAnCRjAsiEEvgepY0FnJ
         c949HcJa61HC4X3St5XdUkhk7ILoZxzdPu4zGjb+Ze66rA/G0rFEod3LPHcdJaliv6LY
         Vo1G45EsNtnuTE5Ro9BjH2w6x6lD0QshqXWgKPO0jRgAmggC6GmeQ7lAO0hVVPT6wrhS
         m/NwsH4j5VFI8AgpXyXX3IGhqIePFB0bW5uudwvS4ZF6yaX1JdYOvpJZBi8GUQQJF5CY
         u/BLoFL9H0f/kolj44exFIQOPPva4C8FSRnIFSTEQKr4UzMpp0D6cdBEaTKRfXACvliK
         J0AA==
X-Gm-Message-State: AOJu0YxTe/9oVBTfY0PTa4Xo5F0xw5tSiWLvR+b4oa8lPW0VMYCa4tin
	S1WQRF5Jh6u6HElzoAeMhSXXUQhcseGQ3jEQd0qykU3a8ae9Cah09n7LT1UaCJppc4tpOw1g9Uz
	Wr7E=
X-Google-Smtp-Source: AGHT+IHu4RK9r5PLGcNNH5dewJx4wVVzrbLrTch7hody5C+rbtRU8z9ZFO1NVAMzG57d+R+2jxzQDw==
X-Received: by 2002:a05:6830:1bcc:b0:6f9:6060:8582 with SMTP id 46e09a7af769-6fa1c4361f3mr590351a34.32.1718162562795;
        Tue, 11 Jun 2024 20:22:42 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:42 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 12/24] Staging: rtl8192e: Rename variable CntAfterLink
Date: Tue, 11 Jun 2024 20:22:18 -0700
Message-Id: <20240612032230.9738-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CntAfterLink to cnt_after_link
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 08d057ab8f74..9eeae01dc98d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -951,10 +951,10 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 		return;
 
 	if (priv->rtllib->link_state >= MAC80211_LINKED) {
-		if (priv->rtllib->CntAfterLink < 2)
-			priv->rtllib->CntAfterLink++;
+		if (priv->rtllib->cnt_after_link < 2)
+			priv->rtllib->cnt_after_link++;
 	} else {
-		priv->rtllib->CntAfterLink = 0;
+		priv->rtllib->cnt_after_link = 0;
 	}
 
 	rtl92e_dm_watchdog(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index d131ef525f46..c21a0560410a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -241,7 +241,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 		    (ieee->link_state <= RTLLIB_ASSOCIATING_AUTHENTICATED))
 			return 0;
 		if ((priv->rtllib->link_state == MAC80211_LINKED) &&
-		    (priv->rtllib->CntAfterLink < 2))
+		    (priv->rtllib->cnt_after_link < 2))
 			return 0;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 812aeabb4a52..b48d9d416ead 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1168,7 +1168,7 @@ struct rtllib_device {
 	bool disable_mgnt_queue;
 
 	unsigned long status;
-	u8	CntAfterLink;
+	u8	cnt_after_link;
 
 	enum rt_op_mode op_mode;
 
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 1ea7157127f6..b5eb3968581d 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -280,7 +280,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 	if (is_multicast_ether_addr(hdr->addr1))
 		return;
 
-	if (tcb_desc->bdhcp || ieee->CntAfterLink < 2)
+	if (tcb_desc->bdhcp || ieee->cnt_after_link < 2)
 		return;
 
 	if (ht_info->iot_action & HT_IOT_ACT_TX_NO_AGGREGATION)
-- 
2.30.2

