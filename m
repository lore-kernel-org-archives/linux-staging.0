Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559D35E53B
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 21:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769894507; cv=none; b=VcS9KZtAjRmiH/OotEXJCG21OfMxDxvZw3L7JtUUMDYW8FU2OpkT5hz9ZzhqVtE6SGi+i6Tg02okhGIQ3laY7MP9IBiADc6Nzya8kYlfqozlFURjyZi94p1zVHNw4zVzk/SGAzO4pnqbDVpj1Xqu/oX7r410Y+2WJAnxl8pytD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769894507; c=relaxed/simple;
	bh=pvb/vEKNZHwLsonDnQxu/QBGAhZy1UOKq8A23DcP+4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQ1w8MTuOP/V3dB/MxGlkZ3MNpI00zhOlk4dfSG67jLEd9D0ojWQNVKO/zQ/3Fw7od2MEf0l8J3gkuuiyox77nZgbvl8+TlD394aF9Ib4ngGdJxqiuOjRqG5L5IGlT926dc/Qc6iwfRlxsok1++bXEIh9MTXQxbrnNYD1+hpOl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wyb0+aA6; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wyb0+aA6"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7927261a3acso34059227b3.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 13:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769894505; x=1770499305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLQwYwu3MFpW5UJeozxt/DZHQwWx7s2HbEbxCwXfxRU=;
        b=Wyb0+aA6+Hbos8Yc/Tmr5aDhy0z8JqlOXkwl3lCuOJteLVCkyrp9HEwDoOGGeKfppU
         3eEW/a3OeKwWSQ2fG9PzaPtZZ4OF2eCuNaIDGNvOgn3Rv/CUNt8EA1ucs7S4LWKcRjJ9
         cC4cKYmJeeJuus4iUUaH4e9LGox2jEobovcnhM6vmx9rhfOZslX/kbcs4KOrHE+X1y2z
         UkXKbUWJYTzQZa+YOBFYTAwPGGWTYEkyMoJQdZJCtTmxNkrfl/B4taGNbNH9oZVy1x8C
         gFbMa8PW+Oc3QYqeFxggR6S8kbWh3YhJ4tC7pvMJTUqFxFKs9MtHJB8+Oi+zqS7oP12s
         CouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769894505; x=1770499305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLQwYwu3MFpW5UJeozxt/DZHQwWx7s2HbEbxCwXfxRU=;
        b=CT0AX6Oe8vbM4UwMBaXcuulQZBPWQlOjkMHFzkVz5Xg2xAF2SsPAFEQjVGmWIYB4N1
         cXavmZATMnVMw+sBBOVmGS1h/83FVQnnlDLvo0AlrQWvfVEU8594CZASJ6aB2C6RTJZ6
         2fq1MYm/MRxa+Z5hxVku9BYTQd1YhhilSB/VJLUikiE7nfzuEcOTpBuDSQymezeQdZDj
         vcoQaox6fAME4Sfx3im99KTlp/l9TGiZP+M+KQueOB7ucrdZp8oqyvlk1AA364YXnr0F
         VWRd4aOhWueJjlzEtkz7m62m99II0zJKP7preybdza/SVA6Mk6FAChnXcWDoli3c9Uxh
         k22w==
X-Forwarded-Encrypted: i=1; AJvYcCXcgHRSyBnS1tebboHOcgeyxVDJvhyx9wbHYjlWcUyM+ID8WfluNEJuUe5F1JTGUPpUUVJGk5vsWAbFvLcD@lists.linux.dev
X-Gm-Message-State: AOJu0YwU9wtvkLAh8/CdOSei9EDdd1LCgH6ro98fNo24uMuJaaurwgtT
	EfH6k12QOL7xpG9e+oHa/ZZm5jSYTX1xQ8nBct1WhuoOECobewtcaEp5
X-Gm-Gg: AZuq6aJM/dbLida3Nxxl5thqK9Dn4p81xnY+wiDYpC94sRU0j4N9X0Y51tvfmiBix+R
	Vbywcw+D4F61gWmBL60I5vdzM1LlhP50HbWHHS0mB06Ao2HsUeSYtgVRIBIMLXntTsLr8zm+x8A
	+E2rTwQFpvtFg1qCzLwfwOEsOSsxJIFeE0PAQz38TeWjeVkMVAOoO9+0x06u/piGsrNSYxqaPNJ
	NWQPbwL54KsQXHRfqgVFOp1rxw/rlNnCuvaXNHznB6qrk9oQtMPLH3wa2j1IZO35t1jKJCx6DRU
	HqkvFnkJlXW4iDR3NeA5UYFCwB8sk5ZGkydVEMqk7MZfy7SnAv+mELVmjUvsn7GeH0bI+LCaakR
	C1s3/SwafmVFlOzXQnfz/GCDToAx7VqVgBWsl8lcjS6J88erxMt4W/oSHpVdZPeKexBGqMJDYAI
	YDm2Kx7fG2vc1YkPjx+vS4Olc=
X-Received: by 2002:a05:690c:fc7:b0:794:2b96:5f96 with SMTP id 00721157ae682-7949de9d93fmr57552727b3.17.1769894504578;
        Sat, 31 Jan 2026 13:21:44 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794828a541bsm49411307b3.28.2026.01.31.13.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:21:44 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: remove unused private debug counters
Date: Sat, 31 Jan 2026 15:21:28 -0600
Message-ID: <20260131212128.25548-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver maintains a private `struct debug_priv` embedded within
`struct dvobj_priv` to track various error counters (e.g., suspend
errors, alloc failures, RX drops).

These counters are incremented in various files but the data is
never read or exposed to userspace.

Remove the unused `debug_priv` structure definition, the instance
in `dvobj_priv`, and all associated increment operations across
the driver to clean up the code.

This also removes the following helper functions which were used
solely to update these counters:
 - rtw_reset_rx_info()
 - recv_indicatepkts_pkt_loss_cnt()

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v5:
- Restore rtw_hal_check_rxfifo_full() function had necessary IO calls.
v4:
- Fixed position of change log.
v3:
- Squashed previous series into a single atomic patch to remove
  definitions and usages simultaneously (Feedback from Dan Carpenter).
- Removed stray blank line in rtw_mlme.c (Feedback from Dan Carpenter).
- Removed unused variable 'fw_current_in_ps_mode' in rtl8723b_dm.c
  to fix -Wunused-but-set-variable warning (Fixes kbuild bot failure).

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 13 ------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  3 --
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  6 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 24 +---------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 13 ------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  8 +---
 drivers/staging/rtl8723bs/include/drv_types.h | 41 -----------------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 15 +------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 45 +++++--------------
 10 files changed, 15 insertions(+), 157 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f81a29cd6a78..2364709595b1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -819,15 +819,6 @@ static void free_scanqueue(struct	mlme_priv *pmlmepriv)
 	spin_unlock_bh(&scan_queue->lock);
 }
 
-static void rtw_reset_rx_info(struct debug_priv *pdbgpriv)
-{
-	pdbgpriv->dbg_rx_ampdu_drop_count = 0;
-	pdbgpriv->dbg_rx_ampdu_forced_indicate_count = 0;
-	pdbgpriv->dbg_rx_ampdu_loss_count = 0;
-	pdbgpriv->dbg_rx_dup_mgt_frame_drop_count = 0;
-	pdbgpriv->dbg_rx_ampdu_window_shift_cnt = 0;
-}
-
 static void find_network(struct adapter *adapter)
 {
 	struct wlan_network *pwlan = NULL;
@@ -848,8 +839,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
-	struct dvobj_priv *psdpriv = adapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
@@ -873,8 +862,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 
 	if (lock_scanned_queue)
 		adapter->securitypriv.key_mask = 0;
-
-	rtw_reset_rx_info(pdbgpriv);
 }
 
 /* rtw_indicate_connect: the caller has to lock pmlmepriv->lock */
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
index 0ef788abf403..1c9e02732687 100644
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
+	if (pwrpriv->bInSuspend) /* system suspend or autosuspend */
 		return;
-	}
 
 	pwrpriv->ps_processing = true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 24cc4a9e0445..16645d0cd67b 100644
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
@@ -1861,15 +1857,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 
 }
 
-static void recv_indicatepkts_pkt_loss_cnt(struct debug_priv *pdbgpriv, u64 prev_seq, u64 current_seq)
-{
-	if (current_seq < prev_seq)
-		pdbgpriv->dbg_rx_ampdu_loss_count += (4096 + current_seq - prev_seq);
-	else
-		pdbgpriv->dbg_rx_ampdu_loss_count += (current_seq - prev_seq);
-
-}
-
 static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	struct recv_priv *precvpriv;
@@ -1916,8 +1903,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 	int bPktInBuf = false;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
@@ -1927,7 +1912,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 	/*  Handling some condition for forced indicate case. */
 	if (bforced == true) {
-		pdbgpriv->dbg_rx_ampdu_forced_indicate_count++;
 		if (list_empty(phead)) {
 			/*  spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			/* spin_unlock(&ppending_recvframe_queue->lock); */
@@ -1937,7 +1921,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 		prframe = (union recv_frame *)plist;
 		pattrib = &prframe->u.hdr.attrib;
 
-		recv_indicatepkts_pkt_loss_cnt(pdbgpriv, preorder_ctrl->indicate_seq, pattrib->seq_num);
 		preorder_ctrl->indicate_seq = pattrib->seq_num;
 
 	}
@@ -1998,8 +1981,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 	struct recv_reorder_ctrl *preorder_ctrl = prframe->u.hdr.preorder_ctrl;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
-	struct dvobj_priv *psdpriv = padapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (!pattrib->amsdu) {
 		/* s1. */
@@ -2042,11 +2023,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	spin_lock_bh(&ppending_recvframe_queue->lock);
 
 	/* s2. check if winstart_b(indicate_seq) needs to been updated */
-	if (!check_indicate_seq(preorder_ctrl, pattrib->seq_num)) {
-		pdbgpriv->dbg_rx_ampdu_drop_count++;
+	if (!check_indicate_seq(preorder_ctrl, pattrib->seq_num))
 		goto _err_exit;
-	}
-
 
 	/* s3. Insert all packet into Reorder Queue to maintain its ordering. */
 	if (!enqueue_reorder_recvframe(preorder_ctrl, prframe)) {
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 70b5b289f9cb..31b3e880ae6a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -782,21 +782,8 @@ bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 
 void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 {
-	struct dvobj_priv *psdpriv = adapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
-	int save_cnt = false;
-
 	/* switch counter to RX fifo */
 	rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xf0);
-	save_cnt = true;
-	/* todo: other chips */
-
-	if (save_cnt) {
-		/* rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xa0); */
-		pdbgpriv->dbg_rx_fifo_last_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow;
-		pdbgpriv->dbg_rx_fifo_curr_overflow = rtw_read16(adapter, REG_RXERR_RPT);
-		pdbgpriv->dbg_rx_fifo_diff_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow-pdbgpriv->dbg_rx_fifo_last_overflow;
-	}
 }
 
 static u32 Array_kfreemap[] = {
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
index bc02db13781c..dd70309016e7 100644
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
@@ -1122,8 +1116,6 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	struct net_device *pnetdev;
 	struct pwrctrl_priv *pwrpriv;
 	struct mlme_priv *pmlmepriv;
-	struct dvobj_priv *psdpriv;
-	struct debug_priv *pdbgpriv;
 
 	int ret = _SUCCESS;
 
@@ -1135,8 +1127,6 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	pnetdev = padapter->pnetdev;
 	pwrpriv = adapter_to_pwrctl(padapter);
 	pmlmepriv = &padapter->mlmepriv;
-	psdpriv = padapter->dvobj;
-	pdbgpriv = &psdpriv->drv_dbg;
 	/*  interface init */
 	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
 	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
@@ -1155,7 +1145,6 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 
 	if (pm_netdev_open(pnetdev, true) != 0) {
 		ret = -1;
-		pdbgpriv->dbg_resume_error_cnt++;
 		goto exit;
 	}
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index dc787954126f..d664e254912c 100644
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
@@ -147,22 +139,15 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
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
 
 		if (dvobj->irq_alloc) {
-			err = sdio_release_irq(func);
-			if (err)
-				dvobj->drv_dbg.dbg_sdio_free_irq_error_cnt++;
-			else
-				dvobj->drv_dbg.dbg_sdio_free_irq_cnt++;
+			sdio_release_irq(func);
 		}
 
 		sdio_release_host(func);
@@ -434,15 +419,12 @@ static int rtw_sdio_suspend(struct device *dev)
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
 
@@ -452,13 +434,9 @@ static int rtw_sdio_suspend(struct device *dev)
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
@@ -470,9 +448,6 @@ static int rtw_sdio_resume(struct device *dev)
 	struct adapter *padapter = psdpriv->if1;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	int ret = 0;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
-
-	pdbgpriv->dbg_resume_cnt++;
 
 	ret = rtw_resume_process(padapter);
 
-- 
2.52.0

