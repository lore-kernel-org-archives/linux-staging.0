Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E606F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:22 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id bf3so21519824edb.6
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GiSL2vQNHOeb+lHHgXLmlbWZpqI3OzYyomQt07zeHrI=;
        b=C32qE/vbLWB3F8k5DeZTOD7jNpmD8PM1+0chLyl9pj0iCZxHGZpHyKt/kJsGyCHi57
         hSc0WEg2awiSncXNAL8q7T86vDDxFS/S2FMNbp843YuhgysdsU81RBp+me5n7hY0s9X9
         Y38h/ZEshXeJdtBv8pi/ygo1eBz61HhsR303jyYSRoWGIVmaPBqIjUIkgZJC/gR7/l36
         UmkzhsGH6Wf090crtvdD9GFt6Qncs1y3zOiJhms4KqDKNsuH4zkNXtjLyOdqfH52BrUe
         HNoIZNEaS+092b9NRXdHyz8fUwD9fTGTBCuQ79CVEJ5WwreT8stc5IGtHoVEsem+SsMw
         0neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GiSL2vQNHOeb+lHHgXLmlbWZpqI3OzYyomQt07zeHrI=;
        b=oTCD38gDoMvvTXL/9uGS2TK3FlzFTSoGmR7bmfb06b/tX0TuDjIc3EPxBSjSdF2Mlt
         /yNUQ0IZCWCJelID6Zd2R4Yc2TZsPcZSlvXX+zbR+WdZ1hQUMB/JArtl3Td6DLHhzR3F
         usIsYJp1TnsQZxv7qs9wp+fkDCLTP1KOGCUdGpWHwwUs0i1eOySTpxyFOF1DU0RLnlKr
         Wf+IkDtBQZephdaVD9oFsE4AdYdJDZ67kM8F9YUHui4vt9xTM3iJXYTW0Tlsy7yi869d
         5YCcMos1OVU5LvyOpAVcWj7gGP9HfxYITbYHc8T3bZEd0UiKpW72wWI8Pmyrz5ShKIKS
         gTmg==
X-Gm-Message-State: AOAM532p6gYYjA2NwRrkmTR58ZJKNDj4C9cde6kZyLTysXnMJ7twf01I
	ImvH+/yBuBhYkdcQ3TWcBLc=
X-Google-Smtp-Source: ABdhPJyIAJMXXcKAdKO0bb2usEnx8bI6A2R9xVJJIHWl6DqiMskNV0wup8wvMokS4I82oj3e879qyw==
X-Received: by 2002:a05:6402:1855:: with SMTP id v21mr2608163edy.310.1617183680850;
        Wed, 31 Mar 2021 02:41:20 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id q16sm850906ejd.15.2021.03.31.02.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 37/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in os_dep/sdio_intf.c
Date: Wed, 31 Mar 2021 11:40:05 +0200
Message-Id: <dcad5154eaaac72f5a3f89bf0d2213f69f5cf943.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index b6be1423ef75..e99c6f72cff6 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -160,7 +160,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 	int err;
 
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_notice_, ("+sdio_deinit\n"));
+	pr_notice("%s+%s\n", DRIVER_PREFIX, __func__);
 
 	func = dvobj->intf_data.func;
 
@@ -201,7 +201,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 	psdio->func = func;
 
 	if (sdio_init(dvobj) != _SUCCESS) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("%s: initialize SDIO Failed!\n", __func__));
+		pr_err("%s %s: initialize SDIO Failed!\n", DRIVER_PREFIX, __func__);
 		goto free_dvobj;
 	}
 	rtw_reset_continual_io_error(dvobj);
@@ -306,8 +306,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	padapter->intf_free_irq = &sdio_free_irq;
 
 	if (rtw_init_io_priv(padapter, sdio_set_intf_ops) == _FAIL) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			("rtw_drv_init: Can't init io_priv\n"));
+		pr_err("%s rtw_drv_init: Can't init io_priv\n", DRIVER_PREFIX);
 		goto free_hal_data;
 	}
 
@@ -322,8 +321,8 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	/* 3 7. init driver common data */
 	if (rtw_init_drv_sw(padapter) == _FAIL) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			 ("rtw_drv_init: Initialize driver software resource Failed!\n"));
+		pr_err("%s rtw_drv_init: Initialize driver software resource Failed!\n",
+		       DRIVER_PREFIX);
 		goto free_hal_data;
 	}
 
@@ -406,7 +405,7 @@ static int rtw_drv_init(
 
 	dvobj = sdio_dvobj_init(func);
 	if (dvobj == NULL) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("initialize device object priv Failed!\n"));
+		pr_err("%s initialize device object priv Failed!\n", DRIVER_PREFIX);
 		goto exit;
 	}
 
@@ -424,7 +423,7 @@ static int rtw_drv_init(
 	if (sdio_alloc_irq(dvobj) != _SUCCESS)
 		goto free_if2;
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("-871x_drv - drv_init, success!\n"));
+	pr_err("%s-871x_drv - drv_init, success!\n", DRIVER_PREFIX);
 
 	rtw_ndev_notifier_register();
 	status = _SUCCESS;
@@ -447,7 +446,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 	struct dvobj_priv *dvobj = sdio_get_drvdata(func);
 	struct adapter *padapter = dvobj->if1;
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_notice_, ("+rtw_dev_remove\n"));
+	pr_notice("%s+%s\n", DRIVER_PREFIX, __func__);
 
 	dvobj->processing_dev_remove = true;
 
@@ -479,7 +478,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 
 	sdio_dvobj_deinit(func);
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_notice_, ("-rtw_dev_remove\n"));
+	pr_notice("%s - %s\n", DRIVER_PREFIX, __func__);
 }
 
 static int rtw_sdio_suspend(struct device *dev)
-- 
2.20.1

