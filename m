Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB91F9C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu+oPwcZ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9c14313eb1cso12804466b.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299046; x=1698903846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NK++5DiuxJTPHibT8VaHHf3bgG67tMPkAr+ypnICuHE=;
        b=Mu+oPwcZ0Q72IfxYjXMFseM7crRLYuTmeDee1B1dQuw7gDfYCMPtgtIaHEO/9P8RGs
         nLkbaAYoMwILkepRwRBwsez7/GKykNfGJoXL2KYjvNydj2OFQkzmdEWzM0DV5uHLw/6Q
         gV5GXAIWVNAh/VF/xHgCHjZgQlQBhiT6cs0XQPi3jW8/wunY6RoHUN02ldZlSraykDTY
         +25qqSWMOWapgAss1bKKo7Sx96aTEqD+tgJ8Y2WHc1+hORuI5UTAWQTfLVdCKvy4p/f+
         BQcJ0JatkD1kSj111QHZHopWH83JGUIxvH7TQBmF4JTwo5BSEAM5P/At97rzfaoZjZOM
         vB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299046; x=1698903846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK++5DiuxJTPHibT8VaHHf3bgG67tMPkAr+ypnICuHE=;
        b=C09zvxbnbxrH/wXri6fffRXyMKrkdt2b82/qBp5PxPwGYq2hsSEpkTHgcF6PwsJ3+B
         LpdqWh3n5aG30uEQ/W8ZzyaZ9uqqVPRcyrcWt54TXVXdY+BgMAgjekDR1urJK76HyI0d
         74Bj2tAOiUgW8hRyc4ju23tKzZnnsHJvuCmeUT9Zg9yvsAjqE2LcKimSX79vZ7MJP9fG
         CiM83TJOW/hOvUMABFB+Rv2SJG7G0z+rRHtArbBqB2ykOMCC4Zq469SK9iBLvDpnxuJx
         b8MXJqmrMIMsZFCP6EYKO+CYFqyJo/wbWbPX01NvMQUp3+n+OKDgAY1E6dcWsJbE8m7U
         3onw==
X-Gm-Message-State: AOJu0YzAMR0zd7jRMndj0vtHW5D7mQsKJTw+xL0PgGyq1piRTifmRDVQ
	nkp2HclleWaaMmQ11SdA0K/8XoHXh0Q=
X-Google-Smtp-Source: AGHT+IEZPodmVtixZvoF2A3QU5hK55l0bYHD13t2+/vkydpXb90IeMLaHJf/MEIjQBudDR2pVP5mCg==
X-Received: by 2002:a17:906:29c:b0:9c4:950:92b5 with SMTP id 28-20020a170906029c00b009c4095092b5mr12732010ejf.6.1698299046699;
        Wed, 25 Oct 2023 22:44:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906694200b0099bc80d5575sm10951258ejs.200.2023.10.25.22.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:44:06 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:44:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Convert array rx_ring[] to variable
 rx_ring
Message-ID: <c53ff4251eba0adae6d8279a918c8ab4914b4780.1698295861.git.philipp.g.hortmann@gmail.com>
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

Convert array rx_ring[] to variable rx_ring as index is always 0. This
increases readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 25 ++++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 2f0fc7c0f216..d0d5b1dfff48 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1157,10 +1157,10 @@ static void _rtl92e_free_rx_ring(struct net_device *dev)
 	}
 
 	dma_free_coherent(&priv->pdev->dev,
-			  sizeof(*priv->rx_ring[rx_queue_idx]) * priv->rxringcount,
-			  priv->rx_ring[rx_queue_idx],
+			  sizeof(*priv->rx_ring) * priv->rxringcount,
+			  priv->rx_ring,
 			  priv->rx_ring_dma[rx_queue_idx]);
-	priv->rx_ring[rx_queue_idx] = NULL;
+	priv->rx_ring = NULL;
 }
 
 static void _rtl92e_free_tx_ring(struct net_device *dev, unsigned int prio)
@@ -1354,12 +1354,11 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 	int i;
 	int rx_queue_idx = 0;
 
-	priv->rx_ring[rx_queue_idx] = dma_alloc_coherent(&priv->pdev->dev,
-							 sizeof(*priv->rx_ring[rx_queue_idx]) * priv->rxringcount,
-							 &priv->rx_ring_dma[rx_queue_idx],
-							 GFP_ATOMIC);
-	if (!priv->rx_ring[rx_queue_idx] ||
-	    (unsigned long)priv->rx_ring[rx_queue_idx] & 0xFF) {
+	priv->rx_ring = dma_alloc_coherent(&priv->pdev->dev,
+					   sizeof(*priv->rx_ring) * priv->rxringcount,
+					   &priv->rx_ring_dma[rx_queue_idx],
+					   GFP_ATOMIC);
+	if (!priv->rx_ring || (unsigned long)priv->rx_ring & 0xFF) {
 		netdev_warn(dev, "Cannot allocate RX ring\n");
 		return -ENOMEM;
 	}
@@ -1370,7 +1369,7 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 		struct sk_buff *skb = dev_alloc_skb(priv->rxbuffersize);
 		dma_addr_t *mapping;
 
-		entry = &priv->rx_ring[rx_queue_idx][i];
+		entry = &priv->rx_ring[i];
 		if (!skb)
 			return 0;
 		skb->dev = dev;
@@ -1456,11 +1455,11 @@ void rtl92e_reset_desc_ring(struct net_device *dev)
 	int rx_queue_idx = 0;
 	unsigned long flags = 0;
 
-	if (priv->rx_ring[rx_queue_idx]) {
+	if (priv->rx_ring) {
 		struct rx_desc *entry = NULL;
 
 		for (i = 0; i < priv->rxringcount; i++) {
-			entry = &priv->rx_ring[rx_queue_idx][i];
+			entry = &priv->rx_ring[i];
 			entry->OWN = 1;
 		}
 		priv->rx_idx[rx_queue_idx] = 0;
@@ -1574,7 +1573,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 	stats.nic_type = NIC_8192E;
 
 	while (count--) {
-		struct rx_desc *pdesc = &priv->rx_ring[rx_queue_idx]
+		struct rx_desc *pdesc = &priv->rx_ring
 					[priv->rx_idx[rx_queue_idx]];
 		struct sk_buff *skb = priv->rx_buf[rx_queue_idx]
 				      [priv->rx_idx[rx_queue_idx]];
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index d4e998cfbefc..caa8a00cc922 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -232,7 +232,7 @@ struct r8192_priv {
 
 	u8 (*rf_set_chan)(struct net_device *dev, u8 ch);
 
-	struct rx_desc *rx_ring[MAX_RX_QUEUE];
+	struct rx_desc *rx_ring;
 	struct sk_buff	*rx_buf[MAX_RX_QUEUE][MAX_RX_COUNT];
 	dma_addr_t	rx_ring_dma[MAX_RX_QUEUE];
 	unsigned int	rx_idx[MAX_RX_QUEUE];
-- 
2.42.0

