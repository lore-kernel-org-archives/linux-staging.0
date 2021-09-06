Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8C83FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:28 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id n27so14970983eja.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sXXSA0c+SHY34EOMuaUJW7qEAiEP8/m0m4ZBvHYTna8=;
        b=KtlQKT5ENVMTJjBzk/v7rDUKpMeXIXFKHa/NmbaNSJvvWX3Ien1SP25v5aSjnqmZlD
         KLJ12XKw1iHVBnEEBfkpSjAiPmItxPi5Cz2MQ8lNyvTScOlb0jCsmCunBTCRdj5qVh3G
         UNVDEU8E3V7Fj40FO3M59XnWkez7Pbq2TjOIkX8/2M0H1xBgkBbJ+U1HArfPM0gDQX30
         sCyf/8chxdRiVn7iK+JAOk20kfhfmM1Lffdoxq44hhXVu+C+sMtdrlOykuvDIFEAv0dp
         h9fIfJnYw8a1tcTjjgopbIaEMLDdZhC3l63fbjS1U9F8Pk6Yvgz6BDk/7Y+DoU9gsLPY
         0DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXXSA0c+SHY34EOMuaUJW7qEAiEP8/m0m4ZBvHYTna8=;
        b=tn0TusDY9MMcKVEi6sUSbHS9cKCVVAEpMRDNjJDPvGjU4mKxM57UoJvVk6OY4BsDVZ
         4QRpIz4/Ce1kLUaalu2pYWqH+F5vNj/rf6EooiiKQirHYIm564L8neY/aBdHdYBkuKk8
         NBOZzmXphI7JpNFscFfrXxt6y6dRtu2tlyVbhHSwAOOGvjy+bVmPSvGs79O4K1sNJxkY
         oHzZyHedKe0D9N7lB/vO2Y2+gQGeK4mnajn9/27hqzBeKPXgbZMMwPZ2T0vHcJ3ckgQY
         C0ayJVxsZqbR3881x8u1lD/azEV0qxGEgZrLxj3+lxDq062zMtWWMxpNBO3gE35xzXrZ
         QUSA==
X-Gm-Message-State: AOAM531dU1O0MSYrh0SllP914b1z2vXEqgllILbUVN2s8Sd+PAQNV+rX
	Ca7u4wjfQekIbnYKXGK8yAVEvvITQPQw/g==
X-Google-Smtp-Source: ABdhPJzF20Ajj3iUvL89Q7BjgmVslW2ihvucQgaumDb/1wV0wEROTxjITa0I2S5v4UgiXXlcU4rTrQ==
X-Received: by 2002:a17:906:7250:: with SMTP id n16mr14734942ejk.147.1630952727110;
        Mon, 06 Sep 2021 11:25:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.26
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
Subject: [PATCH 35/40] staging: r8188eu: remove empty function rtl8188e_stop_thread()
Date: Mon,  6 Sep 2021 20:24:33 +0200
Message-Id: <20210906182438.5417-36-straube.linux@gmail.com>
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

Remove empty function rtl8188e_stop_thread() and related code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 7 -------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h      | 3 ---
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 --
 5 files changed, 19 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 3ea581fb2c7e..4a9820c2b36e 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -151,13 +151,6 @@ void rtw_hal_update_ra_mask(struct adapter *adapt, u32 mac_id, u8 rssi_level)
 	}
 }
 
-/*	Start specifical interface thread		*/
-void rtw_hal_stop_thread(struct adapter *adapt)
-{
-	if (adapt->HalFunc.cancel_thread)
-		adapt->HalFunc.cancel_thread(adapt);
-}
-
 u32 rtw_hal_read_bbreg(struct adapter *adapt, u32 regaddr, u32 bitmask)
 {
 	u32 data = 0;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index fc420cbec5de..f87cfa0e404a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1748,10 +1748,6 @@ void rtl8188e_clone_haldata(struct adapter *dst_adapter, struct adapter *src_ada
 	memcpy(dst_adapter->HalData, src_adapter->HalData, dst_adapter->hal_data_sz);
 }
 
-void rtl8188e_stop_thread(struct adapter *padapter)
-{
-}
-
 static void hal_notch_filter_8188e(struct adapter *adapter, bool enable)
 {
 	if (enable) {
@@ -1766,8 +1762,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->cancel_thread = &rtl8188e_stop_thread;
-
 	pHalFunc->read_bbreg = &rtl8188e_PHY_QueryBBReg;
 	pHalFunc->write_bbreg = &rtl8188e_PHY_SetBBReg;
 	pHalFunc->read_rfreg = &rtl8188e_PHY_QueryRFReg;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index caee83ed962d..fdde4b2b8ec4 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -153,8 +153,6 @@ struct hal_ops {
 				       u32 mac_id, u8 rssi_level);
 	void	(*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
 
-	void	(*cancel_thread)(struct adapter *adapter);
-
 	s32	(*hal_xmit)(struct adapter *padapter,
 			    struct xmit_frame *pxmitframe);
 	s32 (*mgnt_xmit)(struct adapter *padapter,
@@ -236,7 +234,6 @@ void	rtw_hal_free_recv_priv(struct adapter *padapter);
 void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
 void	rtw_hal_clone_data(struct adapter *dst_adapt,
 			   struct adapter *src_adapt);
-void	rtw_hal_stop_thread(struct adapter *padapter);
 
 void rtw_hal_bcn_related_reg_setting(struct adapter *padapter);
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 5947708594d2..40bc00a9b23b 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -439,7 +439,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc);
 void rtl8188e_read_chip_version(struct adapter *padapter);
 
 void rtl8188e_clone_haldata(struct adapter *dst, struct adapter *src);
-void rtl8188e_stop_thread(struct adapter *padapter);
 
 void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter  *Adapter, int len);
 s32 rtl8188e_iol_efuse_patch(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index c18f6a7237c7..3b277774b39a 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -742,8 +742,6 @@ void rtw_stop_drv_threads(struct adapter *padapter)
 	up(&padapter->cmdpriv.cmd_queue_sema);
 	if (padapter->cmdThread)
 		_rtw_down_sema(&padapter->cmdpriv.terminate_cmdthread_sema);
-
-	rtw_hal_stop_thread(padapter);
 }
 
 static u8 rtw_init_default_value(struct adapter *padapter)
-- 
2.33.0

