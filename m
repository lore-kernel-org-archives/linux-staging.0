Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9C24534A2
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135913; cv=none; b=Kaza9kClVBz8LQBParmeFP+I6PlLzhcrJ3VoTrtB8UCAdbxmupZopdNtsndWxvN8S3zpHJSOEgJSkGf7pJ9/0EIHv27GcNAxmVkQ+l5HmnxOIbCN9ut/3aiJjhjsQ4XrupTvMaQggQj4hLZ1ee+izoa0ae+GYecoesKU3ojnBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135913; c=relaxed/simple;
	bh=a5LGWfaX1N0guUoaJRhtWYdY2vCT0GTTmTkQ7q1QLHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRZsIMExVBeu+uf+I6L7SXDFDgWH9m20aVl3szVwD5jw8U9+OcTl+O3z8GRp9jAxmcLtfm24zEwSgJIw8d4AmOlICSjYeEylPjlaiq9X80n+ZG/pUmJkGPlV3nx7bBMv3kZVInEIWxJei0XUltFbcw2IpL2VCd2iDvNYnW365gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOfb93lL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOfb93lL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47d6c634f45so3266406f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784135904; x=1784740704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PDEskE9NRkaddeQHaILyav9mwa2nv/KH7G4Zr0ctzk=;
        b=nOfb93lLR4AB6ivvWGIUbcGC6UA4PIv7ZXdnUuGyR8M1VLsxxrQsj1OrmrpOjMFy3P
         MkQbW/lZ5EdP9UVN9WXhdq2NPSiSapvTpaBAUrnuThdiVAxjAVpuCHkF90xivBFPG937
         xvLefhxfMGjYYi7BJKzJMcNIHCHpMHlMdWUZv55rTHVm6cazuV4gTW/vTBbnOpc2KbxW
         Mp/awpADS+ENR7nJRCdVuOKTCn+U02aB2xlPFwRFOetBRBD9kdwPfja0Gtk3TZDbu2yY
         eAGXzDhwzCSPteCfIzXdsnBb9S1/L4JoMIXU1rj2nDOOXnTe3XL81Fo75fq+paYVezbB
         bYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784135904; x=1784740704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PDEskE9NRkaddeQHaILyav9mwa2nv/KH7G4Zr0ctzk=;
        b=glWMYSdF1eDif4BhgNfAcQ+xgMWxEji6sQUaZW/UCHr30etJCI7MstqXJSc1QdZr44
         3w7RFVfGPYIS9IXGa6aGrPsnt4eJDXRPm2yOWEdQv/t//2GkQSh0dCyVkT+Ho5BB4V6Z
         Cxv8mi8Rt2sboPQ4FDNLpe6hGz+HBvhPeLeGmn1BwRSITexxVyJLbG/VpbhdYl09IQW6
         wACddY6Awp+XWsPDkX5kYYIJcPTCFrGN37P9s6yWklswVra0Hd44z78vULLDezE7BWVl
         EL1R2kcnfQZGM8Pvg32txn1s0ITQzcKHWjdx0WeGwmyDoYXyDFKAdSmWz6rhSRme7urP
         94+g==
X-Gm-Message-State: AOJu0Yxu4ori54gewJovAVPRxD/vLy9Df7ipeL8YfAioMgoi1imLOskP
	noE8kBkPmGGL4LpiBQv9xLjqE7QdyV1DW+NMsWSzVmaPrMwaqEg+ABGK
X-Gm-Gg: AfdE7ckawBM5MzmSvRBzxDEYHZjR5NTslZIZgv1Vtz6fYs7cIYMcSnXOE3e15lZ/KbK
	Obcb1r1XRly+Ysg7malNfBDx58MaSAJEJj05wI8VUC6S9LEQmuqOX0XqHqREPQJsO9px08IbrG8
	E66Il/R82D+L6V/+31739oHTSYxGzuFIfd8m5ZX30Q2WBPeG/1qAEmEAFU1L2hFs5WNhFkGvXIx
	JE8Y71zmtdpUD8T20jz497OA7+1cr9nvhh3Ed9MVcPbCa53FikZLULetCnAgEI2ZFens0dwjq4f
	HKMz2cLQt3+r+tau401QHeGoeq9ITiiNvrSUrGtjQ8vhe6SkgAADh+gcrvUk8C9Ah/g0SNuzakL
	amuRPOaqlj3v9Vv4rXfNNfHpJpa/4rVotT+NrB/L+u31nTDhr58o+3aONyfGm5rM1gtHj4+l3eK
	Z5HydQwTsRN0487DvbT+XSy2UfhEYi3wb5qg0QuNantDrL+pJNPfW9EtLtL38iHGlEq/rhmGOBb
	VMbqQ==
X-Received: by 2002:a05:6000:18aa:b0:46e:8f0e:2f02 with SMTP id ffacd0b85a97d-47f488b2626mr9266659f8f.33.1784135904403;
        Wed, 15 Jul 2026 10:18:24 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm17123032f8f.27.2026.07.15.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:18:24 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: change struct member bSurpriseRemoved
Date: Wed, 15 Jul 2026 17:16:33 +0000
Message-ID: <20260715171634.1550-4-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Member name does not adhere to linux coding style.
Changed type as well since b indicates a boolean type and in every
instance of setting the variable the values true and false are used.
bSurpriseRemoved -> surprise_removed

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 20 ++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 12 +++----
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +++----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  8 ++---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +--
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 ++---
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  8 ++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 10 +++---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  4 +--
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 +++++++++----------
 15 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 9e00424d00bd..24b6742509d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -23,7 +23,7 @@ void rtw_btcoex_halt_notify(struct adapter *padapter)
 	if (!padapter->bup)
 		return;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	hal_btcoex_HaltNotify(padapter);
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index df6b118ee9c9..daad3e90ee05 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -396,11 +396,11 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->driver_stopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   padapter->surprise_removed, __LINE__);
 			break;
 		}
 
@@ -419,11 +419,11 @@ int rtw_cmd_thread(void *context)
 			continue;
 
 _next:
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->driver_stopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   padapter->surprise_removed, __LINE__);
 			break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2606fc6b8c5c..0d9feedfaa55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -264,7 +264,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 
 bool rtw_if_up(struct adapter *padapter)
 {
-	if (padapter->driver_stopped || padapter->bSurpriseRemoved ||
+	if (padapter->driver_stopped || padapter->surprise_removed ||
 	    !check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		return false;
 
@@ -930,7 +930,7 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = true;
 	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
 		&& jiffies_to_msecs(start) <= 200) {
-		if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+		if (adapter->driver_stopped || adapter->surprise_removed)
 			break;
 
 		msleep(20);
@@ -1501,7 +1501,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 						     mlmepriv.assoc_timer);
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->surprise_removed)
 		return;
 
 	spin_lock_bh(&pmlmepriv->lock);
@@ -1603,7 +1603,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (!adapter->hw_init_completed)
 		return;
 
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->surprise_removed)
 		return;
 
 	if (adapter->net_closed)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4a7fe5af0ffa..5206cd464778 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1961,7 +1961,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -1979,7 +1979,7 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct submit_ctx sctx;
 
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -2008,7 +2008,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	u32 timeout_ms = 500;/*   500ms */
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -2507,7 +2507,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3052,7 +3052,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3184,7 +3184,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3277,7 +3277,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3705,13 +3705,13 @@ unsigned int send_beacon(struct adapter *padapter)
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
 		} while ((poll % 10) != 0 && !bxmitok &&
-			 !padapter->bSurpriseRemoved &&
+			 !padapter->surprise_removed &&
 			 !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
+	} while (false == bxmitok && issue < 100 && !padapter->surprise_removed &&
 		 !padapter->driver_stopped);
 
-	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
+	if (padapter->surprise_removed || padapter->driver_stopped)
 		return _FAIL;
 
 	if (!bxmitok)
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 03553dec0a93..65be5e993524 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -237,7 +237,7 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 			return;
 	}
 
-	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
+	if ((padapter->surprise_removed) || !(padapter->hw_init_completed)) {
 		pwrpriv->cpwm = PS_STATE_S4;
 		return;
 	}
@@ -404,7 +404,7 @@ int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 		if (bAwake)
 			return 0;
 
-		if (padapter->bSurpriseRemoved)
+		if (padapter->surprise_removed)
 			return -ENODEV;
 
 		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
@@ -480,7 +480,7 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(Adapter);
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->surprise_removed)
 		return;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) { /* connect */
@@ -514,7 +514,7 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 	if (!Adapter->bup)
 		return;
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->surprise_removed)
 		return;
 
 	if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
@@ -548,7 +548,7 @@ void LPS_Leave_check(struct adapter *padapter)
 	while (1) {
 		mutex_lock(&pwrpriv->lock);
 
-		if (padapter->bSurpriseRemoved ||
+		if (padapter->surprise_removed ||
 		    !(padapter->hw_init_completed) ||
 		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
 			bReady = true;
@@ -1089,7 +1089,7 @@ int rtw_pm_set_ips(struct adapter *padapter, u8 mode)
 		return 0;
 	} else if (mode == IPS_NONE) {
 		rtw_ips_mode_req(pwrctrlpriv, mode);
-		if ((padapter->bSurpriseRemoved == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
+		if ((padapter->surprise_removed == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
 			return -EFAULT;
 	} else {
 		return -EINVAL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 92e0c574a556..240866e57866 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1893,7 +1893,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
 				if (!padapter->driver_stopped &&
-				    !padapter->bSurpriseRemoved)
+				    !padapter->surprise_removed)
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1932,7 +1932,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 		if (pattrib->qos != 1) {
 			if (!padapter->driver_stopped &&
-			    !padapter->bSurpriseRemoved) {
+			    !padapter->surprise_removed) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 			}
@@ -2009,7 +2009,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 	struct adapter *padapter = preorder_ctrl->padapter;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
-	if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+	if (padapter->driver_stopped || padapter->surprise_removed)
 		return;
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
@@ -2034,7 +2034,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
 			if (!padapter->driver_stopped &&
-			    !padapter->bSurpriseRemoved) {
+			    !padapter->surprise_removed) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2044,7 +2044,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if (!padapter->driver_stopped && !padapter->bSurpriseRemoved) {
+		if (!padapter->driver_stopped && !padapter->surprise_removed) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d2b44ad60a4c..858471b8d65a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -59,7 +59,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 	if (CmdLen > RTL8723B_MAX_CMD_LEN)
 		goto exit;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		goto exit;
 
 	/* pay attention to if  race condition happened in  H2C cmd setting. */
@@ -639,13 +639,13 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->surprise_removed &&
 				 !padapter->driver_stopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved &&
+		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->surprise_removed &&
 			 !padapter->driver_stopped);
 
-		if (padapter->bSurpriseRemoved || padapter->driver_stopped) {
+		if (padapter->surprise_removed || padapter->driver_stopped) {
 		} else {
 			struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
 
@@ -899,9 +899,9 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->surprise_removed &&
 			 !padapter->driver_stopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved &&
+	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->surprise_removed &&
 		 !padapter->driver_stopped);
 
 	if (bcn_valid) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 08c77348b307..028fb78f940c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -189,7 +189,7 @@ static s32 polling_fwdl_chksum(
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved ||
+		if (value32 & FWDL_ChkSum_rpt || adapter->surprise_removed ||
 		    adapter->driver_stopped)
 			break;
 		yield();
@@ -230,7 +230,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved || adapter->driver_stopped)
+		if (value32 & WINTINI_RDY || adapter->surprise_removed || adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
@@ -386,7 +386,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	fwdl_start_time = jiffies;
 	while (
 		!padapter->driver_stopped &&
-		!padapter->bSurpriseRemoved &&
+		!padapter->surprise_removed &&
 		(write_fw++ < 3 || jiffies_to_msecs(jiffies - fwdl_start_time) < 500)
 	) {
 		/* reset FWDL chksum */
@@ -2743,7 +2743,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			u32 valRCR;
 
 			if (
-				padapter->bSurpriseRemoved  ||
+				padapter->surprise_removed ||
 				(adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off)
 			) {
 				/*  If it is in HW/SW Radio OFF or IPS state, we do not check Fw LPS Leave, */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index f6ad3c8b7aa3..eff18320630f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -660,7 +660,7 @@ static void phy_SwChnlAndSetBwMode8723B(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	if (Adapter->driver_stopped || Adapter->bSurpriseRemoved)
+	if (Adapter->driver_stopped || Adapter->surprise_removed)
 		return;
 
 	if (pHalData->bSwChnl) {
@@ -726,7 +726,7 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	}
 
 	/* Switch workitem or set timer to do switch channel or setbandwidth operation */
-	if ((!Adapter->driver_stopped) && (!Adapter->bSurpriseRemoved)) {
+	if ((!Adapter->driver_stopped) && (!Adapter->surprise_removed)) {
 		phy_SwChnlAndSetBwMode8723B(Adapter);
 	} else {
 		if (pHalData->bSwChnl) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 58e5bd8baf85..9f17a1ca979e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -15,7 +15,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 
 	while (pHalData->SdioTxOQTFreeSpace < agg_num) {
 		if (
-			(padapter->bSurpriseRemoved) ||
+			(padapter->surprise_removed) ||
 			(padapter->driver_stopped)
 		)
 			return false;
@@ -88,7 +88,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	}
 
 	if (
-		(padapter->bSurpriseRemoved) ||
+		(padapter->surprise_removed) ||
 		(padapter->driver_stopped)
 	)
 		goto free_xmitbuf;
@@ -130,7 +130,7 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _FAIL;
 	}
 
-	ret = (padapter->driver_stopped) || (padapter->bSurpriseRemoved);
+	ret = (padapter->driver_stopped) || (padapter->surprise_removed);
 	if (ret)
 		return _FAIL;
 
@@ -363,7 +363,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 next:
 	if (
 		(padapter->driver_stopped) ||
-		(padapter->bSurpriseRemoved)
+		(padapter->surprise_removed)
 	)
 		return _FAIL;
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index da2d9088ab5a..ca50f8a5c32e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -803,7 +803,7 @@ void sd_int_hdl(struct adapter *adapter)
 	struct hal_com_data *hal;
 
 	if (
-		(adapter->driver_stopped) || (adapter->bSurpriseRemoved)
+		(adapter->driver_stopped) || (adapter->surprise_removed)
 	)
 		return;
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index b2bbec7769d0..0a0a9b4d6a9a 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -295,7 +295,7 @@ struct adapter {
 	u32 hal_data_sz;
 
 	bool driver_stopped;
-	s32	bSurpriseRemoved;
+	bool surprise_removed;
 	s32  bCardDisableWOHSM;
 
 	u32 IsrContent;
@@ -396,17 +396,17 @@ static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 #define RTW_IS_FUNC_DISABLED(padapter, func_bit) (atomic_read(&adapter_to_dvobj(padapter)->disable_func) & (func_bit))
 
 #define RTW_CANNOT_IO(padapter) \
-			((padapter)->bSurpriseRemoved || \
+			((padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_IO_BIT))
 
 #define RTW_CANNOT_RX(padapter) \
 			((padapter)->driver_stopped || \
-			 (padapter)->bSurpriseRemoved || \
+			 (padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_RX_BIT))
 
 #define RTW_CANNOT_TX(padapter) \
 			((padapter)->driver_stopped || \
-			 (padapter)->bSurpriseRemoved || \
+			 (padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_TX_BIT))
 
 static inline u8 *myid(struct eeprom_priv *peepriv)
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index d4a3eb5d00b7..a848ab4154ea 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -799,7 +799,7 @@ static int _netdev_open(struct net_device *pnetdev)
 
 	if (!padapter->bup) {
 		padapter->driver_stopped = false;
-		padapter->bSurpriseRemoved = false;
+		padapter->surprise_removed = false;
 		padapter->bCardDisableWOHSM = false;
 
 		status = rtw_hal_init(padapter);
@@ -902,7 +902,7 @@ void rtw_ips_pwr_down(struct adapter *padapter)
 
 void rtw_ips_dev_unload(struct adapter *padapter)
 {
-	if (!padapter->bSurpriseRemoved)
+	if (!padapter->surprise_removed)
 		rtw_hal_deinit(padapter);
 }
 
@@ -1000,13 +1000,13 @@ void rtw_dev_unload(struct adapter *padapter)
 				   "%s: driver not in IPS\n", __func__);
 		}
 
-		if (!padapter->bSurpriseRemoved) {
+		if (!padapter->surprise_removed) {
 			hal_btcoex_IpsNotify(padapter, pwrctl->ips_mode_req);
 
 			/* amy modify 20120221 for power seq is different between driver open and ips */
 			rtw_hal_deinit(padapter);
 
-			padapter->bSurpriseRemoved = true;
+			padapter->surprise_removed = true;
 		}
 
 		padapter->bup = false;
@@ -1088,7 +1088,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->bSurpriseRemoved))
+	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->surprise_removed))
 		return;
 
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c1543e11a6ae..3065b89182e2 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -383,7 +383,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 
 	rtw_unregister_netdevs(dvobj);
 
-	if (!padapter->bSurpriseRemoved) {
+	if (!padapter->surprise_removed) {
 		int err;
 
 		/* test surprise remove */
@@ -391,7 +391,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 		sdio_readb(func, 0, &err);
 		sdio_release_host(func);
 		if (err == -ENOMEDIUM)
-			padapter->bSurpriseRemoved = true;
+			padapter->surprise_removed = true;
 	}
 
 	rtw_ps_deny(padapter, PS_DENY_DRV_REMOVE);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index e9a2f3f7ec74..71d3e4babd31 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -42,7 +42,7 @@ s32 _sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -74,7 +74,7 @@ s32 sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -106,7 +106,7 @@ s32 _sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -138,7 +138,7 @@ s32 sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -166,7 +166,7 @@ u8 sd_read8(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -193,7 +193,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -222,10 +222,10 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 				break;
 			}
 		}
@@ -245,7 +245,7 @@ void sd_write8(struct intf_hdl *pintfhdl, u32 addr, u8 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -270,7 +270,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -298,10 +298,10 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 				break;
 			}
 		}
@@ -336,7 +336,7 @@ s32 _sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -386,7 +386,7 @@ s32 sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -429,7 +429,7 @@ s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -480,7 +480,7 @@ s32 sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
-- 
2.54.0

