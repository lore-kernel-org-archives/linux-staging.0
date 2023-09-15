Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09911C8D
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:09:40 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4046f7d49a9so5754305e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794179; x=1695398979; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5e6/GrGXg7ud0y+MSoiSWpfkaO91EExpjUMBSQMSvz0=;
        b=AmASKDJRZ38cE1YTeXeizee89EfOTG2sfP/OKC4ofM5EwKEO12MEdvVcG+Xgl7KUFJ
         SY7CgTR0s9SNW15GwsNRxsiCN+mGs5yCXerxsGWGYD59Hqc8BLjNwdkiPurOwwzXtwmD
         +Yi1rYO90HxmdltNNXoFfF638kNS/ID46JhuD/0s9ftKn/pKSkLMj8wSztX3gz62v6ws
         pT4EJCFfSyoxLEk4g4lddC0V6Nff4xbJGg7W4DcCejVnzALTS10dIyXf4atLq+kMzp+O
         5+oSwg4WvgthOZ6q/W/w0hbejE7ZeK2bdoK51637KDvCWG5h5aDPLrFxdSS8oru0ANdl
         CkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794179; x=1695398979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e6/GrGXg7ud0y+MSoiSWpfkaO91EExpjUMBSQMSvz0=;
        b=XeYp23kxzzydVGETdoI9nWMuMMhcDsi7rbP50IKeKUzBpp8Wh29TlowZsfQK2xfGib
         KmfEO6BrkZEUtYFnw5wdx/iLKhbidUaOXH5KWjR5bUmLuAzexAbj7p6SFmG739i5YhWv
         Qf8lHGHUU/auQjFOcmIfNUL96R+DNiSJI7sx3gUR55t6x5aMOSMmJYwXPRVDyErDveTJ
         LzBoSScCeglYG+9wZYbMVamYrtXvlWMcQuyCE6dKUyjWF7cUdeSYZUXCBkg0aAU87AY9
         rtnzSA+xq4O9HPJXsCwQPvXHvLC6Ze47Ego2OhrLHeP99pusqxuMaJEKqsmwR6lLL/in
         8bfg==
X-Gm-Message-State: AOJu0Yw4AEMAlxbGxaqndQlvNFadtk5JwcT23vcmw/fb70oT6tTnGBYP
	ybL1TbA6ddXk/zf+BArtqHudHxEy7GfCCA==
X-Google-Smtp-Source: AGHT+IGosulwWa6AdnlOyCPckCB2PqyDEOZq7ChIqVO2W3o1Nm75eiww4pvZArLxt7btmhCy4SIeyA==
X-Received: by 2002:adf:e903:0:b0:31a:ed75:75e8 with SMTP id f3-20020adfe903000000b0031aed7575e8mr1740067wrm.2.1694794177825;
        Fri, 15 Sep 2023 09:09:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b003176eab8868sm4862937wrs.82.2023.09.15.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:09:37 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:09:36 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] staging: rtl8192e: Replace management subframe types
 with IEEE80211_STYPE_*
Message-ID: <35ff2758b79f8dadb1d864f3f6d948a76179ad36.1694792595.git.philipp.g.hortmann@gmail.com>
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

Replace management subframe types RTLLIB_STYPE_* with IEEE80211_STYPE_*
to avoid proprietary constant names.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c |  4 +--
 drivers/staging/rtl8192e/rtllib.h         | 14 -----------
 drivers/staging/rtl8192e/rtllib_softmac.c | 30 +++++++++++------------
 3 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 4cadbf549933..a57673ecf791 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -93,7 +93,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 	ether_addr_copy(BAReq->addr2, ieee->dev->dev_addr);
 
 	ether_addr_copy(BAReq->addr3, ieee->current_network.bssid);
-	BAReq->frame_control = cpu_to_le16(RTLLIB_STYPE_MANAGE_ACT);
+	BAReq->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION);
 
 	tag = skb_put(skb, 9);
 	*tag++ = ACT_CAT_BA;
@@ -153,7 +153,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	ether_addr_copy(Delba->addr1, dst);
 	ether_addr_copy(Delba->addr2, ieee->dev->dev_addr);
 	ether_addr_copy(Delba->addr3, ieee->current_network.bssid);
-	Delba->frame_control = cpu_to_le16(RTLLIB_STYPE_MANAGE_ACT);
+	Delba->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION);
 
 	tag = skb_put(skb, 6);
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ef6e2187f847..3cf171a70974 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -350,20 +350,6 @@ enum rt_op_mode {
 #define RTLLIB_FTYPE_CTL		0x0004
 #define RTLLIB_FTYPE_DATA		0x0008
 
-/* management */
-#define RTLLIB_STYPE_ASSOC_REQ	0x0000
-#define RTLLIB_STYPE_ASSOC_RESP		0x0010
-#define RTLLIB_STYPE_REASSOC_REQ	0x0020
-#define RTLLIB_STYPE_REASSOC_RESP	0x0030
-#define RTLLIB_STYPE_PROBE_REQ	0x0040
-#define RTLLIB_STYPE_PROBE_RESP	0x0050
-#define RTLLIB_STYPE_BEACON		0x0080
-#define RTLLIB_STYPE_ATIM		0x0090
-#define RTLLIB_STYPE_DISASSOC	0x00A0
-#define RTLLIB_STYPE_AUTH		0x00B0
-#define RTLLIB_STYPE_DEAUTH		0x00C0
-#define RTLLIB_STYPE_MANAGE_ACT	0x00D0
-
 /* control */
 #define RTLLIB_STYPE_PSPOLL		0x00A0
 #define RTLLIB_STYPE_RTS		0x00B0
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e51bdfd847d2..14f402308ecd 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -331,7 +331,7 @@ static inline struct sk_buff *rtllib_probe_req(struct rtllib_device *ieee)
 	skb_reserve(skb, ieee->tx_headroom);
 
 	req = skb_put(skb, sizeof(struct rtllib_probe_request));
-	req->header.frame_control = cpu_to_le16(RTLLIB_STYPE_PROBE_REQ);
+	req->header.frame_control = cpu_to_le16(IEEE80211_STYPE_PROBE_REQ);
 	req->header.duration_id = 0;
 
 	eth_broadcast_addr(req->header.addr1);
@@ -739,7 +739,7 @@ rtllib_authentication_req(struct rtllib_network *beacon,
 
 	auth = skb_put(skb, sizeof(struct rtllib_authentication));
 
-	auth->header.frame_control = cpu_to_le16(RTLLIB_STYPE_AUTH);
+	auth->header.frame_control = cpu_to_le16(IEEE80211_STYPE_AUTH);
 	if (challengelen)
 		auth->header.frame_control |= cpu_to_le16(RTLLIB_FCTL_WEP);
 
@@ -860,7 +860,7 @@ static struct sk_buff *rtllib_probe_resp(struct rtllib_device *ieee,
 	if (encrypt)
 		beacon_buf->capability |= cpu_to_le16(WLAN_CAPABILITY_PRIVACY);
 
-	beacon_buf->header.frame_control = cpu_to_le16(RTLLIB_STYPE_PROBE_RESP);
+	beacon_buf->header.frame_control = cpu_to_le16(IEEE80211_STYPE_PROBE_RESP);
 	beacon_buf->info_element[0].id = MFIE_TYPE_SSID;
 	beacon_buf->info_element[0].len = ssid_len;
 
@@ -1076,7 +1076,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	hdr = skb_put(skb, sizeof(struct rtllib_assoc_request_frame) + 2);
 
-	hdr->header.frame_control = cpu_to_le16(RTLLIB_STYPE_ASSOC_REQ);
+	hdr->header.frame_control = cpu_to_le16(IEEE80211_STYPE_ASSOC_REQ);
 	hdr->header.duration_id = cpu_to_le16(37);
 	ether_addr_copy(hdr->header.addr1, beacon->bssid);
 	ether_addr_copy(hdr->header.addr2, ieee->dev->dev_addr);
@@ -2136,22 +2136,22 @@ inline int rtllib_rx_frame_softmac(struct rtllib_device *ieee,
 
 	frame_ctl = le16_to_cpu(header->frame_control);
 	switch (WLAN_FC_GET_STYPE(frame_ctl)) {
-	case RTLLIB_STYPE_ASSOC_RESP:
-	case RTLLIB_STYPE_REASSOC_RESP:
+	case IEEE80211_STYPE_ASSOC_RESP:
+	case IEEE80211_STYPE_REASSOC_RESP:
 		if (rtllib_rx_assoc_resp(ieee, skb, rx_stats) == 1)
 			return 1;
 		break;
-	case RTLLIB_STYPE_ASSOC_REQ:
-	case RTLLIB_STYPE_REASSOC_REQ:
+	case IEEE80211_STYPE_ASSOC_REQ:
+	case IEEE80211_STYPE_REASSOC_REQ:
 		break;
-	case RTLLIB_STYPE_AUTH:
+	case IEEE80211_STYPE_AUTH:
 		rtllib_rx_auth(ieee, skb, rx_stats);
 		break;
-	case RTLLIB_STYPE_DISASSOC:
-	case RTLLIB_STYPE_DEAUTH:
+	case IEEE80211_STYPE_DISASSOC:
+	case IEEE80211_STYPE_DEAUTH:
 		rtllib_rx_deauth(ieee, skb);
 		break;
-	case RTLLIB_STYPE_MANAGE_ACT:
+	case IEEE80211_STYPE_ACTION:
 		rtllib_process_action(ieee, skb);
 		break;
 	default:
@@ -2488,7 +2488,7 @@ static struct sk_buff *rtllib_get_beacon_(struct rtllib_device *ieee)
 		return NULL;
 
 	b = (struct rtllib_probe_response *)skb->data;
-	b->header.frame_control = cpu_to_le16(RTLLIB_STYPE_BEACON);
+	b->header.frame_control = cpu_to_le16(IEEE80211_STYPE_BEACON);
 
 	return skb;
 }
@@ -2730,7 +2730,7 @@ rtllib_disauth_skb(struct rtllib_network *beacon,
 	skb_reserve(skb, ieee->tx_headroom);
 
 	disauth = skb_put(skb, sizeof(struct rtllib_disauth));
-	disauth->header.frame_control = cpu_to_le16(RTLLIB_STYPE_DEAUTH);
+	disauth->header.frame_control = cpu_to_le16(IEEE80211_STYPE_DEAUTH);
 	disauth->header.duration_id = 0;
 
 	ether_addr_copy(disauth->header.addr1, beacon->bssid);
@@ -2757,7 +2757,7 @@ rtllib_disassociate_skb(struct rtllib_network *beacon,
 	skb_reserve(skb, ieee->tx_headroom);
 
 	disass = skb_put(skb, sizeof(struct rtllib_disassoc));
-	disass->header.frame_control = cpu_to_le16(RTLLIB_STYPE_DISASSOC);
+	disass->header.frame_control = cpu_to_le16(IEEE80211_STYPE_DISASSOC);
 	disass->header.duration_id = 0;
 
 	ether_addr_copy(disass->header.addr1, beacon->bssid);
-- 
2.42.0

