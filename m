Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AE63FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 11:11:39 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z4so2071489wrr.6
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q0+qxLUcfLaE11CwoMFFPeo6YcQhBxtIGAw3YzJXtL4=;
        b=RkI47eejDMsjbFb/EEyPVwbfUQF1kV/rp8X2sgGt50iRsq3mPGLLImWtYzVJa6b1vM
         y7s2BmQkgjg0zTBSHsYUvRvs6rg0TeOl7Zu1XUx4DibgupiH6cKrM4TMZIalxnYlynNR
         FSo7q0i6kLnGIVlWomnobv+SDuClATsWp7duvstsqHk2U7928jZ3PYnh/1P35li3Oi2W
         vsm1XvZq8uYYtY+pzCsVTzXDRQCPgTkqaFvhTHguTRQS7PRg7amGTX2dyyPXZl0pv4Ek
         22icnwp2LAmflZzrpDIYqUY7GkIH5rjbVjaaGXS2mDBX81vYpk/5DGf6UKj1KpybRc6p
         lhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q0+qxLUcfLaE11CwoMFFPeo6YcQhBxtIGAw3YzJXtL4=;
        b=yq5R/UC4XlT9v0YgU8tqJbhALWgMt4hP2s3bBn8l4K+j6fjHTQMINqTFlPXnc18/Py
         y9BbnTkQ09VnvREgoDZw8MZa61tGNrdrAMquenqnLTPpWA1Lpp//GY2BHD9llTx5PZlD
         GSjMJydjQY8rxMlnm6TW83s6CVnCYfKL6ySDdmhsgHPO2HBS0ITW3Uxv2p618FYLZBfb
         dhlXMJYuRLcRWI7O0ggtRYMGwSYyE/Z5q6OVG9CIAvvSHMfoAM+K/lvFLw6mXggAnAIp
         2Wk5Lt9uw100aXwUZLVre3fo3oDglwoo1N+xjN9WZZ2V93GEx7gYhdQn+T4tJpz88Jjg
         8QMg==
X-Gm-Message-State: AOAM530WGGvhZ6lk1CthI7Cn174VNRFmWDTqUmNNSwGrLxQ/im+KU2S8
	n2NDg8gLUzVMstegKY3YI5M=
X-Google-Smtp-Source: ABdhPJw8Udupd0Yiyb2NZRHK5dtWTEQdck/ZHhXxrqF0pbHF74htExyLiIKmZPkAzPipdXZ6ABXEZQ==
X-Received: by 2002:adf:f1c7:: with SMTP id z7mr2451763wro.425.1631272297622;
        Fri, 10 Sep 2021 04:11:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id o7sm3848828wmc.46.2021.09.10.04.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 04:11:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/3] staging: r8188eu: remove IOL_exec_cmds_sync() from struct hal_ops
Date: Fri, 10 Sep 2021 13:11:08 +0200
Message-Id: <20210910111110.4628-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove IOL_exec_cmds_sync() from struct hal_ops and its wrapper
rtw_hal_iol_cmd(). Call rtl8188e_IOL_exec_cmds_sync() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/r8188eu/core/rtw_iol.c          |  2 +-
 drivers/staging/r8188eu/hal/hal_intf.c          | 10 ----------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c |  4 +---
 drivers/staging/r8188eu/include/hal_intf.h      | 10 +++-------
 4 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 5c1b19679cad..9c85e590fc9d 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -74,7 +74,7 @@ bool rtw_IOL_applied(struct adapter  *adapter)
 
 int rtw_IOL_exec_cmds_sync(struct adapter  *adapter, struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt)
 {
-	return rtw_hal_iol_cmd(adapter, xmit_frame, max_wating_ms, bndy_cnt);
+	return rtl8188e_IOL_exec_cmds_sync(adapter, xmit_frame, max_wating_ms, bndy_cnt);
 }
 
 int rtw_IOL_append_LLT_cmd(struct xmit_frame *xmit_frame, u8 page_boundary)
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 92c55b9ab244..849651bbab5e 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -177,13 +177,3 @@ void rtw_hal_write_rfreg(struct adapter *adapt, enum rf_radio_path rfpath,
 		adapt->HalFunc.write_rfreg(adapt, rfpath, regaddr,
 					      bitmask, data);
 }
-
-int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
-		    u32 max_wating_ms, u32 bndy_cnt)
-{
-	if (adapter->HalFunc.IOL_exec_cmds_sync)
-		return adapter->HalFunc.IOL_exec_cmds_sync(adapter, xmit_frame,
-							   max_wating_ms,
-							   bndy_cnt);
-	return _FAIL;
-}
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 8278493e3489..5ea96a5ac630 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -306,7 +306,7 @@ static s32 iol_ioconfig(struct adapter *padapter, u8 iocfg_bndy)
 	return rst;
 }
 
-static int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter, struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt)
+int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter, struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt)
 {
 	struct pkt_attrib *pattrib = &xmit_frame->attrib;
 	u8 i;
@@ -1754,8 +1754,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->write_bbreg = &rtl8188e_PHY_SetBBReg;
 	pHalFunc->read_rfreg = &rtl8188e_PHY_QueryRFReg;
 	pHalFunc->write_rfreg = &rtl8188e_PHY_SetRFReg;
-
-	pHalFunc->IOL_exec_cmds_sync = &rtl8188e_IOL_exec_cmds_sync;
 }
 
 u8 GetEEPROMSize8188E(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 727ef8511f64..c1e120593574 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -162,10 +162,6 @@ struct hal_ops {
 	void	(*write_rfreg)(struct adapter *padapter,
 			       enum rf_radio_path eRFPath, u32 RegAddr,
 			       u32 BitMask, u32 Data);
-
-	int (*IOL_exec_cmds_sync)(struct adapter *padapter,
-				  struct xmit_frame *frame, u32 max_wait,
-				  u32 bndy_cnt);
 };
 
 #define RF_CHANGE_BY_INIT	0
@@ -204,6 +200,9 @@ void hal_notch_filter_8188e(struct adapter *adapter, bool enable);
 void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt);
 void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level);
 
+int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter,
+				struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt);
+
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
@@ -240,9 +239,6 @@ void	rtw_hal_write_rfreg(struct adapter *padapter,
 			    enum rf_radio_path eRFPath, u32 RegAddr,
 			    u32 BitMask, u32 Data);
 
-int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
-		    u32 max_wating_ms, u32 bndy_cnt);
-
 void indicate_wx_scan_complete_event(struct adapter *padapter);
 u8 rtw_do_join(struct adapter *padapter);
 
-- 
2.33.0

