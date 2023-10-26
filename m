Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50FCFBF5
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrScIyvz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54115c72f78so116126a12.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299060; x=1698903860; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=imLoq3QOIDWhZVVFMyITjeWZi//HhodEfugMiQeWmFQ=;
        b=SrScIyvzFjN9FFjWEfoNnsr4CUz0AuEZ3XeplIQjrM7qpRS53WYwOCDDd77FQeJGXG
         GXmwwZ1eHOiupa8MToKHQ9SqBJ7v/56HAVtfh6pli1wSxfyiJUzFuEqFmCGLtfvWS6RR
         quPF4HFWDsCl9rmy3yPJ3DqDioIRO0aoFik2aPmQHt5AP3PNBuguxEGBaXY7J/8i9UR5
         HfU8vlO8XO13aqPxDfs2rdpsEJ54m0R1xq1uRNejYM2xOJNT2Gb9zXaCinSfdbvLFZ+N
         cul9ID9vVeqlWkcYs3Kb15fZsHTEtMZl0eMjn4MKOSo1Xo3EJY2siTJgbpG7ULASGewU
         ajlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299060; x=1698903860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imLoq3QOIDWhZVVFMyITjeWZi//HhodEfugMiQeWmFQ=;
        b=SQOdXofVVsMDrWR7wBi7hGMcaSJMAmDxK0UfsjG1wIlEl5AgXhPMnIXdvRkAxWAtKE
         /aw/aeKnUOrNFDCUxOZWIX1g4IfhRXMGtED2SkHZ2ZtXBn2IQgKGocxscqVhVhPg9Wun
         m79jzWzhRH09kgJsU6MIdXXqmWzTF17lydbeQN8pblkdUUsX6vWPqB2W/HlLc1gF7AZE
         gHQYCXB6VuAjSyEXOdR6bsAhUxnHdnURknwL6aEFQi4H0FFH9O+ao96C+pzM9iX21ypK
         ClrPI7i19Do54/dyxUXhsaPNmDC0QK10wdXeFH1tu+dEkYwKJHr/dNdsCqHS/Qvtsv2H
         9n9w==
X-Gm-Message-State: AOJu0Yy8qML35Fos+yY3aE+TX2DQKta2QDm50i1FyJ1V0EViDb2bmdnx
	hfUiLawpGcAJnNwIL1avKHQ=
X-Google-Smtp-Source: AGHT+IHOXgcA1TCybO2sbdaKfI+5D4MQxJngk/NOUAuorwVFoL4JhzWvNNBViBPEB/4sQHXxWbEkkQ==
X-Received: by 2002:a17:906:59a5:b0:9cb:798f:91e8 with SMTP id m37-20020a17090659a500b009cb798f91e8mr5736638ejs.6.1698299059999;
        Wed, 25 Oct 2023 22:44:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n13-20020a17090673cd00b00991faf3810esm11261518ejl.146.2023.10.25.22.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:44:19 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:44:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Convert array rx_ring_dma[] to
 variable rx_ring_dma
Message-ID: <51d3be0a715452cefe5ac6dd29a86fbe65b824fa.1698295861.git.philipp.g.hortmann@gmail.com>
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

Convert array rx_ring_dma[] to variable rx_ring_dma as index is always 0.
This increases readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e343e10e011a..e93394c51264 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1841,7 +1841,7 @@ void rtl92e_enable_rx(struct net_device *dev)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 
-	rtl92e_writel(dev, RDQDA, priv->rx_ring_dma[RX_MPDU_QUEUE]);
+	rtl92e_writel(dev, RDQDA, priv->rx_ring_dma);
 }
 
 static const u32 TX_DESC_BASE[] = {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 573d548e44d8..8af732870ddf 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1159,7 +1159,7 @@ static void _rtl92e_free_rx_ring(struct net_device *dev)
 	dma_free_coherent(&priv->pdev->dev,
 			  sizeof(*priv->rx_ring) * priv->rxringcount,
 			  priv->rx_ring,
-			  priv->rx_ring_dma[rx_queue_idx]);
+			  priv->rx_ring_dma);
 	priv->rx_ring = NULL;
 }
 
@@ -1356,7 +1356,7 @@ static short _rtl92e_alloc_rx_ring(struct net_device *dev)
 
 	priv->rx_ring = dma_alloc_coherent(&priv->pdev->dev,
 					   sizeof(*priv->rx_ring) * priv->rxringcount,
-					   &priv->rx_ring_dma[rx_queue_idx],
+					   &priv->rx_ring_dma,
 					   GFP_ATOMIC);
 	if (!priv->rx_ring || (unsigned long)priv->rx_ring & 0xFF) {
 		netdev_warn(dev, "Cannot allocate RX ring\n");
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 2a99873fbe90..b3ebff2df62a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -234,7 +234,7 @@ struct r8192_priv {
 
 	struct rx_desc *rx_ring;
 	struct sk_buff	*rx_buf[MAX_RX_COUNT];
-	dma_addr_t	rx_ring_dma[MAX_RX_QUEUE];
+	dma_addr_t	rx_ring_dma;
 	unsigned int	rx_idx[MAX_RX_QUEUE];
 	int		rxringcount;
 	u16		rxbuffersize;
-- 
2.42.0

