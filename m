Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B742734D92C
	for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442081; cv=none; b=OEc7KloaIsxStthgEDyu2iBFQhNP6ZLZCDfY5jLiO7j3puuSJyni7qqt9aM9Iyqco4zdkh8JHonjfAa+LV+jJgj8ZgD33yutlTI5FqliKWvn0UzdmkCym18sr01QLkKj+LMpOcQZ6QQLQSZJTK2TXpobtCb57zUPv8EUNzGzwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442081; c=relaxed/simple;
	bh=6Gqyybi5f1+/rOaFiBrAjuOWPKQM/C9FIcvNqzTZ//I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuM9CAU4T9Utcawib/Utq6KcZoV9rDIv5PfuwLVL2ceNG9Xsn1JaZbpezpzQK5899JQrsPwYeubX0lgqUKrvyULQTBniN1trZdy/iPgw7cCch0QphdV1R8yhs9XkdbwOuZ1TRCEXDCvBs4M++gyEdopahNEIeagkr9Xc8OZwxGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTUxnvnc; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTUxnvnc"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d47b5987so1693625e87.2
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442078; x=1791046878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2LtHAaylmzUwvtZGxdyjvEKCHez6qvwObhUlbLkE8c=;
        b=rTUxnvncXZjbjnAGMA5mnry4Axqst+WPV7ZNp01GbdXBI0Y3CTFUWHylod5pUguLL4
         A/ZepG0bh7IyAnybpp1DqV/nuWLZN2Awi1RB0LFVaUyfbcDV+UMLBbeCyreRffnO8oNW
         Bfj6nldoRhravMtyw3V4srj8HMiLxVMfeFaPFmctivB3pAdAuEL4RgYe8n9yvQK/y6Ep
         R9O39pU7sQbuM2j8HGy/kamW0TCqEe3VdITa47c2rX7BWiI3RC8j+5gkH9PXSoE9bFWg
         gPTbPrR/1ICo2UQajkZlK6p/ki6F7xlwvCUCGelXWNOFb1DGg3fDoVhHPhxQoJFotYou
         UAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442078; x=1791046878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2LtHAaylmzUwvtZGxdyjvEKCHez6qvwObhUlbLkE8c=;
        b=QsgMZQiNHEz6izcO+DXEFRARQWLTAWU5cEiEBD0HvontyEsqvoSusZu8X4DFoLShVq
         wuHNEQvyQT5tlT8uS4LCLo31B8VTyTi1GUIAUvqBxB5pEhrY/AolI442Snz5KEEibYNS
         tI5AKgNvGSlpxbGu2uiaQGdO94Ak1qimZx49A1G5Nhhql3xbaqZ6U/FBdcTyrDuVOc6F
         BsXclGIHGk9jPaMeGNddDBAIG7MGpP+gXgW0HShLcDC5HvWYRXEyVJvQGu21us5SwWrr
         b0TVBKA1mrmMThTUPao8yozIuEkaytHll4cF/FHvkVxhZ6SJl7/Oc+FJEUFHOzCMEyFE
         CD/g==
X-Forwarded-Encrypted: i=1; AKwUvBzi/5SCZ+vI9djiu3wxXvoO4A7/yUMLitpWUzMRxBg4Emm5bMgYZnFsJnvBCEWOTW2qW+rgVps1cEe5r7oH@lists.linux.dev
X-Gm-Message-State: AFuF++k5yIEtVA0xiokDXIdjCg13nYL8z95A6GpamWoUhLyAvk26MXMf
	M3UCJsXIkwZ6wJeo78Mswwm82kciso4gduqZWLdNgyhrknbSQJ8R2bby
X-Gm-Gg: AYBFou3gD3NmZ9qvmjG23d/eC5XgxPDTURhVod886fTF3ik9dGYxIUrvHZM/2EwRGUM
	Vbc/dlvtlanAgRnyr8DZM2e9sqIedoyqjg6ic4ToerCcYET/YeLXmfeaXuiBPAr88HFD6ZgvxCx
	QER5dZ6j0UTnzp51k+G0JH3QqTsk/7dV4HUsLuOOiNH6AMRT5USfd5B/p5lPx/L9Ull3oGT4KJT
	vPGFkscEsqYqVhPeXIQlb7zViQbQzjpFI3/W6mCfj7A6WS4qhu962qF03aPB4nOy2LT6ngAwCaV
	YqvFYwcuITygyccV90Se3XjIeNh1ZxIWj54i6PS7dUK0sbzU1EAVaicG03gO//2KRK5gRdVuUFM
	f15gNQeRG61B/6SF5MeM4gycTRIma+j7/lxoicMtNmydk3ib1VGY6NCYf8apXL2eleOhbUqQoNd
	93uf84w9Ft8WCnilSzfPO+JsaQ8/eYqL9NdQTrQij15z3aG+UtylPyn2U8+aUDXvDbX6q4It3tX
	RVxLJbCOKmQaGpa6hE70TklPFMnykKi4E3Jf4/j878vyK8IXUo=
X-Received: by 2002:a05:6512:3f22:b0:5b8:f4d4:7fe1 with SMTP id 2adb3069b0e04-5b8f4d480admr35233e87.35.1790442077440;
        Sat, 26 Sep 2026 10:01:17 -0700 (PDT)
Received: from Hedgehog.. (broadband-188-32-185-163.ip.moscow.rt.ru. [188.32.185.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e836df4bsm1235398e87.72.2026.09.26.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:01:15 -0700 (PDT)
From: Artem Shelenko <artem.shelenko@gmail.com>
X-Google-Original-From: Artem Shelenko <Artem.Shelenko@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: use standard error returns in HAL interface
Date: Sat, 26 Sep 2026 20:00:49 +0300
Message-ID: <20260926170049.315302-1-Artem.Shelenko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arfBy_n6FsDI39p-@stanley.mountain>
References: <arfBy_n6FsDI39p-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_hal_init() and rtw_hal_deinit() return vendor-style status values,
with one indicating success and zero indicating failure. Convert both
interfaces to return int with zero on success and -EIO on failure. The
lower HAL functions retain their legacy status contract and do not
provide a more specific error code at this boundary.

Update the init callers to check the new return convention. Propagate
HAL errors through _netdev_open(), while preserving its existing -1
return for failure of the unrelated rtw_start_drv_threads() API. Keep
the _SUCCESS/_FAIL contract of ips_netdrv_open() for its IPS callers.

Preserve the hw_init_completed transitions, including clearing the
flag only after a successful lower-layer deinitialization. The lower
deinit function currently always reports success; this change does
not add detection of hardware teardown failures.

Suggested-by: Dan Carpenter <error27@gmail.com>
Assisted-by: LLM
Signed-off-by: Artem Shelenko <Artem.Shelenko@gmail.com>
---

Notes:
    Changes in v2:
    - Replace the type-only cleanup with standard 0/-errno HAL return values as suggested by Dan Carpenter.
    - Update init callers for the new convention and propagate the HAL error through _netdev_open().
    - Preserve the existing IPS and rtw_start_drv_threads() return conventions.

 drivers/staging/rtl8723bs/hal/hal_intf.c     | 14 ++++++++------
 drivers/staging/rtl8723bs/include/hal_intf.h |  4 ++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 17 ++++++++---------
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1..870cfaf1d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -4,6 +4,8 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include <linux/errno.h>
+
 #include <drv_types.h>
 #include <hal_data.h>
 
@@ -27,9 +29,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+int rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -51,12 +53,12 @@ uint rtw_hal_init(struct adapter *padapter)
 		dvobj->padapters->hw_init_completed = false;
 	}
 
-	return status;
+	return status == _SUCCESS ? 0 : -EIO;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+int rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
@@ -66,7 +68,7 @@ uint rtw_hal_deinit(struct adapter *padapter)
 		padapter->hw_init_completed = false;
 	}
 
-	return status;
+	return status == _SUCCESS ? 0 : -EIO;
 }
 
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b6311652..77aed5939 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+int rtw_hal_init(struct adapter *padapter);
+int rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee2..691dc248a 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -786,7 +786,7 @@ int rtw_drv_register_netdev(struct adapter *if1)
 
 static int _netdev_open(struct net_device *pnetdev)
 {
-	unsigned int status;
+	int ret;
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
 
@@ -802,13 +802,14 @@ static int _netdev_open(struct net_device *pnetdev)
 		padapter->bSurpriseRemoved = false;
 		padapter->bCardDisableWOHSM = false;
 
-		status = rtw_hal_init(padapter);
-		if (status == _FAIL)
+		ret = rtw_hal_init(padapter);
+		if (ret)
 			goto netdev_open_error;
 
-		status = rtw_start_drv_threads(padapter);
-		if (status == _FAIL)
+		if (rtw_start_drv_threads(padapter) == _FAIL) {
+			ret = -1;
 			goto netdev_open_error;
+		}
 
 		if (padapter->intf_start)
 			padapter->intf_start(padapter);
@@ -838,7 +839,7 @@ static int _netdev_open(struct net_device *pnetdev)
 	netif_carrier_off(pnetdev);
 	rtw_netif_stop_queue(pnetdev);
 
-	return (-1);
+	return ret;
 }
 
 int netdev_open(struct net_device *pnetdev)
@@ -861,7 +862,6 @@ int netdev_open(struct net_device *pnetdev)
 
 static int  ips_netdrv_open(struct adapter *padapter)
 {
-	int status = _SUCCESS;
 	/* struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter); */
 
 	padapter->net_closed = false;
@@ -870,8 +870,7 @@ static int  ips_netdrv_open(struct adapter *padapter)
 	padapter->bCardDisableWOHSM = false;
 	/* padapter->bup = true; */
 
-	status = rtw_hal_init(padapter);
-	if (status == _FAIL)
+	if (rtw_hal_init(padapter))
 		goto netdev_open_error;
 
 	if (padapter->intf_start)

base-commit: 8444548bd905f22093729065408284a6b46f7eee
-- 
2.43.0

