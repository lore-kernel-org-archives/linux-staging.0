Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FC2FB3
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:05 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id u19so10626197edb.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J4xkTtQ3wuvhdh3g04JX3HPGsYGJOr6tST/yQR3N1No=;
        b=UeOw2r9L5CIoEl3BJ1Yn/FHs1FFHbwvYVgsrP+UkmFAQXf6ItNNyioLIAyJ9dOMOJw
         n+MpmDWYvqpKHYZBNxOobh9EzZV3Ytnlxz3brY1pfKj6a9nigj1DLS5tC9WsZsJcIvdj
         9y8d89ZI8d35Oiad8eFJKF05+sfNLRujhQt32B7X0uy8fVvWk6c4Q+iq1UCyjzzTFtfu
         hKxhHouOnrc42VQr/uH9d3xyFhFkpCQINpPxhCjXBbqLOQREf5V0yNAAQodTBN33SYZE
         l9fqjyIYspmufBUa1RXmU/xeWBY0q3V/h6goQCNT0YC/7urtagOWiGEjeGu94/PbrglP
         nllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J4xkTtQ3wuvhdh3g04JX3HPGsYGJOr6tST/yQR3N1No=;
        b=RjP9jamLd0J0Gq2MfgfFv44GF49/sgQ39PRhLbRpYvQTxuFrGwL6Z8+PaHFVDNhY8k
         JuywZQQSIf8yZnR3q46Ldsl6CJ0UkXo8Ess1+hsVXe82Xep+CHD6WDCIpOWqbvp3g3eV
         4q15I3NHpRhFeBK2W3wkxFApDJT5cP87chev+AM/cYUDL859KbmnEjg/682FgwHv7wLW
         GuZCXoT7JJsJLjc7iD+kCTOa8ljhl69ezbMXDhATZG5VPngP64DF3lBL0imtTG/QSWFI
         5CBENXEpXZWi1iDahzb0Otfd7mTBNb5LXjDPS41NRPfwLy+PMMqk1nMQ7fGlgcQ1epCx
         p6vg==
X-Gm-Message-State: AOAM531VvVacWebA7dWcsaSFaUZyp6llK8DlTyncfvbkO8GX/NINmYcI
	OSNerO6JpBYOXkPFyV9P+/Q=
X-Google-Smtp-Source: ABdhPJypOkBwMKkTEMdRWfO8kkiyradOodRH+YPqpbzAWNw366wKrsCBGv13HtdWPn6rzxQzNDyZKQ==
X-Received: by 2002:a05:6402:1cb9:: with SMTP id cz25mr14985384edb.11.1630954443882;
        Mon, 06 Sep 2021 11:54:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 02/40] staging: r8188eu: remove DeInitSwLeds from hal_ops
Date: Mon,  6 Sep 2021 20:52:49 +0200
Message-Id: <20210906185327.10326-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove DeInitSwLeds from hal_ops and remove its wrapper
rtw_hal_sw_led_deinit(). Call rtl8188eu_DeInitSwLeds() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c       | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c    | 1 -
 drivers/staging/r8188eu/include/hal_intf.h   | 3 ---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 2 +-
 5 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 1848a7246d6d..3c4c719fe9bc 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -25,12 +25,6 @@ void rtw_hal_dm_deinit(struct adapter *adapt)
 		adapt->HalFunc.dm_deinit(adapt);
 }
 
-void rtw_hal_sw_led_deinit(struct adapter *adapt)
-{
-	if (adapt->HalFunc.DeInitSwLeds)
-		adapt->HalFunc.DeInitSwLeds(adapt);
-}
-
 u32 rtw_hal_power_on(struct adapter *adapt)
 {
 	if (adapt->HalFunc.hal_power_on)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 86080d502636..87aa12a6b5ba 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2246,7 +2246,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 
 	halfunc->init_recv_priv = &rtl8188eu_init_recv_priv;
 	halfunc->free_recv_priv = &rtl8188eu_free_recv_priv;
-	halfunc->DeInitSwLeds = &rtl8188eu_DeInitSwLeds;
 
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
 	halfunc->GetHwRegHandler = &GetHwReg8188EU;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index e240d5b2406f..a3da6e04d481 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -143,8 +143,6 @@ struct hal_ops {
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
-	void	(*DeInitSwLeds)(struct adapter *padapter);
-
 	void	(*dm_init)(struct adapter *padapter);
 	void	(*dm_deinit)(struct adapter *padapter);
 
@@ -255,7 +253,6 @@ void	rtw_hal_free_data(struct adapter *padapter);
 
 void rtw_hal_dm_init(struct adapter *padapter);
 void rtw_hal_dm_deinit(struct adapter *padapter);
-void rtw_hal_sw_led_deinit(struct adapter *padapter);
 
 u32 rtw_hal_power_on(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 7c18b0adf740..c7229878ee53 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3862,7 +3862,7 @@ static int rtw_rereg_nd_name(struct net_device *dev,
 		rtw_led_control(padapter, LED_CTL_POWER_OFF);
 		rereg_priv->old_bRegUseLed = padapter->ledpriv.bRegUseLed;
 		padapter->ledpriv.bRegUseLed = false;
-		rtw_hal_sw_led_deinit(padapter);
+		rtl8188eu_DeInitSwLeds(padapter);
 
 		/*  the interface is being "disabled", we can do deeper IPS */
 		rereg_priv->old_ips_mode = rtw_get_ips_mode_req(&padapter->pwrctrlpriv);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 7e0eaa3f7db6..43deffc29833 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -906,7 +906,7 @@ void rtw_cancel_all_timer(struct adapter *padapter)
 	_cancel_timer_ex(&padapter->mlmepriv.dynamic_chk_timer);
 
 	/*  cancel sw led timer */
-	rtw_hal_sw_led_deinit(padapter);
+	rtl8188eu_DeInitSwLeds(padapter);
 
 	_cancel_timer_ex(&padapter->pwrctrlpriv.pwr_state_check_timer);
 
-- 
2.33.0

