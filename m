Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519011C8D
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:09:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-404724ec0dcso4975725e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794160; x=1695398960; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABHro1WbVSv9M1mp1iSF234oY2ZCcRBRXlCCIHJK3dU=;
        b=IM/OCYwEuefXvWleIazTVhpGsMlVBx9X9JBxu9eDtRBeywjec6J9T5dfvitozt4S8r
         UAPQNuCwFdNUsuHbLrYcYegNM81saJ5thRk9+KAEMxI90Bj4aUDCUypx6JvTed/6gNJy
         ppTDZ/HyYZgX2RbO43vBuLHZ4NEtZeZSUnCqqDS7oJd9eo3fw1yt1ApsRHZDzhzIpbhp
         nJLp9BbVdKPmXerO00W+DQFlr6YYcrg9BQnhcyMcotzN2lwz8PYmZED55NV8V/xifs8O
         A+R7jFXJr/Haq/j3ZvZst0hpgqzKerYAOp0pnDriy2KK34ov/9hSKAUNVylatR3O4g77
         8CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794160; x=1695398960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABHro1WbVSv9M1mp1iSF234oY2ZCcRBRXlCCIHJK3dU=;
        b=Ofu3jxyWBYj//07BfU96s+Jm9R6gbD2Qa/f8vqMrBUfl5TRzVfN7gGJAB8Ixt2FLJU
         pVoQh+T8wIeYWe4MXM6nZ+o3ha/2taXVB+fCg64ylGSRfISAk6i63QDQahHbTEOr4fcq
         e95bk4jECCQodM1eLdOgqROGmmDC6Vi/JZdl79fGTOluIttQE4RcCrEJ3s5R09Mmt0kR
         KWFpns0cfsYRFNI93So4u5+DrT+HfXJ/33CZzToov5kBlTNBNoDnPCsxeRqxpjS0uEDa
         I6Q30z+Z55QoUXz+w916rpwPPtEEg2wLvpefpY762HwgQ2hAsCoXV5jEAk3NWGcOuDM5
         BFNg==
X-Gm-Message-State: AOJu0Yzb+9qXt6HxgbHJUVIMDi9inWmwMuz8wTC6a76Xf7BmzghlNnyU
	eC8zleTikKNWcwCq9UglRXeLOSQa9DRYjg==
X-Google-Smtp-Source: AGHT+IHCEiDjU07u0tGx9Pyzk8I6wtgw2o7MegPhc89b8M2XnCyb0Aa32kumf3Tk5DNm3vYcpxXEFw==
X-Received: by 2002:a05:600c:5106:b0:3fe:d637:7b25 with SMTP id o6-20020a05600c510600b003fed6377b25mr2002791wms.0.1694794160276;
        Fri, 15 Sep 2023 09:09:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n7-20020a7bcbc7000000b003fef3180e7asm7827085wmi.44.2023.09.15.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:09:20 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:09:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/16] staging: rtl8192e: Remove struct rtllib_hdr_3addrqos
Message-ID: <f9c52f9822075476d491b2f1061af51a4b818f3a.1694792595.git.philipp.g.hortmann@gmail.com>
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

Replace struct rtllib_hdr_3addrqos with struct ieee80211_qos_hdr to avoid
proprietary code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h    | 11 -----------
 drivers/staging/rtl8192e/rtllib_rx.c | 18 +++++++++---------
 drivers/staging/rtl8192e/rtllib_tx.c | 22 +++++++++++-----------
 3 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index dfdc45d06365..e73292201e3a 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -679,17 +679,6 @@ struct rtllib_pspoll_hdr {
 	u8 ta[ETH_ALEN];
 } __packed;
 
-struct rtllib_hdr_3addrqos {
-	__le16 frame_ctl;
-	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN];
-	u8 addr3[ETH_ALEN];
-	__le16 seq_ctl;
-	__le16 qos_ctl;
-	u8 payload[];
-} __packed;
-
 struct rtllib_hdr_4addrqos {
 	__le16 frame_ctl;
 	__le16 duration_id;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 05d1d47bed47..265a718a20a4 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -93,7 +93,7 @@ rtllib_frag_cache_get(struct rtllib_device *ieee,
 	unsigned int frag = WLAN_GET_SEQ_FRAG(sc);
 	unsigned int seq = WLAN_GET_SEQ_SEQ(sc);
 	struct rtllib_frag_entry *entry;
-	struct rtllib_hdr_3addrqos *hdr_3addrqos;
+	struct ieee80211_qos_hdr *hdr_3addrqos;
 	struct rtllib_hdr_4addrqos *hdr_4addrqos;
 	u8 tid;
 
@@ -104,8 +104,8 @@ rtllib_frag_cache_get(struct rtllib_device *ieee,
 		tid = UP2AC(tid);
 		tid++;
 	} else if (RTLLIB_QOS_HAS_SEQ(fc)) {
-		hdr_3addrqos = (struct rtllib_hdr_3addrqos *)hdr;
-		tid = le16_to_cpu(hdr_3addrqos->qos_ctl) & RTLLIB_QCTL_TID;
+		hdr_3addrqos = (struct ieee80211_qos_hdr *)hdr;
+		tid = le16_to_cpu(hdr_3addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
 		tid = UP2AC(tid);
 		tid++;
 	} else {
@@ -162,7 +162,7 @@ static int rtllib_frag_cache_invalidate(struct rtllib_device *ieee,
 	u16 sc = le16_to_cpu(hdr->seq_ctrl);
 	unsigned int seq = WLAN_GET_SEQ_SEQ(sc);
 	struct rtllib_frag_entry *entry;
-	struct rtllib_hdr_3addrqos *hdr_3addrqos;
+	struct ieee80211_qos_hdr *hdr_3addrqos;
 	struct rtllib_hdr_4addrqos *hdr_4addrqos;
 	u8 tid;
 
@@ -173,8 +173,8 @@ static int rtllib_frag_cache_invalidate(struct rtllib_device *ieee,
 		tid = UP2AC(tid);
 		tid++;
 	} else if (RTLLIB_QOS_HAS_SEQ(fc)) {
-		hdr_3addrqos = (struct rtllib_hdr_3addrqos *)hdr;
-		tid = le16_to_cpu(hdr_3addrqos->qos_ctl) & RTLLIB_QCTL_TID;
+		hdr_3addrqos = (struct ieee80211_qos_hdr *)hdr;
+		tid = le16_to_cpu(hdr_3addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
 		tid = UP2AC(tid);
 		tid++;
 	} else {
@@ -355,7 +355,7 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 	u16 frag = WLAN_GET_SEQ_FRAG(sc);
 	u16 *last_seq, *last_frag;
 	unsigned long *last_time;
-	struct rtllib_hdr_3addrqos *hdr_3addrqos;
+	struct ieee80211_qos_hdr *hdr_3addrqos;
 	struct rtllib_hdr_4addrqos *hdr_4addrqos;
 	u8 tid;
 
@@ -366,8 +366,8 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 		tid = UP2AC(tid);
 		tid++;
 	} else if (RTLLIB_QOS_HAS_SEQ(fc)) {
-		hdr_3addrqos = (struct rtllib_hdr_3addrqos *)header;
-		tid = le16_to_cpu(hdr_3addrqos->qos_ctl) & RTLLIB_QCTL_TID;
+		hdr_3addrqos = (struct ieee80211_qos_hdr *)header;
+		tid = le16_to_cpu(hdr_3addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
 		tid = UP2AC(tid);
 		tid++;
 	} else {
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index a244a072e551..4b730b2c9fef 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -544,17 +544,17 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 	struct rtllib_device *ieee = (struct rtllib_device *)
 				     netdev_priv_rsl(dev);
 	struct rtllib_txb *txb = NULL;
-	struct rtllib_hdr_3addrqos *frag_hdr;
+	struct ieee80211_qos_hdr *frag_hdr;
 	int i, bytes_per_frag, nr_frags, bytes_last_frag, frag_size;
 	unsigned long flags;
 	struct net_device_stats *stats = &ieee->stats;
 	int ether_type = 0, encrypt;
 	int bytes, fc, qos_ctl = 0, hdr_len;
 	struct sk_buff *skb_frag;
-	struct rtllib_hdr_3addrqos header = { /* Ensure zero initialized */
+	struct ieee80211_qos_hdr header = { /* Ensure zero initialized */
 		.duration_id = 0,
-		.seq_ctl = 0,
-		.qos_ctl = 0
+		.seq_ctrl = 0,
+		.qos_ctrl = 0
 	};
 	int qos_activated = ieee->current_network.qos_data.active;
 	u8 dest[ETH_ALEN];
@@ -689,7 +689,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 
 		bIsMulticast = is_multicast_ether_addr(header.addr1);
 
-		header.frame_ctl = cpu_to_le16(fc);
+		header.frame_control = cpu_to_le16(fc);
 
 		/* Determine fragmentation size based on destination (multicast
 		 * and broadcast are not fragmented)
@@ -716,7 +716,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			}
 
 			qos_ctl |= skb->priority;
-			header.qos_ctl = cpu_to_le16(qos_ctl & RTLLIB_QOS_TID);
+			header.qos_ctrl = cpu_to_le16(qos_ctl & RTLLIB_QOS_TID);
 
 		} else {
 			hdr_len = RTLLIB_3ADDR_LEN;
@@ -798,7 +798,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			 * MOREFRAGS bit to the frame control
 			 */
 			if (i != nr_frags - 1) {
-				frag_hdr->frame_ctl = cpu_to_le16(fc |
+				frag_hdr->frame_control = cpu_to_le16(fc |
 								  RTLLIB_FCTL_MOREFRAGS);
 				bytes = bytes_per_frag;
 
@@ -807,13 +807,13 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				bytes = bytes_last_frag;
 			}
 			if ((qos_activated) && (!bIsMulticast)) {
-				frag_hdr->seq_ctl =
+				frag_hdr->seq_ctrl =
 					 cpu_to_le16(rtllib_query_seqnum(ieee, skb_frag,
 									 header.addr1));
-				frag_hdr->seq_ctl =
-					 cpu_to_le16(le16_to_cpu(frag_hdr->seq_ctl) << 4 | i);
+				frag_hdr->seq_ctrl =
+					 cpu_to_le16(le16_to_cpu(frag_hdr->seq_ctrl) << 4 | i);
 			} else {
-				frag_hdr->seq_ctl =
+				frag_hdr->seq_ctrl =
 					 cpu_to_le16(ieee->seq_ctrl[0] << 4 | i);
 			}
 			/* Put a SNAP header on the first fragment */
-- 
2.42.0

