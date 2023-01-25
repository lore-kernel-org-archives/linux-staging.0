Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543956FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:09:36 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so2135663wmc.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUNK4telbL5iEm9hMJeiQP6SRHQdjAr35nMvZWBiILs=;
        b=REd4vr+NBUQzVGTn98U8rYpH2ztbkzE46mstrYzWVGqc6JaLtIGyXUEXeQaMNry8kG
         8Np9kCEW0zrxUpZ0uq/bQCP247NQl8Ygff6Rb9Mw3xJXO4fufvQrpVUGHZJMM3+PjA/D
         bAWsJhV67XoXXs2EOA3HdfZY/4ohZvP8e8p4E9wInWYxMjseqMg7XlW+Tv94sDV3gUmg
         MdADRNptB9qFbCXuJzg8rPdfmcZa7Ax0OIT4RHo8R8inA0v+6DJ4A3S7keWLmHJPfb/q
         i39yTLdw2v91ILvGUGOOm8JeHw6bWSmVhJD0XSL6xTtFgHdQU6gZcgstxE0dzLk46uyd
         9MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUNK4telbL5iEm9hMJeiQP6SRHQdjAr35nMvZWBiILs=;
        b=76ETWz5puB9BN7ihIffHiBgbiypn83OI1hOV3kWr5fzKtsohDVdpP3cj1ayDdbOJfJ
         5tqjlyRM0u9RHpEEy6/9fRGuCzbGbjbakh8dt6/vJLojjPE/fdoqKKUClrMBjFOWUAo0
         hDLR4rlVa2r0jCS3F2Uk1z9jS9JYYZ9a6B5dJQWdGP7+dchAZLzeRplRGCB6Zjjo0bYq
         31iPLaxalNlHrDzDWzOmPKtKman3/hWlYsqKb/nptFqqmzofb/Yq8bW5dumqSkZnZjrW
         40No/oaZAndln6Bcjn8LhziMY+2GG0nSUnfmVpo1W2VhgRZsVIXKx1+HanvpzTECEoRG
         TOsQ==
X-Gm-Message-State: AFqh2kr6IP5okVMYkA4SgeDcUQ8+lfqvoNwDQXNRbvHhDkfUXLhno27p
	a2ollabYDLRddDQWw0cgRQBdUg2ytjE=
X-Google-Smtp-Source: AMrXdXuepv1cKXrMXx18nZpaMQWWKMg9TVj9FBgPL1rBbx9bj+2ZLOkP+Euv57+gjC7jBl1bo1b82Q==
X-Received: by 2002:a05:600c:1c83:b0:3da:ff24:4b93 with SMTP id k3-20020a05600c1c8300b003daff244b93mr8571356wms.3.1674677374737;
        Wed, 25 Jan 2023 12:09:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id h24-20020a05600c499800b003dc1a525f22sm2642847wmp.25.2023.01.25.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:34 -0800 (PST)
Date: Wed, 25 Jan 2023 21:09:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] staging: rtl8192e: Remove unused variables
 txbytes.., txbyt.. and signa..
Message-ID: <c469f82619625fecbed95532967cc7ec2b12e5f9.1674675808.git.philipp.g.hortmann@gmail.com>
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

txbytesmulticast, txbytesbroadcast and signal_quality are initialized and
increased or set but never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 6 +-----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 3 ---
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 9d13fda33fbf..3989d484cc33 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1613,7 +1613,6 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 
 			tmp_val = priv->stats.slide_evm_total /
 				  slide_evm_statistics;
-			priv->stats.signal_quality = tmp_val;
 			priv->stats.last_signal_strength_inpercent = tmp_val;
 		}
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 2c5edda74e73..f8a8ece40ac1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1616,11 +1616,7 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 	type = WLAN_FC_GET_TYPE(fc);
 	pda_addr = header->addr1;
 
-	if (is_broadcast_ether_addr(pda_addr))
-		priv->stats.txbytesbroadcast += skb->len - fwinfo_size;
-	else if (is_multicast_ether_addr(pda_addr))
-		priv->stats.txbytesmulticast += skb->len - fwinfo_size;
-	else
+	if (!is_broadcast_ether_addr(pda_addr) && !is_multicast_ether_addr(pda_addr))
 		priv->stats.txbytesunicast += skb->len - fwinfo_size;
 
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index c6a4ac6ce959..4cf776094ac0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,8 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long txbytesmulticast;
-	unsigned long txbytesbroadcast;
 	unsigned long txbytesunicast;
 	unsigned long rxbytesunicast;
 	unsigned long txretrycount;
@@ -195,7 +193,6 @@ struct rt_stats {
 	unsigned long	slide_rssi_total;
 	unsigned long slide_evm_total;
 	long signal_strength;
-	long signal_quality;
 	long last_signal_strength_inpercent;
 	long	recv_signal_power;
 	u8 rx_rssi_percentage[4];
-- 
2.39.1

