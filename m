Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E86EB4C
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748778; cv=none; b=PTalocCluY32occAIJLXdGbjghpdNsY1PiRFq14vpkYfCc5JqM4xAqzsTcQ8zGIYIqW+i97kQbq6WKbpY5GUV9sXUK1t14TWmhq6ghBua/7hPF1czn8Vd3UwpWh3TYo+ueULrjFkVNS+HbNUskIESD2imgVoFIMGPsrbBxED+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748778; c=relaxed/simple;
	bh=x+7th958K+EtaVZNAuZ4f3J4B8F0FKqpXqhitiQlKQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=blZrFaVCPvdmlXikmjCtyz7aHqI07deyOIx8FjKoF04zolyrKgok6ww2zPK+XgLPIDCC28W/1QGfTfJa9oETOaNOGXPYVBkKDEh+IOLNH65wUEPef+Xyk419LMrdHXBhSjC57HaQhlY65YvQub9d/9IayVcCThlylRae0A7aV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=a3sKDEUL; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="a3sKDEUL"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c96fef64b3so3869471b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748775; x=1716353575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5tTRlvba6F46bSw0/iKQNOrZ3zzLqHwL6ZR5s0u92w=;
        b=a3sKDEULRM7lXUOWgPZHaE8X43skUphrBfAVzp/G67j9mqR/Uvsz2b5OoCmIg40bOl
         TkD2IUhDt6wWX5diUB5NNjV8bghufPBBkH5ZHcyJrr2fgqiSsjOs1NPl8Ulsvxz0Sc0p
         iDC+AFQVO2d7Kjn9F0OuuPjEgKEgAl7NR9HeiOxyQRKZnUN/ETCiDQuGngJMHlEwv7Tc
         252z3TH8PQhI1biArGG2hoEo0Ka5uM3HFPqVLVk1d+HFKjKY4qmu2jDDNRvTwgjAYuoJ
         WVjJ7fT+o0IMUb+L8rwIoI1xZPm+jyuBkysmk5adLSbeBmKzVIpGfuV+xqviW8erjEHR
         MFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748775; x=1716353575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5tTRlvba6F46bSw0/iKQNOrZ3zzLqHwL6ZR5s0u92w=;
        b=JFSMLEn8JtQ4alXIHezZ3ujhWUNmzfz52+dlpxhJ2YLGpkYHN9AEW36UV4rrVXJyRf
         lOMu5pXfnSkvGb8IcYh/Bj4Rx3r7o04RwNH+bRV9UnSJNtXIVIawuGMX6TrGMVaKo2LT
         Gwf4ILjop3azbODRIGeNzZxn1HiqRi8eRbIG0UgL0s2xtO91f+q2yZVeFMYiDeMhf7/w
         Hhl7A6LDFFWgZWpm7Mzcz0taKqISDkgTfLPOAEihsgNflH17LV9T/yLnxtaX2k/3uUnC
         +gT89pKihkrCTb4JBx8vE4k2Z+LEWaDHV4Y/fvL2p1skmaFhxQJ15En666jazIgsPLkE
         rjTQ==
X-Gm-Message-State: AOJu0YxEQtvrNPg+QUAVS7eBBU/XgVrHX0kh70x6vfq5RKFdMwr2zaWj
	z81FPqcCkSR6QBKPMC0tVjCKvO6hvKyI3YzQLf8zudfGFJWq6H6Y05lAswil7aM=
X-Google-Smtp-Source: AGHT+IHYqmmOj/jm6/YE87uOWnTTJmdQU5S5Y09QrP2XqrtjcVjmfsAKRuT5+JOGOfU1YuvVdxDGCA==
X-Received: by 2002:aca:2806:0:b0:3c9:66f2:69c0 with SMTP id 5614622812f47-3c9971d9509mr14382791b6e.55.1715748774095;
        Tue, 14 May 2024 21:52:54 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:53 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 28/31] Staging: rtl8192e: Rename variable IsQoSDataFrame
Date: Tue, 14 May 2024 21:52:25 -0700
Message-Id: <20240515045228.35928-29-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable IsQoSDataFrame to is_qos_data_frame
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 9b0a981f6f22..36a734ded7dc 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -625,7 +625,7 @@ EXPORT_SYMBOL(HT_update_self_and_peer_setting);
 u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame)
 {
 	if (ieee->ht_info->current_ht_support) {
-		if ((IsQoSDataFrame(pFrame) && frame_order(pFrame)) == 1) {
+		if ((is_qos_data_frame(pFrame) && frame_order(pFrame)) == 1) {
 			netdev_dbg(ieee->dev, "HT CONTROL FILED EXIST!!\n");
 			return true;
 		}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ca69bb0965ba..e2695beaf582 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -340,7 +340,7 @@ enum rt_op_mode {
 #define	FC_QOS_BIT					BIT(7)
 #define is_data_frame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
 #define	is_legacy_data_frame(pdu)	(is_data_frame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
-#define IsQoSDataFrame(pframe)			\
+#define is_qos_data_frame(pframe)			\
 	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
 	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
 #define frame_order(pframe)     (*(u16 *)pframe&IEEE80211_FCTL_ORDER)
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index fe72149aa81c..976e8b4da1d4 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1322,7 +1322,7 @@ static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb
 
 	/* Get TS for Rx Reorder  */
 	hdr = (struct ieee80211_hdr *)skb->data;
-	if (ieee->current_network.qos_data.active && IsQoSDataFrame(skb->data)
+	if (ieee->current_network.qos_data.active && is_qos_data_frame(skb->data)
 		&& !is_multicast_ether_addr(hdr->addr1)) {
 		TID = frame_qos_tid(skb->data);
 		SeqNum = WLAN_GET_SEQ_SEQ(sc);
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 1aeb207a3fee..b1bde5c0050a 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -275,7 +275,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
-	if (!IsQoSDataFrame(skb->data))
+	if (!is_qos_data_frame(skb->data))
 		return;
 	if (is_multicast_ether_addr(hdr->addr1))
 		return;
@@ -472,7 +472,7 @@ static u16 rtllib_query_seqnum(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	if (is_multicast_ether_addr(dst))
 		return 0;
-	if (IsQoSDataFrame(skb->data)) {
+	if (is_qos_data_frame(skb->data)) {
 		struct tx_ts_record *ts = NULL;
 
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)(&ts), dst,
-- 
2.30.2

