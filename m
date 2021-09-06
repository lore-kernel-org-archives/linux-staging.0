Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29863FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:47 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id jg16so15154356ejc.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KAvqQpKCWyLVtqR0Pixbdc0rZlX3SIjqbixAcUQtRok=;
        b=ApHw2GmT+b6pDXikotBZqfxs2GZkCPujzIbExiHRwgxG00Ny6M7C7ibeaAACIjxxb1
         jZfOBR0AZvfTqH9ZZIW7jlS5EVVjZz4FgeV3jKa6+ONFusiHNvvrlqORzO1xohXIBYi/
         mRHqqEvO0ztdf5gRfFNxOUu92rHHh6rcu8TlHGiPbiCx9VbcxEC3EhmFONZlFdr1fGJb
         Xr2SpYD4mYDlqHWNiNHG7zsC/XtMboI6hWkYj3+DZ6HknjO9aE5Oobrb5vKIoSuq5dma
         NWJfODeizcmJPwkXJP8k8PJoiaFKC9Az31iphJxCjDY8Bvr+Hh1J3pZBC314TwXG5EtQ
         UR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAvqQpKCWyLVtqR0Pixbdc0rZlX3SIjqbixAcUQtRok=;
        b=aVzTfl/YafKysng5CrxLY3rcP3aoeox3D75w/y8HA3hDtn3i0ch1wl+mpU28aslujD
         Aap1iCZ/r5q6AnACBdPZyxABfuaODT/8U249n0pjt5/QKPn57M0NUutVyJw97H37nB2w
         d8loOSNQIG+beS5ZTrKJ9JsJB9m3Yfn5bLM/FRhEwRWMvEPHIGe+7FbKZUvoDopCNZjn
         tHtmQUWmJbkh6s02gz1UD8unUQe8GOLxrTl8dZFbonDp4NaSgQv0DXzYDxQEPPWQ+605
         wRMETI3/lTgrknN6pbwBtE2qx8KvzNfm2l1Q7sSNEk40PN2uCXeRjPCvgzcocIXVupye
         19QA==
X-Gm-Message-State: AOAM531F0iT2MrJAvVfggVnL+68US+uIVN1hQrfasnYR+MS85RcoPY10
	YiqnJt7M8EeJzRkSGOBlpDU=
X-Google-Smtp-Source: ABdhPJzX6hbK+Q7nb8gv6Beq7FZMDdwxnSJtjRkOsX//ZjvlZDUdtJ9N0sT+fCWWTQXGL7n2+zGkXg==
X-Received: by 2002:a17:906:878f:: with SMTP id za15mr14856564ejb.140.1630954966016;
        Mon, 06 Sep 2021 12:02:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 01/40] staging: r8188eu: remove InitSwLeds from hal_ops
Date: Mon,  6 Sep 2021 21:01:44 +0200
Message-Id: <20210906190223.11396-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove InitSwLeds from hal_ops and remove its wrapper
rtw_hal_sw_led_init(). Call rtl8188eu_InitSwLeds() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c       | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c    | 1 -
 drivers/staging/r8188eu/include/hal_intf.h   | 2 --
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 ++-
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 4 ++--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index e91db4f5886b..1848a7246d6d 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -25,12 +25,6 @@ void rtw_hal_dm_deinit(struct adapter *adapt)
 		adapt->HalFunc.dm_deinit(adapt);
 }
 
-void rtw_hal_sw_led_init(struct adapter *adapt)
-{
-	if (adapt->HalFunc.InitSwLeds)
-		adapt->HalFunc.InitSwLeds(adapt);
-}
-
 void rtw_hal_sw_led_deinit(struct adapter *adapt)
 {
 	if (adapt->HalFunc.DeInitSwLeds)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 679f9f6e6dbe..86080d502636 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2246,7 +2246,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 
 	halfunc->init_recv_priv = &rtl8188eu_init_recv_priv;
 	halfunc->free_recv_priv = &rtl8188eu_free_recv_priv;
-	halfunc->InitSwLeds = &rtl8188eu_InitSwLeds;
 	halfunc->DeInitSwLeds = &rtl8188eu_DeInitSwLeds;
 
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 16d59d24d1b8..e240d5b2406f 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -143,7 +143,6 @@ struct hal_ops {
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
-	void	(*InitSwLeds)(struct adapter *padapter);
 	void	(*DeInitSwLeds)(struct adapter *padapter);
 
 	void	(*dm_init)(struct adapter *padapter);
@@ -256,7 +255,6 @@ void	rtw_hal_free_data(struct adapter *padapter);
 
 void rtw_hal_dm_init(struct adapter *padapter);
 void rtw_hal_dm_deinit(struct adapter *padapter);
-void rtw_hal_sw_led_init(struct adapter *padapter);
 void rtw_hal_sw_led_deinit(struct adapter *padapter);
 
 u32 rtw_hal_power_on(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index bd637a667299..7c18b0adf740 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -15,6 +15,7 @@
 #include "../include/rtw_mp_ioctl.h"
 #include "../include/usb_ops.h"
 #include "../include/rtl8188e_hal.h"
+#include "../include/rtl8188e_led.h"
 
 #include "../include/rtw_mp.h"
 #include "../include/rtw_iol.h"
@@ -3845,7 +3846,7 @@ static int rtw_rereg_nd_name(struct net_device *dev,
 
 	if (!memcmp(rereg_priv->old_ifname, "disable%d", 9)) {
 		padapter->ledpriv.bRegUseLed = rereg_priv->old_bRegUseLed;
-		rtw_hal_sw_led_init(padapter);
+		rtl8188eu_InitSwLeds(padapter);
 		rtw_ips_mode_req(&padapter->pwrctrlpriv, rereg_priv->old_ips_mode);
 	}
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 49ccdde1b0bb..7e0eaa3f7db6 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -9,9 +9,9 @@
 #include "../include/recv_osdep.h"
 #include "../include/hal_intf.h"
 #include "../include/rtw_ioctl.h"
-
 #include "../include/usb_osintf.h"
 #include "../include/rtw_br_ext.h"
+#include "../include/rtl8188e_led.h"
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
@@ -887,7 +887,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	ret8 = rtw_init_default_value(padapter);
 
 	rtw_hal_dm_init(padapter);
-	rtw_hal_sw_led_init(padapter);
+	rtl8188eu_InitSwLeds(padapter);
 
 	rtw_hal_sreset_init(padapter);
 
-- 
2.33.0

