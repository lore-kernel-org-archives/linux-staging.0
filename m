Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A83CCF9
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:34:20 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9ae65c0e46fso53998466b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361659; x=1696966459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UjGjxI6eGVPYNgs9C+/srpj1zkswroX+k2Y9drOlyqk=;
        b=gpMCm4+RvE1uHEkkFNY5BczBw8qIZo2GlaZ4KjfLcNKXjTvZ9t4za7/Ot4ZDIycJYL
         5Qwc+jDOXuuLuL/8Qe9rJ2eBCjlMMb5swtrAYk0Im/JcpNlXocuZzYQfkDkgcdM+g7+k
         HuRuqWC9G2jY9yCjunck2rm+p/iMQWXrEVNUHDD7N8HoHRCYdH+zLhIxWIZCK91VEKsT
         nBHV/2FaLlUZixok6Y/kHnX58DhG8cfGQJLy0LZzSbjFrxRf1y7198hY8r5BXNIPGyiF
         GWPA1ea9lF3OEI2jTFiYWFVsfilklT6gKUYb7ClnUku6WDWJtGuG2pj194zUrUn8zjKO
         Y3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361659; x=1696966459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjGjxI6eGVPYNgs9C+/srpj1zkswroX+k2Y9drOlyqk=;
        b=vJHVSqcz5JiI4G88LNVw6GyIVXpOWvG1SOFZhnS4ABAt76udEl3KnMomVkiCWksBb+
         U6EhNwFrY8TGuU95Vm4Dx/IpiqBh5m/2a1NvpRQb+TDh13PvFR2eYhE2IssSpJHI7H1w
         tfKeNjWJaLNa5aYJRNAFJ1JPfX9atrCs6YZC6PPDIhJZhg3oG0Gh3adPHH+BB95KCTuK
         H850l0NS4IPJ0B1dyCTUmwRSfhfW8VtvX3umQQN0H/pgA8XMsr0GNlMXMb52uSMyHWS/
         27Z1kWYg1CkqTz1uHR0tQv8qjBRwbdhqyN5ddY4X/JHkvumuz3hOp2jEeeyjMwLLqpFN
         pR8w==
X-Gm-Message-State: AOJu0YzyAn8K/y263QMOwhP5QPXLIHdCmlQQ9/WGLGktlKr9y8Xm+X7V
	b0YhMhI0IwBUcP1VseS9fB0=
X-Google-Smtp-Source: AGHT+IF5f6V3BxiM+4giXnCOJ083tdoUbEdsneTHhTD5kdVUh7Xh1UVzbHR+pN1wGFW4hfnKvbB6JQ==
X-Received: by 2002:a17:906:7389:b0:9b2:71f2:bd11 with SMTP id f9-20020a170906738900b009b271f2bd11mr98352ejl.4.1696361659029;
        Tue, 03 Oct 2023 12:34:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709060b4a00b009ae5e46210asm1528773ejg.99.2023.10.03.12.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:34:18 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:34:17 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] staging: rtl8192e: Remove constant variable bToOtherSTA
Message-ID: <ecfcd8bff80d98a4e9a2797535a274625607c699.1696360404.git.philipp.g.hortmann@gmail.com>
References: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696360403.git.philipp.g.hortmann@gmail.com>

Remove variable bToOtherSTA as it is set to 0 and unchanged. The equations
result accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 32 +++++++++++-----------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 9a5fdf16f6a1..124c1651856b 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1244,7 +1244,6 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	u8 bssid[ETH_ALEN] = {0};
 
 	size_t hdrlen = 0;
-	bool bToOtherSTA = false;
 	int ret = 0, i = 0;
 
 	fc = le16_to_cpu(hdr->frame_control);
@@ -1278,8 +1277,6 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	/* Filter MGNT Frame */
 	if (type == RTLLIB_FTYPE_MGMT) {
-		if (bToOtherSTA)
-			goto rx_dropped;
 		if (rtllib_rx_frame_mgmt(ieee, skb, rx_stats, type, stype))
 			goto rx_dropped;
 		else
@@ -1289,10 +1286,8 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/* Filter WAPI DATA Frame */
 
 	/* Update statstics for AP roaming */
-	if (!bToOtherSTA) {
-		ieee->link_detect_info.NumRecvDataInPeriod++;
-		ieee->link_detect_info.NumRxOkInPeriod++;
-	}
+	ieee->link_detect_info.NumRecvDataInPeriod++;
+	ieee->link_detect_info.NumRxOkInPeriod++;
 
 	/* Data frame - extract src/dst addresses */
 	rtllib_rx_extract_addr(ieee, hdr, dst, src, bssid);
@@ -1308,7 +1303,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/* Send pspoll based on moredata */
 	if ((ieee->iw_mode == IW_MODE_INFRA)  &&
 	    (ieee->sta_sleep == LPS_IS_SLEEP) &&
-	    (ieee->polling) && (!bToOtherSTA)) {
+	    (ieee->polling)) {
 		if (WLAN_FC_MORE_DATA(fc)) {
 			/* more data bit is set, let's request a new frame
 			 * from the AP
@@ -1334,8 +1329,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/* Get TS for Rx Reorder  */
 	hdr = (struct ieee80211_hdr *)skb->data;
 	if (ieee->current_network.qos_data.active && IsQoSDataFrame(skb->data)
-		&& !is_multicast_ether_addr(hdr->addr1)
-		&& (!bToOtherSTA)) {
+		&& !is_multicast_ether_addr(hdr->addr1)) {
 		TID = Frame_QoSTID(skb->data);
 		SeqNum = WLAN_GET_SEQ_SEQ(sc);
 		rtllib_get_ts(ieee, (struct ts_common_info **)&ts, hdr->addr2, TID,
@@ -1366,18 +1360,16 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/* Update WAPI PN */
 
 	/* Check if leave LPS */
-	if (!bToOtherSTA) {
-		if (ieee->bIsAggregateFrame)
-			nr_subframes = rxb->nr_subframes;
-		else
-			nr_subframes = 1;
-		if (unicast)
-			ieee->link_detect_info.NumRxUnicastOkInPeriod += nr_subframes;
-		rtllib_rx_check_leave_lps(ieee, unicast, nr_subframes);
-	}
+	if (ieee->bIsAggregateFrame)
+		nr_subframes = rxb->nr_subframes;
+	else
+		nr_subframes = 1;
+	if (unicast)
+		ieee->link_detect_info.NumRxUnicastOkInPeriod += nr_subframes;
+	rtllib_rx_check_leave_lps(ieee, unicast, nr_subframes);
 
 	/* Indicate packets to upper layer or Rx Reorder */
-	if (!ieee->ht_info->cur_rx_reorder_enable || ts == NULL || bToOtherSTA)
+	if (!ieee->ht_info->cur_rx_reorder_enable || ts == NULL)
 		rtllib_rx_indicate_pkt_legacy(ieee, rx_stats, rxb, dst, src);
 	else
 		RxReorderIndicatePacket(ieee, rxb, ts, SeqNum);
-- 
2.42.0

