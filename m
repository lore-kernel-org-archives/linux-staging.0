Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111A3FD6
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 19:27:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id y35so12783537ede.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sp6UUw8l63th3R/1VUB53gD5QxqfRTtFx5oSJCOo0Ew=;
        b=SC8hy3l0Xsw1dPOLtOwMFWvy7LP+BDoXk8K5LGx76ZYX75iTsTwxrVl5skqIGIQne9
         oZVQuovQrEsvolNFh6Epz6xRxLZkHHBHIZZ8o6JyfQqVgWgGERehmIOlcWRfpBUBJ5WN
         mgm3zEqu2pVvv6TUyMYcWh6JzyE7AgzlMbSi8ZLhKDntq6AbPVClYkV4AmJYlrt84gcy
         j5eMAnpm56JeD2gzRaWXMWmd1ZtDsofPnTBZbhbElEctaHoGc8EOtklYV6g9+05thPRz
         IvGFxPlZqKU0y9+w78gWE5M6KR34cZhy0TesqewLev4Q/jWEwqnC8a20vnB1mmicVfD4
         nBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sp6UUw8l63th3R/1VUB53gD5QxqfRTtFx5oSJCOo0Ew=;
        b=eUTJyX5xZBRgtyarEgx+cz3mPsfAI+jcevceQjz141YheeTwEVAmKHNPMKLG8p4ZRQ
         YbGWv0eLL302htYgCjTMl83RXKEweCxn5aZd+3/wSkirxMNE5s3Jw1tWXiXnkvSfF7tq
         dha5qElxpxr5Wms2zi+LV6VUsjYRHBQW9ZhYj27ZLe4pQD8Mbhjw7IJzsaz9w8Ozx0b0
         WYNBl11+Ng4wKI0fkF3dmlayStrtYNH52i6rQgDsWXch2jTojeVtGfC8tAtEX8K2Gw9k
         KkZiexU5ZuQOpwIzQJQU4PtRci532UpQPeXAdkamtCQV8jqt7azUYWH9SSx2pImUCWJ7
         10jA==
X-Gm-Message-State: AOAM531ZZfQz0iZWg+EZFp9Xa8yIL6u00qxSjx8zwg9MG5ENYgDo1hEx
	VXDHB+O3saVUIb1hjyTrqnQ=
X-Google-Smtp-Source: ABdhPJyqVCzk+xdIgXnfYPpD9TXbvJRGBnT5mYSzM0RjTc1mkwZo/2vZ07Avy8PqRNrKUlGnCA1Vfg==
X-Received: by 2002:a50:9552:: with SMTP id v18mr1931389eda.395.1632943625924;
        Wed, 29 Sep 2021 12:27:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::bfc8])
        by smtp.gmail.com with ESMTPSA id f10sm449019edu.70.2021.09.29.12.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 12:27:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/7] staging: r8188eu: remove SetHalDefVarHandler from struct hal_ops
Date: Wed, 29 Sep 2021 21:26:51 +0200
Message-Id: <20210929192657.9569-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929192657.9569-1-straube.linux@gmail.com>
References: <20210929192657.9569-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove SetHalDefVarHandler from struct hal_ops and remove its wrapper
rtw_hal_set_def_var(). Call SetHalDefVar8188EUsb() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c       | 8 --------
 drivers/staging/r8188eu/hal/usb_halinit.c    | 8 ++------
 drivers/staging/r8188eu/include/hal_intf.h   | 7 ++-----
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 6 +++---
 4 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 410cc4197548..c1e7e38f3d40 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -53,14 +53,6 @@ void rtw_hal_get_hwreg(struct adapter *adapt, u8 variable, u8 *val)
 		adapt->HalFunc.GetHwRegHandler(adapt, variable, val);
 }
 
-u8 rtw_hal_set_def_var(struct adapter *adapt, enum hal_def_variable var,
-		      void *val)
-{
-	if (adapt->HalFunc.SetHalDefVarHandler)
-		return adapt->HalFunc.SetHalDefVarHandler(adapt, var, val);
-	return _FAIL;
-}
-
 u8 rtw_hal_get_def_var(struct adapter *adapt,
 		       enum hal_def_variable var, void *val)
 {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 467809340a82..6eaf97f80e5e 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1956,11 +1956,8 @@ GetHalDefVar8188EUsb(
 	return bResult;
 }
 
-/*  */
-/*	Description: */
-/*		Change default setting of specified variable. */
-/*  */
-static u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
+/* Change default setting of specified variable. */
+u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
 {
 	struct hal_data_8188e	*haldata = GET_HAL_DATA(Adapter);
 	u8 bResult = _SUCCESS;
@@ -2172,5 +2169,4 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
 	halfunc->GetHwRegHandler = &GetHwReg8188EU;
 	halfunc->GetHalDefVarHandler = &GetHalDefVar8188EUsb;
-	halfunc->SetHalDefVarHandler = &SetHalDefVar8188EUsb;
 }
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f1ebb6a2395d..03dc593eb12c 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -141,9 +141,6 @@ struct hal_ops {
 	u8	(*GetHalDefVarHandler)(struct adapter *padapter,
 				       enum hal_def_variable eVariable,
 				       void *pValue);
-	u8	(*SetHalDefVarHandler)(struct adapter *padapter,
-				       enum hal_def_variable eVariable,
-				       void *pValue);
 };
 
 #define RF_CHANGE_BY_INIT	0
@@ -183,14 +180,14 @@ void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level);
 int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter,
 				struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt);
 
+u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
+
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 
-u8 rtw_hal_set_def_var(struct adapter *padapter,
-		       enum hal_def_variable eVariable, void *pValue);
 u8 rtw_hal_get_def_var(struct adapter *padapter,
 		       enum hal_def_variable eVariable, void *pValue);
 
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 20f6182fd93c..41ab38f9d876 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3996,10 +3996,10 @@ static int rtw_dbg_port(struct net_device *dev,
 		case 0x0c:/* dump rx/tx packet */
 			if (arg == 0) {
 				DBG_88E("dump rx packet (%d)\n", extra_arg);
-				rtw_hal_set_def_var(padapter, HAL_DEF_DBG_DUMP_RXPKT, &(extra_arg));
+				SetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DUMP_RXPKT, &extra_arg);
 			} else if (arg == 1) {
 				DBG_88E("dump tx packet (%d)\n", extra_arg);
-				rtw_hal_set_def_var(padapter, HAL_DEF_DBG_DUMP_TXPKT, &(extra_arg));
+				SetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DUMP_TXPKT, &extra_arg);
 			}
 			break;
 		case 0x0f:
@@ -4097,7 +4097,7 @@ static int rtw_dbg_port(struct net_device *dev,
 						extra_arg = 2  - disable tx power tracking
 						extra_arg = 3  - turn on all dynamic func
 					*/
-					rtw_hal_set_def_var(padapter, HAL_DEF_DBG_DM_FUNC, &(extra_arg));
+					SetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DM_FUNC, &extra_arg);
 					rtw_hal_get_def_var(padapter, HAL_DEF_DBG_DM_FUNC, &odm_flag);
 					DBG_88E(" === DMFlag(0x%08x) ===\n", odm_flag);
 				}
-- 
2.33.0

