Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3CC72
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:27 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id lc21so14954023ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qKuqjYia3ho1J2eduvi6cGeST2WqpIrutveIryjYm4Y=;
        b=ZTIHPtmpbe6onFTXaFDDCaC2I1bMSTBzQFPLUmfhCc9631rAXzNeT6wMout19W7Ope
         p41h815q0Nq3R+CaqcskJbMH5Q9EYcz1Ygx7KOi5XIlPP066HdBpurIImNiq1rh9AcUa
         6c91neMDCB5EFWfIMin47OJ4Dl6EMwOlHy4V6AdcJSlA82TJ8ohBNmc6U6BIvigZHAxE
         d+MgqL++1bnml3cLvE2OXczOUyZTYgyvkEkwUKXvT92ebEJw1UOzwyu1Ox9ecInFE+93
         tRyu8LRrEu5fxXMeHN7AbwedL7Lq380zuHBjRXOkWX1b6r7SHQ5jWTKPQpy4zRnekCDW
         UIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qKuqjYia3ho1J2eduvi6cGeST2WqpIrutveIryjYm4Y=;
        b=oCthh+LbCT7peZJcY36zFV8li260D5te/tAqO+3xAV85Ueclal1ZpFExwdTjYXtNLi
         tNDuK3WEy5+Gg2o9Wgrj3xS684C1bm32vr+mYnCOiDR6g38c6v0Dzxxy0lZ7btfK0ptw
         V+rs9Xkf1Zbyag/3DzqLj5tMU1q9CxuxXexsABo5PyM/0CMxaf1xLohgmqCvzlOIB3bW
         WQdAlnUzsXfUYs/Q9XxzstzzgBd+RX4Y4YmCbu0QbO8CXxfymCLKVbiv6Vondpm6QG1H
         ryJ0+wJfGd086qX0RcBiQxavQbnXRbAjJUbG9yietjbHs9/DnnN9bC9nAy9lVpBZqjo4
         dY4w==
X-Gm-Message-State: AOAM532uPM7kExSs+/l9d0uQocURAv2NBtbU0MXtkQ+GsajK7duNqG6E
	qI0VOacXEhRhaJR+SMkwGO4=
X-Google-Smtp-Source: ABdhPJxbvJatdOrRJ5NCzjDdAQLwpvgVodigdLkcW7YKEubxF9M2R7c+GAP87f1BX7owsqgGxEL+mA==
X-Received: by 2002:a17:907:e8d:: with SMTP id ho13mr14964041ejc.299.1630952726427;
        Mon, 06 Sep 2021 11:25:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 34/40] staging: r8188eu: remove empty function rtl8188e_start_thread()
Date: Mon,  6 Sep 2021 20:24:32 +0200
Message-Id: <20210906182438.5417-35-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty function rtl8188e_start_thread() and related code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 7 -------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 -----
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 1 -
 5 files changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index e723742dab51..3ea581fb2c7e 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -151,13 +151,6 @@ void rtw_hal_update_ra_mask(struct adapter *adapt, u32 mac_id, u8 rssi_level)
 	}
 }
 
-/*	Start specifical interface thread		*/
-void rtw_hal_start_thread(struct adapter *adapt)
-{
-	if (adapt->HalFunc.run_thread)
-		adapt->HalFunc.run_thread(adapt);
-}
-
 /*	Start specifical interface thread		*/
 void rtw_hal_stop_thread(struct adapter *adapt)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 84449d8111c0..fc420cbec5de 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1748,10 +1748,6 @@ void rtl8188e_clone_haldata(struct adapter *dst_adapter, struct adapter *src_ada
 	memcpy(dst_adapter->HalData, src_adapter->HalData, dst_adapter->hal_data_sz);
 }
 
-void rtl8188e_start_thread(struct adapter *padapter)
-{
-}
-
 void rtl8188e_stop_thread(struct adapter *padapter)
 {
 }
@@ -1770,7 +1766,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->run_thread = &rtl8188e_start_thread;
 	pHalFunc->cancel_thread = &rtl8188e_stop_thread;
 
 	pHalFunc->read_bbreg = &rtl8188e_PHY_QueryBBReg;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 2c6a3d1f0077..caee83ed962d 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -153,7 +153,6 @@ struct hal_ops {
 				       u32 mac_id, u8 rssi_level);
 	void	(*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
 
-	void	(*run_thread)(struct adapter *adapter);
 	void	(*cancel_thread)(struct adapter *adapter);
 
 	s32	(*hal_xmit)(struct adapter *padapter,
@@ -237,7 +236,6 @@ void	rtw_hal_free_recv_priv(struct adapter *padapter);
 void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
 void	rtw_hal_clone_data(struct adapter *dst_adapt,
 			   struct adapter *src_adapt);
-void	rtw_hal_start_thread(struct adapter *padapter);
 void	rtw_hal_stop_thread(struct adapter *padapter);
 
 void rtw_hal_bcn_related_reg_setting(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index bb5620a9b17b..5947708594d2 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -439,7 +439,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc);
 void rtl8188e_read_chip_version(struct adapter *padapter);
 
 void rtl8188e_clone_haldata(struct adapter *dst, struct adapter *src);
-void rtl8188e_start_thread(struct adapter *padapter);
 void rtl8188e_stop_thread(struct adapter *padapter);
 
 void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter  *Adapter, int len);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 28f6028d7335..c18f6a7237c7 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -733,7 +733,6 @@ u32 rtw_start_drv_threads(struct adapter *padapter)
 	else
 		_rtw_down_sema(&padapter->cmdpriv.terminate_cmdthread_sema); /* wait for cmd_thread to run */
 
-	rtw_hal_start_thread(padapter);
 	return _status;
 }
 
-- 
2.33.0

