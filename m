Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1023FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id ia27so15054946ejc.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gmbLARluVxMQ+ZokkZJzSgEYmy1Qusxy/6FmmYzAGJc=;
        b=dZD7TsGd8gza2uaROXuIBa3GO1SoYFKR4n5y/DV87NSAEe/N7+YxaFwSHBBXnLvjF1
         9wCJfkl74a+uimqy9vihkO/2zLTqMMf0bW/gJE9X9HXWk/rDbp7xlW8Cb+XXlKzkwUNw
         XBWP8jS4ff4uXi2yTzuNS5BZC5q5XvrlZZHPK2uvSqgAgndgKREk3vSU46RQFNuICIqL
         ItxSo6zHycEx99uxjBBdIa+GGMvciHWrkKxiOBl1IE1bC6eWBdm0VsKQY2H62jGf2HPZ
         ccMzn/f7ZVNqxTkdropkfVO8WQa2FMeZTihcaP0Y57ZDF4q3iBsDYUh6adkoAAuJF98F
         CIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gmbLARluVxMQ+ZokkZJzSgEYmy1Qusxy/6FmmYzAGJc=;
        b=FCwGasyUVnT6L2yrCLvq1leCw+4vJREzjnCIxxtaDDX8U/hUPlurCgunWbOkKRCCh5
         rvJE+MppubuIvVAX8NXnPq4cBDn24/maWA89sdMO4aihibocgbNslowVkjlHyU2Q+vVi
         GGY9HSrJ3C/KVe5zGRfntloP/Xli281fyV8m2u7Wace/Pt5kRBaYyOFdB5HD3O+wBLFh
         VgSrGSLCSweyJDLZNY8+M4fK1rTkobXT1qgWyU/q28/Qx0koHJ1qXwQBbPPNAN7izsIT
         VCCbsSYJVUHIumJ03aSNq+huUeruW0AevI0Iez0b1TTKJyJ8rZ8D2fLZi4L8Ptce0hCO
         ORYw==
X-Gm-Message-State: AOAM533fqzq/95etXbDp4DPLSYg29TyAvxtZA9HLpbgL55VXf7DykRSj
	+zSFvoSILsxOBDC3zUP/ilCJKKjlOJPJnA==
X-Google-Smtp-Source: ABdhPJzICbJKtzRxfT7H3STvf66aePpA9UZmZ0Wt2Bl+PbTYxlLLBDvg59qnydoplKnDZ6Swo7/uOA==
X-Received: by 2002:a17:906:369a:: with SMTP id a26mr15171800ejc.539.1630954452834;
        Mon, 06 Sep 2021 11:54:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 14/40] staging: r8188eu: remove hal_power_on from hal_ops
Date: Mon,  6 Sep 2021 20:53:01 +0200
Message-Id: <20210906185327.10326-15-straube.linux@gmail.com>
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

Remove hal_power_on from hal_ops and remove its wrapper
rtw_hal_power_on(). Call rtl8188eu_InitPowerOn() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 7 -------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c       | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h      | 4 +---
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 39b1a8711754..58ece9a1232c 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -12,13 +12,6 @@ void rtw_hal_free_data(struct adapter *adapt)
 		adapt->HalFunc.free_hal_data(adapt);
 }
 
-u32 rtw_hal_power_on(struct adapter *adapt)
-{
-	if (adapt->HalFunc.hal_power_on)
-		return adapt->HalFunc.hal_power_on(adapt);
-	return _FAIL;
-}
-
 uint	 rtw_hal_init(struct adapter *adapt)
 {
 	uint	status = _SUCCESS;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 0b14748e1346..207fb182ee6c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -904,7 +904,7 @@ static void ReadEFuseByIC(struct adapter *Adapter, u8 efuseType, u16 _offset, u1
 	if (!bPseudoTest) {
 		int ret = _FAIL;
 		if (rtw_IOL_applied(Adapter)) {
-			rtw_hal_power_on(Adapter);
+			rtl8188eu_InitPowerOn(Adapter);
 
 			iol_mode_enable(Adapter, 1);
 			ret = iol_read_efuse(Adapter, 0, _offset, _size_byte, pbuf);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 7b9cca4e3cb4..2c010f12118a 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -85,7 +85,7 @@ void rtl8188eu_interface_configure(struct adapter *adapt)
 				pdvobjpriv->RtNumInPipes, pdvobjpriv->RtNumOutPipes);
 }
 
-static u32 rtl8188eu_InitPowerOn(struct adapter *adapt)
+u32 rtl8188eu_InitPowerOn(struct adapter *adapt)
 {
 	u16 value16;
 	/*  HW Power on sequence */
@@ -2214,7 +2214,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 		DBG_88E("cant not alloc memory for HAL DATA\n");
 	adapt->hal_data_sz = sizeof(struct hal_data_8188e);
 
-	halfunc->hal_power_on = rtl8188eu_InitPowerOn;
 	halfunc->hal_init = &rtl8188eu_hal_init;
 	halfunc->hal_deinit = &rtl8188eu_hal_deinit;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 9f804f9f5363..63842cd469c5 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -124,7 +124,6 @@ enum hal_odm_variable {
 typedef s32 (*c2h_id_filter)(u8 id);
 
 struct hal_ops {
-	u32	(*hal_power_on)(struct adapter *padapter);
 	u32	(*hal_init)(struct adapter *padapter);
 	u32	(*hal_deinit)(struct adapter *padapter);
 
@@ -227,10 +226,9 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter);
 void rtl8188eu_init_default_value(struct adapter *adapt);
 void rtl8188e_SetHalODMVar(struct adapter *Adapter,
 			   enum hal_odm_variable eVariable, void *pValue1, bool bSet);
+u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 
 void	rtw_hal_free_data(struct adapter *padapter);
-
-u32 rtw_hal_power_on(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
-- 
2.33.0

