Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2250A1CD0C
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919800; cv=none; b=X90icYGKwJQVgyWePH66d1h7yMicbx0l0nHLIDBiSl9n7AulS9YgTFvONzcp+99Fpe04hFGW3I2OPuKLIay9FQEL7kqaZUf9D59qS7my++oR6e6VKF2PMvrYpv+vGXcdvaHwprCvvcHKc4+G47pZzGCl0qnUTYU7czFf8m+3znw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919800; c=relaxed/simple;
	bh=g3nFukFgoqAJK6s/qvYcL8fgv2CgGDB14Qsca/pPKFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cq6/5s03nBaQuevq8mC9KexFfd8d+JR0Sngpr9CMXRD0jj5QYoYe6YP9z1Y6QmYGLlNpjMwW3mtbwg37AFyaTEr12QLrBD3m15XZnXQZ9jljm19+TT3vwg9XCRrDcoWB5MXlgYP1X5OxlFmA2XR+xkcpiV2rKTwy8J+91cLjIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=L3T7P3j2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="L3T7P3j2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d918008b99so18724175ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919798; x=1709524598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdNqV5+ffAhQgtPZjajCidDLujgoFt5XmWAm32Jyabw=;
        b=L3T7P3j21oiy+KvUPNBS0WDhASrtBJotZo1NKwLrvUA+A9hcpoHkpE1CGx3DRuAT5a
         yu0OfSDbyrKMrAEPiF6lAIRyw4GPLAwnP6i660ugzz0fhWDKyZgIJO2eMIcT/8jjVK56
         44e8F+XMPKHPk9RvM8D3VYNNf78fvU0ZlswUKTdcRnubOEFVuIX3O3bPhm70XvZf46cs
         Mdo6KsltpcvT4YYlyGvoqMvV6M8RwRhxFxnhiNCnf6FT7s+TMTL911qleierYLHBAcDa
         WVkuXzf2Wg+oU8YBR1hQLA5gSftKYnpuBpwsTcKoEjz+dL8SX6v8UXxPRsOikgH8vko6
         lu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919798; x=1709524598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdNqV5+ffAhQgtPZjajCidDLujgoFt5XmWAm32Jyabw=;
        b=GjWzflb1gMDvyvtWmbwQBtcmk95blWbqwHhn8JyinugTXbcfhdG6iPmcypm9tLw7QC
         QjMg+BUeT8cqiq1PujXw6IKY6LFFgLWyRJ4FTRz7Cbyku5BnBPO/Hw9ZKWJ+zk1h6c7y
         dMqrZuPt15qeZyH5acmdBjDG+enzkFK9Vr8O5rNz1lgECR7d6R4CvZQ/zH3LQG3klfPC
         xydkxk7bmD96VmVVq9wREyIf2rRB1uOHqJ4r4g1MZJ+wYHJNQ45LZC5eGXlFg1z5IRYt
         vcznDO/xIh3zMbzmEIFYWcuYelxvWt3Bq15dUqgIAFRUQTAxaccGGTfqfNhiJBp09ctO
         PQHQ==
X-Gm-Message-State: AOJu0YxzT2RxUKCD1gLwurcRnlmSepCThDSEzKwRYIchlIGvebQ0loGo
	xngPye93ggN0XuTNFm40CJTPRC97+yQPnv3dYngSmRznxHXukoOrknM09PzRcxg=
X-Google-Smtp-Source: AGHT+IHJ5W5qIG9Quk8KzldgtQfUBXY4v2RsELCEHX+LnfS6M+aMhl4GyKHM24GZ1YO+ybSuZ/aKbw==
X-Received: by 2002:a17:902:f78c:b0:1dc:1379:2152 with SMTP id q12-20020a170902f78c00b001dc13792152mr6730839pln.56.1708919798503;
        Sun, 25 Feb 2024 19:56:38 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:38 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/20] Staging: rtl8192e: Rename variable asRsn
Date: Sun, 25 Feb 2024 19:56:16 -0800
Message-Id: <20240226035624.370443-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable asRsn to rsn to fix checkpatch warning
Avoid CamelCase, and adjust spacing to avoid alignment check.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         |  4 ++--
 drivers/staging/rtl8192e/rtllib_softmac.c | 24 +++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c703e6d95fb9..a5925fe75a6a 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1662,7 +1662,7 @@ int rtllib_rx_frame_softmac(struct rtllib_device *ieee, struct sk_buff *skb,
 void rtllib_softmac_new_net(struct rtllib_device *ieee,
 			    struct rtllib_network *net);
 
-void send_disassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn);
+void send_disassociation(struct rtllib_device *ieee, bool deauth, u16 rsn);
 void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee);
 
 int rtllib_softmac_init(struct rtllib_device *ieee);
@@ -1805,7 +1805,7 @@ static inline const char *escape_essid(const char *essid, u8 essid_len)
 }
 
 /* fun with the built-in rtllib stack... */
-bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 asRsn);
+bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 rsn);
 
 /* For the function is more related to hardware setting, it's better to use the
  * ieee handler to refer to it.
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 4ab4cf6e1197..e59cd2792389 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2144,7 +2144,7 @@ void rtllib_softmac_free(struct rtllib_device *ieee)
 
 static inline struct sk_buff *
 rtllib_disauth_skb(struct rtllib_network *beacon,
-		   struct rtllib_device *ieee, u16 asRsn)
+		   struct rtllib_device *ieee, u16 rsn)
 {
 	struct sk_buff *skb;
 	struct rtllib_disauth *disauth;
@@ -2164,13 +2164,13 @@ rtllib_disauth_skb(struct rtllib_network *beacon,
 	ether_addr_copy(disauth->header.addr2, ieee->dev->dev_addr);
 	ether_addr_copy(disauth->header.addr3, beacon->bssid);
 
-	disauth->reason = cpu_to_le16(asRsn);
+	disauth->reason = cpu_to_le16(rsn);
 	return skb;
 }
 
 static inline struct sk_buff *
 rtllib_disassociate_skb(struct rtllib_network *beacon,
-			struct rtllib_device *ieee, u16 asRsn)
+			struct rtllib_device *ieee, u16 rsn)
 {
 	struct sk_buff *skb;
 	struct rtllib_disassoc *disass;
@@ -2191,19 +2191,19 @@ rtllib_disassociate_skb(struct rtllib_network *beacon,
 	ether_addr_copy(disass->header.addr2, ieee->dev->dev_addr);
 	ether_addr_copy(disass->header.addr3, beacon->bssid);
 
-	disass->reason = cpu_to_le16(asRsn);
+	disass->reason = cpu_to_le16(rsn);
 	return skb;
 }
 
-void send_disassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn)
+void send_disassociation(struct rtllib_device *ieee, bool deauth, u16 rsn)
 {
 	struct rtllib_network *beacon = &ieee->current_network;
 	struct sk_buff *skb;
 
 	if (deauth)
-		skb = rtllib_disauth_skb(beacon, ieee, asRsn);
+		skb = rtllib_disauth_skb(beacon, ieee, rsn);
 	else
-		skb = rtllib_disassociate_skb(beacon, ieee, asRsn);
+		skb = rtllib_disassociate_skb(beacon, ieee, rsn);
 
 	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
@@ -2238,7 +2238,7 @@ u8 rtllib_ap_sec_type(struct rtllib_device *ieee)
 }
 
 static void rtllib_mlme_disassociate_request(struct rtllib_device *rtllib,
-					   u8 *asSta, u8 asRsn)
+					     u8 *asSta, u8 rsn)
 {
 	u8 i;
 	u8	op_mode;
@@ -2261,7 +2261,7 @@ static void rtllib_mlme_disassociate_request(struct rtllib_device *rtllib,
 	}
 }
 
-static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 asRsn)
+static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 rsn)
 {
 	bool filter_out_nonassociated_bssid = false;
 
@@ -2269,19 +2269,19 @@ static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 asRsn)
 	rtllib->set_hw_reg_handler(rtllib->dev, HW_VAR_CECHK_BSSID,
 				(u8 *)(&filter_out_nonassociated_bssid));
 	rtllib_mlme_disassociate_request(rtllib, rtllib->current_network.bssid,
-				       asRsn);
+					 rsn);
 
 	rtllib->link_state = MAC80211_NOLINK;
 }
 
-bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 asRsn)
+bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 rsn)
 {
 	if (rtllib->ps != RTLLIB_PS_DISABLED)
 		rtllib->sta_wake_up(rtllib->dev);
 
 	if (rtllib->link_state == MAC80211_LINKED) {
 		if (rtllib->iw_mode == IW_MODE_INFRA)
-			rtllib_mgnt_disconnect_ap(rtllib, asRsn);
+			rtllib_mgnt_disconnect_ap(rtllib, rsn);
 	}
 
 	return true;
-- 
2.39.2

