Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B0299A81
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 22:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554087; cv=none; b=XpAcWJNeiP3HVdSUFGOIeCU88008DS0lNELoZjeABxWGi+ohKLW5DAPCwVAwXcZWKjsChmK54Tj+OC7BK4HL0oT17b2v58RNyEDSPIeiXDEZ2P9GSj0OnFxGey6bbQxzZMgZimLFpXMB/s+ZFTw82jimGUiKxHG+fXzvYpHuiiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554087; c=relaxed/simple;
	bh=EDN0QGTFDvm8ggC9Q6gvIRT036y5U8fQ0O9YIfrFmi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TkHojy0YQEvh5oxouD00IxfVN+RdZClV6UA47Ca4RtTvPO30M5yxz+h86s8nwKrGddL5jlDGxlxlJzXpdnwkPJTowgc+427/xGqJq36JcgYMXVt48kZs/6Kyu8aogM/v25dU/SxIYOL45S7BVXclpeAHlw/b1cWdYjcDTaPGsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/p/zmNl; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/p/zmNl"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64931bbf70cso5339649d50.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769554084; x=1770158884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCQDQqxS7QhTVFDcAi3eDL0L7CLRtmR3GtbKlv50k3U=;
        b=N/p/zmNlo0sCDrXZrzWEtVVYZDK+jdSoAhAU84ayG2lE+bLVZf/KcrdjOnCIZXc19u
         xc8c/HwwK18U3+aCya4m6XZbL6Rj8v8YWYCZG2lsyJ46/kDohbLeMuJxouOYcI9aCtSK
         lsS0bfMnwEuJOz3hOf+mXDuAKzq6D313JWtvlgiPpjtmmP8GKDxtH/lkYnavbb4a8cF/
         VmDrZXbaXopeTHv3d5QAJU2LOfNQIvxbT2KSsykfOpRhY36sb3dV6Qfc5xkYPR+czYae
         IGbplo8OYGFQdcfEhM+MaMsv/V1MX6Ijr0N1fVVFMkp18ZBFT/wy6mb4q9qX8zwuRNrH
         BOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769554084; x=1770158884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HCQDQqxS7QhTVFDcAi3eDL0L7CLRtmR3GtbKlv50k3U=;
        b=QzasPWNd+M8BZL1D6HNS1NJMsBVGwkSv9TMeKzE3bu+mnv/0EUo1ikFBveJ3yB+Xf0
         DE37uxFbxarMel9HOTEkHaWBsvujToyxdt68La6y/v01z7Ob00JjbdhZHdd5P/pm8ipZ
         hPDLPsdgIlq4BeNPrMJCmJqpaY8x2GU8ZqKstw+bKq/sx4mWzEW0fcW751ida+cCh/Vx
         SNmkQoKWCywQyGLybKTvjuUbTzVivzb2/OVvrdNCH5690iVKgi+1v1JzmCo1/cTl+fdO
         SbZaII6A31R6FQGHFMD9uMcxPyPzSZebyz7rGwylNKPJDml07MvOS/HWL7yhzoDM7OTh
         se8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX33ng2aRpI50ONUfQmoYNyyn4izBfgX8gDIrbUbB3BzfHyhzkdi2uT8p5TITsIJRYYR8gDN50QLxKbvqAV@lists.linux.dev
X-Gm-Message-State: AOJu0YyI0usZaMYiMuL01ME7JUIUcHqAXZ37p0ZFND+m89B0itjAM9Di
	jxyr6ucKlZXgoEuGhtgCW9dnelL3SzdJdFZ5Bn9s7IsQj58neRxU/xaS/6pzUQ==
X-Gm-Gg: AZuq6aKgtyeTh3DVhN8cuMi81l981N4A2vOQ7gxsBblVDecNvhqFlxYhC6DlsmhQqH8
	oST5jjNveEOqYbCLA4ACWZdp+isCH+OlbEhxn4DrV3pGfP0Gg9eIIMFSOftTa2mJRWxNDV0olLI
	aY9+2ee4JlLFLlmDarfRGp4d3HIssn1/bw6DBx7s2jJxZSGZNrBgBOvtdrqEz5+jCRYhIt7ROYG
	zDAxvIM7Wa3J+rjQ5NIIFhHgSqETJONGdl/7zu7DUdO7OqbIqLWABXgCRaVKjWWB5ugntbRY2fe
	I+GsFlTlBLYJ5AMcwl/jwDGkP7AOIcSfepBH7hYM+cxKyw3uEA+wEiQnrMpYOaKxqwsXbghDdIh
	1pURvH8+f1jKyl2rXpchlUMHaTWZel/tutrMw/2LOlDNFU4mmnp+fdlz/GoD3kptamuSthHp649
	oraQ==
X-Received: by 2002:a05:690c:fd1:b0:794:7324:dd9 with SMTP id 00721157ae682-7947ab3b960mr61767387b3.19.1769554084150;
        Tue, 27 Jan 2026 14:48:04 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960788bbsm55250d50.9.2026.01.27.14.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 14:48:03 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v1 3/3] staging: rtl8723bs: remove unused struct debug_priv and all counters
Date: Tue, 27 Jan 2026 16:47:38 -0600
Message-ID: <20260127224747.40305-4-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127224747.40305-1-ethantidmore06@gmail.com>
References: <20260127224747.40305-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct debug_priv is a collection of diagnostic counters that are
updated throughout the driver's hot paths (RX/TX, MLME, Power Control,
and SDIO) but are never read, exposed via debugfs, or used for logic.

This cleanup removes:
- The entire struct debug_priv definition and its instance in dvobj_priv.
- All write-only counter increments across the core, hal, and os_dep.
- Unused local pointers (psdpriv, pdbgpriv) that were only serving
  the dead diagnostic logic.
- Redundant logic blocks that only existed to update these counters.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  3 --
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  6 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 13 +----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  8 +---
 drivers/staging/rtl8723bs/include/drv_types.h | 41 ----------------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 14 ++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 48 +++++--------------
 8 files changed, 17 insertions(+), 120 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index fa1e3ad59254..f4b50bfdb9d5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -438,8 +438,6 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (GetFrameType(pframe) != WIFI_MGT_TYPE)
 		return;
@@ -463,7 +461,6 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 		if (GetRetry(pframe)) {
 			if (precv_frame->u.hdr.attrib.seq_num == psta->RxMgmtFrameSeqNum) {
 				/* drop the duplicate management frame */
-				pdbgpriv->dbg_rx_dup_mgt_frame_drop_count++;
 				return;
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 0ef788abf403..f06d8bc6dac5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -139,8 +139,6 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 void rtw_ps_processor(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	u32 ps_deny = 0;
 
 	mutex_lock(&adapter_to_pwrctl(padapter)->lock);
@@ -149,10 +147,8 @@ void rtw_ps_processor(struct adapter *padapter)
 	if (ps_deny != 0)
 		goto exit;
 
-	if (pwrpriv->bInSuspend) {/* system suspend or autosuspend */
-		pdbgpriv->dbg_ps_insuspend_cnt++;
+	if (pwrpriv->bInSuspend)
 		return;
-	}
 
 	pwrpriv->ps_processing = true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index cc824427f9a8..409dab008a1d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1782,9 +1782,6 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 
 static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_num)
 {
-	struct adapter *padapter = preorder_ctrl->padapter;
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	u8 wsize = preorder_ctrl->wsize_b;
 	u16 wend = (preorder_ctrl->indicate_seq + wsize - 1) % 4096u;
 
@@ -1810,7 +1807,6 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 			preorder_ctrl->indicate_seq = seq_num + 1 - wsize;
 		else
 			preorder_ctrl->indicate_seq = 0xFFF - (wsize - (seq_num + 1)) + 1;
-		pdbgpriv->dbg_rx_ampdu_window_shift_cnt++;
 	}
 
 	return true;
@@ -1907,8 +1903,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 	int bPktInBuf = false;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
@@ -1918,7 +1912,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 	/*  Handling some condition for forced indicate case. */
 	if (bforced == true) {
-		pdbgpriv->dbg_rx_ampdu_forced_indicate_count++;
 		if (list_empty(phead)) {
 			/*  spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			/* spin_unlock(&ppending_recvframe_queue->lock); */
@@ -1988,8 +1981,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 	struct recv_reorder_ctrl *preorder_ctrl = prframe->u.hdr.preorder_ctrl;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (!pattrib->amsdu) {
 		/* s1. */
@@ -2032,10 +2023,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	spin_lock_bh(&ppending_recvframe_queue->lock);
 
 	/* s2. check if winstart_b(indicate_seq) needs to been updated */
-	if (!check_indicate_seq(preorder_ctrl, pattrib->seq_num)) {
-		pdbgpriv->dbg_rx_ampdu_drop_count++;
+	if (!check_indicate_seq(preorder_ctrl, pattrib->seq_num))
 		goto _err_exit;
-	}
 
 
 	/* s3. Insert all packet into Reorder Queue to maintain its ordering. */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 054e2c2eab02..0527f36c6bfa 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -304,8 +304,6 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	const struct firmware *fw;
 	struct device *device = dvobj_to_dev(padapter->dvobj);
 	u8 *fwfilepath;
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	u8 tmp_ps;
 
 	pFirmware = kzalloc(sizeof(struct rt_firmware), GFP_KERNEL);
@@ -324,8 +322,6 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	/* 2. read power_state = 0xA0[1:0] */
 	tmp_ps = rtw_read8(padapter, 0xa0);
 	tmp_ps &= 0x03;
-	if (tmp_ps != 0x01)
-		pdbgpriv->dbg_downloadfw_pwr_state_cnt++;
 
 	fwfilepath = "rtlwifi/rtl8723bs_nic.bin";
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 4e81ef53dc47..a3940b61e177 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -886,9 +886,6 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 
 u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 {
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
-
 	if (padapter->hw_init_completed) {
 		if (adapter_to_pwrctl(padapter)->bips_processing) {
 			if (padapter->netif_up) {
@@ -921,18 +918,15 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				adapter_to_pwrctl(padapter)->pre_ips_type = 0;
 
 			} else {
-				pdbgpriv->dbg_carddisable_cnt++;
 				CardDisableRTL8723BSdio(padapter);
 
 				adapter_to_pwrctl(padapter)->pre_ips_type = 1;
 			}
 
 		} else {
-			pdbgpriv->dbg_carddisable_cnt++;
 			CardDisableRTL8723BSdio(padapter);
 		}
-	} else
-		pdbgpriv->dbg_deinit_fail_cnt++;
+	}
 
 	return _SUCCESS;
 }
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index f86180dc350c..d07f04d51e55 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -177,45 +177,6 @@ struct registry_priv {
 #define GET_IFACE_NUMS(padapter) (((struct adapter *)padapter)->dvobj->iface_nums)
 #define GET_ADAPTER(padapter, iface_id) (((struct adapter *)padapter)->dvobj->padapters[iface_id])
 
-struct debug_priv {
-	u32 dbg_sdio_free_irq_error_cnt;
-	u32 dbg_sdio_alloc_irq_error_cnt;
-	u32 dbg_sdio_free_irq_cnt;
-	u32 dbg_sdio_alloc_irq_cnt;
-	u32 dbg_sdio_deinit_error_cnt;
-	u32 dbg_sdio_init_error_cnt;
-	u32 dbg_suspend_error_cnt;
-	u32 dbg_suspend_cnt;
-	u32 dbg_resume_cnt;
-	u32 dbg_resume_error_cnt;
-	u32 dbg_deinit_fail_cnt;
-	u32 dbg_carddisable_cnt;
-	u32 dbg_carddisable_error_cnt;
-	u32 dbg_ps_insuspend_cnt;
-	u32 dbg_dev_unload_inIPS_cnt;
-	u32 dbg_wow_leave_ps_fail_cnt;
-	u32 dbg_scan_pwr_state_cnt;
-	u32 dbg_downloadfw_pwr_state_cnt;
-	u32 dbg_fw_read_ps_state_fail_cnt;
-	u32 dbg_leave_ips_fail_cnt;
-	u32 dbg_leave_lps_fail_cnt;
-	u32 dbg_h2c_leave32k_fail_cnt;
-	u32 dbg_diswow_dload_fw_fail_cnt;
-	u32 dbg_enwow_dload_fw_fail_cnt;
-	u32 dbg_ips_drvopen_fail_cnt;
-	u32 dbg_poll_fail_cnt;
-	u32 dbg_rpwm_toggle_cnt;
-	u32 dbg_rpwm_timeout_fail_cnt;
-	u64 dbg_rx_fifo_last_overflow;
-	u64 dbg_rx_fifo_curr_overflow;
-	u64 dbg_rx_fifo_diff_overflow;
-	u64 dbg_rx_ampdu_drop_count;
-	u64 dbg_rx_ampdu_forced_indicate_count;
-	u64 dbg_rx_ampdu_loss_count;
-	u64 dbg_rx_dup_mgt_frame_drop_count;
-	u64 dbg_rx_ampdu_window_shift_cnt;
-};
-
 struct rtw_traffic_statistics {
 	/*  tx statistics */
 	u64	tx_bytes;
@@ -251,8 +212,6 @@ struct dvobj_priv {
 
 	s32	processing_dev_remove;
 
-	struct debug_priv drv_dbg;
-
 	/* for local/global synchronization */
 	/*  */
 	spinlock_t	lock;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index bc02db13781c..fd47f324a8bc 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -964,8 +964,6 @@ void rtw_ndev_destructor(struct net_device *ndev)
 void rtw_dev_unload(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
-	struct dvobj_priv *pobjpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &pobjpriv->drv_dbg;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 cnt = 0;
 
@@ -994,7 +992,6 @@ void rtw_dev_unload(struct adapter *padapter)
 			/* check HW status and SW state */
 			netdev_dbg(padapter->pnetdev,
 				   "%s: driver in IPS-FWLPS\n", __func__);
-			pdbgpriv->dbg_dev_unload_inIPS_cnt++;
 			LeaveAllPowerSaveMode(padapter);
 		} else {
 			netdev_dbg(padapter->pnetdev,
@@ -1077,24 +1074,21 @@ static void rtw_suspend_normal(struct adapter *padapter)
 void rtw_suspend_common(struct adapter *padapter)
 {
 	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(psdpriv);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	unsigned long start_time = jiffies;
 
 	netdev_dbg(padapter->pnetdev, " suspend start\n");
-	pdbgpriv->dbg_suspend_cnt++;
 
 	pwrpriv->bInSuspend = true;
 
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved)) {
-		pdbgpriv->dbg_suspend_error_cnt++;
+	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
 		return;
-	}
+
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
 
 	rtw_cancel_all_timer(padapter);
@@ -1123,7 +1117,6 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv;
 	struct mlme_priv *pmlmepriv;
 	struct dvobj_priv *psdpriv;
-	struct debug_priv *pdbgpriv;
 
 	int ret = _SUCCESS;
 
@@ -1136,7 +1129,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	pwrpriv = adapter_to_pwrctl(padapter);
 	pmlmepriv = &padapter->mlmepriv;
 	psdpriv = padapter->dvobj;
-	pdbgpriv = &psdpriv->drv_dbg;
+
 	/*  interface init */
 	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
 	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
@@ -1155,7 +1148,6 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 
 	if (pm_netdev_open(pnetdev, true) != 0) {
 		ret = -1;
-		pdbgpriv->dbg_resume_error_cnt++;
 		goto exit;
 	}
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index dc787954126f..a86252ccac76 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -70,13 +70,10 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 	sdio_claim_host(func);
 
 	err = sdio_claim_irq(func, &sd_sync_int_hdl);
-	if (err) {
-		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
+	if (err)
 		netdev_crit(dvobj->if1->pnetdev, "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
-	} else {
-		dvobj->drv_dbg.dbg_sdio_alloc_irq_cnt++;
+	else
 		dvobj->irq_alloc = 1;
-	}
 
 	sdio_release_host(func);
 
@@ -97,12 +94,10 @@ static void sdio_free_irq(struct dvobj_priv *dvobj)
 			sdio_claim_host(func);
 			err = sdio_release_irq(func);
 			if (err) {
-				dvobj->drv_dbg.dbg_sdio_free_irq_error_cnt++;
 				netdev_err(dvobj->if1->pnetdev,
 					   "%s: sdio_release_irq FAIL(%d)!\n",
 					   __func__, err);
-			} else
-				dvobj->drv_dbg.dbg_sdio_free_irq_cnt++;
+			}
 			sdio_release_host(func);
 		}
 		dvobj->irq_alloc = 0;
@@ -122,16 +117,13 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 	sdio_claim_host(func);
 
 	err = sdio_enable_func(func);
-	if (err) {
-		dvobj->drv_dbg.dbg_sdio_init_error_cnt++;
+	if (err)
 		goto release;
-	}
 
 	err = sdio_set_block_size(func, 512);
-	if (err) {
-		dvobj->drv_dbg.dbg_sdio_init_error_cnt++;
+	if (err)
 		goto release;
-	}
+
 	psdio_data->block_transfer_len = 512;
 	psdio_data->tx_block_mode = 1;
 	psdio_data->rx_block_mode = 1;
@@ -147,23 +139,15 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 static void sdio_deinit(struct dvobj_priv *dvobj)
 {
 	struct sdio_func *func;
-	int err;
 
 	func = dvobj->intf_data.func;
 
 	if (func) {
 		sdio_claim_host(func);
-		err = sdio_disable_func(func);
-		if (err)
-			dvobj->drv_dbg.dbg_sdio_deinit_error_cnt++;
+		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
-			err = sdio_release_irq(func);
-			if (err)
-				dvobj->drv_dbg.dbg_sdio_free_irq_error_cnt++;
-			else
-				dvobj->drv_dbg.dbg_sdio_free_irq_cnt++;
-		}
+		if (dvobj->irq_alloc)
+			sdio_release_irq(func);
 
 		sdio_release_host(func);
 	}
@@ -434,15 +418,12 @@ static int rtw_sdio_suspend(struct device *dev)
 	struct dvobj_priv *psdpriv = sdio_get_drvdata(func);
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(psdpriv);
 	struct adapter *padapter = psdpriv->if1;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (padapter->bDriverStopped)
 		return 0;
 
-	if (pwrpriv->bInSuspend) {
-		pdbgpriv->dbg_suspend_error_cnt++;
+	if (pwrpriv->bInSuspend)
 		return 0;
-	}
 
 	rtw_suspend_common(padapter);
 
@@ -452,13 +433,9 @@ static int rtw_sdio_suspend(struct device *dev)
 static int rtw_resume_process(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
-	if (!pwrpriv->bInSuspend) {
-		pdbgpriv->dbg_resume_error_cnt++;
+	if (!pwrpriv->bInSuspend)
 		return -1;
-	}
 
 	return rtw_resume_common(padapter);
 }
@@ -470,9 +447,6 @@ static int rtw_sdio_resume(struct device *dev)
 	struct adapter *padapter = psdpriv->if1;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	int ret = 0;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
-
-	pdbgpriv->dbg_resume_cnt++;
 
 	ret = rtw_resume_process(padapter);
 
-- 
2.52.0

