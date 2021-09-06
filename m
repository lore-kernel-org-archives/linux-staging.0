Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15F3FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:05 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id lc21so14952244ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AGfAkjZZ48GEEgIScm6nSlR9T8fsWGbKvoUwEaQLs2M=;
        b=WcJeThGqhAJ8K5qC6oCmq0e++qSBUED1UF9lDYqHUczZ34bZaUZngpDezJC4Nl1WHL
         kzRQp3X21EvzKEJWr4UPSIOpNWdENy0i6KEuIi78y4NYWZALgO5FBeilUjiJQ2TXW7lx
         gm1JZpvERqf4YWActzs3Mz3CAIsMF55z6kk/MLQDuYWy1GfG+bFtGcyimAFm+crTHE3u
         RLzkzzRphbnWqqssdh3+UOtqxCeecH3Bs3b/vICux/dC7VAzqpIYR19xr40/tDbNnWei
         KCeerT1ZHTDLnr9K7qr0L1vgb78gWrkUxIvYNhIuB4Q8KXakcZR7VQX2PDY4U/GDn0f+
         R5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AGfAkjZZ48GEEgIScm6nSlR9T8fsWGbKvoUwEaQLs2M=;
        b=XNEru0wXJm2ScN4Z7Ged1CqC79f98p1DfyPpy7LNoYSwCWWptUuzRXWnTuktzn8/Ke
         csC4elhSMEecuef6hDtDNWSwksxkKhW9ShU6qoBmcqX4GGrpUaiNmLAosBuXHNoBVkVj
         GsHBI37FKjS6SIzWQz83dg/tFttvCBpZdqwWVYNxzJOotBxSMuPQNNDJH14YBqu+wyXA
         0dlrLrxwd+94/umdpmnQRxC8p7q1CrGOySkmbVAyOzlnmES6EuPELndELY7Q3q6wI34t
         A3ukuCGMKCzS4aYga9uH/xMlGl9dHz7P0qKuCb5wgALpTh3nkNaq74lJZXKVXuhBhLR6
         fWGQ==
X-Gm-Message-State: AOAM531PFdE2NOzr2WO5T4sEGJYbQ178IVz4+6TQ0QlrgiI7h9wQbKl4
	7PGoh9li6QeKid5G3EiXaCE6jIr5KB9GvA==
X-Google-Smtp-Source: ABdhPJw6No9satq8T8m6gftToGmnoF/8mrlcFb6sd1vgCX+8wO7DNrjMpFnmRQ7zynRIo0G5JbYAsg==
X-Received: by 2002:a17:906:bcd7:: with SMTP id lw23mr15074513ejb.141.1630952703534;
        Mon, 06 Sep 2021 11:25:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/40] staging: r8188eu: remove dm_init from hal_ops
Date: Mon,  6 Sep 2021 20:24:01 +0200
Message-Id: <20210906182438.5417-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dm_init from hal_ops and remove its wrapper rtw_hal_dm_init().
Call rtl8188e_init_dm_priv() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 3 ++-
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 3c4c719fe9bc..a3b3dd11ba6e 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -12,12 +12,6 @@ void rtw_hal_free_data(struct adapter *adapt)
 		adapt->HalFunc.free_hal_data(adapt);
 }
 
-void rtw_hal_dm_init(struct adapter *adapt)
-{
-	if (adapt->HalFunc.dm_init)
-		adapt->HalFunc.dm_init(adapt);
-}
-
 void rtw_hal_dm_deinit(struct adapter *adapt)
 {
 	/*  cancel dm  timer */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 09f7bc010ba7..765c8c4321f1 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1784,7 +1784,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->dm_init = &rtl8188e_init_dm_priv;
 	pHalFunc->dm_deinit = &rtl8188e_deinit_dm_priv;
 
 	pHalFunc->set_bwmode_handler = &PHY_SetBWMode8188E;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index a3da6e04d481..7d502701be27 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -143,7 +143,6 @@ struct hal_ops {
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
-	void	(*dm_init)(struct adapter *padapter);
 	void	(*dm_deinit)(struct adapter *padapter);
 
 	void	(*set_bwmode_handler)(struct adapter *padapter,
@@ -251,7 +250,6 @@ void rtl8188eu_init_default_value(struct adapter *adapt);
 
 void	rtw_hal_free_data(struct adapter *padapter);
 
-void rtw_hal_dm_init(struct adapter *padapter);
 void rtw_hal_dm_deinit(struct adapter *padapter);
 
 u32 rtw_hal_power_on(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 43deffc29833..c5dc02d30349 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -12,6 +12,7 @@
 #include "../include/usb_osintf.h"
 #include "../include/rtw_br_ext.h"
 #include "../include/rtl8188e_led.h"
+#include "../include/rtl8188e_dm.h"
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
@@ -886,7 +887,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	ret8 = rtw_init_default_value(padapter);
 
-	rtw_hal_dm_init(padapter);
+	rtl8188e_init_dm_priv(padapter);
 	rtl8188eu_InitSwLeds(padapter);
 
 	rtw_hal_sreset_init(padapter);
-- 
2.33.0

