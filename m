Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD81F9C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lefCHWPi"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9c14313eb1cso12798366b.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299041; x=1698903841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avBMhTQILI4e6+6heKlFl4WenhKlgtCr5qfdN9CAMvo=;
        b=lefCHWPi6LDeo7zU52stPnzc1fEA0OLlmKIMhIq4Wzb9ZV6L5Yuj7SQ+TfhN1/UEPS
         Xj1aoLrOzWV4D8aZDRrH4cmJR35rhQfWDlT37ClwxWyGBU7lzEd/84YuUxjH88jHHolp
         gMAjbet+Qk06kJTEHrqJw5n0yUjQ400lCLtWSquxh0HDghAPOuCgfDvfuEcJ00pQyWBm
         bqQi4FHTLMM/3+cvhgE30pSQ8hOBK+tNxGJq3zJACqTREK7sG2OopUB4WjzryWqCw0TJ
         Okv0zLHG+GONCBeF5NpCOzDTxd4XygCi1c0qt0Z8RMGRIUWHEUXPmcxidhR6xAOv00V0
         DM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299041; x=1698903841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avBMhTQILI4e6+6heKlFl4WenhKlgtCr5qfdN9CAMvo=;
        b=DdUca0CLnqw2WbHZXffIwAZCUHMiCgvJR9lCBWaLgYdcVMpkgB+Ks7WOqHlK494niU
         dWUQdU3qhj7+IPnlNmVanRVyGLNf5WFTrO6nyHxrgr2vmsCdUxAdmXRkdVSL27fWZs+z
         qu9tgf1v8o8qcTvhUsYzhiE0sCF4fp1B1ELRbG4Pk50+CIizZJn7xVAvG3rgfamqWiQZ
         NOtwNwwgxskgEaHDq2uIVbIiHtAsoGgF8SlgXI7350a9KDikuwEk5g/t69H0UcU5BuLf
         YnoTov4l85Mop1k/X9An0Uylnxw29NgaXjTLj3OU3K+wBS6rHmw7zhW/vVtPnp6tmcal
         6wqg==
X-Gm-Message-State: AOJu0Yw0x7i/rHSanpJKJq/3JPBWGgPY2gBiCD8QbfRBRgwL1yrL+e29
	pwIQq9amlK7vtxw4W99iRi6rSL9VuvQ=
X-Google-Smtp-Source: AGHT+IEEzgom6mUp2yUfo9xYoRFpn+T5Mb10i99mbJrjpR95Hr8MtlWpnJhzqpwT1m9pnoOxb/NGuA==
X-Received: by 2002:a17:906:51ce:b0:9ae:2f35:442a with SMTP id v14-20020a17090651ce00b009ae2f35442amr10465695ejk.5.1698299041064;
        Wed, 25 Oct 2023 22:44:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090611ce00b009b29553b648sm10907859eja.206.2023.10.25.22.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:44:00 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:43:59 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Remove loops with constant
 MAX_RX_QUEUE
Message-ID: <8bc9d3c15fba082a928ea2c0916a6aef5f76f456.1698295861.git.philipp.g.hortmann@gmail.com>
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

MAX_RX_QUEUE is set to 1. All loops with MAX_RX_QUEUE run only one cycle.
Remove loops.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 120 +++++++++----------
 1 file changed, 58 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ba35ae4a21fa..2f0fc7c0f216 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1141,28 +1141,26 @@ void rtl92e_tx_enable(struct net_device *dev)
 static void _rtl92e_free_rx_ring(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	int i, rx_queue_idx;
-
-	for (rx_queue_idx = 0; rx_queue_idx < MAX_RX_QUEUE;
-	     rx_queue_idx++) {
-		for (i = 0; i < priv->rxringcount; i++) {
-			struct sk_buff *skb = priv->rx_buf[rx_queue_idx][i];
+	int i;
+	int rx_queue_idx = 0;
 
-			if (!skb)
-				continue;
+	for (i = 0; i < priv->rxringcount; i++) {
+		struct sk_buff *skb = priv->rx_buf[rx_queue_idx][i];
 
-			dma_unmap_single(&priv->pdev->dev,
-					 *((dma_addr_t *)skb->cb),
-					 priv->rxbuffersize, DMA_FROM_DEVICE);
-			kfree_skb(skb);
-		}
+		if (!skb)
+			continue;
 
-		dma_free_coherent(&priv->pdev->dev,
-				  sizeof(*priv->rx_ring[rx_queue_idx]) * priv->rxringcount,
-				  priv->rx_ring[rx_queue_idx],
-				  priv->rx_ring_dma[rx_queue_idx]);
-		priv->rx_ring[rx_queue_idx] = NULL;
+		dma_unmap_single(&priv->pdev->dev,
+				 *((dma_addr_t *)skb->cb),
+				 priv->rxbuffersize, DMA_FROM_DEVICE);
+		kfree_skb(skb);
 	}
+
+	dma_free_coherent(&priv->pdev->dev,
+			  sizeof(*priv->rx_ring[rx_queue_idx]) * priv->rxringcount,
+			  priv->rx_ring[rx_queue_idx],
+			  priv->rx_ring_dma[rx_queue_idx]);
+	priv->rx_ring[rx_queue_idx] = NULL;
 }
 
 static void _rtl92e_free_tx_ring(struct net_device *dev, unsigned int prio)
@@ -1353,47 +1351,46 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rx_desc *entry = NULL;
-	int i, rx_queue_idx;
-
-	for (rx_queue_idx = 0; rx_queue_idx < MAX_RX_QUEUE; rx_queue_idx++) {
-		priv->rx_ring[rx_queue_idx] = dma_alloc_coherent(&priv->pdev->dev,
-								 sizeof(*priv->rx_ring[rx_queue_idx]) * priv->rxringcount,
-								 &priv->rx_ring_dma[rx_queue_idx],
-								 GFP_ATOMIC);
-		if (!priv->rx_ring[rx_queue_idx] ||
-		    (unsigned long)priv->rx_ring[rx_queue_idx] & 0xFF) {
-			netdev_warn(dev, "Cannot allocate RX ring\n");
-			return -ENOMEM;
-		}
-
-		priv->rx_idx[rx_queue_idx] = 0;
+	int i;
+	int rx_queue_idx = 0;
+
+	priv->rx_ring[rx_queue_idx] = dma_alloc_coherent(&priv->pdev->dev,
+							 sizeof(*priv->rx_ring[rx_queue_idx]) * priv->rxringcount,
+							 &priv->rx_ring_dma[rx_queue_idx],
+							 GFP_ATOMIC);
+	if (!priv->rx_ring[rx_queue_idx] ||
+	    (unsigned long)priv->rx_ring[rx_queue_idx] & 0xFF) {
+		netdev_warn(dev, "Cannot allocate RX ring\n");
+		return -ENOMEM;
+	}
 
-		for (i = 0; i < priv->rxringcount; i++) {
-			struct sk_buff *skb = dev_alloc_skb(priv->rxbuffersize);
-			dma_addr_t *mapping;
+	priv->rx_idx[rx_queue_idx] = 0;
 
-			entry = &priv->rx_ring[rx_queue_idx][i];
-			if (!skb)
-				return 0;
-			skb->dev = dev;
-			priv->rx_buf[rx_queue_idx][i] = skb;
-			mapping = (dma_addr_t *)skb->cb;
-			*mapping = dma_map_single(&priv->pdev->dev,
-						  skb_tail_pointer(skb),
-						  priv->rxbuffersize, DMA_FROM_DEVICE);
-			if (dma_mapping_error(&priv->pdev->dev, *mapping)) {
-				dev_kfree_skb_any(skb);
-				return -1;
-			}
-			entry->BufferAddress = *mapping;
+	for (i = 0; i < priv->rxringcount; i++) {
+		struct sk_buff *skb = dev_alloc_skb(priv->rxbuffersize);
+		dma_addr_t *mapping;
 
-			entry->Length = priv->rxbuffersize;
-			entry->OWN = 1;
+		entry = &priv->rx_ring[rx_queue_idx][i];
+		if (!skb)
+			return 0;
+		skb->dev = dev;
+		priv->rx_buf[rx_queue_idx][i] = skb;
+		mapping = (dma_addr_t *)skb->cb;
+		*mapping = dma_map_single(&priv->pdev->dev,
+					  skb_tail_pointer(skb),
+					  priv->rxbuffersize, DMA_FROM_DEVICE);
+		if (dma_mapping_error(&priv->pdev->dev, *mapping)) {
+			dev_kfree_skb_any(skb);
+			return -1;
 		}
+		entry->BufferAddress = *mapping;
 
-		if (entry)
-			entry->EOR = 1;
+		entry->Length = priv->rxbuffersize;
+		entry->OWN = 1;
 	}
+
+	if (entry)
+		entry->EOR = 1;
 	return 0;
 }
 
@@ -1455,19 +1452,18 @@ static short _rtl92e_pci_initdescring(struct net_device *dev)
 void rtl92e_reset_desc_ring(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	int i, rx_queue_idx;
+	int i;
+	int rx_queue_idx = 0;
 	unsigned long flags = 0;
 
-	for (rx_queue_idx = 0; rx_queue_idx < MAX_RX_QUEUE; rx_queue_idx++) {
-		if (priv->rx_ring[rx_queue_idx]) {
-			struct rx_desc *entry = NULL;
+	if (priv->rx_ring[rx_queue_idx]) {
+		struct rx_desc *entry = NULL;
 
-			for (i = 0; i < priv->rxringcount; i++) {
-				entry = &priv->rx_ring[rx_queue_idx][i];
-				entry->OWN = 1;
-			}
-			priv->rx_idx[rx_queue_idx] = 0;
+		for (i = 0; i < priv->rxringcount; i++) {
+			entry = &priv->rx_ring[rx_queue_idx][i];
+			entry->OWN = 1;
 		}
+		priv->rx_idx[rx_queue_idx] = 0;
 	}
 
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
-- 
2.42.0

