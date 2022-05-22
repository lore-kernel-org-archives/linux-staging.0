Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3433E3
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:49:14 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id gh17so11722692ejc.6
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tW0vbsqNyBqWB8eLL+zLqE/3yrno5YNaQTHqzB2WNng=;
        b=CanW3o/0o7Jp9mq96FqklsTPi1uCmU/qtWV7warAwwNfuZSx/IOX9GSUQaCh/OXvbT
         LjhpL4jqooFmFpYAzSfB4DJd7xPItmL7RPPx98S3DZTIfLYeT2aZ5G22D7K6n+27JPsq
         LIl2vqmI7gi3cGs/ZMaW0WTlY4SV4l0xG+MQIwTLnQdTu7Tn6Hbof2ePagFwaJZgNaE7
         n4HVCs87I+vwn3bJc3a0IKugkSHdaPN2p7fDk5O9fds47e49cCWwxQpaC87ZV5kQhR0o
         xSNvCK0bzfR35kLXASDo9x8MRsBKpu+Axw44yxEPC7Pm+4aM/eUNAlfsU8hOD5vphvJK
         ZhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tW0vbsqNyBqWB8eLL+zLqE/3yrno5YNaQTHqzB2WNng=;
        b=56DrFKsCfeLeTIH2BAHf+vq8R9kjsrCvyeOh8XNWoaJM5MsrjaBEfYDDu/UUcuZjst
         hLwEb68IZ7i5qtN/cXxKJSp7IndDoNmFbi6KSEIdFWo81F9clMnOWtQCugJtUnidgYnb
         +gnhqWfZ6xBzBOKotIxBVvaalZKrgw7MWZiPLMJH9faOaLtLaBqAgQkUDEweqcIbg9CW
         Yjuij/e3AswCO1GlJWX3B+qTDVP9tKenhevklNeAErcTDBAFyK4JohUA+iLU0I+b/KQK
         34gIGT5mjZ0MtUulj+Ld+PVNnXeEo8zMjqXAA7swf1YvAnQgXIvkk5AVjoe9INQ2ynfa
         vT6Q==
X-Gm-Message-State: AOAM531m/YPt3szdiMTCf81m1HcFAQC+lHohBxCsacb6yc9H/kz200Ky
	lOdoRm8KREsKX2IVEQLrIFo=
X-Google-Smtp-Source: ABdhPJwF+yD1jv0wGZgcBf3rKgRIMvhBNXlvV3liHMIFonghMV8p+lKTdUB9PPOFuwfSLSKwW9IiyA==
X-Received: by 2002:a17:907:8c8c:b0:6fe:ecbf:3412 with SMTP id td12-20020a1709078c8c00b006feecbf3412mr495869ejc.377.1653248953106;
        Sun, 22 May 2022 12:49:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id sa24-20020a170906edb800b006fe8ac6bc69sm2782191ejb.140.2022.05.22.12.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:49:12 -0700 (PDT)
Date: Sun, 22 May 2022 21:49:10 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] staging: vt6655: Replace MACvSetCurrBCNTxDescAddr with
 VNSvOutPortD
Message-ID: <1db079979f7e0e3535463d9f31204aa708c6f680.1653203927.git.philipp.g.hortmann@gmail.com>
References: <cover.1653203927.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1653203927.git.philipp.g.hortmann@gmail.com>

Replace macro MACvSetCurrBCNTxDescAddr with VNSvOutPortD and as it
was only used twice, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl
VNSvOutPortD will be replaced in this patch series.
---
 drivers/staging/vt6655/card.c | 3 +--
 drivers/staging/vt6655/mac.h  | 5 -----
 drivers/staging/vt6655/rxtx.c | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 72043a29b543..23804cd72477 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -411,8 +411,7 @@ void CARDvSafeResetTx(struct vnt_private *priv)
 	MACvSetCurrTXDescAddr(TYPE_AC0DMA, priv, priv->td1_pool_dma);
 
 	/* set MAC Beacon TX pointer */
-	MACvSetCurrBCNTxDescAddr(priv->port_offset,
-				 (priv->tx_beacon_dma));
+	VNSvOutPortD(priv->port_offset + MAC_REG_BCNDMAPTR, priv->tx_beacon_dma);
 }
 
 /*
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index a1d5eb52ddc4..89a3979aeb10 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -565,11 +565,6 @@ do {									\
 	iowrite16(wData & ~(wBits), iobase + byRegOfs);			\
 } while (0)
 
-/* set the chip with current BCN tx descriptor address */
-#define MACvSetCurrBCNTxDescAddr(iobase, dwCurrDescAddr)	\
-	VNSvOutPortD(iobase + MAC_REG_BCNDMAPTR,		\
-		     dwCurrDescAddr)
-
 #define MACvWriteBSSIDAddress(iobase, pbyEtherAddr)		\
 do {								\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 390b27b02562..03c2ab8489fa 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1420,7 +1420,7 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 
 	priv->wBCNBufLen = sizeof(*short_head) + skb->len;
 
-	MACvSetCurrBCNTxDescAddr(priv->port_offset, priv->tx_beacon_dma);
+	VNSvOutPortD(priv->port_offset + MAC_REG_BCNDMAPTR, priv->tx_beacon_dma);
 
 	iowrite16(priv->wBCNBufLen, priv->port_offset + MAC_REG_BCNDMACTL + 2);
 	/* Set auto Transmit on */
-- 
2.25.1

