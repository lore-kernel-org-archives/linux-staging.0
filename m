Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073617CA3
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 22:46:33 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e11so14082588wru.8
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 14:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEaJLedtxp4Hd4OqGYxt+eo5FX2zcD+DeLqh0BnkZRE=;
        b=htH6hiIze2cA8azBJCi1YaJk/VDgg84GAWotqblQ09VK/wBHIlp4u3VqNiJ8ufYlIZ
         yQV6VjC42gjeBOTKRlWYofvHJubGgUOHGnHFmAKufSrIStW3Df8tnKQNQ5i3xVh3jTMs
         S6S3x5gxJn9jNSOqO7lvraQpf44qwGKunVEVOF08Flwc9u1/I6QvaYrtpluz/BP5QjHt
         Za+Mn4P+WDNEFwQS01ihYWoC5l8zpPj7/TFC1OHRmyaSWdX/JlnKRboef72xCBl4rfPj
         Xtiu1eNh2Rh2w+fXn0pDoN6FlIj9WP+EcGUHsbv6Ib2u9LEqD0gx0D/qD6B5zcz2omiF
         rcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEaJLedtxp4Hd4OqGYxt+eo5FX2zcD+DeLqh0BnkZRE=;
        b=UmjV9z5a4JXtf8cZ6hsv5qDVmAkZR1ftzgtdtWEIHIq0LixSzZxA3ethQm88eaZSrR
         ep0B2uNdChe29Yp2JZoWr+wgrNbApb4yn9X0HEmxQJozMvPrdz3Tu2xH+JQvtTR2bMSl
         /229OGxUyFiCWRaR2nueQQng0kXWi4mlu2L6wXWVFmBXa2fZThjtYwiQcpEa/chxeYtj
         J5MmBNRV1wLaVW2ImIs4KJWtXhQsfpLHt2LxQfRdN+3E4BrJr/U6iJpq6sT48svuvJMp
         PrhJ7j9XAgdK1pBV4RaHc/osFFhppc6FPAXkNYDlYUQL6fDRhKLtogmduefAjrptmdmE
         0I9g==
X-Gm-Message-State: ANoB5pm2aV4FXaKbbb/eXCpuWk1qlTcIv4NEyLf2eO6mMjuqert0/y4z
	MZOmDIe9kQWiJGPTZKOcB7s=
X-Google-Smtp-Source: AA0mqf6wsqjCTuK+EIEbfNaR6eiboD6gYIG0Df1WvEzxJ/tgJfrjB4le2tp8RIaqluCvI3HVucqi6A==
X-Received: by 2002:adf:c64e:0:b0:236:78cd:f3d2 with SMTP id u14-20020adfc64e000000b0023678cdf3d2mr16049108wrg.719.1669157191563;
        Tue, 22 Nov 2022 14:46:31 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm153935wmq.31.2022.11.22.14.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:46:31 -0800 (PST)
Date: Tue, 22 Nov 2022 23:46:29 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] staging: rtl8192e: Remove unused variable int_log
Message-ID: <e2edcde052cc3c47e6e6b94d09e460b8cf6a49a8.1669156825.git.philipp.g.hortmann@gmail.com>
References: <cover.1669156825.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1669156825.git.philipp.g.hortmann@gmail.com>

int_log is initialized and incremented but never evaluated. Remove
resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 15 ---------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  2 --
 3 files changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index 53fd79a28189..ac192254a4bb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -154,21 +154,6 @@ struct tx_fwinfo_8190pci {
 
 };
 
-struct log_int_8190 {
-	u32	nIMR_COMDOK;
-	u32	nIMR_MGNTDOK;
-	u32	nIMR_HIGH;
-	u32	nIMR_VODOK;
-	u32	nIMR_VIDOK;
-	u32	nIMR_BEDOK;
-	u32	nIMR_BKDOK;
-	u32	nIMR_ROK;
-	u32	nIMR_RCOK;
-	u32	nIMR_TBDOK;
-	u32	nIMR_BDOK;
-	u32	nIMR_RXFOVW;
-};
-
 struct phy_ofdm_rx_status_rxsc_sgien_exintfflag {
 	u8			reserved:4;
 	u8			rxsc:2;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7b78bdfadc8d..f8fbe78ccad9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -866,8 +866,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rst_progress = RESET_TYPE_NORESET;
 	priv->force_reset = false;
 	memset(priv->rtllib->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
-
-	memset(&priv->int_log, 0, sizeof(struct log_int_8190));
 	priv->rx_ctr = 0;
 	priv->rtllib->wx_set_enc = 0;
 	priv->hw_radio_off = false;
@@ -2185,7 +2183,6 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 
 	if (inta & IMR_ROK) {
 		priv->stats.rxint++;
-		priv->int_log.nIMR_ROK++;
 		tasklet_schedule(&priv->irq_rx_tasklet);
 	}
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index ca2e685148d4..cceb77492363 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -317,8 +317,6 @@ struct r8192_priv {
 
 	struct work_struct				reset_wq;
 
-	struct log_int_8190 int_log;
-
 	enum rt_customer_id CustomerID;
 
 
-- 
2.37.3

