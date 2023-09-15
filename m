Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32411C9A
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:07:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4046f7d49a9so5748435e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794052; x=1695398852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mEl920j4bMU1c1j+prGL8R31kmbWRsQYB45PK9cGhQ=;
        b=S34jgwf7o4HAA44TeklIqLGkSdcfXqqRpgTRyTWjFryBvhU1OaGuO+Vs77UunFj/Vy
         JK1hifFwTbQcwRv4mt1wyntnWyijyQSU0pAT/UAVrgXn/XEf36N/U3+dupan2a5Nhc6U
         wP0tlsVg+FjY6NLxPHQS+tfLXiozOTaxmAWqmwm5o9j9bOO90l8TM+nC0oHm9wR2kPFA
         UuEUMJ2o+nD4tw0UPfZrmfz5C7r6XcGiaVjZtQwSHY2g+hvn2m7+YQT1n8T8XeHn514u
         lyv0zX/YuyafVpvkEtUwUR5wO0l6hp8HDZ8S8h4CD94ygNdE/GU1oNnYq12a8x9nKRfn
         EcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794052; x=1695398852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mEl920j4bMU1c1j+prGL8R31kmbWRsQYB45PK9cGhQ=;
        b=cny9LBKpGOxt564tYpVA+iklpgX2IujQgiVyILPVmSaX5TTAwpyrHWr/6vvGuCzGac
         YtdH0p4b8AMzYScNuBsNSRbQ54gly8zvaBOt6US5qc1r78O926PE7PlMsXEl+oyJfchw
         hKgbN/S3u+gje4uUgyJu+btnNc60mwN2NmGmS70JbecP/RMNidyhHZVDC3Ftqb7xQLQW
         W51RrGKLgDQEqY+ijOjKZ/tD+LcCPD++60RE+dxKnTT3jQGTmeoGRFwSgL7k+dueMSAQ
         VPc7Uv7dtFxtzg2awBLXzikeYKbfloeN25pyOA7bw5gQJgUDVesmJPvTW/k7DHcaOVX8
         cXSA==
X-Gm-Message-State: AOJu0YyJwVBTkd1vLicmoDRygbfy6q6ZxZpX11OanuWcREiD0obIIBQW
	Z1JT5xnSjzliv8M5VSbnTsMJrzNxaQwqfw==
X-Google-Smtp-Source: AGHT+IFuO50yzHNl10RIZSyAAE218Gy11mrpopmrZ5Z+zuljjIKx6D52kWfYVUFCf51Y6tfzWv/s1A==
X-Received: by 2002:a05:600c:3b03:b0:3ff:8617:672b with SMTP id m3-20020a05600c3b0300b003ff8617672bmr2058173wms.2.1694794052198;
        Fri, 15 Sep 2023 09:07:32 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id f10-20020adff8ca000000b0031ffa453affsm617386wrq.17.2023.09.15.09.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:07:31 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:07:30 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] staging: rtl8192e: Replace struct rtllib_hdr_3addr in
 structs of rtllib.h
Message-ID: <e327712027b022561759d7cadcf51bf8274ab05a.1694792595.git.philipp.g.hortmann@gmail.com>
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
proprietary struct in structs of rtllib.h.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         | 24 +++++++----------------
 drivers/staging/rtl8192e/rtllib_rx.c      |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 18 ++++++++---------
 3 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c13268ad6b56..55f96f446f9e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -685,16 +685,6 @@ struct rtllib_hdr {
 	u8 payload[];
 } __packed;
 
-struct rtllib_hdr_3addr {
-	__le16 frame_ctl;
-	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN];
-	u8 addr3[ETH_ALEN];
-	__le16 seq_ctl;
-	u8 payload[];
-} __packed;
-
 struct rtllib_hdr_4addr {
 	__le16 frame_ctl;
 	__le16 duration_id;
@@ -736,7 +726,7 @@ struct rtllib_info_element {
 } __packed;
 
 struct rtllib_authentication {
-	struct rtllib_hdr_3addr header;
+	struct ieee80211_hdr_3addr header;
 	__le16 algorithm;
 	__le16 transaction;
 	__le16 status;
@@ -745,23 +735,23 @@ struct rtllib_authentication {
 } __packed;
 
 struct rtllib_disauth {
-	struct rtllib_hdr_3addr header;
+	struct ieee80211_hdr_3addr header;
 	__le16 reason;
 } __packed;
 
 struct rtllib_disassoc {
-	struct rtllib_hdr_3addr header;
+	struct ieee80211_hdr_3addr header;
 	__le16 reason;
 } __packed;
 
 struct rtllib_probe_request {
-	struct rtllib_hdr_3addr header;
+	struct ieee80211_hdr_3addr header;
 	/* SSID, supported rates */
 	struct rtllib_info_element info_element[];
 } __packed;
 
 struct rtllib_probe_response {
-	struct rtllib_hdr_3addr header;
+	struct ieee80211_hdr_3addr header;
 	u32 time_stamp[2];
 	__le16 beacon_interval;
 	__le16 capability;
@@ -775,7 +765,7 @@ struct rtllib_probe_response {
 #define rtllib_beacon rtllib_probe_response
 
 struct rtllib_assoc_request_frame {
-	struct rtllib_hdr_3addr header;
+	struct ieee80211_hdr_3addr header;
 	__le16 capability;
 	__le16 listen_interval;
 	/* SSID, supported rates, RSN */
@@ -783,7 +773,7 @@ struct rtllib_assoc_request_frame {
 } __packed;
 
 struct rtllib_assoc_response_frame {
-	struct rtllib_hdr_3addr header;
+	struct ieee80211_hdr_3addr header;
 	__le16 capability;
 	__le16 status;
 	__le16 aid;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index dddd38bbc648..0c2135431f5b 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2483,7 +2483,7 @@ static inline void rtllib_process_probe_response(
 	short renew;
 	struct rtllib_network *network = kzalloc(sizeof(struct rtllib_network),
 						 GFP_ATOMIC);
-	__le16 frame_ctl = beacon->header.frame_ctl;
+	__le16 frame_ctl = beacon->header.frame_control;
 
 	if (!network)
 		return;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e3b15fa0edcb..3c61b6f4f69f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -331,7 +331,7 @@ static inline struct sk_buff *rtllib_probe_req(struct rtllib_device *ieee)
 	skb_reserve(skb, ieee->tx_headroom);
 
 	req = skb_put(skb, sizeof(struct rtllib_probe_request));
-	req->header.frame_ctl = cpu_to_le16(RTLLIB_STYPE_PROBE_REQ);
+	req->header.frame_control = cpu_to_le16(RTLLIB_STYPE_PROBE_REQ);
 	req->header.duration_id = 0;
 
 	eth_broadcast_addr(req->header.addr1);
@@ -739,9 +739,9 @@ rtllib_authentication_req(struct rtllib_network *beacon,
 
 	auth = skb_put(skb, sizeof(struct rtllib_authentication));
 
-	auth->header.frame_ctl = cpu_to_le16(RTLLIB_STYPE_AUTH);
+	auth->header.frame_control = cpu_to_le16(RTLLIB_STYPE_AUTH);
 	if (challengelen)
-		auth->header.frame_ctl |= cpu_to_le16(RTLLIB_FCTL_WEP);
+		auth->header.frame_control |= cpu_to_le16(RTLLIB_FCTL_WEP);
 
 	auth->header.duration_id = cpu_to_le16(0x013a);
 	ether_addr_copy(auth->header.addr1, beacon->bssid);
@@ -860,7 +860,7 @@ static struct sk_buff *rtllib_probe_resp(struct rtllib_device *ieee,
 	if (encrypt)
 		beacon_buf->capability |= cpu_to_le16(WLAN_CAPABILITY_PRIVACY);
 
-	beacon_buf->header.frame_ctl = cpu_to_le16(RTLLIB_STYPE_PROBE_RESP);
+	beacon_buf->header.frame_control = cpu_to_le16(RTLLIB_STYPE_PROBE_RESP);
 	beacon_buf->info_element[0].id = MFIE_TYPE_SSID;
 	beacon_buf->info_element[0].len = ssid_len;
 
@@ -1076,7 +1076,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	hdr = skb_put(skb, sizeof(struct rtllib_assoc_request_frame) + 2);
 
-	hdr->header.frame_ctl = cpu_to_le16(RTLLIB_STYPE_ASSOC_REQ);
+	hdr->header.frame_control = cpu_to_le16(RTLLIB_STYPE_ASSOC_REQ);
 	hdr->header.duration_id = cpu_to_le16(37);
 	ether_addr_copy(hdr->header.addr1, beacon->bssid);
 	ether_addr_copy(hdr->header.addr2, ieee->dev->dev_addr);
@@ -2488,7 +2488,7 @@ static struct sk_buff *rtllib_get_beacon_(struct rtllib_device *ieee)
 		return NULL;
 
 	b = (struct rtllib_probe_response *)skb->data;
-	b->header.frame_ctl = cpu_to_le16(RTLLIB_STYPE_BEACON);
+	b->header.frame_control = cpu_to_le16(RTLLIB_STYPE_BEACON);
 
 	return skb;
 }
@@ -2503,7 +2503,7 @@ struct sk_buff *rtllib_get_beacon(struct rtllib_device *ieee)
 		return NULL;
 
 	b = (struct rtllib_probe_response *)skb->data;
-	b->header.seq_ctl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
+	b->header.seq_ctrl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
 
 	if (ieee->seq_ctrl[0] == 0xFFF)
 		ieee->seq_ctrl[0] = 0;
@@ -2730,7 +2730,7 @@ rtllib_disauth_skb(struct rtllib_network *beacon,
 	skb_reserve(skb, ieee->tx_headroom);
 
 	disauth = skb_put(skb, sizeof(struct rtllib_disauth));
-	disauth->header.frame_ctl = cpu_to_le16(RTLLIB_STYPE_DEAUTH);
+	disauth->header.frame_control = cpu_to_le16(RTLLIB_STYPE_DEAUTH);
 	disauth->header.duration_id = 0;
 
 	ether_addr_copy(disauth->header.addr1, beacon->bssid);
@@ -2757,7 +2757,7 @@ rtllib_disassociate_skb(struct rtllib_network *beacon,
 	skb_reserve(skb, ieee->tx_headroom);
 
 	disass = skb_put(skb, sizeof(struct rtllib_disassoc));
-	disass->header.frame_ctl = cpu_to_le16(RTLLIB_STYPE_DISASSOC);
+	disass->header.frame_control = cpu_to_le16(RTLLIB_STYPE_DISASSOC);
 	disass->header.duration_id = 0;
 
 	ether_addr_copy(disass->header.addr1, beacon->bssid);
-- 
2.42.0

