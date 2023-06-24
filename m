Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB497FC
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:04:42 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51a52fff2f0so313615a12.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 23:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687586680; x=1690178680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3T8C4UeShnoX/kA2p4evbH04NRgTdKwA7ilNwmOPeH0=;
        b=pNUfGZIMcZt4266HC7Nas0DONedBslUQYOy3Czp9p8MV4CWAnYLwGRRKhcKab5krAX
         1yPxP+HdqWZETrukA8IcpXyy6wMu+CwDuzoVftHhFg+3wrOXCIQKVthogfobjSyZbR3E
         QuSiGPuoRf4Sn62DDG9PyaG4H718xXgFYcTIOSFwoT+CYoEjwGjq5slkG7HdojNSo553
         SGvNNnqwNzfIVtaHT41O9FOnFZkVmdTM/wHAmv82Nu6iaPLu9pIa/tPmTiZek5g8rqOE
         UPYuf7AzQ3cf1U1UoVFh3CzGqrUr+AEBBEr0aHnSj2MyjhV13mVIEIFzFHbVDtFqgsLl
         BxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586680; x=1690178680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T8C4UeShnoX/kA2p4evbH04NRgTdKwA7ilNwmOPeH0=;
        b=js910skOSLY+aaXQtd5AhoseRXamD85Tqk4TayGCiOu0rtRAGeFY4YB/rHOmYomHBT
         NHTgWjiSRtcLKFDwTTZZcN7MdhyLznHAzoBKkk2T9Ek+SnBYQeJfW+v7bD2QDuiEXVQm
         mOYkSO7jJr5TLVyAVM0tqyJ6I/wI2yaKrSVxY4vRfg8PUDS9V2y2nD2vU7QCj2pvDROb
         Wf1JCQDJhBZ6gUZsyUnHxbFIV6xcJXJLasdKlfAB3yutnvY2Wm5bQMDOqDmSPnQgvWmR
         W3vryp1fVcxDfKVNDHA9Hqz6u8hbh1F5xjd9JRc5GeGypK5fvWAvyVkFKChOhC2Z4fM9
         D7Tw==
X-Gm-Message-State: AC+VfDwi38ZegOGJt9pP5cBODvbm24FSnC7PEANjUgzw6UPLHKwRaxhM
	hH600MPYYxFfnLZNL7YifqA=
X-Google-Smtp-Source: ACHHUZ6rsTFYz7kROdutExy2vh/9WiuzbEnae/KU3XYefeFprKV5Shivkn2H8Wnar8MfFuUhr85ZrA==
X-Received: by 2002:a05:6402:270f:b0:514:971b:7f36 with SMTP id y15-20020a056402270f00b00514971b7f36mr17612423edd.3.1687586680385;
        Fri, 23 Jun 2023 23:04:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id d26-20020aa7d69a000000b0051bfd21d21asm319307edr.46.2023.06.23.23.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:04:39 -0700 (PDT)
Date: Sat, 24 Jun 2023 08:04:36 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] staging: rtl8192e: Remove variable bdisable_nic
Message-ID: <6b083ce8c4aaf42f366c365cbc47178afa2636d4.1687583718.git.philipp.g.hortmann@gmail.com>
References: <cover.1687583718.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687583718.git.philipp.g.hortmann@gmail.com>

Remove variable bdisable_nic as always set to false. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 12 ------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index e9eb55c6e6d8..23f9b729940b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -618,8 +618,6 @@ static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
 					(&priv->rtllib->pwr_save_ctrl);
 	bool init_status;
 
-	priv->bdisable_nic = false;
-
 	priv->up = 1;
 	priv->rtllib->ieee_up = 1;
 
@@ -760,7 +758,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->up_first_time = 1;
 	priv->blinked_ingpio = false;
 	priv->being_init_adapter = false;
-	priv->bdisable_nic = false;
 	priv->txringcount = 64;
 	priv->rxbuffersize = 9100;
 	priv->rxringcount = MAX_RX_COUNT;
@@ -1498,12 +1495,6 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 	int   idx;
 	u32 fwinfo_size = 0;
 
-	if (priv->bdisable_nic) {
-		netdev_warn(dev, "%s: Nic is disabled! Can't tx packet.\n",
-			    __func__);
-		return skb->len;
-	}
-
 	priv->rtllib->bAwakePktSent = true;
 
 	fwinfo_size = sizeof(struct tx_fwinfo_8190pci);
@@ -2245,20 +2236,17 @@ bool rtl92e_enable_nic(struct net_device *dev)
 
 	if (!priv->up) {
 		netdev_warn(dev, "%s(): Driver is already down!\n", __func__);
-		priv->bdisable_nic = false;
 		return false;
 	}
 
 	init_status = rtl92e_start_adapter(dev);
 	if (!init_status) {
 		netdev_warn(dev, "%s(): Initialization failed!\n", __func__);
-		priv->bdisable_nic = false;
 		return false;
 	}
 	RT_CLEAR_PS_LEVEL(psc, RT_RF_OFF_LEVL_HALT_NIC);
 
 	rtl92e_irq_enable(dev);
-	priv->bdisable_nic = false;
 	return init_status;
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 1cb68d53a17e..38b215d86eeb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -322,7 +322,6 @@ struct r8192_priv {
 
 	bool rf_change_in_progress;
 	bool set_rf_pwr_state_in_progress;
-	bool bdisable_nic;
 
 	u8 cck_pwr_enl;
 	u16 tssi_13dBm;
-- 
2.41.0

