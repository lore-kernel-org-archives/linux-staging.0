Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1872
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:49 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id lc21so15111621ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZ+jGlU52R+dGiD1XqdEMOHCz9GkCMtVwRo9Px3Ek0c=;
        b=DoGdAVrkK4FN/8WWiaHvgG5VhP0owLtHK7QBvJZDCG/6rBwjaFs8azO1lnCGGySBw/
         vOmCoQYIUBfFLn6I9C2kZYabxEqU5lE/RQFl2IRbXdlI0KIjyPz3ajj0eOchvfwAxyf0
         8Kop9kznA9LEDdV6JsKxSPvK42oPOhzSW7xRyacRAWHyZZx2W7naoW1VGKSNCIRhvoLg
         TGsb0XVXI1uqk9+dxX2B4NHb+acQDWpFkSYRC6TALw1DBiiLBfjrFVmSYRJ3njRrjP0Y
         CgesfVPBjvJij3eZguDSfZy8lTDHBbE3ybOluKgOlMyxp2iEbZ5keRjNB6/rA1zbEK+p
         ECcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZ+jGlU52R+dGiD1XqdEMOHCz9GkCMtVwRo9Px3Ek0c=;
        b=mLwl0VyYzVSPuIO9JEakAFrB+ypizBMY6KyupNOtf49a55ebfr0wPh+ttSP9MCjy3U
         IUc2T68/rst9yGHtGlFtePrZTbUzl6n1h0E1iYNYIFjCvyAPWAoNg2g2Ywfg0yhEGQV0
         IL18GEyQOW/ajXAgmsAUV5Ni52tuA3ifMqFoBW/cksGCn89Sv0ce2qUCibeJk/C0vTpZ
         jHfB0HyM6CcEe2Z6AQ7BvlmtIt/nIrIXKY4ZBu+h/WnFgOjaWO102ViUtuKQ6ZBcg4On
         O2qJR5Ql9cnmcJ9zB5c6wD8qEfe3UtdeV+hS9yQ8/9q1QAvYN+OmRwUWpGhb/m59RMV1
         gpZg==
X-Gm-Message-State: AOAM53044Qk+iJ6/RhoTBIBCeW4773QjL+Uzc+v61/BpoCkzNkRziuLa
	s8yqMKGDffWIJ2OP5LVAFMQ=
X-Google-Smtp-Source: ABdhPJyTqCq35vvXbGbu5pjIIUL+qh2JAO+yYMlPk8zN+MAQjAuRPZxpjikbz3G5rtlfwfQC2U0zFQ==
X-Received: by 2002:a17:906:6445:: with SMTP id l5mr14518656ejn.194.1630954968255;
        Mon, 06 Sep 2021 12:02:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 04/40] staging: r8188eu: remove dm_deinit from hal_ops
Date: Mon,  6 Sep 2021 21:01:47 +0200
Message-Id: <20210906190223.11396-5-straube.linux@gmail.com>
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

Remove dm_deinit from hal_ops and remove its wrapper
rtw_hal_dm_deinit(). Call rtl8188e_deinit_dm_priv() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 7 -------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 drivers/staging/r8188eu/include/hal_intf.h      | 4 ----
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 +-
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index a3b3dd11ba6e..d467e734a699 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -12,13 +12,6 @@ void rtw_hal_free_data(struct adapter *adapt)
 		adapt->HalFunc.free_hal_data(adapt);
 }
 
-void rtw_hal_dm_deinit(struct adapter *adapt)
-{
-	/*  cancel dm  timer */
-	if (adapt->HalFunc.dm_deinit)
-		adapt->HalFunc.dm_deinit(adapt);
-}
-
 u32 rtw_hal_power_on(struct adapter *adapt)
 {
 	if (adapt->HalFunc.hal_power_on)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 765c8c4321f1..355878ec270d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1784,8 +1784,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->dm_deinit = &rtl8188e_deinit_dm_priv;
-
 	pHalFunc->set_bwmode_handler = &PHY_SetBWMode8188E;
 	pHalFunc->set_channel_handler = &PHY_SwChnl8188E;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 7d502701be27..61f4a6bcb7dc 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -143,8 +143,6 @@ struct hal_ops {
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
-	void	(*dm_deinit)(struct adapter *padapter);
-
 	void	(*set_bwmode_handler)(struct adapter *padapter,
 				      enum ht_channel_width Bandwidth,
 				      u8 Offset);
@@ -250,8 +248,6 @@ void rtl8188eu_init_default_value(struct adapter *adapt);
 
 void	rtw_hal_free_data(struct adapter *padapter);
 
-void rtw_hal_dm_deinit(struct adapter *padapter);
-
 u32 rtw_hal_power_on(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index c5dc02d30349..039c05ffbc57 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -913,7 +913,7 @@ void rtw_cancel_all_timer(struct adapter *padapter)
 
 	_cancel_timer_ex(&padapter->recvpriv.signal_stat_timer);
 	/* cancel dm timer */
-	rtw_hal_dm_deinit(padapter);
+	rtl8188e_deinit_dm_priv(padapter);
 }
 
 u8 rtw_free_drv_sw(struct adapter *padapter)
-- 
2.33.0

