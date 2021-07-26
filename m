Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E65A72
	for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 09:21:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l18so2546283wrv.5
        for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqNUqFciNN4LC8aT5JJ7kp05Roas++LREeGimN8w8rw=;
        b=aJh6pZUOKONswsCUiE+v3fACkMsH/juMZscKD8PQx3W+W4YoZXIKtYP4uCxWJq5DmK
         Mfg9ruke4uHCUx9+T7PYMVNTOnMJJMm/GAnB5hGh/PE6ed3a6IGjFyb18KGG6BXEGatI
         tEa4Q8OdPZ+8e5iRQ7SrdHqkmE6/76h1GHVglDpetTJUshrZoF/uKHOMbmQuSDkkjBeD
         53+eA+W58ulw80HVzHtH0i9jabQ/vAVlPUs8Mj4a/ps9x/a3yalQzkUySqz4MWLZq5wd
         18lScrdFp9T2D6IRX7u86+lpdeNwgCQuh4XRDRaB1Bj445MR/rpBppj2cgo0AtFGiybA
         FnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqNUqFciNN4LC8aT5JJ7kp05Roas++LREeGimN8w8rw=;
        b=Rex+ZWbJhfghGP7K9YN9hfrRV3o0GN11aEblk5Fb9DcfJ/gTRVDvP9GdKWZW4tujgV
         pcC4SnHYdFEIHnP+0Z7qMteq2HKESfNDWbfAaZpAmvduScDAL1Ebr4tdicQxqipORc6p
         GywUFcXvojZ5rdSDvJBbGYO343udS8zuBPwXr/tOhfbRKIxhp1UetuOVk65znU+zruVd
         PXnI0B47GdYKZt1cikEfYTqCExClTY34l5vzvaWj/vc++h8ez1HuqZ/0ihxv+jAwB9eg
         9XJWbhtY6DEWSd3m89dQ0vR66tXl32wkJD2X2zdUkc4OIFiI35USC5umT3ARHcoQNjm4
         tLRg==
X-Gm-Message-State: AOAM531QDmWmnGjkB9kfagsWw8veTA78tl8ga1X3YMsENzo7cr7IZ+iF
	oj2F1d9OhfIiT4nHKjDpHbngElD1O2A=
X-Google-Smtp-Source: ABdhPJz2uwaAY/feFqZNsLuiMK4gU1YCIYHxJAFsrMTudHMAMjr7Kd8aSGKX0T14AExgK2BUB4UnQg==
X-Received: by 2002:a5d:6851:: with SMTP id o17mr18354347wrw.346.1627291311493;
        Mon, 26 Jul 2021 02:21:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4bf9])
        by smtp.gmail.com with ESMTPSA id a191sm2555704wme.15.2021.07.26.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 02:21:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8188eu: remove braces from single line if blocks
Date: Mon, 26 Jul 2021 11:21:29 +0200
Message-Id: <20210726092129.30334-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from single line if blocks to clear checkpatch warnings.
WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_cmd.c          | 3 +--
 drivers/staging/rtl8188eu/core/rtw_mlme.c         | 3 +--
 drivers/staging/rtl8188eu/core/rtw_xmit.c         | 3 +--
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 3 +--
 drivers/staging/rtl8188eu/hal/usb_halinit.c       | 6 ++----
 5 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index eb89a52aa4e3..56ece839c9ca 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -1159,9 +1159,8 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		psta = rtw_get_stainfo(&padapter->stapriv, pnetwork->MacAddress);
 		if (!psta) {
 			psta = rtw_alloc_stainfo(&padapter->stapriv, pnetwork->MacAddress);
-			if (!psta) {
+			if (!psta)
 				goto createbss_cmd_fail;
-			}
 		}
 
 		rtw_indicate_connect(padapter);
diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index 71d205f3d73d..0d334aba9a3f 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -953,9 +953,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			}
 
 			/* s4. indicate connect */
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
 				rtw_indicate_connect(adapter);
-			}
 
 			/* s5. Cancel assoc_timer */
 			del_timer_sync(&pmlmepriv->assoc_timer);
diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index d5fc59417ec6..c77ebd18f40c 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -1124,9 +1124,8 @@ struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv)
 		list_del_init(&pxmitbuf->list);
 		pxmitpriv->free_xmitbuf_cnt--;
 		pxmitbuf->priv_data = NULL;
-		if (pxmitbuf->sctx) {
+		if (pxmitbuf->sctx)
 			rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_BUF_ALLOC);
-		}
 	}
 	spin_unlock_irqrestore(&pfree_xmitbuf_queue->lock, irql);
 
diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index 6cf87312bc36..a67615708745 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -510,7 +510,6 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
 	else
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
 
-	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail) {
+	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail)
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
-	}
 }
diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 1d7d5037ce89..3e8f7315d377 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -641,9 +641,8 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	}
 
 	status = rtw_hal_power_on(Adapter);
-	if (status == _FAIL) {
+	if (status == _FAIL)
 		goto exit;
-	}
 
 	/*  Save target channel */
 	haldata->CurrentChannel = 6;/* default set to 6 */
@@ -696,9 +695,8 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	_InitTxBufferBoundary(Adapter, txpktbuf_bndy);
 
 	status =  InitLLTTable(Adapter, txpktbuf_bndy);
-	if (status == _FAIL) {
+	if (status == _FAIL)
 		goto exit;
-	}
 
 	/*  Get Rx PHY status in order to report RSSI and others. */
 	_InitDriverInfoSize(Adapter, DRVINFO_SZ);
-- 
2.32.0

