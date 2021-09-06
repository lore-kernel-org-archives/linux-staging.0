Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295672
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:26 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id q3so10529866edt.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vK60yexlBVKhL5/ikBgXRFsvFgsQ3+tvgnO1pskI9U4=;
        b=e3oRBZcZQKIlO7nVDIy0jhSLHaGb1CNxQvP6Ux4KvLSviW81RX1TTIi0Ly6xXPx3wO
         pTyClSFP2dNSwhEu3K29On0HzXmgFrWuI+jHaBIxKKWCHjSvb+dk5db/LOPbg18j9zvh
         6ScKaWCEgGaGDpD9WoGUxpMTp8DJs3X4bGcUrTo46gkKDsgcbsa5BRFdg3JSahBC8qOl
         Dh3XKGFD1Sz/YczclWgH/fkn39FcQd7Nsq0L1ME5LiqT+VOGkdKp4wWretRrGYrHztid
         j+V7gVaC1Hu7j+qrTXjS0nlFKzGnowLo6SUE+1SMHaXTAvauQbxX/wb59i2y3EaDSpr4
         UF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vK60yexlBVKhL5/ikBgXRFsvFgsQ3+tvgnO1pskI9U4=;
        b=abopWpmNo9x9ziOEE0tfIq3wVa1+UikRvbIW1ZWDDjYohHh5BFxvs3uy95lkH/OXiT
         2DPwb6vdDVRPY64fyicIIuppp4jbdJDBYKXB03MfP70rjOi+rN6yE1vU/hnS4Q9M7HaX
         DHlITHUXR2xd6fMx+O2ynbcfbinDFWv6Tpue5t8TieZLfZ1xQOd7ZhVkXJ5zv9t2hDKi
         76Y59N+Asy4GblU2jRrO79DzlNtP7RoBUkRgqIJ/xMtmmHpuRDbalV8l+jAjYRJl77ha
         +mdxbCG6CPIIvUV2p9v4SYd7JpZaLZd2QhNHpMDXaFPSMYuIhu9UkDLtnrcgAUBU9F/b
         ZfVQ==
X-Gm-Message-State: AOAM530+dFYUWv178LCENfSB8QGabnOmBpKmzQAm3FFCRS/VFlTERTs/
	iGHO5h8if5e1D1Z5WOHGF4A=
X-Google-Smtp-Source: ABdhPJw8QKJTaIKK3DrVtkAl36PBvJKQRO6i9OMKxE0GHzULcY2W2b5SCrGusrl9QGULuyhtoZ+SWw==
X-Received: by 2002:a05:6402:2816:: with SMTP id h22mr14375006ede.146.1630952724933;
        Mon, 06 Sep 2021 11:25:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 32/40] staging: r8188eu: remove AntDivBeforeLinkHandler from hal_ops
Date: Mon,  6 Sep 2021 20:24:30 +0200
Message-Id: <20210906182438.5417-33-straube.linux@gmail.com>
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

Remove AntDivBeforeLinkHandler hal_ops and remove its wrapper
rtw_hal_antdiv_before_linked(). Call AntDivBeforeLink8188E() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/r8188eu/hal/hal_intf.c          | 7 -------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 2bdc1ed18149..ef04845d7a71 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6370,7 +6370,7 @@ void site_survey(struct adapter *padapter)
 			/*  20100721:Interrupt scan operation here. */
 			/*  For SW antenna diversity before link, it needs to switch to another antenna and scan again. */
 			/*  It compares the scan result and select beter one to do connection. */
-			if (rtw_hal_antdiv_before_linked(padapter)) {
+			if (AntDivBeforeLink8188E(padapter)) {
 				pmlmeext->sitesurvey_res.bss_cnt = 0;
 				pmlmeext->sitesurvey_res.channel_idx = -1;
 				pmlmeext->chan_scan_time = SURVEY_TO / 2;
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 27adaea61f84..1bec02b1dede 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -206,13 +206,6 @@ void rtw_hal_bcn_related_reg_setting(struct adapter *adapt)
 		adapt->HalFunc.SetBeaconRelatedRegistersHandler(adapt);
 }
 
-u8 rtw_hal_antdiv_before_linked(struct adapter *adapt)
-{
-	if (adapt->HalFunc.AntDivBeforeLinkHandler)
-		return adapt->HalFunc.AntDivBeforeLinkHandler(adapt);
-	return false;
-}
-
 void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
 				  struct wlan_bssid_ex *dst,
 				  struct wlan_bssid_ex *src)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 33d4e534f05e..62fd62ced0e5 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1773,7 +1773,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->run_thread = &rtl8188e_start_thread;
 	pHalFunc->cancel_thread = &rtl8188e_stop_thread;
 
-	pHalFunc->AntDivBeforeLinkHandler = &AntDivBeforeLink8188E;
 	pHalFunc->AntDivCompareHandler = &AntDivCompare8188E;
 	pHalFunc->read_bbreg = &rtl8188e_PHY_QueryBBReg;
 	pHalFunc->write_bbreg = &rtl8188e_PHY_SetBBReg;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 4b937bd2c63c..929e861cc81b 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -156,7 +156,6 @@ struct hal_ops {
 	void	(*run_thread)(struct adapter *adapter);
 	void	(*cancel_thread)(struct adapter *adapter);
 
-	u8	(*AntDivBeforeLinkHandler)(struct adapter *adapter);
 	void	(*AntDivCompareHandler)(struct adapter *adapter,
 					struct wlan_bssid_ex *dst,
 					struct wlan_bssid_ex *src);
@@ -256,7 +255,6 @@ void	rtw_hal_write_rfreg(struct adapter *padapter,
 			    enum rf_radio_path eRFPath, u32 RegAddr,
 			    u32 BitMask, u32 Data);
 
-u8	rtw_hal_antdiv_before_linked(struct adapter *padapter);
 void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
 				     struct wlan_bssid_ex *src);
-- 
2.33.0

