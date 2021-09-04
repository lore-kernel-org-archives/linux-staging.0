Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44FB3FC1
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:40:56 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso1369097wmc.5
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VjGQcdj4Knl301hFJWFCQe4nS0zuwuso/gUPSHuU+kk=;
        b=mUTX1s8FzIPXMm06vlMVqQEZE+Kt4QHu/KrHTawfFQFZoeNZ8dvxkdagqoh4dofeXw
         QIF7y96Pzs/BW1b9724EagAZISq0eTNMbXnm+sAzKDGwLsxDAsRwmFLrv4EIkECsWeYU
         jHsYWTq8qcvi0P45NJWr+tu1pwn3URo1mm+VZWHJJvgelvBFl5mGvzz8xSlaXu2vtsrf
         mBIcx+bo1ykQAKOlkD0mr0AMgXoi4ib1Tf8vtOUBCzKX6U05zSGnvyckgbjK1vZpLrak
         gUbuJMfk+6p9kw9Rq9tR+B/Um4R5uZmwr3iWGQrKSwSGG9CxXoDNL6VoUf5OYG/eDBO2
         YiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VjGQcdj4Knl301hFJWFCQe4nS0zuwuso/gUPSHuU+kk=;
        b=h6+Fdl5j0Ro/XVcIdw28go86melupg+iFafQdef/UqznFvjVq1gzcVSewUv2TgoTBZ
         rZXnfh5mEk8QHgVwiTkqqUCDvfv0KF9wPljey3KXhQmCBLmhYVKvKWu+QLkJBeTyJ8Af
         tGbggIEmmr4w0ENc/VyPI3SidYh+7FyFvm0UMuhcuMAwb0IzE7c0o2G8jyyMtlnOdTA2
         kKi70lzmxtHYOJR8NDWGailoM1q3AWAI1AWD1Gvm3HYycPY/KV4mFr8BZ8FwTApM5e6M
         j8q9JAebfUPg7EwTl1jpUS9X37fEuITvmCYpzKmxwAYo95PVUH4pXag6mOOv+CTlErFl
         Np7A==
X-Gm-Message-State: AOAM5311yZjlvrSP7Qq8/YAEJfgR+8DhAm7lCdI9rHb9yYU2KDWPYdCw
	Mb2hRwzHsv3K2oH7UQH8/OY=
X-Google-Smtp-Source: ABdhPJx+GXPj0ixBefkedjRjO6Tfzn47DxFFROLLwf2caNscMZeVpJ0+LiLNJai68So4xOXVkvploA==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr3172882wmc.102.1630759255320;
        Sat, 04 Sep 2021 05:40:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id j207sm2094071wmj.40.2021.09.04.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:40:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/6] staging: r8188eu: remove GetHalODMVarHandler from hal_ops
Date: Sat,  4 Sep 2021 14:40:32 +0200
Message-Id: <20210904124033.14244-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904124033.14244-1-straube.linux@gmail.com>
References: <20210904124033.14244-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove GetHalODMVarHandler from hal_ops ant remove its wrapper
rtw_hal_get_odm_var(), both are unused.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 9 ---------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 -----
 drivers/staging/r8188eu/include/hal_intf.h      | 6 ------
 3 files changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 1a59644679f1..9069b52f83ff 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -124,15 +124,6 @@ void rtw_hal_set_odm_var(struct adapter *adapt,
 						      val1, set);
 }
 
-void rtw_hal_get_odm_var(struct adapter *adapt,
-			 enum hal_odm_variable var, void *val1,
-			 bool set)
-{
-	if (adapt->HalFunc.GetHalODMVarHandler)
-		adapt->HalFunc.GetHalODMVarHandler(adapt, var,
-						      val1, set);
-}
-
 void rtw_hal_enable_interrupt(struct adapter *adapt)
 {
 	if (adapt->HalFunc.enable_interrupt)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 64a0223f0ee0..09f7bc010ba7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1728,10 +1728,6 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 	MSG_88E("RF_Type is %x!!\n", pHalData->rf_type);
 }
 
-static void rtl8188e_GetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
-{
-}
-
 static void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
 {
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(Adapter);
@@ -1823,7 +1819,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->sreset_linked_status_check  = &rtl8188e_sreset_linked_status_check;
 	pHalFunc->sreset_get_wifi_status  = &sreset_get_wifi_status;
 
-	pHalFunc->GetHalODMVarHandler = &rtl8188e_GetHalODMVar;
 	pHalFunc->SetHalODMVarHandler = &rtl8188e_SetHalODMVar;
 
 	pHalFunc->IOL_exec_cmds_sync = &rtl8188e_IOL_exec_cmds_sync;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 7046f4b222b6..d5cf9b0d9a77 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -174,9 +174,6 @@ struct hal_ops {
 				       enum hal_def_variable eVariable,
 				       void *pValue);
 
-	void	(*GetHalODMVarHandler)(struct adapter *padapter,
-				       enum hal_odm_variable eVariable,
-				       void *pValue1, bool bSet);
 	void	(*SetHalODMVarHandler)(struct adapter *padapter,
 				       enum hal_odm_variable eVariable,
 				       void *pValue1, bool bSet);
@@ -290,9 +287,6 @@ u8 rtw_hal_get_def_var(struct adapter *padapter,
 void rtw_hal_set_odm_var(struct adapter *padapter,
 			 enum hal_odm_variable eVariable, void *pValue1,
 			 bool bSet);
-void rtw_hal_get_odm_var(struct adapter *padapter,
-			 enum hal_odm_variable eVariable,
-			 void *pValue1, bool bSet);
 
 void rtw_hal_enable_interrupt(struct adapter *padapter);
 void rtw_hal_disable_interrupt(struct adapter *padapter);
-- 
2.33.0

