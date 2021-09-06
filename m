Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3E72
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:08 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id q3so10529109edt.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W+27fWh63R63N+X/Iw73hVrw7vVcTyoRqHIRYToSkYs=;
        b=qifJvx5HcqeExcdxOcAUJzqlgmKo2JSbgUVM2oqkik2Y7HKNgfB88jnKJ79T7LRT08
         53MxnTXKv/wfg44uCWOTtaYQukLy7iKJUD/GOpMthaYfVbwhBAHChyGFzroA6HBcAJO1
         xmBY60SfGidJFd0x+Ycx/putviHRLGzewG81PPrXtCSY3vk9Ruq3ioEwdEjZC4ySYRQw
         dr98/4FDFb+Hu+audZi6Xa1lYwbDCpOrmSWE6CzBVWEL1xSCdlHPphfuD39/3unDk9Ku
         c7RcvXakwAxZHMrEUAFXedIX7EyittIRPl46lX/Sp4gy6pMtROq10yc0jYzSN/86LQ9s
         MHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W+27fWh63R63N+X/Iw73hVrw7vVcTyoRqHIRYToSkYs=;
        b=cNPWWOkwWr71xosWNBD7x2y1EgA0Vcbrp4N5fb5kCw+7+op9IFSpyuQgsI4z74T7fX
         e8NBERBnQumd2brEnSRNANNpFh4JV0QqfdoVNSxGAzpggUoeOQ60T7IawfuQDxNy6lrT
         tLobgBKHRgnu3Ad467SH4lO6yGVVBY4ryGH9Nd7Ww015OFwhK8PqFY1rTFC9vQIdwBOw
         jijkO7CvtT3pguN/QLkgEiVkQK5glxaRL/EDT+seI7qzw1XHxnfCYmrjwBeE0V1tQSbC
         s1D20AzVcsAZMGJNwv0XBGOrPzyEeCOi8XpLxn59F1SGj4/fKiHLnMrliShvDMQVufdB
         k8bw==
X-Gm-Message-State: AOAM531vHYkL3uoK/RQCrX6z0QbF/m3QyqBlpk8bz8O6qGvk1S5KvJ5D
	m9ejT9+OUcm/AsZkpHgQHsw=
X-Google-Smtp-Source: ABdhPJz3WEwr6RxhhPYcxP16bUmjJdjCcfk3LTmer08pPRP1Ep5LseLd1C79Kk113j/590Lwu2DxwQ==
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr14715570edu.359.1630952707392;
        Mon, 06 Sep 2021 11:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/40] staging: r8188eu: remove interface_ps_func from hal_ops
Date: Mon,  6 Sep 2021 20:24:06 +0200
Message-Id: <20210906182438.5417-9-straube.linux@gmail.com>
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

Remove interface_ps_func from hal_ops from hal_ops and remove its
wrapper rtw_hal_intf_ps_func() and the unused rtl8188eu_ps_func().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 9 ---------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 9 ---------
 drivers/staging/r8188eu/include/hal_intf.h | 5 -----
 3 files changed, 23 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 4f893333cade..45166f160756 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -101,15 +101,6 @@ u32 rtw_hal_inirp_deinit(struct adapter *adapt)
 	return _FAIL;
 }
 
-u8 rtw_hal_intf_ps_func(struct adapter *adapt,
-			enum hal_intf_ps_func efunc_id, u8 *val)
-{
-	if (adapt->HalFunc.interface_ps_func)
-		return adapt->HalFunc.interface_ps_func(adapt, efunc_id,
-							   val);
-	return _FAIL;
-}
-
 s32 rtw_hal_xmit(struct adapter *adapt, struct xmit_frame *pxmitframe)
 {
 	if (adapt->HalFunc.hal_xmit)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 65f68f35b611..7b9cca4e3cb4 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2205,12 +2205,6 @@ void rtl8188eu_init_default_value(struct adapter *adapt)
 		haldata->odmpriv.RFCalibrateInfo.ThermalValue_HP[i] = 0;
 }
 
-static u8 rtl8188eu_ps_func(struct adapter *Adapter, enum hal_intf_ps_func efunc_id, u8 *val)
-{
-	u8 bResult = true;
-	return bResult;
-}
-
 void rtl8188eu_set_hal_ops(struct adapter *adapt)
 {
 	struct hal_ops	*halfunc = &adapt->HalFunc;
@@ -2243,8 +2237,5 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->hal_xmit = &rtl8188eu_hal_xmit;
 	halfunc->mgnt_xmit = &rtl8188eu_mgnt_xmit;
 
-	halfunc->interface_ps_func = &rtl8188eu_ps_func;
-
 	rtl8188e_set_hal_ops(halfunc);
-
 }
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f6f0763e0ab3..44a8943eadfe 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -175,8 +175,6 @@ struct hal_ops {
 	void	(*AntDivCompareHandler)(struct adapter *adapter,
 					struct wlan_bssid_ex *dst,
 					struct wlan_bssid_ex *src);
-	u8	(*interface_ps_func)(struct adapter *padapter,
-				     enum hal_intf_ps_func efunc_id, u8 *val);
 
 	s32	(*hal_xmit)(struct adapter *padapter,
 			    struct xmit_frame *pxmitframe);
@@ -261,9 +259,6 @@ u8 rtw_hal_get_def_var(struct adapter *padapter,
 u32	rtw_hal_inirp_init(struct adapter *padapter);
 u32	rtw_hal_inirp_deinit(struct adapter *padapter);
 
-u8	rtw_hal_intf_ps_func(struct adapter *padapter,
-			     enum hal_intf_ps_func efunc_id, u8 *val);
-
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32	rtw_hal_mgnt_xmit(struct adapter *padapter,
 			  struct xmit_frame *pmgntframe);
-- 
2.33.0

