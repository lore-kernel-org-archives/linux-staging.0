Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A82C11CB1
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:07:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe4f3b5f25so6766075e9.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794025; x=1695398825; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n2PHM1eEcsGJe5Q3fmJzIu7/A4Sy54TXuvy1bSnpta0=;
        b=LzmyKNXzIom+WfGpoz3lQK8n34Y5Bv6+w18JYTFdCJqwt50jNR4UD5QNSAlhmpiSnN
         uhicrl3OqnoZBVVbKhDBE7BLYFYCexKtEvrwCgz2XhkL7dWq72UHDxSqrCVHT1dlA01q
         V9QYh0R2W106dil8JtTJHdQswkRr6qqiUThu8s+KsD5BGOjym7XGfnCdRSOZZfSJrv9u
         HXwviwKQePAo2ROkNJPK7YwdZ7LFLJqvMl1tO8vvOu2Vban7TlETz0e3D1SiFvZtPFyH
         7jjdCXPsfDkd1XyWMb3t8RIwcra6sHYSOzW75VVIEgkeS1hm7acloEj8phySXWijnuwR
         96Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794025; x=1695398825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2PHM1eEcsGJe5Q3fmJzIu7/A4Sy54TXuvy1bSnpta0=;
        b=sUCmu8bD6hCowLRIxfw9Wynn5cuoi/kKkfDKwQrt9vdB0PmZDMn35cMCJ5ReNu1SYr
         MJlG6332ssMQBKjoMwKnIkdn/jIRh0YWEMT1aPmVDHwlx/RZNf7K0b7RtSIp9gGjlTYX
         iLaH0/q42FYEta794SeuoxKtJ1kWa+53fLK1d5XiyyxZFLRYKXTe+vsPt+q9sv/kfNEk
         8MqYOFS9KZOFqdjAllQEJWsN0tUO+5Nidwl+AoXxp2+mpZAS6+/LC7/zRk0JCZljs07+
         ytXsgvbFxlBsta06M0OrC4Rx+0iw1ouLa8uZYJgwJafGC41beKGKE9RFUpHV9Rt+pjbM
         P2FQ==
X-Gm-Message-State: AOJu0YzczDnijCqcvPELwcj/EYxrFW21qdYGEtv6DjAOUzeC6zHb/Os8
	NMk9HnIFfzdQfawA5NbNOxM=
X-Google-Smtp-Source: AGHT+IF/ijfQPAUagQMR9utW7X9u3hMyteF1L/EmpYSHvLiidP3LzggjkFTr7qZE13hRNbBkeUFYiA==
X-Received: by 2002:a05:600c:1da9:b0:404:72f9:d59a with SMTP id p41-20020a05600c1da900b0040472f9d59amr1957402wms.0.1694794024864;
        Fri, 15 Sep 2023 09:07:04 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003feee8d8011sm7943810wmj.41.2023.09.15.09.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:07:04 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:07:03 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] staging: rtl8192e: Replace struct rtllib_hdr_3addr in
 rtllib_softmac.c
Message-ID: <8e385d0810132086ce44d295c47d3798960a391b.1694792595.git.philipp.g.hortmann@gmail.com>
References: <cover.1694792595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694792595.git.philipp.g.hortmann@gmail.com>

Replace struct rtllib_hdr_3addr with struct ieee80211_hdr_3addr to avoid
proprietary struct.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 50 +++++++++++------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 904be0ef867f..e3b15fa0edcb 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -187,8 +187,8 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 {
 	unsigned long flags;
 	short single = ieee->softmac_features & IEEE_SOFTMAC_SINGLE_QUEUE;
-	struct rtllib_hdr_3addr  *header =
-		(struct rtllib_hdr_3addr  *)skb->data;
+	struct ieee80211_hdr_3addr  *header =
+		(struct ieee80211_hdr_3addr  *)skb->data;
 
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb + 8);
 
@@ -197,7 +197,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 	/* called with 2nd param 0, no mgmt lock required */
 	rtllib_sta_wakeup(ieee, 0);
 
-	if (ieee80211_is_beacon(header->frame_ctl))
+	if (ieee80211_is_beacon(header->frame_control))
 		tcb_desc->queue_index = BEACON_QUEUE;
 	else
 		tcb_desc->queue_index = MGNT_QUEUE;
@@ -213,7 +213,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 		if (ieee->queue_stop) {
 			enqueue_mgmt(ieee, skb);
 		} else {
-			header->seq_ctl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
+			header->seq_ctrl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
 
 			if (ieee->seq_ctrl[0] == 0xFFF)
 				ieee->seq_ctrl[0] = 0;
@@ -230,7 +230,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 		spin_unlock_irqrestore(&ieee->lock, flags);
 		spin_lock_irqsave(&ieee->mgmt_tx_lock, flags);
 
-		header->seq_ctl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
+		header->seq_ctrl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
 
 		if (ieee->seq_ctrl[0] == 0xFFF)
 			ieee->seq_ctrl[0] = 0;
@@ -264,12 +264,12 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
 		     struct rtllib_device *ieee)
 {
 	short single = ieee->softmac_features & IEEE_SOFTMAC_SINGLE_QUEUE;
-	struct rtllib_hdr_3addr  *header =
-		(struct rtllib_hdr_3addr  *)skb->data;
+	struct ieee80211_hdr_3addr  *header =
+		(struct ieee80211_hdr_3addr  *)skb->data;
 	u16 fc, type, stype;
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb + 8);
 
-	fc = le16_to_cpu(header->frame_ctl);
+	fc = le16_to_cpu(header->frame_control);
 	type = WLAN_FC_GET_TYPE(fc);
 	stype = WLAN_FC_GET_STYPE(fc);
 
@@ -287,7 +287,7 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
 	tcb_desc->tx_use_drv_assinged_rate = 1;
 	if (single) {
 		if (type != RTLLIB_FTYPE_CTL) {
-			header->seq_ctl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
+			header->seq_ctrl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
 
 			if (ieee->seq_ctrl[0] == 0xFFF)
 				ieee->seq_ctrl[0] = 0;
@@ -300,7 +300,7 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
 
 	} else {
 		if (type != RTLLIB_FTYPE_CTL) {
-			header->seq_ctl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
+			header->seq_ctrl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
 
 			if (ieee->seq_ctrl[0] == 0xFFF)
 				ieee->seq_ctrl[0] = 0;
@@ -912,21 +912,21 @@ static struct sk_buff *rtllib_probe_resp(struct rtllib_device *ieee,
 static struct sk_buff *rtllib_null_func(struct rtllib_device *ieee, short pwr)
 {
 	struct sk_buff *skb;
-	struct rtllib_hdr_3addr *hdr;
+	struct ieee80211_hdr_3addr *hdr;
 
-	skb = dev_alloc_skb(sizeof(struct rtllib_hdr_3addr) + ieee->tx_headroom);
+	skb = dev_alloc_skb(sizeof(struct ieee80211_hdr_3addr) + ieee->tx_headroom);
 	if (!skb)
 		return NULL;
 
 	skb_reserve(skb, ieee->tx_headroom);
 
-	hdr = skb_put(skb, sizeof(struct rtllib_hdr_3addr));
+	hdr = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
 
 	ether_addr_copy(hdr->addr1, ieee->current_network.bssid);
 	ether_addr_copy(hdr->addr2, ieee->dev->dev_addr);
 	ether_addr_copy(hdr->addr3, ieee->current_network.bssid);
 
-	hdr->frame_ctl = cpu_to_le16(RTLLIB_FTYPE_DATA |
+	hdr->frame_control = cpu_to_le16(RTLLIB_FTYPE_DATA |
 		RTLLIB_STYPE_NULLFUNC | RTLLIB_FCTL_TODS |
 		(pwr ? RTLLIB_FCTL_PM : 0));
 
@@ -1311,7 +1311,7 @@ static void rtllib_auth_challenge(struct rtllib_device *ieee, u8 *challenge,
 			   "Sending authentication challenge response\n");
 
 		rtllib_encrypt_fragment(ieee, skb,
-					sizeof(struct rtllib_hdr_3addr));
+					sizeof(struct ieee80211_hdr_3addr));
 
 		softmac_mgmt_xmit(skb, ieee);
 		mod_timer(&ieee->associate_timer, jiffies + (HZ / 2));
@@ -1620,11 +1620,11 @@ static short probe_rq_parse(struct rtllib_device *ieee, struct sk_buff *skb,
 	u8 *skbend;
 	u8 *ssid = NULL;
 	u8 ssidlen = 0;
-	struct rtllib_hdr_3addr   *header =
-		(struct rtllib_hdr_3addr   *)skb->data;
+	struct ieee80211_hdr_3addr   *header =
+		(struct ieee80211_hdr_3addr   *)skb->data;
 	bool bssid_match;
 
-	if (skb->len < sizeof(struct rtllib_hdr_3addr))
+	if (skb->len < sizeof(struct ieee80211_hdr_3addr))
 		return -1; /* corrupted */
 
 	bssid_match =
@@ -1637,7 +1637,7 @@ static short probe_rq_parse(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	skbend = (u8 *)skb->data + skb->len;
 
-	tag = skb->data + sizeof(struct rtllib_hdr_3addr);
+	tag = skb->data + sizeof(struct ieee80211_hdr_3addr);
 
 	while (tag + 1 < skbend) {
 		if (*tag == 0) {
@@ -1953,8 +1953,8 @@ rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 	int aid;
 	u8 *ies;
 	struct rtllib_assoc_response_frame *assoc_resp;
-	struct rtllib_hdr_3addr *header = (struct rtllib_hdr_3addr *)skb->data;
-	u16 frame_ctl = le16_to_cpu(header->frame_ctl);
+	struct ieee80211_hdr_3addr *header = (struct ieee80211_hdr_3addr *)skb->data;
+	u16 frame_ctl = le16_to_cpu(header->frame_control);
 
 	netdev_dbg(ieee->dev, "received [RE]ASSOCIATION RESPONSE (%d)\n",
 		   WLAN_FC_GET_STYPE(frame_ctl));
@@ -2092,7 +2092,7 @@ rtllib_rx_auth(struct rtllib_device *ieee, struct sk_buff *skb,
 static inline int
 rtllib_rx_deauth(struct rtllib_device *ieee, struct sk_buff *skb)
 {
-	struct rtllib_hdr_3addr *header = (struct rtllib_hdr_3addr *)skb->data;
+	struct ieee80211_hdr_3addr *header = (struct ieee80211_hdr_3addr *)skb->data;
 	u16 frame_ctl;
 
 	if (memcmp(header->addr3, ieee->current_network.bssid, ETH_ALEN) != 0)
@@ -2104,7 +2104,7 @@ rtllib_rx_deauth(struct rtllib_device *ieee, struct sk_buff *skb)
 	if ((ieee->softmac_features & IEEE_SOFTMAC_ASSOCIATE) &&
 	    ieee->link_state == MAC80211_LINKED &&
 	    (ieee->iw_mode == IW_MODE_INFRA)) {
-		frame_ctl = le16_to_cpu(header->frame_ctl);
+		frame_ctl = le16_to_cpu(header->frame_control);
 		netdev_info(ieee->dev,
 			    "==========>received disassoc/deauth(%x) frame, reason code:%x\n",
 			    WLAN_FC_GET_STYPE(frame_ctl),
@@ -2128,13 +2128,13 @@ inline int rtllib_rx_frame_softmac(struct rtllib_device *ieee,
 				   struct rtllib_rx_stats *rx_stats, u16 type,
 				   u16 stype)
 {
-	struct rtllib_hdr_3addr *header = (struct rtllib_hdr_3addr *)skb->data;
+	struct ieee80211_hdr_3addr *header = (struct ieee80211_hdr_3addr *)skb->data;
 	u16 frame_ctl;
 
 	if (!ieee->proto_started)
 		return 0;
 
-	frame_ctl = le16_to_cpu(header->frame_ctl);
+	frame_ctl = le16_to_cpu(header->frame_control);
 	switch (WLAN_FC_GET_STYPE(frame_ctl)) {
 	case RTLLIB_STYPE_ASSOC_RESP:
 	case RTLLIB_STYPE_REASSOC_RESP:
-- 
2.42.0

