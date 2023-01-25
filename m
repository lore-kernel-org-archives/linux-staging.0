Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A16FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:08:26 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id m7so4548496wru.8
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3QUDM7lOv5vhtcSI90OpPSN2/l5dUarb+bY6Rv4FS0=;
        b=EsA4nNT7fKM/RgL86Ec0d6j21wZFI6rqkqUVKwXTv/qCBhPLXnRsXqDfJBRyGewGcn
         U5L+nc7rPhUomHI/JBCFiVhS0rMIHJMkvJq9uKVQu3m7kIT0LBt3gAZcAfW7SR3lf1kH
         6i0wHyZHWlrhNu1PzmaDPNlxU/WQDi/fxhZT2g9DHDD2d6OBI1O3W5KTaMB0tVz2Ty3j
         +FZWWYunXyEg3IcyxXGaJo0gcNGVMqg+GPNJaMX7SjNtdWzTr2JRNXpQuWGLR2H/Ypke
         uXrpteTVjyxS5kqotOirCtArEMMxL9FJ4Dkfsz/cusaeCtOODeLxxejS3geGAZnFR06N
         nOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3QUDM7lOv5vhtcSI90OpPSN2/l5dUarb+bY6Rv4FS0=;
        b=rBrxtGhmxxzy4V9xuC5W+MH0xiRfoFWH8TZpUApisc30OuffmraSdBkaBHABg4JRyd
         qH2/Xjt79m4rNnKRQyL2/lfBnfI3K6kkdwaxL19hzgFncMGYGSYajWUeFCwWZbAX50pW
         +CxijffehJih0YcMuFXI0rh5lDItWRIi3fObrwGhquWCI3yIV6qbQ4bbzK2Bn2ii4Neo
         HdPCIA4JY+BT+Uvfb9Qx0prG7sozo/S/R21nBZs4wg52kHlQHg9Wj0j1jBbKSuWoqvPC
         8um19xSpQwp0fzWDzzltnu2U+KVeTyxMbnfo2lUifLgFwDHaqoA+jVwi41z4857x2y0O
         zb7g==
X-Gm-Message-State: AFqh2kq8berixCt7M3SqGaO0RsVqVJveX3k9l1jTorLGzz2gHz2AHP1F
	fPoK10dzSUV841voosFvrBw=
X-Google-Smtp-Source: AMrXdXv0uHv236FNy6MmU6roGijeMmtfDbRsvZpQDZHkC8pSAM1AXkg2KKO9Dc+/Nrqu8t15i8vAZA==
X-Received: by 2002:a05:6000:1088:b0:2be:5295:bd9e with SMTP id y8-20020a056000108800b002be5295bd9emr3999634wrw.7.1674677305155;
        Wed, 25 Jan 2023 12:08:25 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05600c3d9800b003d1d5a83b2esm2701098wmb.35.2023.01.25.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:24 -0800 (PST)
Date: Wed, 25 Jan 2023 21:08:22 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] staging: rtl8192e: Remove unused variables rxrdu
 and rxok
Message-ID: <20738d339066e36f5347c7e5011bd3d1aa3e4f53.1674675808.git.philipp.g.hortmann@gmail.com>
References: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674675808.git.philipp.g.hortmann@gmail.com>

rxrdu and rxok are initialized and increased but never read. Remove dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 80450d46191c..605146c840c7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1938,7 +1938,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		if (!rtllib_rx(priv->rtllib, skb, &stats)) {
 			dev_kfree_skb_any(skb);
 		} else {
-			priv->stats.rxok++;
 			if (unicast_packet)
 				priv->stats.rxbytesunicast += skb_len;
 		}
@@ -2186,7 +2185,6 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		tasklet_schedule(&priv->irq_prepare_beacon_tasklet);
 
 	if (inta & IMR_RDU) {
-		priv->stats.rxrdu++;
 		rtl92e_writel(dev, INTA_MASK,
 			      rtl92e_readl(dev, INTA_MASK) & ~IMR_RDU);
 		tasklet_schedule(&priv->irq_rx_tasklet);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 983bc663a570..82cbc7f5536a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -183,8 +183,6 @@ enum reset_type {
 };
 
 struct rt_stats {
-	unsigned long rxrdu;
-	unsigned long rxok;
 	unsigned long rxdatacrcerr;
 	unsigned long rxmgmtcrcerr;
 	unsigned long rxcrcerrmin;
-- 
2.39.1

