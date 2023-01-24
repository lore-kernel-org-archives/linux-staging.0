Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBF78F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:03:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z5so15272511wrt.6
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3QUDM7lOv5vhtcSI90OpPSN2/l5dUarb+bY6Rv4FS0=;
        b=HnDQ8jcUqzklYtZ+03sHwmyFK6XwULAk90aX9K8vKRZmzTSzBSE+x5U9WJUQ/2ZMiw
         5WJx8nGlSFG2PmE+vjWUNeWoaJ9PEX9JZCRSuTCWKjIrS6jWn0/6xXZR3Zve4GhWrkgw
         VtZ1HdZxdEFE58L+Y/ohnStgDkf1/Cw9aa0wq8F7rXCprFFhPUxPkNprBf09rSikdYjd
         47lB4MR8ZiZcyCBMvaynOXwckJ59EWSeFzrWegWYI263Y859xrv4Ft1w5Boois8daGpz
         87BmOatXXFM1w0iLc3E1wjcKQwQTeap/iQd3xoGEpcz3i33hFIwInjllbVUsE3OD70pL
         /N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3QUDM7lOv5vhtcSI90OpPSN2/l5dUarb+bY6Rv4FS0=;
        b=fr4rLDX43av/YbTfV8gwut8qmKTRNxvYz9Cf/lCQ+mm5BDuZTYEX0LmEmRUc21lJEX
         rrAkS+KGyW7hJ4rO/cSM+vxtAsUrQ1u7UEvc15nyROwpqBDFGbEGamMUCLYX8OaAWUbf
         HiKhDxMezUwEytX9H8XHHSw5Akay/8b0mHdAU9EVJAPfT+ZVLJiRHKGBZccklDW1piaf
         OWwr2VfsSMjnjofYdwXWJDbkZ0wWfdNP3ffyq8UWZI4oglLmK20RkdK5/qC67Ar0Mo8g
         XqIFbN7zBMWbItOS4WDZneQuu4niaPicbTv2kZRVYmSUILdwMALz3aU6jNJxRkG5AvlR
         sicg==
X-Gm-Message-State: AO0yUKXe/JhF1dMQI2h0UcI8baLUgm48z386t113SHaZsv/nOHowWZ5d
	cnG5CBYJa3dJgs19pg7IVDU=
X-Google-Smtp-Source: AK7set+Cr6heynZXLavpDc+Ia+seioc9hbM7lP1X3/fJLtZQZLJjHAqPoGInE80nkbLJs5ni7ZPJFg==
X-Received: by 2002:adf:a492:0:b0:2bf:b9b1:9568 with SMTP id g18-20020adfa492000000b002bfb9b19568mr3649wrb.2.1674597793145;
        Tue, 24 Jan 2023 14:03:13 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id r4-20020a5d4e44000000b0027cb20605e3sm2814715wrt.105.2023.01.24.14.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:03:12 -0800 (PST)
Date: Tue, 24 Jan 2023 23:03:10 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: rtl8192e: Remove unused variables rxrdu and
 rxok
Message-ID: <20738d339066e36f5347c7e5011bd3d1aa3e4f53.1674596722.git.philipp.g.hortmann@gmail.com>
References: <cover.1674596722.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674596722.git.philipp.g.hortmann@gmail.com>

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

