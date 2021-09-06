Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034E872
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:52 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id me10so15091556ejb.11
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W+27fWh63R63N+X/Iw73hVrw7vVcTyoRqHIRYToSkYs=;
        b=JWruG25no6bIk/rleeBHn/1ucvn/NOwayuE8rF2JGcF0eZr1ZyUNtdQ1fNR0NQiVv/
         QjzbLxmIe+5yU0LN2fNsvTERXEfTh9L0L92Spwfw7JjRecNnc+ct3aGezP7/NGqIp7wL
         dAj1mZzkaX+J43EVcUtrAPH7nz3qq5m5FuosbR16vuSNa9U26pMmxB1b11CugXDqImp6
         EYO/7NltApqeB0uF1q1wyGVXOA2xpgV3eMlAGCXpiSpfzItY1rguY3RDEb7VtqE2rwLw
         9mCBTzPyPnHv8DwZjkPcP/FrhjRbXjBCCR6ZCWSlL+Z7ymlZMFfKvoAo2OWbhb/JLDRm
         8L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W+27fWh63R63N+X/Iw73hVrw7vVcTyoRqHIRYToSkYs=;
        b=qczV+N9/hG1Sk7VcTp2KUUCrdbyLNhi+QtOf75E25UOlkzZFh3S0CBTkWKuin5aHNe
         gp/eH0zYEC/07JQlQfs8iI0SbfyH77u5LX8dyY/MM/nUSXRsAtEUvc3N/VnxlEsJCmW7
         6L2SmzdEazRuipcexKX5c3EVzfKSdI4CV/DACKWhyF0xpvDnas9gwdeT+9QcufwCt+Ci
         oz+DIxyMNFPE8TOELQChJ/ASbVL+QDkfb5t2RqNQlaagdtslrXwbeqJlcT/7D+JGvOyE
         +C1/rXzkhLeFJVQQKQUt4yZi9aYAjUhAaS2JuzE5Ls4MSg4DBZuMYLw//VEjRmo0wVMJ
         QjtA==
X-Gm-Message-State: AOAM532M4c85E7GYEgBAX9E8DrdsblS2/1+1ahaP/oZObwY2w4qcRWVL
	IwQn5b7Uoz6N4LONwheOof4=
X-Google-Smtp-Source: ABdhPJwRypS+ml1sq92GjguIyV9PjezTqGuoEc4Lwkk3p0jgHlJbbePXxdVQeqb9rEq3xF15YecWCA==
X-Received: by 2002:a17:906:1d19:: with SMTP id n25mr15138871ejh.11.1630954971428;
        Mon, 06 Sep 2021 12:02:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 08/40] staging: r8188eu: remove interface_ps_func from hal_ops
Date: Mon,  6 Sep 2021 21:01:51 +0200
Message-Id: <20210906190223.11396-9-straube.linux@gmail.com>
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

