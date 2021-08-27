Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36BE29CA
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:41:54 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso8749408wmg.4
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Tdc9xo/6gcTa4My94Z747tR+Jfm2IQ0b1YpujsZkQQ=;
        b=ZMLhRF0L1D0gZku4Yvj4fXA0ifyYY66iL9mJwfolWhiIAo2cd6Zntz/5O+5fulEqLj
         J0YXhlfsIcyjIq8nR9uIoWeMkafmVAamWvIpsYMeR/qH8huEoCV5EZi/zCfDMgnabxBv
         0BVbxJ51JuCqtOg8V4iVBfENcwgSJxUjz7yeEgquU9bABi4NMQ/wCjQGT/msUjmu9f1s
         xHkkP1rdOg+YBX8Ta6g4LM/YMFa4J7l9d61mhjuKK3a3oDeIF3cFuDbLjRk5VLi4Zgop
         hCFtmiYS2ertp5ehwjXMyPuKgRYTkl9WSuw4+QcaVicibEfIzQYpjN5fQZLiTCO64gET
         uzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Tdc9xo/6gcTa4My94Z747tR+Jfm2IQ0b1YpujsZkQQ=;
        b=AnPf5Aw1DDBt8XK9kincyqthzI7YyjmvIRb98avSyyJuEE/IL1LabxFCdzuBEYXS2H
         tMieJeLZ1bE1LsKboh0QfES5PFaORWWKGRMhWsHVPligWdzEU0HLBl2453X0GAxNRXtZ
         fzidUfTnEtXXVS6yd9GiAKzRBhsAbuftwmOPxenEw7xu//VzUCP5zVe8lfXcoUmONZSF
         5GcMicLGN2P4Zt0rU1YBYM4uFs0vMLYeLTzmgAdqJ7Xc7KhvmJMowUZpEGAfu6ILXakr
         An2ODc2iLwnGi6sCIgVCfBRVdEABC9SsUWF+8vLKEQbbSMYUVmiaOyvmLjQSFY9q8jNG
         RS4Q==
X-Gm-Message-State: AOAM533/Ag+WKEWMFykkwqHxBWRUSLKrZwgNfcdApgiUN9j3wCK6qfcK
	4oKA3RjsWi94AWlEmYvspZg=
X-Google-Smtp-Source: ABdhPJw0nSxuAOdGdlE6mnxuQ9BrfLlXXyg53wfM2DjoL/T11bdgjtMLdPw9Q9GPhjcctb2t5Zv7Qw==
X-Received: by 2002:a1c:115:: with SMTP id 21mr18555478wmb.95.1630057313179;
        Fri, 27 Aug 2021 02:41:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with ESMTPSA id b15sm6500034wru.1.2021.08.27.02.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:41:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: rename struct field Wifi_Error_Status
Date: Fri, 27 Aug 2021 11:41:41 +0200
Message-Id: <20210827094144.13290-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827094144.13290-1-straube.linux@gmail.com>
References: <20210827094144.13290-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename struct field Wifi_Error_Status to avoid camel case.

Wifi_Error_Status -> wifi_error_status

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sreset.c    | 18 +++++++++---------
 drivers/staging/r8188eu/hal/usb_ops_linux.c  |  4 ++--
 drivers/staging/r8188eu/include/rtw_sreset.h |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sreset.c b/drivers/staging/r8188eu/core/rtw_sreset.c
index 8e1bc62e74e5..c831033d20a9 100644
--- a/drivers/staging/r8188eu/core/rtw_sreset.c
+++ b/drivers/staging/r8188eu/core/rtw_sreset.c
@@ -10,7 +10,7 @@ void sreset_init_value(struct adapter *padapter)
 
 	_rtw_mutex_init(&psrtpriv->silentreset_mutex);
 	psrtpriv->silent_reset_inprogress = false;
-	psrtpriv->Wifi_Error_Status = WIFI_STATUS_SUCCESS;
+	psrtpriv->wifi_error_status = WIFI_STATUS_SUCCESS;
 	psrtpriv->last_tx_time = 0;
 	psrtpriv->last_tx_complete_time = 0;
 }
@@ -20,7 +20,7 @@ void sreset_reset_value(struct adapter *padapter)
 	struct sreset_priv *psrtpriv = &pHalData->srestpriv;
 
 	psrtpriv->silent_reset_inprogress = false;
-	psrtpriv->Wifi_Error_Status = WIFI_STATUS_SUCCESS;
+	psrtpriv->wifi_error_status = WIFI_STATUS_SUCCESS;
 	psrtpriv->last_tx_time = 0;
 	psrtpriv->last_tx_complete_time = 0;
 }
@@ -37,20 +37,20 @@ u8 sreset_get_wifi_status(struct adapter *padapter)
 		return status;
 	val32 = rtw_read32(padapter, REG_TXDMA_STATUS);
 	if (val32 == 0xeaeaeaea) {
-		psrtpriv->Wifi_Error_Status = WIFI_IF_NOT_EXIST;
+		psrtpriv->wifi_error_status = WIFI_IF_NOT_EXIST;
 	} else if (val32 != 0) {
 		DBG_88E("txdmastatu(%x)\n", val32);
-		psrtpriv->Wifi_Error_Status = WIFI_MAC_TXDMA_ERROR;
+		psrtpriv->wifi_error_status = WIFI_MAC_TXDMA_ERROR;
 	}
 
-	if (WIFI_STATUS_SUCCESS != psrtpriv->Wifi_Error_Status) {
-		DBG_88E("==>%s error_status(0x%x)\n", __func__, psrtpriv->Wifi_Error_Status);
-		status = (psrtpriv->Wifi_Error_Status & (~(USB_READ_PORT_FAIL | USB_WRITE_PORT_FAIL)));
+	if (WIFI_STATUS_SUCCESS != psrtpriv->wifi_error_status) {
+		DBG_88E("==>%s error_status(0x%x)\n", __func__, psrtpriv->wifi_error_status);
+		status = (psrtpriv->wifi_error_status & (~(USB_READ_PORT_FAIL | USB_WRITE_PORT_FAIL)));
 	}
 	DBG_88E("==> %s wifi_status(0x%x)\n", __func__, status);
 
 	/* status restore */
-	psrtpriv->Wifi_Error_Status = WIFI_STATUS_SUCCESS;
+	psrtpriv->wifi_error_status = WIFI_STATUS_SUCCESS;
 
 	return status;
 }
@@ -58,5 +58,5 @@ u8 sreset_get_wifi_status(struct adapter *padapter)
 void sreset_set_wifi_error_status(struct adapter *padapter, u32 status)
 {
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
-	pHalData->srestpriv.Wifi_Error_Status = status;
+	pHalData->srestpriv.wifi_error_status = status;
 }
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 5a55ee38d7b8..0cf69033c529 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -69,7 +69,7 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 					adapt->bSurpriseRemoved = true;
 				} else {
 					struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
-					haldata->srestpriv.Wifi_Error_Status = USB_VEN_REQ_CMD_FAIL;
+					haldata->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
 				}
 			} else { /*  status != len && status >= 0 */
 				if (status > 0) {
@@ -417,7 +417,7 @@ static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
 		case -EOVERFLOW:
 			{
 				struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
-				haldata->srestpriv.Wifi_Error_Status = USB_READ_PORT_FAIL;
+				haldata->srestpriv.wifi_error_status = USB_READ_PORT_FAIL;
 			}
 			precvbuf->reuse = true;
 			rtw_read_port(adapt, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf);
diff --git a/drivers/staging/r8188eu/include/rtw_sreset.h b/drivers/staging/r8188eu/include/rtw_sreset.h
index 8fa7aa4abb3f..4e97997c305b 100644
--- a/drivers/staging/r8188eu/include/rtw_sreset.h
+++ b/drivers/staging/r8188eu/include/rtw_sreset.h
@@ -10,7 +10,7 @@
 struct sreset_priv {
 	struct mutex	silentreset_mutex;
 	u8	silent_reset_inprogress;
-	u8	Wifi_Error_Status;
+	u8	wifi_error_status;
 	unsigned long last_tx_time;
 	unsigned long last_tx_complete_time;
 };
-- 
2.32.0

