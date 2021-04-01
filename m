Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D355F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id h10so1129363edt.13
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j8yBh+QrAemiC0bPY4Ow5WV3STLbPxKdPO1253KlO8E=;
        b=OhpN8VvpGm0bFGtgRnt1NDcbV70nSeMs7fv69TeRd03m/KluDthTV6/M/Gf6VzA658
         oA8cfGd0wPyW7U80eJBdD89tQG8h5PGR3AxCyNHDqhT+8JVSHLiqW11FriP4fZaLLkpi
         K8uHfQlzvHWTTITijhWb0InGA20tPJmaow4G1bPyleK1pF/GvetVXcy8nxKTV8UTNQr6
         3mZ/lSlGw/0gEkT4/jOdG+pk0YPCvAIi7Ps4upYwD1jtqSOowl7LRjwOmaLOJReQrcLZ
         aLYJJzaOevrm+mAP3KIk6B/t0VxmRjZ/Nx3jxX5LbwRA4qn8YKz7zpYPyXtCX6z/RV9c
         61eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j8yBh+QrAemiC0bPY4Ow5WV3STLbPxKdPO1253KlO8E=;
        b=s8jHXdw7AZg81oTB0pdRJhd+N65k1CP5Q1oXm29YrhVXJvRy20cDcnZJ2BDWGRQWJk
         MzUy5DCO6YvD3Jrg2dvpmByekHA6cg0bUDKLhhagPJyAttAYLH0S/bb8RQgxRcqak8Ig
         Zt0OvHV2iRVTouZqhkrm0E/z5dbcHGn9mTvsq1R/sB2bxskF8Fx0lH/8WxL8fN8P+L6O
         W7eHEUf7Zs+wmUWWaHdTit+RLoLwZh/0VdfV1PxITU78eMoOruXtdvl6PjpZ10NinsDX
         5pARHuvrFMv2IzpOb8Jm5v1khFnGfUM5LJl5SUPj0sUyx4DGvXaV9GQDx3nYM62I9xbH
         FQsQ==
X-Gm-Message-State: AOAM532bOFqOS1sElMHNXyp1JDj588whvd3NFepIFE9SkZzyDidgNaea
	6f5XigPAuJavp1F1kTnnIyXNNdq9ce28Kg==
X-Google-Smtp-Source: ABdhPJzs1aZHMP3M9CxAAP2l/WDqbK0qVH9aqo7hvWt/RD4Af/18tdUhCOw7N0bgNg3iOmN9vXvjbw==
X-Received: by 2002:a05:6402:438f:: with SMTP id o15mr8833029edc.123.1617268956527;
        Thu, 01 Apr 2021 02:22:36 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id g20sm3083129edb.7.2021.04.01.02.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 45/49] staging: rtl8723bs: remove RT_TRACE logs in os_dep/sdio_intf.c
Date: Thu,  1 Apr 2021 11:21:15 +0200
Message-Id: <1efd90da9a2d3b1456f2fe47b28543e0ef5b1fb7.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index b6be1423ef75..fecb43b870d7 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -159,9 +159,6 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 	struct sdio_func *func;
 	int err;
 
-
-	RT_TRACE(_module_hci_intfs_c_, _drv_notice_, ("+sdio_deinit\n"));
-
 	func = dvobj->intf_data.func;
 
 	if (func) {
@@ -201,7 +198,6 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 	psdio->func = func;
 
 	if (sdio_init(dvobj) != _SUCCESS) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("%s: initialize SDIO Failed!\n", __func__));
 		goto free_dvobj;
 	}
 	rtw_reset_continual_io_error(dvobj);
@@ -306,8 +302,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	padapter->intf_free_irq = &sdio_free_irq;
 
 	if (rtw_init_io_priv(padapter, sdio_set_intf_ops) == _FAIL) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			("rtw_drv_init: Can't init io_priv\n"));
 		goto free_hal_data;
 	}
 
@@ -322,8 +316,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	/* 3 7. init driver common data */
 	if (rtw_init_drv_sw(padapter) == _FAIL) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			 ("rtw_drv_init: Initialize driver software resource Failed!\n"));
 		goto free_hal_data;
 	}
 
@@ -406,7 +398,6 @@ static int rtw_drv_init(
 
 	dvobj = sdio_dvobj_init(func);
 	if (dvobj == NULL) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("initialize device object priv Failed!\n"));
 		goto exit;
 	}
 
@@ -424,8 +415,6 @@ static int rtw_drv_init(
 	if (sdio_alloc_irq(dvobj) != _SUCCESS)
 		goto free_if2;
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("-871x_drv - drv_init, success!\n"));
-
 	rtw_ndev_notifier_register();
 	status = _SUCCESS;
 
@@ -447,8 +436,6 @@ static void rtw_dev_remove(struct sdio_func *func)
 	struct dvobj_priv *dvobj = sdio_get_drvdata(func);
 	struct adapter *padapter = dvobj->if1;
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_notice_, ("+rtw_dev_remove\n"));
-
 	dvobj->processing_dev_remove = true;
 
 	rtw_unregister_netdevs(dvobj);
@@ -479,7 +466,6 @@ static void rtw_dev_remove(struct sdio_func *func)
 
 	sdio_dvobj_deinit(func);
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_notice_, ("-rtw_dev_remove\n"));
 }
 
 static int rtw_sdio_suspend(struct device *dev)
-- 
2.20.1

