Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F017F9C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSlhsb5V"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9c6f0530929so14428766b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299054; x=1698903854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uNXP1byPvesZdfc6sqLsUl9gM3gqBThouw1QohVxG38=;
        b=kSlhsb5VuXroAbNy0eA55gTlVBUZoIaQwEBcnz0i7aO/m6keODh0l2NsTXE/IdZb1A
         t/wpauuwy9ohHZSRhL5HF1ucZY8kJEwJM0WplpBRRZ50N/lb73Hkmx96vBlKqtC+Omnh
         EAI4TdkEyG2coyE83v7J4zZa2hyx6PJZoXoGp9Y5VihbPPlk3PgdDs6Vid92DClwQukh
         p0uFMK8e6ipiTycv0myOw0MPtbKE9cEjStwA0hwEftKyFkjZml4Fziql4Cn9Znlh8qfd
         csO6TVmTt2p633YP8jkF9WxDbGulboNTc9c5qPkHwCNLhm+u4YaahB2At+79Jp3jxbu/
         /b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299054; x=1698903854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNXP1byPvesZdfc6sqLsUl9gM3gqBThouw1QohVxG38=;
        b=ciy82sonHyREPrnTc5oc57K5wO49MqxBARv0p1efSoDqhMk7/YXW9sIkJhGcUEMMNo
         8C/FsVL3f2jelu/tK7maqAdOamMWIr9ng8R/7jWil/EjnI8XNcimGdPOzE9TbEMmM1hQ
         utTtux/JV04+pvmHIQPaHsaGwGxVl8UTovFEl9LvhXNsJ9DtKLYUpo0OIid1Fv2AGCL8
         3UUNMpDc/AQ54m5ehTWoll/AlFuLlLbu9JD4UIhB3EYfzAbTBrlurR2xv3hO/WGm/3dP
         OPtA49VA7D5Aki/MEOoHhLJd86jK1MvnEiGNHSDMY/3eDxBCAno5jMzlDDry/4nHPbdx
         qb5Q==
X-Gm-Message-State: AOJu0YwS12chXLFsVXk0lpwkc8ZsitO8qskJPbP85wZr6jBP1Qy6K0B/
	8p8lMW+mEpFNkvbauVmrvYw=
X-Google-Smtp-Source: AGHT+IEUQb7ZEfMb1j7XIWettGwOTwr8B03mIxUOw0AP3WBsKgtvIOnTbNoEuxTSWSEz4NBAAB21Bg==
X-Received: by 2002:a17:906:74d1:b0:9be:3483:94da with SMTP id z17-20020a17090674d100b009be348394damr11842255ejl.1.1698299053674;
        Wed, 25 Oct 2023 22:44:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id ov6-20020a170906fc0600b009ce03057c4dsm1684281ejb.2.2023.10.25.22.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:44:13 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:44:11 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Convert array rx_buf[][] to array
 rx_buf[]
Message-ID: <967337963336cf09383003050b12c43c779e1562.1698295861.git.philipp.g.hortmann@gmail.com>
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

Convert array rx_buf[][] to array rx_buf[] as index is always 0. This
increases readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index d0d5b1dfff48..573d548e44d8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1145,7 +1145,7 @@ static void _rtl92e_free_rx_ring(struct net_device *dev)
 	int rx_queue_idx = 0;
 
 	for (i = 0; i < priv->rxringcount; i++) {
-		struct sk_buff *skb = priv->rx_buf[rx_queue_idx][i];
+		struct sk_buff *skb = priv->rx_buf[i];
 
 		if (!skb)
 			continue;
@@ -1373,7 +1373,7 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 		if (!skb)
 			return 0;
 		skb->dev = dev;
-		priv->rx_buf[rx_queue_idx][i] = skb;
+		priv->rx_buf[i] = skb;
 		mapping = (dma_addr_t *)skb->cb;
 		*mapping = dma_map_single(&priv->pdev->dev,
 					  skb_tail_pointer(skb),
@@ -1575,7 +1575,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 	while (count--) {
 		struct rx_desc *pdesc = &priv->rx_ring
 					[priv->rx_idx[rx_queue_idx]];
-		struct sk_buff *skb = priv->rx_buf[rx_queue_idx]
+		struct sk_buff *skb = priv->rx_buf
 				      [priv->rx_idx[rx_queue_idx]];
 		struct sk_buff *new_skb;
 
@@ -1614,7 +1614,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		skb = new_skb;
 		skb->dev = dev;
 
-		priv->rx_buf[rx_queue_idx][priv->rx_idx[rx_queue_idx]] =
+		priv->rx_buf[priv->rx_idx[rx_queue_idx]] =
 								 skb;
 		*((dma_addr_t *)skb->cb) = dma_map_single(&priv->pdev->dev,
 							  skb_tail_pointer(skb),
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index caa8a00cc922..2a99873fbe90 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -233,7 +233,7 @@ struct r8192_priv {
 	u8 (*rf_set_chan)(struct net_device *dev, u8 ch);
 
 	struct rx_desc *rx_ring;
-	struct sk_buff	*rx_buf[MAX_RX_QUEUE][MAX_RX_COUNT];
+	struct sk_buff	*rx_buf[MAX_RX_COUNT];
 	dma_addr_t	rx_ring_dma[MAX_RX_QUEUE];
 	unsigned int	rx_idx[MAX_RX_QUEUE];
 	int		rxringcount;
-- 
2.42.0

