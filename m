Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD2245012
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304928; cv=none; b=lYcEH9/9qgqsmgs9ySVyPACiHK/DwLP/oWSSNuNs4D2EIu70Vwz9ay+OWGceHesszTJrWtzHs0RwkRDae93+XdrEFSro6J2tgI4VXQe/BBxDFt1sJ0NlO/HxLeNwSbHj2YOYXyT9hocsyU7QnF+6ayQRsAZ3E1bq4beVZf5/5Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304928; c=relaxed/simple;
	bh=b49Jo7cb+aAuOuuHYnLoWVzVL2avSfUoDItQi9/5EZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqKaHAyrBLjlBawL7/oEPXm/CFykkNFcoLvPi1KKKXIfhXaK02R7S8CaPpN+aNHqsXZ2560YqH0o9i6VGBXk2EZJzMZg+giwPbH7zqgxW+O8fVahR9JlBRl4yRXLm1car5WuufroJoOAuyghsE/SHZROxZwcofOe6nFK4nk+U8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic3uYHo/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic3uYHo/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-475881b9a4bso4706637f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304922; x=1784909722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+mCi6CAcCQZ/L5rZxcZEfzKd4dGmx3j4XGejbBm5Pw=;
        b=ic3uYHo/KqDkAWPV1tyupcdKDybFFVZ04j5T35hdR7XEJlKueb/GlyCgPQthkvxyj0
         +fGeOS2pi9Iy96Q4+tap/EXbVdNmeH99KLXle2AI/o2wuk1V3sc08Fdx/3N1e+A06Mmm
         1FipbpawcAnwSo5l5MtQkjunRPb1yltWbhBLw8/10f87a0lrd6ikESV2bozd+U7TZKEj
         dTT9gGOLXDA+bMu2xRSm6KDwVCMIuALJxYUFR1VP4tFgyLQ0PYPL40UnFNCRgKe5rlzc
         ohgMAil+2wJXnML8PMUSHOk/jUFAcItewI3KKgOzwGdbFXn6AWvkkVCdUjQdSXnGeM16
         iz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304922; x=1784909722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+mCi6CAcCQZ/L5rZxcZEfzKd4dGmx3j4XGejbBm5Pw=;
        b=PUSvDIMEo2RHHq9pSyKmjdxsgcvTVuthA+o/yZcE8ja6WS0NgirGSmPM+gFx1gUU9/
         mDhlp391+56g2fg/lZqqEEah5F5l/N6xJXNoQ5NpRcmk+3gtNkLhWAifkWoNiWvGh7v9
         VuYCA7GPOgEZMPGBIYvw8+ODrgyC40aCLw8yEufNVsmgR0cgqdvpkRM3dWhHTdlZNhkr
         oryF6rckhqLqSc5y+sbvIy60kxqG4AO77fD4CCLAXM8akxE+gtEPU+toRS2hEGKLDNZd
         EtFKauXwXHun/t+YnqJ03QvGzxlI7G3aHopG9wu0ZQRb2vzTFvbH1Pn9/feMgMOBj2bL
         VIDA==
X-Gm-Message-State: AOJu0YysW1W/SD/1Bp0ncPGC971ZuUQiFBEl70DJON4GF7ewaL0UgHVl
	bwrRoTEe5DfpLPvARTwbMwp5OgQEXhGmb/Mhp9GX4WtraQ5FJVuxUQqg
X-Gm-Gg: AfdE7ckHdlKYKmTSRMqQjUu5PMxPByqWwGkTgF5ZPrnaskRxWCOTYXDJP38i4gIXOMZ
	RBf4/Qc5Qw3MwFwc0ZGFcxtYRIJA1yhBwZzb2sBcfN++oyB887hY4wc+0vAGfpBbnl5GJZIAAi1
	+dRiTktFtc7ZeOSQXI46LvFpYvNWwX4n9rv7h5DXPnH/3o0Gw0A678vs2mVA9+ERKLaU7yWzwbI
	2CLfzvvp+lovfjEU3HoIKOULIgFI2cPjgTaPkJOIBBIP0lBG5w7xhniV77G5neImM+Sf+HmtYA7
	UIUNW+hnrrG4m2NgBV0FKQ3QI9UC7Dygelk3Pu7EjZ0j5vcIjLFnfcD+iAw6MkKROK6Tv3vrUAI
	LroHVdKH/LFQtXcRfS48aSlaVMGWDN6UdcAIi0Fl1Srj2otOoJ6pDVgPvJ8AhMi/FZWriZfC58C
	w0POcb/Euyl9xWUcTNKV8ge8vDnBUDmUuY2p0kVYuT4VimkQzBAZxgZjArMDd7pBKCm2Y=
X-Received: by 2002:a05:6000:71e:b0:473:1ccc:15cc with SMTP id ffacd0b85a97d-47f622c57admr4101203f8f.0.1784304922344;
        Fri, 17 Jul 2026 09:15:22 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f66df025csm3252526f8f.0.2026.07.17.09.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:15:21 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: change struct member bDriverStopped
Date: Fri, 17 Jul 2026 16:13:26 +0000
Message-ID: <20260717161329.3400-2-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717161329.3400-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260717161329.3400-1-fliegbert2@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 11 +++++-----
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
 14 files changed, 53 insertions(+), 52 deletions(-)

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
index 7a232daf5c56..11f77b7ca745 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -264,7 +264,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 
 bool rtw_if_up(struct adapter *padapter)
 {
-	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
+	if (padapter->driver_stopped || padapter->bSurpriseRemoved ||
 	    !check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		return false;
 
@@ -927,8 +927,9 @@ void rtw_scan_abort(struct adapter *adapter)
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) && jiffies_to_msecs(start) <= 200) {
-		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
+	       && jiffies_to_msecs(start) <= 200) {
+		if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 			break;
 
 		msleep(20);
@@ -1499,7 +1500,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 						     mlmepriv.assoc_timer);
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 		return;
 
 	spin_lock_bh(&pmlmepriv->lock);
@@ -1601,7 +1602,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (!adapter->hw_init_completed)
 		return;
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 		return;
 
 	if (adapter->net_closed)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f5ab94a2d0a0..57f0403ff5bf 100644
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
@@ -2516,7 +2516,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3064,7 +3064,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3196,7 +3196,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3289,7 +3289,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3718,11 +3718,11 @@ unsigned int send_beacon(struct adapter *padapter)
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
index 803eef9438a6..448611ad8237 100644
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
index 7946acd8869b..7568fc514d7c 100644
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
index 3dac9a8fe5d8..bb66ab008e3c 100644
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
index 79dbca1b5525..6110172858eb 100644
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
index cb270e1768e9..c15056ee207c 100644
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
index 099f9e6fc3ce..c61d3d12df7f 100644
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

