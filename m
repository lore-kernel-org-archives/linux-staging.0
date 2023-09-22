Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F827707
	for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 13:29:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40471c054f9so6727665e9.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389371; x=1695994171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvA1NhHU9wJadRFvynpx4VWVmQWw3BozI/MwraHbSoM=;
        b=Vq3X3ZZHxs46VHN8VtHJoh7/iVDJGbaPC2z1uXOlwLqz4YC0Kjrg4RRFsgazopRfhJ
         VHYY9JsyVWTvm6i7riG6/gk/6VIG+GDorCaj1GTpISN/u+9zz23Rys/wJ19nAJdQ+bkN
         TikM8F0gR/I8kZ+6EW+sofGBplScQULe3oQk0sVMeRGHKupraN4WDX3X19cf8x6UwKuL
         q5+eyvOm/DGyBAhplwyR4vuSRlmlQ5DHLGaip4qID3bTjisGsBKKePgnhDOGRH7qb3tt
         4BjI5EXqyTwaNFAbz/OoXvLcOWMhvgjIDeNPfGgANK1GeHbQihYvy+hT181LYaScFEhN
         XIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389371; x=1695994171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvA1NhHU9wJadRFvynpx4VWVmQWw3BozI/MwraHbSoM=;
        b=cAPb7ase40zz+gOElMyKcUav4dCx838ZMw+1izKLeYx8IqDkisuymG29LsqonBJ6a9
         Uc5dMR0oifm5AqDydSayzS86eGtf78ILHq4B4VcFNY++zI1umoqDRqApbFxzUXAzNzLh
         FaJkgC57uswQNIskw+wn57Ejr+n4PxZg/W1lM08kHhx6J03DdaJ18FVWdlpTBS4qxwHk
         tls9gJTjRhJjk4XCYtwXnxESHZBkQ7aA3Grb723xx2YWq1HO/DXr2tmvCQc7xMiHratT
         kLl/mpXiCTuZ2L98L862DRVGj1Y2mh0h3V9anT6WgPZMJivhHDU0J6UBUOF8JS0Zg3+t
         Zd7A==
X-Gm-Message-State: AOJu0Ywb9Fm9sS/wP4PMuCdD2rN2A9UTQ1K2W6h8VB6ebKSQHA6sjCUV
	lxbYbwoXoAFtB+p3zbvSvs31NE3OIdQmXQ==
X-Google-Smtp-Source: AGHT+IEniLWtAPga448LSVQoAKXwyP5aeYgyiMzuiODW6HLhdZzfHgDiUZm2Btw7IYjhooFgjvjpRw==
X-Received: by 2002:a05:600c:cc8:b0:401:c07f:72bd with SMTP id fk8-20020a05600c0cc800b00401c07f72bdmr7905417wmb.4.1695389370547;
        Fri, 22 Sep 2023 06:29:30 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id ay2-20020a05600c1e0200b003feea62440bsm1161020wmb.43.2023.09.22.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:29:30 -0700 (PDT)
Date: Fri, 22 Sep 2023 15:29:28 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] staging: rtl8192e: Remove mode IW_MODE_ADHOC from
 rtllib_rx.c
Message-ID: <5400c68e17b86b1170ac997fae3fe1fb09220af8.1695387832.git.philipp.g.hortmann@gmail.com>
References: <cover.1695387832.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695387832.git.philipp.g.hortmann@gmail.com>

Remove unsupported mode IW_MODE_ADHOC from rtllib_rx.c and all related
functions and structs.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         |  9 ----
 drivers/staging/rtl8192e/rtllib_rx.c      | 38 -------------
 drivers/staging/rtl8192e/rtllib_softmac.c | 65 -----------------------
 3 files changed, 112 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 2a2eec192198..7dde428313c9 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -466,13 +466,6 @@ enum _REG_PREAMBLE_MODE {
 
 /* this is stolen from ipw2200 driver */
 #define IEEE_IBSS_MAC_HASH_SIZE 31
-struct ieee_ibss_seq {
-	u8 mac[ETH_ALEN];
-	u16 seq_num[17];
-	u16 frag_num[17];
-	unsigned long packet_time[17];
-	struct list_head list;
-};
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
  *       information for frames received.  Not setting these will not cause
@@ -1676,8 +1669,6 @@ void rtllib_txb_free(struct rtllib_txb *txb);
 /* rtllib_rx.c */
 int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 	      struct rtllib_rx_stats *rx_stats);
-void rtllib_rx_probe_rq(struct rtllib_device *ieee,
-			struct sk_buff *skb);
 int rtllib_legal_channel(struct rtllib_device *rtllib, u8 channel);
 
 /* rtllib_wx.c */
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index cba460c46285..456dd05e291d 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -375,37 +375,6 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 	}
 
 	switch (ieee->iw_mode) {
-	case IW_MODE_ADHOC:
-	{
-		struct list_head *p;
-		struct ieee_ibss_seq *entry = NULL;
-		u8 *mac = header->addr2;
-		int index = mac[5] % IEEE_IBSS_MAC_HASH_SIZE;
-
-		list_for_each(p, &ieee->ibss_mac_hash[index]) {
-			entry = list_entry(p, struct ieee_ibss_seq, list);
-			if (!memcmp(entry->mac, mac, ETH_ALEN))
-				break;
-		}
-		if (p == &ieee->ibss_mac_hash[index]) {
-			entry = kmalloc(sizeof(struct ieee_ibss_seq),
-					GFP_ATOMIC);
-			if (!entry)
-				return 0;
-
-			ether_addr_copy(entry->mac, mac);
-			entry->seq_num[tid] = seq;
-			entry->frag_num[tid] = frag;
-			entry->packet_time[tid] = jiffies;
-			list_add(&entry->list, &ieee->ibss_mac_hash[index]);
-			return 0;
-		}
-		last_seq = &entry->seq_num[tid];
-		last_frag = &entry->frag_num[tid];
-		last_time = &entry->packet_time[tid];
-		break;
-	}
-
 	case IW_MODE_INFRA:
 		last_seq = &ieee->last_rxseq_num[tid];
 		last_frag = &ieee->last_rxfrag_num[tid];
@@ -1487,7 +1456,6 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 	}
 
 	switch (ieee->iw_mode) {
-	case IW_MODE_ADHOC:
 	case IW_MODE_INFRA:
 		ret = rtllib_rx_InfraAdhoc(ieee, skb, rx_stats);
 		break;
@@ -2654,11 +2622,5 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 		netdev_dbg(ieee->dev, "received PROBE RESPONSE\n");
 		rtllib_process_probe_response(ieee,
 			      (struct rtllib_probe_response *)header, stats);
-	} else if (ieee80211_is_probe_req(header->frame_control)) {
-		netdev_dbg(ieee->dev, "received PROBE REQUEST\n");
-		if ((ieee->softmac_features & IEEE_SOFTMAC_PROBERS) &&
-		    (ieee->iw_mode == IW_MODE_ADHOC &&
-		    ieee->link_state == MAC80211_LINKED))
-			rtllib_rx_probe_rq(ieee, skb);
 	}
 }
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 61afce587812..d8d9d59664ed 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -956,14 +956,6 @@ static struct sk_buff *rtllib_pspoll_func(struct rtllib_device *ieee)
 	return skb;
 }
 
-static void rtllib_resp_to_probe(struct rtllib_device *ieee, u8 *dest)
-{
-	struct sk_buff *buf = rtllib_probe_resp(ieee, dest);
-
-	if (buf)
-		softmac_mgmt_xmit(buf, ieee);
-}
-
 static inline int SecIsInPMKIDList(struct rtllib_device *ieee, u8 *bssid)
 {
 	int i = 0;
@@ -1613,52 +1605,6 @@ static inline int auth_parse(struct net_device *dev, struct sk_buff *skb,
 	return 0;
 }
 
-static short probe_rq_parse(struct rtllib_device *ieee, struct sk_buff *skb,
-			    u8 *src)
-{
-	u8 *tag;
-	u8 *skbend;
-	u8 *ssid = NULL;
-	u8 ssidlen = 0;
-	struct ieee80211_hdr_3addr   *header =
-		(struct ieee80211_hdr_3addr   *)skb->data;
-	bool bssid_match;
-
-	if (skb->len < sizeof(struct ieee80211_hdr_3addr))
-		return -1; /* corrupted */
-
-	bssid_match =
-	  (!ether_addr_equal(header->addr3, ieee->current_network.bssid)) &&
-	  (!is_broadcast_ether_addr(header->addr3));
-	if (bssid_match)
-		return -1;
-
-	ether_addr_copy(src, header->addr2);
-
-	skbend = (u8 *)skb->data + skb->len;
-
-	tag = skb->data + sizeof(struct ieee80211_hdr_3addr);
-
-	while (tag + 1 < skbend) {
-		if (*tag == 0) {
-			ssid = tag + 2;
-			ssidlen = *(tag + 1);
-			break;
-		}
-		tag++; /* point to the len field */
-		tag = tag + *(tag); /* point to the last data byte of the tag */
-		tag++; /* point to the next tag */
-	}
-
-	if (ssidlen == 0)
-		return 1;
-
-	if (!ssid)
-		return 1; /* ssid not found in tagged param */
-
-	return !strncmp(ssid, ieee->current_network.ssid, ssidlen);
-}
-
 static inline u16 assoc_parse(struct rtllib_device *ieee, struct sk_buff *skb,
 			      int *aid)
 {
@@ -1688,17 +1634,6 @@ static inline u16 assoc_parse(struct rtllib_device *ieee, struct sk_buff *skb,
 	return le16_to_cpu(response_head->status);
 }
 
-void rtllib_rx_probe_rq(struct rtllib_device *ieee, struct sk_buff *skb)
-{
-	u8 dest[ETH_ALEN];
-
-	ieee->softmac_stats.rx_probe_rq++;
-	if (probe_rq_parse(ieee, skb, dest) > 0) {
-		ieee->softmac_stats.tx_probe_rs++;
-		rtllib_resp_to_probe(ieee, dest);
-	}
-}
-
 void rtllib_sta_ps_send_null_frame(struct rtllib_device *ieee, short pwr)
 {
 	struct sk_buff *buf = rtllib_null_func(ieee, pwr);
-- 
2.42.0

