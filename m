Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF63D76
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 08:15:00 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id i13so4883444edj.11
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hbLEgaxrLrA+lt0pf8j+1LPKczyD5CeM4DOxfzFvdCs=;
        b=UtRFL4OFdw21a1MrnvF8HlG/tm8pt0PEjiZNotdSR+BXvB4e7QtRZZkSIGTBvpjbXP
         6jZEiswjrUCJPtJLv6zodOv2cZQyEUT4Ecq6wZ9JfGo3zZbpnBXhznanYKKOhhDb7vBI
         WIOuT3vwx2N/H0JGHIr8y5I0wvMe9e76kLTJdTJIdlX1+KvKtfQVL6Qt/kjmqKd81QLo
         7wZm7AuyZ45vPVPc0Jpy+dZBl4S4bqE6r3lD2vUGmJyvBa6Gp87rVFqzd/0g5qA440W0
         31jfc8ZGYSdA5wtsxdQyIcFLky8GTCdCTKaBcvW76Arpt+iZyJv/8GfiMUvTNF2I1RGT
         a/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hbLEgaxrLrA+lt0pf8j+1LPKczyD5CeM4DOxfzFvdCs=;
        b=74ciEubEPYbm4gdVsGteOHsU3ZXH6IfpEgQSxgByzAecjlrfjhRTpxJLKSRqvQZdd6
         J68FX4Kc4ZF6yUcOHp15IY2CoNIzfsD/OPl/jzgr72i1hlNHLuLXzJoki2riOHb1/mRX
         EyFg8dQEwGERkuOScTcBCr1lwYwmexsZ54Wj3w/x/TSm3W0R1w8SxwHfeIWRBiFgSL2n
         5B8NiopRmvrrCszieDfMQLVAGs4jKFrK2aOLbpeTeDiadiXTaooWsyVjZkwNWXV0vhZ4
         0IrFUKJuk4As/TrXMK3+/ujl62llRoa1fiKSrII9wYqTcaEj737DY7Gx1XHJgi2j690g
         iXxQ==
X-Gm-Message-State: AJIora/8vZPEIreQxxgqWIdO9eLa9UjUQdUowOCdmbOIc0ROzxnllXgx
	GOhhq5DftOdv+M5UfvEAKHQ=
X-Google-Smtp-Source: AGRyM1uBjg5FfYexSGWqbMQKasmzKoc95hUfYfTRSjIi+l2ZvqN4q0bCCK7juB1Sa85VO+6nQDv4lg==
X-Received: by 2002:aa7:dbd9:0:b0:43b:6e02:7e37 with SMTP id v25-20020aa7dbd9000000b0043b6e027e37mr2455217edt.341.1659082499073;
        Fri, 29 Jul 2022 01:14:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id ee24-20020a056402291800b0043b7917b1a4sm1971865edb.43.2022.07.29.01.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 01:14:58 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:14:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] staging: vt6655: Replace MACvTransmitAC0 with
 function vt6655_mac_dma_ctl
Message-ID: <013abd177d9ac129c034776f10cdf823fd87d781.1659080988.git.philipp.g.hortmann@gmail.com>
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

Convert macro MACvTransmitAC0 to existing static function. This saves
codelines and multiline macros are not liked by kernel community.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Improved description
---
 drivers/staging/vt6655/device_main.c |  2 +-
 drivers/staging/vt6655/mac.h         | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index c0a00063e4d1..1fc8bdf8a311 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1229,7 +1229,7 @@ static int vnt_tx_packet(struct vnt_private *priv, struct sk_buff *skb)
 	wmb(); /* second memory barrier */
 
 	if (head_td->td_info->flags & TD_FLAGS_NETIF_SKB)
-		MACvTransmitAC0(priv->port_offset);
+		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_AC0DMACTL);
 	else
 		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_TXDMACTL0);
 
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index be33da59dd84..467c599a3289 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,16 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvTransmitAC0(iobase)					\
-do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_AC0DMACTL);			\
-	if (dwData & DMACTL_RUN)					\
-		iowrite32(DMACTL_WAKE, iobase + MAC_REG_AC0DMACTL);	\
-	else								\
-		iowrite32(DMACTL_RUN, iobase + MAC_REG_AC0DMACTL);	\
-} while (0)
-
 #define MACvSelectPage0(iobase)				\
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL)
 
-- 
2.37.1

