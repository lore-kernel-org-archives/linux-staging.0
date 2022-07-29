Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A8D3D76
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 08:14:38 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id a89so4902244edf.5
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bql96rsyZxB76GDg2PMxZ15XLQXYm6iZUZ1zvDkMvNM=;
        b=RJLshvwMru71GvjWyDbiCin6AFbkYpMBDFCoG5TtILNQMMPHK9ttWtrN+P+e214ZUc
         D1XWjjWlDNaHJrOru/2nzk+G6M06RSPJ0SXrTswnEA8naFIBZfP6IjmSJ88Ig5s4TuyI
         QDP99YVuBwf8hXpZNmkreGb1eJzuvalx9KP5V3T1jglh61Vuq56gBUGiiA9mbjNGFWoH
         gGkg2RdzdJaa4kQcx1V12UBHmMBDrR3puAhyhdX5nEy5Jc3hLnw6e34vgJGjj8Eu23/5
         zSS8BZ9UI3YgEce8DNpc09A8Ijpe4T9v1uQaOYrteNj5fd8WoZfm8pxFc6DjnWEW7A7l
         NNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bql96rsyZxB76GDg2PMxZ15XLQXYm6iZUZ1zvDkMvNM=;
        b=uAWGx0HuM1R6lDKsQbmEnDCWlLf36KyMovX3f6OMuzbDMkYZ2r7dU7r9JpfBY5RZ67
         Unx88lJzj4G5L2P2DOGeQU0hTLLaxAYRF8s7kgBQTYIVpyAWRH9/fAUZi9t3ZN6chn4I
         LjMpsAREYnkYoZBKJnOiAK3PDTpoTzuNTD3irqXFpXVzuGLwpLgKs8LyyQ0s/sn+r19m
         P+iDPATNTAtcm3Dz+saFjybP47jusLTPMHdRx4io0XMpLT+1h2CixN6zc+UGmRLN9Emz
         EYW3k3NXQ5HI4rnd75exErlP9E9gdv4AN3j9vfmRv1PnDYqayZ1GXSUBWq2PHAsnOrrr
         XqfA==
X-Gm-Message-State: AJIora8+7ZPPy5CqOZ5tp6DR/TzPHQREgJ1IZPpP944jCzUC1jK1JVKf
	nueXBXe1qIkj8tNGtk3XjsM=
X-Google-Smtp-Source: AGRyM1uIBPYb3HQEI97ljYGfZYV5BFMyBeQmFBpOCMGfiks5T97fBYVnGRRiqpgq772bFwPNhZ82pg==
X-Received: by 2002:aa7:de85:0:b0:43a:d89f:1c7b with SMTP id j5-20020aa7de85000000b0043ad89f1c7bmr2438607edv.17.1659082476883;
        Fri, 29 Jul 2022 01:14:36 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b006fee98045cdsm344073ejo.10.2022.07.29.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 01:14:36 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:14:34 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] staging: vt6655: Replace MACvReceive1 with function
 vt6655_mac_dma_ctl
Message-ID: <ec8dbbfeccb32e0b5c753702cb70d2749426c054.1659080988.git.philipp.g.hortmann@gmail.com>
References: <cover.1659080988.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659080988.git.philipp.g.hortmann@gmail.com>

Convert macro MACvReceive1 to existing static function. This saves
codelines and multiline macros are not liked by kernel community.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Improved description
---
 drivers/staging/vt6655/device_main.c |  4 ++--
 drivers/staging/vt6655/mac.h         | 10 ----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index fb40d71d9e8e..554531411dad 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -432,7 +432,7 @@ static void device_init_registers(struct vnt_private *priv)
 
 	/* Turn On Rx DMA */
 	vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
-	MACvReceive1(priv->port_offset);
+	vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL1);
 
 	/* start the adapter */
 	iowrite8(HOSTCR_MACEN | HOSTCR_RXON | HOSTCR_TXON, priv->port_offset + MAC_REG_HOSTCR);
@@ -1147,7 +1147,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 		isr = ioread32(priv->port_offset + MAC_REG_ISR);
 
 		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
-		MACvReceive1(priv->port_offset);
+		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL1);
 
 		if (max_count > priv->opts.int_works)
 			break;
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index d21313f3067e..5a473ca393f2 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,16 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvReceive1(iobase)						\
-do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_RXDMACTL1);			\
-	if (dwData & DMACTL_RUN)					\
-		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL1);	\
-	else								\
-		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL1);	\
-} while (0)
-
 #define MACvTransmit0(iobase)						\
 do {									\
 	unsigned long dwData;						\
-- 
2.37.1

