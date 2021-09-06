Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AD872
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:32 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u14so15040515ejf.13
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HM0U8aFAgyxYkE6pP3iIT4ysY9lJ8YRKLSjNY12/S5U=;
        b=VjDVvc493ZOEDJcSRt1TuQO3p+phQ6oxKt1Qeh6Upk3l0UIiAEKWQjZ+8P2cp2cTCy
         a5S3KSethnsM+r4ni8qNUCU4QNAqEjosmjCFnw+tCQA+MXSptgJ1AjO0wqU92/fAL9oe
         pKBomo/+GcqcQwyNZ90FGSIUzo502BNPSjWAdGNUicdvD0mhz0kCQLKEFWM9/zy0sEtc
         nEVu3q4q1guHOc5dTYufnIaisiN37ErE0j1NPUzhQsLlW4Ws2uLDAdB8z+TgF0vlvvaP
         HZL+6wqspu+rHk8gaJl+o8sbTtv3vH5FBdOyw8coCGFXMBY4HTGfjXSbJ0F4Gic29mYN
         3vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HM0U8aFAgyxYkE6pP3iIT4ysY9lJ8YRKLSjNY12/S5U=;
        b=gyMPS4+4h6hMOAfMeCrPh+WrUhPAgB2JwxkKJI/me1q9wj1VPEcVUItoqFNxqDoRi6
         CVMJoN2Y/NkpCFnr1KHq+0RJp+I9fTaayyrX8i+rfIb4lyeon1rpOutf2ZRWi3UB5k7n
         ZoN2w8xkbN69I8qHRsldJCm4yaPXd+Ri9DMr8sbFgfoDJVKWVjW2c+f3hm6XwuTgqXKf
         HbcLfXY8oodmWyk11gFIiUplOxwCsNdombs7N6Tkk4XImvgx3Pfy3Zjg4Na7c2QzH0Ky
         V6AlaYyWs7Y4X7Yt+0nYZA08siTL/WQHhz9aeC04GdtOtAcJ5yf2SUWUycq5RmROfvDf
         rJ0w==
X-Gm-Message-State: AOAM530au5hqbGkJ00fnHYlmBMCky7261CCS1ASd29yGV67cgIL2MEcf
	hyu0hXQPtYhW9V/UfZBkYtU=
X-Google-Smtp-Source: ABdhPJz+l8x6s/LpQWTOoGeYhk7QC/xj9W4x6rITKww6O5AJecxBw3gJp0MDl80cUi5LmIl6YuZ2hA==
X-Received: by 2002:a17:906:29d0:: with SMTP id y16mr15347504eje.477.1630954471163;
        Mon, 06 Sep 2021 11:54:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 39/40] staging: r8188eu: remove SetBeaconRelatedRegistersHandler from hal_ops
Date: Mon,  6 Sep 2021 20:53:26 +0200
Message-Id: <20210906185327.10326-40-straube.linux@gmail.com>
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

Remove SetBeaconRelatedRegistersHandler from hal_ops and remove its
wrapper rtw_hal_bcn_related_reg_setting().
Call SetBeaconRelatedRegisters8188EUsb() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 2 +-
 drivers/staging/r8188eu/hal/hal_intf.c       | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c    | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h   | 5 ++---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index cd4f1ae61dca..c2f664bdb979 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1525,7 +1525,7 @@ void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext)
 
 void beacon_timing_control(struct adapter *padapter)
 {
-	rtw_hal_bcn_related_reg_setting(padapter);
+	SetBeaconRelatedRegisters8188EUsb(padapter);
 }
 
 static struct adapter *pbuddy_padapter;
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 17ac271e2417..d38a8134b243 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -180,12 +180,6 @@ void rtw_hal_write_rfreg(struct adapter *adapt, enum rf_radio_path rfpath,
 					      bitmask, data);
 }
 
-void rtw_hal_bcn_related_reg_setting(struct adapter *adapt)
-{
-	if (adapt->HalFunc.SetBeaconRelatedRegistersHandler)
-		adapt->HalFunc.SetBeaconRelatedRegistersHandler(adapt);
-}
-
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 		    u32 max_wating_ms, u32 bndy_cnt)
 {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 2c010f12118a..4d60b5156995 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2147,7 +2147,7 @@ static void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_l
 	psta->init_rate = init_rate;
 }
 
-static void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt)
+void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt)
 {
 	u32 value32;
 	struct mlme_ext_priv	*pmlmeext = &adapt->mlmeextpriv;
@@ -2231,7 +2231,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->SetHalDefVarHandler = &SetHalDefVar8188EUsb;
 
 	halfunc->UpdateRAMaskHandler = &UpdateHalRAMask8188EUsb;
-	halfunc->SetBeaconRelatedRegistersHandler = &SetBeaconRelatedRegisters8188EUsb;
 
 	halfunc->hal_xmit = &rtl8188eu_hal_xmit;
 	halfunc->mgnt_xmit = &rtl8188eu_mgnt_xmit;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 9b0a44659f57..668a21cbe71e 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -149,7 +149,6 @@ struct hal_ops {
 
 	void	(*UpdateRAMaskHandler)(struct adapter *padapter,
 				       u32 mac_id, u8 rssi_level);
-	void	(*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
 
 	s32	(*hal_xmit)(struct adapter *padapter,
 			    struct xmit_frame *pxmitframe);
@@ -205,6 +204,8 @@ int rtl8188e_Efuse_PgPacketWrite(struct adapter *pAdapter, u8 offset, u8 word_en
 
 void hal_notch_filter_8188e(struct adapter *adapter, bool enable);
 
+void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt);
+
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
@@ -232,8 +233,6 @@ void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
 void	rtw_hal_clone_data(struct adapter *dst_adapt,
 			   struct adapter *src_adapt);
 
-void rtw_hal_bcn_related_reg_setting(struct adapter *padapter);
-
 u32	rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask);
 void	rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask,
 			    u32 Data);
-- 
2.33.0

