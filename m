Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9613FD6
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 19:27:09 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id v10so12852918edj.10
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QClhxZ+AZAH6ofVBThAd6ZW1zKMJBDT7Zzv3Fto76P4=;
        b=IhcbDfUTa5/W63+yfTgQ3RjESsADU5/VV6eZzy+rUk/dRzudvbRjcHrpVO6LFnHVaS
         Fcypmx9zfs2kb4EJDOaF7oBZooGslbP3uoNEAEUYsXPxYG05spW5FWoMgU8+5xaf/B6C
         pPQToOZoGWztw7HFXulEAxW7ygPHu2g1tLrpi3/bbtGtlnhAhW6R0GtJUKLZ+go9ogg0
         BhGbJNfIkvR8Y+bTbtBzjZjfcBbQA+/D7iYA2M+tBs8ePax/sQ/AagksUp1ofaWjDM/H
         EGa/Y20DwcYL1JyRSvlSaIkLsiGV11vjw4Lbgy11ei389MosB5dF4jJD44gVJG2kTDmH
         IbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QClhxZ+AZAH6ofVBThAd6ZW1zKMJBDT7Zzv3Fto76P4=;
        b=Hq1Lj+dnc7wLAoCDLrAsbnB2qt7oQhbvojiQA3PnPFqT0HgV+MehtejXvmz8Nnc+8W
         ybYCC3ponOJQnqRcKArIsDxazmP7Z4BXKo/Egn8XVZqmFdwVA1ISPS4k6x2+QFaPNv+9
         c2QtMiB7aACp3BWxh0Bimg9RRfIKMOtVsmasYLmnUvn7nfHnfhdYX3V7SSgT2RTVotw4
         MSVQWNxd6+y6NO0svdTbIy/nloyvX58wEeaW2JkSui9qZCSc6m2WEIjOG4/AMjyz0YHB
         pcW6KjStH1haE4clI3NvMCRJN8JpLhrw4U8rta5isc+ge2U/JwPKG8zMGtie6ssqk0AS
         Wj9A==
X-Gm-Message-State: AOAM5311nCszfoO6/+AskbGyDiHTSrSe+hJaRS3/dUNKvPKJTbYZCIWo
	S3EIgmk5SlAq+6gBrgdQEe4=
X-Google-Smtp-Source: ABdhPJzQIybsSib1X0VkmETAR/KO81KibL8P4RyyOVk0vzJMy6hFwiPUntFUR51xkUO7B+01nwwU7w==
X-Received: by 2002:a17:906:2817:: with SMTP id r23mr1786822ejc.285.1632943627879;
        Wed, 29 Sep 2021 12:27:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::bfc8])
        by smtp.gmail.com with ESMTPSA id f10sm449019edu.70.2021.09.29.12.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 12:27:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/7] staging: r8188eu: remove init_recv_priv from struct hal_ops
Date: Wed, 29 Sep 2021 21:26:54 +0200
Message-Id: <20210929192657.9569-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929192657.9569-1-straube.linux@gmail.com>
References: <20210929192657.9569-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove init_recv_priv from struct hal_ops and remove its wrapper
rtw_hal_init_recv_priv(). Call rtl8188eu_init_recv_priv() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 3 ++-
 drivers/staging/r8188eu/hal/hal_intf.c     | 8 --------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 1 -
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 7bbbe412a5cd..3054cc6459c5 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -9,6 +9,7 @@
 #include "../include/mlme_osdep.h"
 #include "../include/usb_ops.h"
 #include "../include/wifi.h"
+#include "../include/rtl8188e_recv.h"
 
 static u8 SNAP_ETH_TYPE_IPX[2] = {0x81, 0x37};
 static u8 SNAP_ETH_TYPE_APPLETALK_AARP[2] = {0x80, 0xf3};
@@ -82,7 +83,7 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 
 	sema_init(&precvpriv->allrxreturnevt, 0);
 
-	res = rtw_hal_init_recv_priv(padapter);
+	res = rtl8188eu_init_recv_priv(padapter);
 
 	timer_setup(&precvpriv->signal_stat_timer, rtw_signal_stat_timer_hdl, 0);
 	precvpriv->signal_stat_sampling_interval = 1000; /* ms */
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index ff06307f07c7..ad327c495b5d 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -72,14 +72,6 @@ u32 rtw_hal_inirp_deinit(struct adapter *adapt)
 	return _FAIL;
 }
 
-s32 rtw_hal_init_recv_priv(struct adapter *adapt)
-{
-	if (adapt->HalFunc.init_recv_priv)
-		return adapt->HalFunc.init_recv_priv(adapt);
-
-	return _FAIL;
-}
-
 void rtw_hal_free_recv_priv(struct adapter *adapt)
 {
 	if (adapt->HalFunc.free_recv_priv)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 93733c59ba58..6465be895574 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2153,7 +2153,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->inirp_init = &rtl8188eu_inirp_init;
 	halfunc->inirp_deinit = &rtl8188eu_inirp_deinit;
 
-	halfunc->init_recv_priv = &rtl8188eu_init_recv_priv;
 	halfunc->free_recv_priv = &rtl8188eu_free_recv_priv;
 
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 915f16f3d452..a74250f6d9dd 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -128,7 +128,6 @@ struct hal_ops {
 	u32	(*inirp_init)(struct adapter *padapter);
 	u32	(*inirp_deinit)(struct adapter *padapter);
 
-	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
 	void	(*SetHwRegHandler)(struct adapter *padapter, u8	variable,
@@ -186,7 +185,6 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 u32	rtw_hal_inirp_init(struct adapter *padapter);
 u32	rtw_hal_inirp_deinit(struct adapter *padapter);
 
-s32	rtw_hal_init_recv_priv(struct adapter *padapter);
 void	rtw_hal_free_recv_priv(struct adapter *padapter);
 
 void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
-- 
2.33.0

