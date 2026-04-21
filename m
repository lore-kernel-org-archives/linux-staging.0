Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32134751B
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 22:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776808895; cv=none; b=YzlJtu1Vxj2ldKeBam10Mh5+aTPSPsbq0c5HlqxXDuyzVnlcZt8jzKtYjfCfvF9yxHpQWXWuXecMJzNCNRi0KR7/ZzuCtkSDk8qLk4GFo55Eh1ZJUIfUUz8r1brqvaCI5+QgUncx+JKJV2zzFJONv/adD3dZ2MErZWDfQ/GeuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776808895; c=relaxed/simple;
	bh=f1SCjcV8TSQ2i/hzD1Wi9HG8rl8dOfCjEKjBhQWmORY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4LyMhCstxzAxGDkr/1nOKnmevBWuHZUsJP0cs+BzIgdqhD4BrURaxjOR00lZzsSQ2e3hZnCdi6DFM8kQz0aHthDE6VmNbDuIhXIsjxnq65v3DLv/mEofmLD8h2btM7D9c/lSLY1r8AvSQJo+EW4D28oqXS7WZ5tE6CRtBumbdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xh3r8gm0; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xh3r8gm0"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g0bsh6wg6z9tnv;
	Wed, 22 Apr 2026 00:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776808889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=De9gPIW5RDTiaTAj/RxmGA15d+R3a2o7Rvsdgptd788=;
	b=xh3r8gm0PZXQIEZzU07vS1EgwM0E2Os133H/sVs6oz04XECKQfeV6gSFNWAATatQhyiXhV
	9FEc7SioFamKIF2EP3iBaLRx2Nv4gTXZlm3g8J/1TQ63Rm2Hsl1lZLP4zpiLAqavs4v2AK
	C4AfZl+uEaTJL/JwNrm/iCktkhMVXt8wmsSZv+lVDoZJzPF/Jq0EB6n5yBPUAQwqILLutI
	AuMjDivFAAGm77E1eBa/nzAx+H5wx/xX1x6tTnHohbSR8hlv1h14eHktQWbWsOM15fVpnk
	uDHJUlmBQUB7bMDQaKQBeNiN1SFeO8rn28fq8EkiQZnLbZop0DpytJQ8HBqoBw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 3/3] staging: rtl8723bs: cleanup if-statements formatting
Date: Wed, 22 Apr 2026 01:00:58 +0300
Message-ID: <20260421220058.29317-4-khomenkov@mailbox.org>
In-Reply-To: <20260421220058.29317-1-khomenkov@mailbox.org>
References: <20260421220058.29317-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ff95a66632ec53fd4b9
X-MBO-RS-META: 8zfooxbsp4spojx76wuiffbe8jbjkbxn

Fix if-statements formatting to improve code readability
and conform to the Linux kernel coding style. This fixes
the following checkpatch.pl issues:

- LONG_LINE: wrap lines exceeding 100 characters.
- LOGICAL_CONTINUATIONS: move logical operators to the previous line.
- PARENTHESIS_ALIGNMENT: fix alignment of continued conditions.
- BRACES: remove redundant curly braces for single-statement blocks.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c      |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c   |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme.c        |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c        | 16 +++++++++-------
 drivers/staging/rtl8723bs/core/rtw_xmit.c        |  7 ++++---
 drivers/staging/rtl8723bs/hal/odm.c              |  7 ++-----
 drivers/staging/rtl8723bs/hal/odm_DIG.c          | 16 ++++++----------
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c      |  6 ++----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c    |  3 ++-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c     |  6 ++----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c    |  7 ++++---
 12 files changed, 40 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 831e5802f419..be764eebe20a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE)) {
+	if ((media_status == RT_MEDIA_CONNECT) &&
+	    check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 5e1269ee14cb..24d2356b5881 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -300,7 +300,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			rtw_disassoc_cmd(padapter, 0, true);
 
 		if (check_fwstate(pmlmepriv, _FW_LINKED) ||
-			check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
+		    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
@@ -471,8 +471,8 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 	struct sta_info *psta = NULL;
 	u8 short_GI = 0;
 
-	if (!check_fwstate(pmlmepriv, _FW_LINKED)
-		&& !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
+	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
+	    !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 		return 0;
 
 	psta = rtw_get_stainfo(&adapter->stapriv, get_bssid(pmlmepriv));
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c3457dc57851..012e361490d3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1767,9 +1767,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
-		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms
-			|| !is_same_ess(&competitor->network, &mlme->cur_network.network)
-		)
+		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=
+		    mlme->roam_scanr_exp_ms ||
+		    !is_same_ess(&competitor->network, &mlme->cur_network.network))
 			goto exit;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0e068ad91252..949e4729472c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -513,7 +513,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 
 	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
-		!check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
+	    !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		return _SUCCESS;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index aad4f3696ebd..64cf806e4d9e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -409,7 +409,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			if (bmic_err) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if (is_multicast_ether_addr(prxattrib->ra)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				if (is_multicast_ether_addr(prxattrib->ra) &&
+				    (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -714,7 +715,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -847,7 +848,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		}
 
 	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
-		     check_fwstate(pmlmepriv, _FW_LINKED)) {
+		   check_fwstate(pmlmepriv, _FW_LINKED)) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -2197,10 +2198,11 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
-			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
-			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
-			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
-			!psecuritypriv->busetkipkey) {
+		    !is_multicast_ether_addr(prxattrib->ra) &&
+		    prxattrib->encrypt > 0 &&
+		    (prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
+		    psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
+		    !psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
 
 			if (recvpriv->free_recvframe_cnt < NR_RECVFRAME / 4) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 2cd4aaf42cbf..e91d7cb21c29 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -386,7 +386,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && pattrib->ampdu_en &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
+			    pattrib->ampdu_en &&
 			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
@@ -653,7 +654,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -925,7 +926,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (pattrib->qos_en)
 				qos_option = true;
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+			   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index b01e9016e30c..b4f872f4d6c9 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -380,12 +380,9 @@ static void FindMinimumRSSI(struct adapter *padapter)
 
 	/* 1 1.Determine the minimum RSSI */
 
-	if (
-		!pDM_Odm->bLinked &&
-		(pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
-	) {
+	if (!pDM_Odm->bLinked && (pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0))
 		pdmpriv->MinUndecoratedPWDBForDM = 0;
-	} else
+	else
 		pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 426989986cc3..fba85cc0e7bf 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -251,12 +251,10 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 	} else
 		EDCCA_State = true;
 
-	if (
-		pDM_Odm->bLinked &&
-		!pDM_Odm->Carrier_Sense_enable &&
-		!pDM_Odm->NHM_disable &&
-		!pDM_Odm->TxHangFlg
-	)
+	if (pDM_Odm->bLinked &&
+	    !pDM_Odm->Carrier_Sense_enable &&
+	    !pDM_Odm->NHM_disable &&
+	    !pDM_Odm->TxHangFlg)
 		odm_NHMBB(pDM_Odm);
 
 	if (EDCCA_State) {
@@ -527,10 +525,8 @@ void odm_DIG(void *pDM_VOID)
 		CurrentIGI = pDM_DigTable->rx_gain_range_max;
 
 	/* 1 Force upper bound and lower bound for adaptivity */
-	if (
-		pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY &&
-		pDM_Odm->adaptivity_flag
-	) {
+	if (pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY &&
+	    pDM_Odm->adaptivity_flag) {
 		if (CurrentIGI > Adap_IGI_Upper)
 			CurrentIGI = Adap_IGI_Upper;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 5cb13a10efd6..612351010359 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -137,10 +137,8 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;
 	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
 
-	if (
-		hw_init_completed &&
-		(!fw_current_in_ps_mode && bFwPSAwake)
-	) {
+	if (hw_init_completed &&
+	    (!fw_current_in_ps_mode && bFwPSAwake)) {
 		rtw_hal_check_rxfifo_full(Adapter);
 	}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index b9d2dabc9d9b..2827b176b4db 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -998,7 +998,8 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
+					       WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f4073f6a342f..55a85f8aa38d 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -596,10 +596,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pHalData = GET_HAL_DATA(padapter);
 	pwrctrlpriv = adapter_to_pwrctl(padapter);
 
-	if (
-		adapter_to_pwrctl(padapter)->bips_processing &&
-		adapter_to_pwrctl(padapter)->pre_ips_type == 0
-	) {
+	if (adapter_to_pwrctl(padapter)->bips_processing &&
+	    adapter_to_pwrctl(padapter)->pre_ips_type == 0) {
 		unsigned long start_time;
 		u8 cpwm_orig, cpwm_now;
 		u8 val8, bMacPwrCtrlOn = true;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 000756a07098..d92ed676d3e7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -899,8 +899,8 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
 			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+		   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
 	}
 
@@ -1210,7 +1210,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	spin_unlock_bh(&pwdev_priv->scan_req_lock);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
-		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING)) {
+		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY |
+					     _FW_UNDER_LINKING)) {
 			need_indicate_scan_done = true;
 			goto check_need_indicate_scan_done;
 		}
-- 
2.53.0

