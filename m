Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E089B53E1E
	for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="IqRPqVXM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28beb1d946fso3172124a91.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 12:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703535802; x=1704140602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB/NPRklIQX18vFPp18HnciRsryoXB+/DvCLU44035c=;
        b=IqRPqVXMvlxHhdG8eklhqMqDRYhJOpt96g5nBjTqXUayRjzyvPa0sg8MwFVruWcQDe
         gEqbxALDsmVgSKUY/4SYEexTspZ+dIYF8DmJMGlmv8zSy1ThuO3AueootWSsdi2gC0FN
         Crr94eEv/sTfyXop4DbrV6+g6M1OQzkoyUPdukwm27kwnWqM6h1s1B5Mk0I/wlF3qcuB
         XYdgD6/+gVTfkvpWf79K0iaYcY/CZ8sLCQfMPdULyATf24uA1qY4qQmHZajk1TZtbbZu
         vaTupfWgY/BuiSzGwSOMiZml+aO2ji3fQ8TdXY/BeQ2Z0aqClrkglD6yzBGrEzM3Tt1L
         C8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703535802; x=1704140602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB/NPRklIQX18vFPp18HnciRsryoXB+/DvCLU44035c=;
        b=mICVh3tpBJnon22cPJuwuu7I0860SZQrm/mHqHypFuChZ6p1Ps0gPBm7ChLMufOfjR
         UtqGFBNU1aVDtp8mBD8c0kbam8+wOo+XGNawOSIh7FKgQvllA3WK6Lq0NrBjuyQ+WokU
         X/brTGYKUqR0ab7M64/+VEqeKfSN9vGOTc3QknKgmiZX9+LEMQIsI3pSgvg9IGa0NOQu
         HoJoOrHDKbYaDqA+ZQW8d7skuSUgPB8rC1igB5/aCeBG83f9jRg23nmIwMkfyhg4O/DM
         Q3GCDM7T9tB8GNBh5lW+vfKdJsplaOwdkJesgGyXuVJED3xsjnBSUIRjqVTJ4Y7aBfbK
         c79w==
X-Gm-Message-State: AOJu0YyUCJOukpDPI2iilG4EgJbiEvjYzRohFRU/M+rpgUumkYJK2DIU
	h3lPoa6DkADOvU1L6jU+vIVdKL9rHFT5Gw==
X-Google-Smtp-Source: AGHT+IEkZIOKUIPikir73sUYhv3D61CLAKChYIpOJiHP27SsKO7k81a0TQwQzNoytrFJ9uos1IDCig==
X-Received: by 2002:a17:903:26cd:b0:1d3:2a94:cb53 with SMTP id jg13-20020a17090326cd00b001d32a94cb53mr7021854plb.5.1703535802350;
        Mon, 25 Dec 2023 12:23:22 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090aaa9100b0028be5732f01sm8741246pjq.0.2023.12.25.12.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 12:23:22 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 5/6] Staging: rtl8192e: Rename variable bIsAggregateFrame
Date: Mon, 25 Dec 2023 12:23:13 -0800
Message-Id: <20231225202314.31869-6-tdavies@darkphysics.net>
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

Rename variable bIsAggregateFrame to is_aggregate_frame to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 10 +++++-----
 drivers/staging/rtl8192e/rtllib_softmac.c |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a2148bf0cea3..df72504e9695 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1402,7 +1402,7 @@ struct rtllib_device {
 	bool FwRWRF;
 
 	struct rt_link_detect link_detect_info;
-	bool bIsAggregateFrame;
+	bool is_aggregate_frame;
 	struct rt_pwr_save_ctrl pwr_save_ctrl;
 
 	/* used if IEEE_SOFTMAC_TX_QUEUE is set */
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d346380fd1d1..a5d530af18c4 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -730,7 +730,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	u16		LLCOffset = sizeof(struct ieee80211_hdr_3addr);
 	u16		ChkLength;
-	bool		bIsAggregateFrame = false;
+	bool		is_aggregate_frame = false;
 	u16		nSubframe_Length;
 	u8		nPadding_Length = 0;
 	u16		SeqNum = 0;
@@ -739,7 +739,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	SeqNum = WLAN_GET_SEQ_SEQ(le16_to_cpu(hdr->seq_ctrl));
 	if ((RTLLIB_QOS_HAS_SEQ(fc)) &&
 	   (((union frameqos *)(skb->data + RTLLIB_3ADDR_LEN))->field.reserved))
-		bIsAggregateFrame = true;
+		is_aggregate_frame = true;
 
 	if (RTLLIB_QOS_HAS_SEQ(fc))
 		LLCOffset += 2;
@@ -752,8 +752,8 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 		return 0;
 
 	skb_pull(skb, LLCOffset);
-	ieee->bIsAggregateFrame = bIsAggregateFrame;
-	if (!bIsAggregateFrame) {
+	ieee->is_aggregate_frame = is_aggregate_frame;
+	if (!is_aggregate_frame) {
 		rxb->nr_subframes = 1;
 
 		/* altered by clark 3/30/2010
@@ -1358,7 +1358,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/* Update WAPI PN */
 
 	/* Check if leave LPS */
-	if (ieee->bIsAggregateFrame)
+	if (ieee->is_aggregate_frame)
 		nr_subframes = rxb->nr_subframes;
 	else
 		nr_subframes = 1;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c0c33ae06908..66816155ff36 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2079,7 +2079,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 	ieee->link_detect_info.num_tx_ok_in_period = 0;
 	ieee->link_detect_info.num_rx_ok_in_period = 0;
 	ieee->link_detect_info.NumRxUnicastOkInPeriod = 0;
-	ieee->bIsAggregateFrame = false;
+	ieee->is_aggregate_frame = false;
 	ieee->assoc_id = 0;
 	ieee->queue_stop = 0;
 	ieee->scanning_continue = 0;
-- 
2.39.2

