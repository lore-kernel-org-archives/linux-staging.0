Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE753FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:40:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so1068993wmh.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KHjSk62j+qI4w6bSE0d8VL7TUL5bahpwJrBiVcsBvxc=;
        b=k+pRs3/jpxoYPdAxFh6OvtDgIYLAhVfH6sPgm1OgXu55cGcNOAD0PKPq81MlqlXRYC
         4KoDJx0Zq3TSinh5mc5XMqZUP+6LPG6NruK+kksGkyScjvd21Kn5sLH93Mkxc3dL7Uoj
         ttWUUFTUbW0zF9Fjbv55C7h1GzT9z364D5tduCkdUkXbpidUdpgDE6Uh8JTFewjATAP2
         FAdrng7BtXOPJhwJlkEGnCADQ0hKy1RT33y1X2vY83nfUznoM3pk18JS0qTZS6QwMtTy
         VcFAS/3+y2hcR0PnyYlNHqoHlAfGCNr86sQDeejR0qzzgFsuowRzEm3Og8UBaOqycZw0
         LRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KHjSk62j+qI4w6bSE0d8VL7TUL5bahpwJrBiVcsBvxc=;
        b=KERWCQs05ny07CJYezpIE2FM5Pq8Mb9ogsCArfNqmRYcb+Rp5iUvCoqbCMrIg7HmFA
         d2I8rR/2b6qjliepI61tNcGHErBL6qbZFShsLXxLXiii6c4+fWjHe9wzI6Bw6FwA6UKa
         o5vv1lMaFGSVlld3SdCYWCLhE9qh23XP0xJtErc1emRrSCD8RF4sXS0HhjHJik+BlUwf
         D7hoGQSQEVhoTvslT9884ZxmaJVghOG7s5EnQOwr3KIm4RHMnYkYje5bPo4v53NsY+8d
         wv7/jdqEgkd5PLZeYHzLaIyDZLP1IS9kH5OCWYJfyUPKue/vMyaCKfzb9AC2vQF7K94/
         q2Iw==
X-Gm-Message-State: AOAM530s2Ht0rgLDvca8aErbI1Y124hNrEYcnwvG9uJ327ZEXwZLAJ45
	FAXLQk/XWTlKGcij85Qqa3o=
X-Google-Smtp-Source: ABdhPJyGX6K2pxuTTFVqEoai7onLpprgo/IhwVmFo1QWBprCQrpY1umJhdcE+gpfrSS/qaQKB/+30g==
X-Received: by 2002:a1c:3103:: with SMTP id x3mr3087096wmx.190.1630759256129;
        Sat, 04 Sep 2021 05:40:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id j207sm2094071wmj.40.2021.09.04.05.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:40:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: remove init_default_value from hal_ops
Date: Sat,  4 Sep 2021 14:40:33 +0200
Message-Id: <20210904124033.14244-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904124033.14244-1-straube.linux@gmail.com>
References: <20210904124033.14244-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove init_default_value from hal_ops and remove its wrapper
rtw_hal_def_value_init(). Call rtl8188eu_init_default_value()
directly instead

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 4 +---
 drivers/staging/r8188eu/include/hal_intf.h | 5 +----
 drivers/staging/r8188eu/os_dep/os_intfs.c  | 4 ++--
 4 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 9069b52f83ff..c06b299cf266 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -6,12 +6,6 @@
 #include "../include/drv_types.h"
 #include "../include/hal_intf.h"
 
-void rtw_hal_def_value_init(struct adapter *adapt)
-{
-	if (adapt->HalFunc.init_default_value)
-		adapt->HalFunc.init_default_value(adapt);
-}
-
 void rtw_hal_free_data(struct adapter *adapt)
 {
 	if (adapt->HalFunc.free_hal_data)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d34d26de69d9..679f9f6e6dbe 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2196,7 +2196,7 @@ static void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt)
 	rtw_write8(adapt, bcn_ctrl_reg, rtw_read8(adapt, bcn_ctrl_reg) | BIT(1));
 }
 
-static void rtl8188eu_init_default_value(struct adapter *adapt)
+void rtl8188eu_init_default_value(struct adapter *adapt)
 {
 	struct hal_data_8188e *haldata;
 	struct pwrctrl_priv *pwrctrlpriv;
@@ -2249,8 +2249,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->InitSwLeds = &rtl8188eu_InitSwLeds;
 	halfunc->DeInitSwLeds = &rtl8188eu_DeInitSwLeds;
 
-	halfunc->init_default_value = &rtl8188eu_init_default_value;
-
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
 	halfunc->GetHwRegHandler = &GetHwReg8188EU;
 	halfunc->GetHalDefVarHandler = &GetHalDefVar8188EUsb;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index d5cf9b0d9a77..b3ea9fc041c6 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -149,8 +149,6 @@ struct hal_ops {
 	void	(*dm_init)(struct adapter *padapter);
 	void	(*dm_deinit)(struct adapter *padapter);
 
-	void	(*init_default_value)(struct adapter *padapter);
-
 	void	(*enable_interrupt)(struct adapter *padapter);
 	void	(*disable_interrupt)(struct adapter *padapter);
 	s32	(*interrupt_handler)(struct adapter *padapter);
@@ -262,8 +260,7 @@ void rtl8188eu_set_hal_ops(struct adapter *padapter);
 
 void rtl8188eu_interface_configure(struct adapter *adapt);
 void ReadAdapterInfo8188EU(struct adapter *Adapter);
-
-void rtw_hal_def_value_init(struct adapter *padapter);
+void rtl8188eu_init_default_value(struct adapter *adapt);
 
 void	rtw_hal_free_data(struct adapter *padapter);
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index c3ac0ae153f8..49ccdde1b0bb 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -782,7 +782,7 @@ static u8 rtw_init_default_value(struct adapter *padapter)
 	rtw_update_registrypriv_dev_network(padapter);
 
 	/* hal_priv */
-	rtw_hal_def_value_init(padapter);
+	rtl8188eu_init_default_value(padapter);
 
 	/* misc. */
 	padapter->bReadPortCancel = false;
@@ -801,7 +801,7 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 	struct pwrctrl_priv *pwrctrlpriv = &padapter->pwrctrlpriv;
 
 	/* hal_priv */
-	rtw_hal_def_value_init(padapter);
+	rtl8188eu_init_default_value(padapter);
 	padapter->bReadPortCancel = false;
 	padapter->bWritePortCancel = false;
 	padapter->bRxRSSIDisplay = 0;
-- 
2.33.0

