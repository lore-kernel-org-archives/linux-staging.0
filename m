Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E38F30D00
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:06:50 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40471c054f9so5596905e9.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794008; x=1695398808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KeiJqYC5IhS4kOqWx8D/S1NwhxMKF1MRIBn49UWSENs=;
        b=fewkrJ0bohNuUTYVlYNPUWhwMT/VC9XRMWCId3vbMc/8D9fy28aLyOtcgpUXBFkqvQ
         gZHBbnJfgJiqWtkoJsbLMaTedc67Es+9+GT5jA6ODq+XeLUexju0X+LlKXhp2JCvFbfm
         bnV9cWZ9I9W/M4BX5G93uN2kuZ5LKMhfDy3ikXMo+GT+IpY4e/kxJNNzrZKd+rR8VhbU
         iKjQ8fYYlIHty+FaIcR2xFS0IKQ3pbYVLzjjRxZEoG3wvvKYuq3ZScpqVe8whxO97eDi
         t/oxV/fDmheWReNvpxB81Cy4xfBy05xMmGCakyb/jR19NC2j5k6Hg5qNXCwG5GKVnya8
         X1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794008; x=1695398808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeiJqYC5IhS4kOqWx8D/S1NwhxMKF1MRIBn49UWSENs=;
        b=NI0F7hBh9iYcC3QhM49FvpxtxJQD8/jihaVmzetPEeHHbcTBz2A/Aofy571EcUw3f0
         HeLVs+X582a8IwV6zJn+tqLOm8bbWEh42tvvmoKgXY2VTwqti6bV1Ucpl8WipwSLfekX
         TCC9QrtIM0BNPqcOUE9iSMy4ZPleGfb0WoKqspDZ8C1Hj/SElykjBhfAnrBg4ZAKvgfd
         orFUGIjdsisUobnrs5QD2B3Vq0hbXvY12HKfmeIO7Wv7I4LC5X+gMQvKi1TkNuKN/cj4
         D68u3Tis3/cnx7Mm2uCOukybLD82/A+EMaHR1iETIUBSn7uQTteJ9T9fSNnsvW7Vs9YA
         KiYA==
X-Gm-Message-State: AOJu0YyUI3Z0nlRL+WV6II3/HbTXY1rQfi0SgIIJQh8zTyQcEbts4EIm
	XMqlP75YsEgkQrWOAGv5ohg=
X-Google-Smtp-Source: AGHT+IHTkLjJA0Hddi7cEh1JlaSoUWaWFrrEJpCAOiwf00DdKBYlZLOdO3XdNW7DXvngom2bHtHn8g==
X-Received: by 2002:adf:ec4f:0:b0:31f:edc3:c5fb with SMTP id w15-20020adfec4f000000b0031fedc3c5fbmr1799445wrn.5.1694794008233;
        Fri, 15 Sep 2023 09:06:48 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id ba13-20020a0560001c0d00b0031ddf6cc89csm2056332wrb.98.2023.09.15.09.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:06:47 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:06:46 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/16] staging: rtl8192e: Replace struct rtllib_hdr_1addr
 with ieee80211_hdr
Message-ID: <84aa25fec8e29199970df37b1671f0252d12374e.1694792595.git.philipp.g.hortmann@gmail.com>
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

Replace struct rtllib_hdr_1addr with struct ieee80211_hdr to avoid
proprietary struct.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h            | 7 -------
 drivers/staging/rtl8192e/rtllib_tx.c         | 2 +-
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 63bf8be3fda5..cbb082d8b89f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1470,7 +1470,7 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb +
 				    MAX_DEV_ADDR_SIZE);
 	struct tx_desc *pdesc = NULL;
-	struct rtllib_hdr_1addr *header = NULL;
+	struct ieee80211_hdr *header = NULL;
 	u8 *pda_addr = NULL;
 	int   idx;
 	u32 fwinfo_size = 0;
@@ -1479,7 +1479,7 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 
 	fwinfo_size = sizeof(struct tx_fwinfo_8190pci);
 
-	header = (struct rtllib_hdr_1addr *)(((u8 *)skb->data) + fwinfo_size);
+	header = (struct ieee80211_hdr *)(((u8 *)skb->data) + fwinfo_size);
 	pda_addr = header->addr1;
 
 	if (!is_broadcast_ether_addr(pda_addr) && !is_multicast_ether_addr(pda_addr))
@@ -1725,7 +1725,7 @@ void rtl92e_copy_mpdu_stats(struct rtllib_rx_stats *psrc_stats,
 static void _rtl92e_rx_normal(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rtllib_hdr_1addr *rtllib_hdr = NULL;
+	struct ieee80211_hdr *rtllib_hdr = NULL;
 	bool unicast_packet = false;
 	u32 skb_len = 0;
 	int rx_queue_idx = RX_MPDU_QUEUE;
@@ -1764,7 +1764,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		skb_reserve(skb, stats.RxDrvInfoSize +
 			stats.RxBufShift);
 		skb_trim(skb, skb->len - S_CRC_LEN);
-		rtllib_hdr = (struct rtllib_hdr_1addr *)skb->data;
+		rtllib_hdr = (struct ieee80211_hdr *)skb->data;
 		if (!is_multicast_ether_addr(rtllib_hdr->addr1)) {
 			/* unicast packet */
 			unicast_packet = true;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 565a6e41b982..3ffebe12e279 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -685,13 +685,6 @@ struct rtllib_hdr {
 	u8 payload[];
 } __packed;
 
-struct rtllib_hdr_1addr {
-	__le16 frame_ctl;
-	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 payload[];
-} __packed;
-
 struct rtllib_hdr_3addr {
 	__le16 frame_ctl;
 	__le16 duration_id;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 4199aee930f0..53eaf6330a98 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -268,7 +268,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct tx_ts_record *pTxTs = NULL;
-	struct rtllib_hdr_1addr *hdr = (struct rtllib_hdr_1addr *)skb->data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 
 	if (rtllib_act_scanning(ieee, false))
 		return;
-- 
2.42.0

