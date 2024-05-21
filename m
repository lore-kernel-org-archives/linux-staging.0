Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD83C78B60
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261465; cv=none; b=fQ16oqx/NDbv1qyJGc3x5+EAI9VdYUicFpWIf5Jl3SSp9TsZSYyLLN8gUbHE4qcJP73zDPR2ImMgE+CpZ4bSq9PEch4SdZv2f5Ttc4pCVk3/U/yeJb4/YJMcLtSIgLF2NOkz9zqWnb1Jz44krhKtSwfjS4XkUPnYziaQX95fBFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261465; c=relaxed/simple;
	bh=WpyAz4wfmdfSZALVu3DB4xV0NpQuAtGDfjdRDPjwzzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jJ2AW0GDAPXwro3yk2Qazg64Ir/hewEKGi6b1R6on1bD97UNGITitBvf6cJsQ1cG0NbmNsXCqAhI0m1gexKtFt8mspyGahAdSrMgXI4a9z5slNlmJ8ZTYkyRf1TLJ/UFbsrkzrkUtAKN2sG3kPVuHGpSzGeJ2Txetl3opZiFCzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=OXpFZ/aS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="OXpFZ/aS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ed835f3c3cso27702805ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261463; x=1716866263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yp9yXgV9Klh/+mkE2OY5ZmNDFLPm1WNDo65CGEwjjY=;
        b=OXpFZ/aStPT6Ykh4V3aopGyMaSjtpb8jgJsSXCITAZSizThEpslFprGLNrXc+bScfU
         CkdoCql9lVzs6JGUJyoURObqRljhXS/UGMHgXSoMYqVnYoSHrdNlqPdUJLL1qJ6xOvGW
         6fefnsZkPY0ST0eefj2nhwZkkJyg5o9I0MetOU+RSqo/tooLZJWMEbmISWwge2CCBnfY
         klk/YcujhdPp3yTBtYerq3d/BTwVHol4IvzFhpDDaJzUifQIrivSF1lsrmyBJXrUOM6N
         SrIT+cLSu4lujxYmHdkSgDeXx5cPI/ArMquaRBLQt2x4QlkpH7qWW2wOOJ8jClk+Ps+A
         lgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261463; x=1716866263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yp9yXgV9Klh/+mkE2OY5ZmNDFLPm1WNDo65CGEwjjY=;
        b=AS5CaGOAr9rmiyOvMmLxKs3lghs+RgpvQNlMS6BgSeUp8GbvJwAempj4ah6yXucWO4
         y8PlHDYyO+hwNQDLifsu9fN/vY+lXrX7utrS4K/qOGXhajUhLkqP5qpnpGVTsCoW48L8
         VD4HV9DXJYUVAsM1KSfTzZNb3q1ThEO3tbqgLUSv4Z3Ug9e92G6FTebaZKJaDw4XHTAq
         RR+prF8iU/tymITKVu/z1xHiMYlYjVuHGgl7pNBN7w4ckTgX1SJOfNDhiezHg/CRBPJa
         diJ2vnknLWJsbB8AcmlytAr7g27e2aGNUJU2gfcIkbsnUg6qPixFtCzVdlobGJKkUO3y
         licQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA54+BO2F7q/IAf9cIZ7Y7QhL3ERlCQv/omHisdl84eZgJMzJkvr4nQIwMSIbmpbvkvw2ZfJrLRrReSMu9iyxHPyGwmNKKuJAfzJayDw==
X-Gm-Message-State: AOJu0YyuXYiL/GHVsdgm40SI5X1bXGUV0YAqZdXjMekui7SQfI8NfCSI
	yl3Tf/LmBlb20fVnrwcH5v++tkxQXFG27N5Cf/0Un9TyTjQziR1+pXrrak47tjI=
X-Google-Smtp-Source: AGHT+IHs6mSWS6UdBkpPE/OJN4puMJl+wlxrOdvXDxZwnag1VOT2ZFK/LfZ1pCZ+djJMxnGbyCbwNA==
X-Received: by 2002:a17:902:c942:b0:1f2:f3dc:43ee with SMTP id d9443c01a7336-1f2f3dc4ddbmr85796915ad.3.1716261463134;
        Mon, 20 May 2024 20:17:43 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:42 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 28/31] Staging: rtl8192e: Rename variable IsQoSDataFrame
Date: Mon, 20 May 2024 20:17:15 -0700
Message-Id: <20240521031718.17852-29-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
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
v2: No change.
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
index 3e8ee1335c24..4d4a4a830470 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1319,7 +1319,7 @@ static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb
 
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

