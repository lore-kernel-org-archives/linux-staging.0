Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1333F4BF
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqRmqKih"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7a7e9357eso475117b3.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697041977; x=1697646777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcrSTPiKgGvBMhWL3rTX/4I3RdS194oyF0Rj5hOezM0=;
        b=lqRmqKih+NuZyAXKMP1VRsHrMqsrzo/avv6sj2tvVteKw5klhnBdW2I10EsJk9/C0h
         chpPoVf9SrQ58lD4IqNEWsoKYBZd+8+BkwBMyZlZKWB/aWJqUZe6jSArQ94sXJPXlR0z
         tCARocxznU9WMG+gq9n7JPO2738bgvRv3efGkawql6tsJyEaWlYCRW7SPjGojmW5iS5H
         s/TnDpjgvakXZAheczUDYW9RC+BC6InUSzsRaCOFeSkcyE/imLPF1NpLGkaZB9C4tDJH
         QmM7XYQVmEKkjJOj3GoN8O98neai2Ot+bDOLbW5IGS7YrToA4fFe1Ubiw68cm+s4BDes
         e4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697041977; x=1697646777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcrSTPiKgGvBMhWL3rTX/4I3RdS194oyF0Rj5hOezM0=;
        b=nwYTl2mQLctJBzWqsnFBB4WyREAURDqxRXRX5tz4aZ7oZiLIKl7AyGMXSQAbSiXcJ1
         eaH96DR/C0D7efz8dBlUIXq3YIDStehSnmkm6NVAuMl04iAiOXpS7A9jjj/LHj3duAet
         F20ZGiesF27J3lGpwHpCpJ4V9tVERj5Ajfv90uU1xMxd9ptvn053J6MROMnFFpwNboeA
         3ebB2SzMHO4rF7NX2kG2hw/fuLLuXmC8wPoTJhOXoUDLat+ADhPMmTi25jSep/iSAEZl
         EyjbAMkMZlcN3L28ri3GHYbtAPbr586T8z5/37RbMn/3pgxAlFgRFulLHqBzlRnpfLDm
         JbBA==
X-Gm-Message-State: AOJu0Yxhf6I0PpEC1r2XsNyKc9P5NdkXrSuoWuWLa67Jat/WsouHJeP/
	adJApHuvAyLdvUs7xXkBG1A=
X-Google-Smtp-Source: AGHT+IG9MyyVRFyjc1GyvqBpuEqq1Yx1XB84LZFroeRGcHITvKl+B4s+4k3qeYqMEN+AZCM6ENNJ4g==
X-Received: by 2002:a81:6c8b:0:b0:59f:67f5:66c6 with SMTP id h133-20020a816c8b000000b0059f67f566c6mr22505291ywc.16.1697041977391;
        Wed, 11 Oct 2023 09:32:57 -0700 (PDT)
Received: from policorp.cardume.local ([177.91.232.53])
        by smtp.gmail.com with ESMTPSA id i23-20020ab04757000000b007ab975b8eb9sm2798097uac.10.2023.10.11.09.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 09:32:57 -0700 (PDT)
From: drosdeck <edson.drosdeck@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	edson.drosdeck@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs:Fix coding style errors and warning
Date: Wed, 11 Oct 2023 13:42:32 -0300
Message-Id: <20231011164232.28866-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script. Fixes warning replacing printk to
pr_crit and fixes conding style.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 21 +++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 490431484524..e178a6881e0c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -48,7 +48,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -73,7 +72,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 	err = sdio_claim_irq(func, &sd_sync_int_hdl);
 	if (err) {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
-		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
+		pr_crit("%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
 	} else {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_cnt++;
 		dvobj->irq_alloc = 1;
@@ -81,7 +80,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 
 	sdio_release_host(func);
 
-	return err?_FAIL:_SUCCESS;
+	return err ? _FAIL : _SUCCESS;
 }
 
 static void sdio_free_irq(struct dvobj_priv *dvobj)
@@ -102,8 +101,9 @@ static void sdio_free_irq(struct dvobj_priv *dvobj)
 				netdev_err(dvobj->if1->pnetdev,
 					   "%s: sdio_release_irq FAIL(%d)!\n",
 					   __func__, err);
-			} else
+			} else {
 				dvobj->drv_dbg.dbg_sdio_free_irq_cnt++;
+			}
 			sdio_release_host(func);
 		}
 		dvobj->irq_alloc = 0;
@@ -169,6 +169,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	int status = _FAIL;
@@ -239,8 +240,8 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_hal_disable_interrupt(padapter);
 }
 
-
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj,
+					 const struct sdio_device_id  *pdid)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -273,7 +274,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
@@ -290,7 +290,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	rtw_hal_chip_configure(padapter);
 
-	hal_btcoex_Initialize((void *) padapter);
+	hal_btcoex_Initialize((void *)padapter);
 
 	/* 3 6. read efuse/eeprom data */
 	rtw_hal_read_chip_info(padapter);
@@ -359,9 +359,7 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
  * notes: drv_init() is called when the bus driver has located a card for us to support.
  *        We accept the new device by returning 0.
  */
-static int rtw_drv_init(
-	struct sdio_func *func,
-	const struct sdio_device_id *id)
+static int rtw_drv_init(struct sdio_func *func, const struct sdio_device_id *id)
 {
 	int status = _FAIL;
 	struct adapter *if1 = NULL;
@@ -501,6 +499,5 @@ static void __exit rtw_drv_halt(void)
 	rtw_ndev_notifier_unregister();
 }
 
-
 module_init(rtw_drv_entry);
 module_exit(rtw_drv_halt);
-- 
2.39.2

