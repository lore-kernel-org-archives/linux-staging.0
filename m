Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A725A3C8728
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135911; cv=none; b=g5GmkxLFVAtIudYi9/+FeuR3znvvdTBqlISWQl91/B+gIYJsXuBjBPFFCzF3uYb+c8J3SUCJ3oCLOWt8mo/x8ywYtOmm12jpPEr0REjeoM0XN0/cA2Rh62eD9Cs1gcCy0Ijz1moYSB/BVgpNyjKm/22ZltpuVaTSxD8R7UJnIyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135911; c=relaxed/simple;
	bh=R3sr3rfXJjXvhqVeEBI4cQ0ftmUx0viGFUC2WI1dSbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sILrwu8DQQaruh2Aw3HhV8XBuMU9lh6nzZewExRMj3GvmBf/deGNc/4kF6gr/heqHMyL/76OhNZ/wzJPJ9FiK1IsWEEaKoHOlz/kcYSVvm1WcvEWuxEbKTvQ+iw777zi3WgVs+E+JSz/6p5GfEJ/dzxfj7QAShW8FaTRUbH1gPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKxXEyz6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKxXEyz6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4798bea72f9so3102812f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784135903; x=1784740703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ba4g0quyevkvFPwtms4QQuBV7QEmmSduygnkwDHtmu0=;
        b=NKxXEyz6a8yWWSIK+VM0F6mE0Hl73qhSw/8UW8ZFxInP+Xaiik50Ke6r4d85KSCrtd
         1/HWW+nZg89AdK2xEm4zJrWaAV3Zyng+AK0qtmlER9S1mtxka6NfrCJ8353TFyUNeNb+
         iLw8txDgYq7lyqJM6yz0LgXtsJSdB/6BvieOC1wqUgDUXxFmzA1r7rR4DLE/VQIzzPG+
         Wh3S3nOquqG7hly5KK2ODSrF92G7tW1nbwTYacykE2yeu2Rq4KYIVY8ud9FSIl37m6UC
         r/dM3Pte4k8Iv78BSwX7BbIlPBeCoGlkubDICa8lpwA/vcEhNtmbq0KtHfkE0+5jLeq6
         hJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784135903; x=1784740703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ba4g0quyevkvFPwtms4QQuBV7QEmmSduygnkwDHtmu0=;
        b=l3nk51eALyMZMuaT5fiUAIcx8Gxi1WoG/H0GrPkvLe2TiPhrZvuN/gfoTaWtf2xsvF
         X+2K4wWOWQKihCp4fO8TnS2zrQPaKhXOD6nuAAANK1gjHHKfFO+ZNWPSbZAO73w8skHu
         v4tdru4F56v5jD7JmZQcx7hGxBmB4agSaStTX9gatwi4ZPO2PiL8zk94z9WGbGA4Oyox
         b1leyKCExQ7BlyXdunYJwhVI+HZACy41plxNxdwnHFP5ETqQNMN8Bhlsii3kj4SGxewC
         7jRB1aUHDyqnLU7TfW2p/vFdOI5RaWR+sfxgjReJa2+pq0J+6cmXNteB11/efqDO6P3T
         wKCQ==
X-Gm-Message-State: AOJu0YwiEH7pXKmcptdatucW+pJ56Buk7PLPMXuaWKQWXkNNpUgBz1O2
	BJVFkmuNrMY242dpybOs2Voa9tcBXJB9VZXxpKf+1LAe5HLDtfwBLJdN
X-Gm-Gg: AfdE7cmbZ/tYxm6VL9CtIrKLXxkfwOd0ySJjrCuOaKKBrqEXGFZqo9dIfBnFLrPMtvU
	WhRl/GvDo+PJXyjd/WdXPal32w7VLMzwcIgtvzMVqoGSDDgejTB0fHa1kUw6WjMp6GzUGRjbInY
	nGyRL5Cmyje7k8+hfrQHKKc58MHrazqoEw5ZsNgvLS4vg/VibPKIbWotaKrYHrwUyF4rGLkcSkG
	dPofDOB24nKHj77AVikQiyYZ4sS4px+AHDMt/MV1YsIt5EfGIV1THqPJj2xnzdWYM3vXkpmVXWO
	kTahKDnt/YwSFx0Tstbk46pQiT356WY/wPjZWfMWuCa2nCX9YjJaGnMPGEuUq8VU5fylvS1IQs1
	LzVbuelxNBu2cc+m3K46ieVC8FDUrUH0LHDvdCgIGzmG8ImiGLETrwYcn+mXyQGPK0Aed/u4GlU
	6mU6lsGJmt0aNmyo23pAgxGd0NRXolnEFtDDm4XJxpO+vUF3xodpVmtgABd6drKEvbD5e3KFfNJ
	y+ZKeoRGZk6abLa
X-Received: by 2002:a5d:6f08:0:b0:47f:45d1:7b74 with SMTP id ffacd0b85a97d-47f488e4e5emr9113149f8f.58.1784135902913;
        Wed, 15 Jul 2026 10:18:22 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm17123032f8f.27.2026.07.15.10.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:18:22 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: change struct member bDriverStopped
Date: Wed, 15 Jul 2026 17:16:31 +0000
Message-ID: <20260715171634.1550-2-fliegbert2@gmail.com>
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
bDriverStopped -> driver_stopped

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 ++++-----
 drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 10 ++++-----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  6 ++---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 ++--
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +++----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  6 ++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  8 +++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  4 ++--
 14 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d8ad1c75195b..df6b118ee9c9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -396,10 +396,10 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				   __func__, padapter->bDriverStopped,
+				   __func__, padapter->driver_stopped,
 				   padapter->bSurpriseRemoved, __LINE__);
 			break;
 		}
@@ -419,10 +419,10 @@ int rtw_cmd_thread(void *context)
 			continue;
 
 _next:
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				   __func__, padapter->bDriverStopped,
+				   __func__, padapter->driver_stopped,
 				   padapter->bSurpriseRemoved, __LINE__);
 			break;
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index aaac09100fe3..2606fc6b8c5c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -264,7 +264,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 
 bool rtw_if_up(struct adapter *padapter)
 {
-	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
+	if (padapter->driver_stopped || padapter->bSurpriseRemoved ||
 	    !check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		return false;
 
@@ -930,7 +930,7 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = true;
 	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
 		&& jiffies_to_msecs(start) <= 200) {
-		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+		if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 			break;
 
 		msleep(20);
@@ -1501,7 +1501,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 						     mlmepriv.assoc_timer);
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 		return;
 
 	spin_lock_bh(&pmlmepriv->lock);
@@ -1603,7 +1603,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (!adapter->hw_init_completed)
 		return;
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 		return;
 
 	if (adapter->net_closed)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8cf3c14a0dd7..4e34249a2d26 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -408,7 +408,7 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	if (!padapter)
 		return;
 
-	if (padapter->bDriverStopped) {
+	if (padapter->driver_stopped) {
 		timer_delete_sync(&pmlmeext->survey_timer);
 		timer_delete_sync(&pmlmeext->link_timer);
 		/* timer_delete_sync(&pmlmeext->ADDBA_timer); */
@@ -1962,7 +1962,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
 	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -1980,7 +1980,7 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	struct submit_ctx sctx;
 
 	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return ret;
@@ -2009,7 +2009,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return -1;
@@ -2507,7 +2507,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3052,7 +3052,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3184,7 +3184,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3277,7 +3277,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3706,11 +3706,11 @@ unsigned int send_beacon(struct adapter *padapter)
 			poll++;
 		} while ((poll % 10) != 0 && !bxmitok &&
 			 !padapter->bSurpriseRemoved &&
-			 !padapter->bDriverStopped);
+			 !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
+	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
 		return _FAIL;
 
 	if (!bxmitok)
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index ea005d2fae29..03553dec0a93 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -242,7 +242,7 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 		return;
 	}
 
-	if (padapter->bDriverStopped) {
+	if (padapter->driver_stopped) {
 		if (pslv < PS_STATE_S2)
 			return;
 	}
@@ -1045,7 +1045,7 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	}
 
 	/* TODO: the following checking need to be merged... */
-	if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
+	if (padapter->driver_stopped || !padapter->bup || !padapter->hw_init_completed) {
 		ret = false;
 		goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 16ec2248b083..92e0c574a556 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1892,7 +1892,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if (!padapter->bDriverStopped &&
+				if (!padapter->driver_stopped &&
 				    !padapter->bSurpriseRemoved)
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
@@ -1931,7 +1931,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if (!padapter->bDriverStopped &&
+			if (!padapter->driver_stopped &&
 			    !padapter->bSurpriseRemoved) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
@@ -2009,7 +2009,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 	struct adapter *padapter = preorder_ctrl->padapter;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
-	if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+	if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 		return;
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
@@ -2033,7 +2033,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if (!padapter->bDriverStopped &&
+			if (!padapter->driver_stopped &&
 			    !padapter->bSurpriseRemoved) {
 				retval = _FAIL;
 				return retval;
@@ -2044,7 +2044,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
+		if (!padapter->driver_stopped && !padapter->bSurpriseRemoved) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 180aac640a14..d18df407e365 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -257,7 +257,7 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 	u8 i;
 	struct adapter *padapter =  pDM_Odm->Adapter;
 
-	if (padapter->bDriverStopped)
+	if (padapter->driver_stopped)
 		return;
 
 	if (!pDM_Odm->bUseRAMask)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 21b837772b24..0790209a3a8f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -639,11 +639,11 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
 
-		if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
+		if (padapter->bSurpriseRemoved || padapter->driver_stopped) {
 		} else {
 			struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
 
@@ -897,8 +897,8 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ecd66f090a50..210b38d23fdc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -189,7 +189,7 @@ static s32 polling_fwdl_chksum(
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->bDriverStopped)
+		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
@@ -229,7 +229,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved || adapter->bDriverStopped)
+		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved || adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
@@ -384,7 +384,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	_FWDownloadEnable(padapter, true);
 	fwdl_start_time = jiffies;
 	while (
-		!padapter->bDriverStopped &&
+		!padapter->driver_stopped &&
 		!padapter->bSurpriseRemoved &&
 		(write_fw++ < 3 || jiffies_to_msecs(jiffies - fwdl_start_time) < 500)
 	) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 78fa99115751..f6ad3c8b7aa3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -660,7 +660,7 @@ static void phy_SwChnlAndSetBwMode8723B(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	if (Adapter->bDriverStopped || Adapter->bSurpriseRemoved)
+	if (Adapter->driver_stopped || Adapter->bSurpriseRemoved)
 		return;
 
 	if (pHalData->bSwChnl) {
@@ -726,7 +726,7 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	}
 
 	/* Switch workitem or set timer to do switch channel or setbandwidth operation */
-	if ((!Adapter->bDriverStopped) && (!Adapter->bSurpriseRemoved)) {
+	if ((!Adapter->driver_stopped) && (!Adapter->bSurpriseRemoved)) {
 		phy_SwChnlAndSetBwMode8723B(Adapter);
 	} else {
 		if (pHalData->bSwChnl) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index e40f69c13c44..58e5bd8baf85 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -16,7 +16,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 	while (pHalData->SdioTxOQTFreeSpace < agg_num) {
 		if (
 			(padapter->bSurpriseRemoved) ||
-			(padapter->bDriverStopped)
+			(padapter->driver_stopped)
 		)
 			return false;
 
@@ -89,7 +89,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 
 	if (
 		(padapter->bSurpriseRemoved) ||
-		(padapter->bDriverStopped)
+		(padapter->driver_stopped)
 	)
 		goto free_xmitbuf;
 
@@ -130,7 +130,7 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _FAIL;
 	}
 
-	ret = (padapter->bDriverStopped) || (padapter->bSurpriseRemoved);
+	ret = (padapter->driver_stopped) || (padapter->bSurpriseRemoved);
 	if (ret)
 		return _FAIL;
 
@@ -362,7 +362,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
 next:
 	if (
-		(padapter->bDriverStopped) ||
+		(padapter->driver_stopped) ||
 		(padapter->bSurpriseRemoved)
 	)
 		return _FAIL;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c4058cfe73f2..da2d9088ab5a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -803,7 +803,7 @@ void sd_int_hdl(struct adapter *adapter)
 	struct hal_com_data *hal;
 
 	if (
-		(adapter->bDriverStopped) || (adapter->bSurpriseRemoved)
+		(adapter->driver_stopped) || (adapter->bSurpriseRemoved)
 	)
 		return;
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index c837157404d0..b2bbec7769d0 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -294,7 +294,7 @@ struct adapter {
 	void *HalData;
 	u32 hal_data_sz;
 
-	s32	bDriverStopped;
+	bool driver_stopped;
 	s32	bSurpriseRemoved;
 	s32  bCardDisableWOHSM;
 
@@ -400,12 +400,12 @@ static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 			 RTW_IS_FUNC_DISABLED((padapter), DF_IO_BIT))
 
 #define RTW_CANNOT_RX(padapter) \
-			((padapter)->bDriverStopped || \
+			((padapter)->driver_stopped || \
 			 (padapter)->bSurpriseRemoved || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_RX_BIT))
 
 #define RTW_CANNOT_TX(padapter) \
-			((padapter)->bDriverStopped || \
+			((padapter)->driver_stopped || \
 			 (padapter)->bSurpriseRemoved || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_TX_BIT))
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index fb6fc603f279..d4a3eb5d00b7 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -798,7 +798,7 @@ static int _netdev_open(struct net_device *pnetdev)
 	}
 
 	if (!padapter->bup) {
-		padapter->bDriverStopped = false;
+		padapter->driver_stopped = false;
 		padapter->bSurpriseRemoved = false;
 		padapter->bCardDisableWOHSM = false;
 
@@ -866,7 +866,7 @@ static int  ips_netdrv_open(struct adapter *padapter)
 
 	padapter->net_closed = false;
 
-	padapter->bDriverStopped = false;
+	padapter->driver_stopped = false;
 	padapter->bCardDisableWOHSM = false;
 	/* padapter->bup = true; */
 
@@ -972,7 +972,7 @@ void rtw_dev_unload(struct adapter *padapter)
 	u8 cnt = 0;
 
 	if (padapter->bup) {
-		padapter->bDriverStopped = true;
+		padapter->driver_stopped = true;
 		if (padapter->xmitpriv.ack_tx)
 			rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_DRV_STOP);
 
@@ -1088,7 +1088,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
+	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->bSurpriseRemoved))
 		return;
 
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 7c8d912dd462..c1543e11a6ae 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -229,7 +229,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 	padapter->dvobj = dvobj;
 	dvobj->if1 = padapter;
 
-	padapter->bDriverStopped = true;
+	padapter->driver_stopped = true;
 
 	dvobj->padapters = padapter;
 	padapter->iface_id = 0;
@@ -415,7 +415,7 @@ static int rtw_sdio_suspend(struct device *dev)
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(psdpriv);
 	struct adapter *padapter = psdpriv->if1;
 
-	if (padapter->bDriverStopped)
+	if (padapter->driver_stopped)
 		return 0;
 
 	if (pwrpriv->bInSuspend)
-- 
2.54.0

