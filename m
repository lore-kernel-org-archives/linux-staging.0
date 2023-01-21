Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65385395
	for <linux-staging@lists.linux.dev>; Sat, 21 Jan 2023 21:44:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso6028135wms.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Jan 2023 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZoNlyGEzH+kRtX90Fp6TGkEBqbyFKQBWafIzoqpx24=;
        b=gULpFAAhxcluTbRql5M1HyxwCkBQDxBZ+Tag4Rz4pndbVmvE8u/2CMFIWVKRyP6Vn3
         1IcTQL93KsokkQCdS+tueBh2wMTu6D8jIJbrHVpA6JB0ygKQyF6YeeL8E++WCkGqNNv/
         5dA1aYTFhVSDHPjpvGZsknke1UmiEDDugBFrj1IiLKUOvoDEv9ChhuGemMVqp1zS9zF1
         OZXasDcVb5x3+wYEjWdn9Ma+hSkJT1qqzSxit/XkWpk0gRXoOMBVLLBa7ORc52IWsXd2
         sa3Uqp6tsbymBKZ+FVe6724c4vo9eMZVCHxmXlq5neHOjNSoddlS0+cqoE/HBDRJ2wEj
         UwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZoNlyGEzH+kRtX90Fp6TGkEBqbyFKQBWafIzoqpx24=;
        b=uEJTVi/K2fIjxwvvj9VqUPCGy8tyhtGYPrIQ91YXHKSxsblEJt9ba+X5pQH98dpOXI
         /HNQ/1PHMZIV1bBCGIDPemFk7gNxRkWwz0hE6XGduGm4AuPwsK6XcIRn/8c4FBxB4w5u
         IifB9pJd3W49BGArgQ3NEAtIqlI5IpSinsdbBgnmpMZwLWhvf8mo0lSJtQNjwYy09TiP
         rmr/owncsGu4B6C/R2KYVxCnNkOkEEdSYTmy8p4YvjMI+S1b1EodRq448Z5/sSMmnakQ
         e1DbkGJyw49+NQaNjmKOo/VO8uPnqzV8deCH4Nxh0dFM/8OeeKLq9DV/6/HJZWz+DXv/
         FeVA==
X-Gm-Message-State: AFqh2kp/SBc9LwjTF5DJMeSrb1Z1/ws2uniSESvwTJl+i5hhqsQ15hAd
	O1mERNsh+THp1viOYaEBg2k=
X-Google-Smtp-Source: AMrXdXuXHtG0IVkGciFWV03e7ox79YQN8u3OPYVVrHgR9UM1otsGKleDBu7N825XRzuAMj2yHt5Eow==
X-Received: by 2002:a05:600c:3b06:b0:3d3:446a:b493 with SMTP id m6-20020a05600c3b0600b003d3446ab493mr5089729wms.4.1674337495560;
        Sat, 21 Jan 2023 13:44:55 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b003dafadd2f77sm6956549wms.1.2023.01.21.13.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 13:44:54 -0800 (PST)
Date: Sat, 21 Jan 2023 22:44:53 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8192e: Remove unused variable bfirst_init
Message-ID: <d4f4552e5dbaa036a762590bf47bd5faff15b598.1674336211.git.philipp.g.hortmann@gmail.com>
References: <cover.1674336211.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674336211.git.philipp.g.hortmann@gmail.com>

bfirst_init is six times set but never evaluated. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 ------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7a89381bae50..80450d46191c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -692,16 +692,13 @@ static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
 	priv->rtllib->ieee_up = 1;
 
 	priv->up_first_time = 0;
-	priv->bfirst_init = true;
 	init_status = priv->ops->initialize_adapter(dev);
 	if (!init_status) {
 		netdev_err(dev, "%s(): Initialization failed!\n", __func__);
-		priv->bfirst_init = false;
 		return -1;
 	}
 
 	RT_CLEAR_PS_LEVEL(psc, RT_RF_OFF_LEVL_HALT_NIC);
-	priv->bfirst_init = false;
 
 	if (priv->polling_timer_on == 0)
 		rtl92e_check_rfctrl_gpio_timer(&priv->gpio_polling_timer);
@@ -837,7 +834,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->blinked_ingpio = false;
 	priv->being_init_adapter = false;
 	priv->bdisable_nic = false;
-	priv->bfirst_init = false;
 	priv->txringcount = 64;
 	priv->rxbuffersize = 9100;
 	priv->rxringcount = MAX_RX_COUNT;
@@ -2423,7 +2419,6 @@ bool rtl92e_enable_nic(struct net_device *dev)
 		return false;
 	}
 
-	priv->bfirst_init = true;
 	init_status = priv->ops->initialize_adapter(dev);
 	if (!init_status) {
 		netdev_warn(dev, "%s(): Initialization failed!\n", __func__);
@@ -2431,7 +2426,6 @@ bool rtl92e_enable_nic(struct net_device *dev)
 		return false;
 	}
 	RT_CLEAR_PS_LEVEL(psc, RT_RF_OFF_LEVL_HALT_NIC);
-	priv->bfirst_init = false;
 
 	rtl92e_irq_enable(dev);
 	priv->bdisable_nic = false;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 59049ad349e0..e0f4a3b444ee 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -298,7 +298,6 @@ struct r8192_priv {
 	struct pci_dev *pdev;
 	struct pci_dev *bridge_pdev;
 
-	bool		bfirst_init;
 	bool		bfirst_after_down;
 	bool		being_init_adapter;
 
-- 
2.39.0

