Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719036D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:11:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id o126so23728929lfa.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=51wN1flQu9ma9cxU2P2DJyhJeDjbr3t7JdzDteFYztw=;
        b=Hc8ggizkUdQBaPnTaPxXh4ebsmM7GEieinB0UT85L/h6nmPE+RS55wHvcwvxXn81fm
         4+9dEgUYTrvsseAKILtnAYTfUVkQkwUwAztrRNiSn42OnhFFSa7m9X8pswLhAu51C2V8
         c7R8OlIiI1Epab8Ea58g5qrL0o0CJurbjB16yKbRrkRVfWvOE84SXjXR6SoaZLLbB/1c
         Y3kYVJ4OMrNotkBdlgMKEw52nNw255F8MM5vH+HyKPQRMMeHbNGij1A0V8wtPm0QUKu9
         Hlm4wHPdLC1vwqPoUzvPjYCgQkN09RkKk2V9zZQZhV43NkLE69xmj8KI3l7qK9jcnpCE
         me9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=51wN1flQu9ma9cxU2P2DJyhJeDjbr3t7JdzDteFYztw=;
        b=Dw2cSI2hD6vQM5ZbWm/zK1J16+gwkqVbFo5Za642DSeVknobq3dQhzEGPvIEudU0in
         BDxS3HsxSX//z5Lxr7+CqguzVfqBcoD04llS3hVZUbQWvjkPMU2nlvZWO0T1pH92kXCJ
         OP9whPstNEmX9Mb5bVAOySY4o2L6l2I2rNCfudnpb+ekKi1pw0fUaGWFtN3eD3Ve/W0h
         UlaWFSkBCFfnlH60fxPGFXOleiM2eyuCRD1ybp5NOg0ZhoYIDw4GT9sNbebqge4Dm2/O
         ogGALTLxQ1cmwkHwreDfNrx2HeefVjwPNjsFQLrCV32oF0LpV6vvxWpTMI8CmsO1bl/0
         lVkA==
X-Gm-Message-State: AOAM532s+hFkYOt42w6jScAiSxx0WWqNQhMO4Te/w9O1Tcu7woYjRSEI
	FpMBtS/6dW6kNgvP0V7Z5Xc=
X-Google-Smtp-Source: ABdhPJyiXoyBhw6whBYmf2aJHfTZJPsOGb+ihfZPa61IlBrvxvzfgwwnCusS3sQb9djMX57cjLMNbw==
X-Received: by 2002:a05:6512:b93:: with SMTP id b19mr21113786lfv.432.1617725494673;
        Tue, 06 Apr 2021 09:11:34 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id q26sm2302783ljg.90.2021.04.06.09.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 09:11:34 -0700 (PDT)
Date: Tue, 6 Apr 2021 22:11:31 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: core: Move constants to the right of
 comparison
Message-ID: <20210406161131.GA103324@zhans>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Move constant variables to the right side of comparisons to increase
consistency with Linux kernel code base.
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 09bf25940e92..23897a4b663f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -89,7 +89,7 @@ int ips_leave(struct adapter *padapter)
 	ret = _ips_leave(padapter);
 	mutex_unlock(&pwrpriv->lock);
 
-	if (_SUCCESS == ret)
+	if (ret == _SUCCESS)
 		hal_btcoex_IpsNotify(padapter, IPS_NONE);
 
 	return ret;
@@ -372,7 +372,7 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 		return;
 
 	if (pwrpriv->pwr_mode == ps_mode)
-		if (PS_MODE_ACTIVE == ps_mode)
+		if (ps_mode == PS_MODE_ACTIVE)
 			return;
 
 
@@ -805,7 +805,7 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (_FAIL == res)
+	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
 
@@ -890,7 +890,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (_FAIL == res)
+	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
 
@@ -935,7 +935,7 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (_FAIL == res)
+	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
 
@@ -1146,7 +1146,7 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	if (rf_off == pwrpriv->rf_pwrstate) {
 		{
 			DBG_8192C("%s call ips_leave....\n", __func__);
-			if (_FAIL ==  ips_leave(padapter)) {
+			if (ips_leave(padapter) == _FAIL) {
 				DBG_8192C("======> ips_leave fail.............\n");
 				ret = _FAIL;
 				goto exit;
@@ -1180,7 +1180,7 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
 
 	if (mode < PS_MODE_NUM) {
 		if (pwrctrlpriv->power_mgnt != mode) {
-			if (PS_MODE_ACTIVE == mode)
+			if (mode == PS_MODE_ACTIVE)
 				LeaveAllPowerSaveMode(padapter);
 			else
 				pwrctrlpriv->LpsIdleCount = 2;
@@ -1206,7 +1206,7 @@ int rtw_pm_set_ips(struct adapter *padapter, u8 mode)
 	} else if (mode == IPS_NONE) {
 		rtw_ips_mode_req(pwrctrlpriv, mode);
 		DBG_871X("%s %s\n", __func__, "IPS_NONE");
-		if ((padapter->bSurpriseRemoved == 0) && (_FAIL == rtw_pwr_wakeup(padapter)))
+		if ((padapter->bSurpriseRemoved == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
 			return -EFAULT;
 	} else
 		return -EINVAL;
-- 
2.25.1

