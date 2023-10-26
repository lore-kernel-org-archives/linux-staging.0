Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771B9FBE1
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaYOEGsK"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9bfbc393dfaso12050366b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299067; x=1698903867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7zJ5qciR0a1yJaFSt2HKre85R/60luQy84wqPr6HdY=;
        b=YaYOEGsKsjtk80gogj+x0xWG+dYeKfFgf4BQ8JKQ9gG8PlXR4yd8osmVCYT1fYWuEi
         xlcKmC9f7URBv2leqvLOWApTm4Xcpw9DQsuKMdzYbip6tCsRGDMMVm/NRuSdq9aX+bft
         vsvV6SyZNJgkY2mP7DeYnoudIVPhxlfU0m5lcV/7L7A4wg0pHzzmxg3IEnyC5iDCHjwn
         54XXCq+OUVXwRHrqNRSaPf7BcsQHXU06B4wYtqv9FBrlLO1cyJw+vPLSGei4CveDyC1B
         pBxwowdORbIN7K5lHpYihYc8Af+BAKe76t/iLtINXHgX6N0O/aUjBTQpbNUdMyZxNgdd
         rFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299067; x=1698903867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7zJ5qciR0a1yJaFSt2HKre85R/60luQy84wqPr6HdY=;
        b=pkf72M5k9/fyx4qK+bFi2zw2Ufb5NnDKNQ+FExpLS/54EXge7QSDVTEBpxJCSKDOsa
         nqy3k8FK0l6weJ9XuHtXI4YvNr/N9Se01HhVtWRAJIf567J8dlzbzkh91mw1hbRMV3LK
         8qRncFhGHPvIkE+AvR8bNnW621IseOey1pxaW+GpM+gC6Sc5V1omigkeSYoGmDgB+ziK
         065ZMycr1vYb9mb/uZOX7qaja8lZqUIXcoP09IAmTb3f4rXkq8VyWLE18zkLQYeCufRP
         Jgb9Lq7dCYEbQFfkzUVvxhfwDh7upSS069/6vtN/CKjvZ+w/FFKzexyj52KB1JwSccoT
         IZnA==
X-Gm-Message-State: AOJu0YwHRGWf5d97NqZNcEwq9intRbHI6cb2GBS30rYDXInak3GD0aOm
	poUi4pWijsHu9Vb2qUl2EQs=
X-Google-Smtp-Source: AGHT+IHV6G3U8Ei6EOu/OCLtkRiBF8d/MORMapHftlJzMU92/7VuVDsYg8oqia1NozyCxV+whorzvw==
X-Received: by 2002:a17:906:74d1:b0:9bf:5696:9154 with SMTP id z17-20020a17090674d100b009bf56969154mr11621970ejl.2.1698299066717;
        Wed, 25 Oct 2023 22:44:26 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id gs26-20020a170906f19a00b0099ddc81903asm11076722ejb.221.2023.10.25.22.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:44:26 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:44:24 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Convert array rx_idx[] to variable
 rx_idx
Message-ID: <f9e3ee95cdc2de810687a9c71f1a9f8d8fdbeac1.1698295861.git.philipp.g.hortmann@gmail.com>
References: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698295861.git.philipp.g.hortmann@gmail.com>

Convert array rx_idx[] to variable rx_idx as index is always 0. Remove
unused rx_queue_idx as well. This increases readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 18 +++++++-----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 8af732870ddf..d2a8a9543579 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1142,7 +1142,6 @@ static void _rtl92e_free_rx_ring(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	int i;
-	int rx_queue_idx = 0;
 
 	for (i = 0; i < priv->rxringcount; i++) {
 		struct sk_buff *skb = priv->rx_buf[i];
@@ -1352,7 +1351,6 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rx_desc *entry = NULL;
 	int i;
-	int rx_queue_idx = 0;
 
 	priv->rx_ring = dma_alloc_coherent(&priv->pdev->dev,
 					   sizeof(*priv->rx_ring) * priv->rxringcount,
@@ -1363,7 +1361,7 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 		return -ENOMEM;
 	}
 
-	priv->rx_idx[rx_queue_idx] = 0;
+	priv->rx_idx = 0;
 
 	for (i = 0; i < priv->rxringcount; i++) {
 		struct sk_buff *skb = dev_alloc_skb(priv->rxbuffersize);
@@ -1452,7 +1450,6 @@ void rtl92e_reset_desc_ring(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	int i;
-	int rx_queue_idx = 0;
 	unsigned long flags = 0;
 
 	if (priv->rx_ring) {
@@ -1462,7 +1459,7 @@ void rtl92e_reset_desc_ring(struct net_device *dev)
 			entry = &priv->rx_ring[i];
 			entry->OWN = 1;
 		}
-		priv->rx_idx[rx_queue_idx] = 0;
+		priv->rx_idx = 0;
 	}
 
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
@@ -1561,7 +1558,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 	struct ieee80211_hdr *rtllib_hdr = NULL;
 	bool unicast_packet = false;
 	u32 skb_len = 0;
-	int rx_queue_idx = RX_MPDU_QUEUE;
 
 	struct rtllib_rx_stats stats = {
 		.signal = 0,
@@ -1574,9 +1570,9 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 
 	while (count--) {
 		struct rx_desc *pdesc = &priv->rx_ring
-					[priv->rx_idx[rx_queue_idx]];
+					[priv->rx_idx];
 		struct sk_buff *skb = priv->rx_buf
-				      [priv->rx_idx[rx_queue_idx]];
+				      [priv->rx_idx];
 		struct sk_buff *new_skb;
 
 		if (pdesc->OWN)
@@ -1614,7 +1610,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		skb = new_skb;
 		skb->dev = dev;
 
-		priv->rx_buf[priv->rx_idx[rx_queue_idx]] =
+		priv->rx_buf[priv->rx_idx] =
 								 skb;
 		*((dma_addr_t *)skb->cb) = dma_map_single(&priv->pdev->dev,
 							  skb_tail_pointer(skb),
@@ -1627,9 +1623,9 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		pdesc->BufferAddress = *((dma_addr_t *)skb->cb);
 		pdesc->OWN = 1;
 		pdesc->Length = priv->rxbuffersize;
-		if (priv->rx_idx[rx_queue_idx] == priv->rxringcount - 1)
+		if (priv->rx_idx == priv->rxringcount - 1)
 			pdesc->EOR = 1;
-		priv->rx_idx[rx_queue_idx] = (priv->rx_idx[rx_queue_idx] + 1) %
+		priv->rx_idx = (priv->rx_idx + 1) %
 					      priv->rxringcount;
 	}
 }
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index b3ebff2df62a..a6c47388d72c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -235,7 +235,7 @@ struct r8192_priv {
 	struct rx_desc *rx_ring;
 	struct sk_buff	*rx_buf[MAX_RX_COUNT];
 	dma_addr_t	rx_ring_dma;
-	unsigned int	rx_idx[MAX_RX_QUEUE];
+	unsigned int	rx_idx;
 	int		rxringcount;
 	u16		rxbuffersize;
 
-- 
2.42.0

