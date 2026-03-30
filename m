Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6683D2FE6
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896424; cv=none; b=CvlQvn20azDRa9p8940Na67dEvqgFglAl/zDq6Ry2bLYSPa+QxGte1Mm0zIVjxW+jP3no8QBO7AeEAL8mZUH14lJPDzThylWrajqw/TDODzRVQuDhPEewRe2N2Kb+EPTS3Y3dvISXX/kdC5EPJNflc6HYp2kAILWk0ZOOFL+8aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896424; c=relaxed/simple;
	bh=qLKyunnHAIvwZrZ9ydLs9yhwO4/934Cjj6lcjfz6lts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8l/cr6UrWa/FZ2Kqe6FdwrHhNgnO/p5nIwlLoNx9Bh2PU6UiG8JWE8blHC2lNmaACbxWVI5rzqbX2ar1Aij0ptZTl/11V0Qi2HVqrvNRGqcF+Sjj/74XjvMzhwRd4qftt2oGiz2oW8Pr2s85gT2SCgJCRljBjh1VdZoxERDf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UelC9fnt; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AdpkrJ/b; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UelC9fnt";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AdpkrJ/b"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fl0bS4Gzmz9vVk;
	Mon, 30 Mar 2026 20:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774896420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guXXKt4zHxWSRqDWVWS+FsyoOfmxpcZq4w4hA1XG3Ig=;
	b=UelC9fntqEaRRpwiMRtzWnYr5MtODRpIrTxHo6gNQPPRg/f/Dpe3KURZhCmRSgRD9HD811
	kE6tZ2AmOk9d8u1taK7JvsoYmavBYfDALmLWKNOrkq+KFRwag0+BFdTeCKRcA4iO8Khr0F
	jXll/fGHavgiggeXKPC+vPncffYZbPVfXM03M4KsizfAbGFDql74ajSbWobqa6mcUaCrfK
	4aTkxID+YFzxZYAz8NJHoR4sDeKugShwJhm43oZWLueyMBOort8YmFYLwb4GgyKiGTuSPF
	HGbB2ew35kPbNiznWig0ptkjB4dqlXKy2mYcsfKvJ87bHSAFD6FciEgu1ihjnw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774896419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guXXKt4zHxWSRqDWVWS+FsyoOfmxpcZq4w4hA1XG3Ig=;
	b=AdpkrJ/b2dJJjhAYyelFUPn+KqUTLtXn/EOngNwBmrSvGC+OmKQHiT86+XnZbb5TcU3TiL
	L6qF2bZ2fHDq99nK47Dfxv37LFPOMdBTy0jXgEyAeAdiOc2wngc9ROwiSkgxO5fawGNZZa
	i9sc+FCyNXsQ/ZNX+Pso24eiGj4gdH0pXn4hQJFvuCY4NFZcYbgVAx0DQ6cYez/7mlKOzu
	TQIXeY/NJq0wDsh61yS6iAggwzDaQWbnrNB6GaVM5AQgpy7i/q3ufGJg7gHSim1WUacnW7
	Lm5anA4IDbue474bpMgPNDgsWWgmtF9k9kUlL9jSuAmKir7SLS+t3+CrebriZA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/2] staging: rtl8723bs: cleanup code style and parentheses
Date: Mon, 30 Mar 2026 21:46:39 +0300
Message-ID: <20260330184640.17795-3-khomenkov@mailbox.org>
In-Reply-To: <20260330184640.17795-1-khomenkov@mailbox.org>
References: <20260330184640.17795-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b4f5c7f6fc995c8738c
X-MBO-RS-META: opuy66den9yc6d4p1bmawccw98sb6cn4

Cleanup the driver code to better match the kernel coding style.
This patch includes:
 - Removal of redundant parentheses in if-statements and expressions.
 - Adding missing spaces around bitwise and logical operators.
 - Reformatting multi-line conditions for better readability.
 - Reformatting long conditions for better readability.

These changes are purely cosmetic and do not alter the driver logic.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +--
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  8 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 34 +++++++++----------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 23 +++++++------
 drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 16 ++++-----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  5 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  9 ++---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 +++---
 14 files changed, 64 insertions(+), 68 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 9a7acabef409..f09510048b93 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
+	if (media_status == RT_MEDIA_CONNECT &&
+	    check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 463a731fb37f..669151c08a3f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -347,7 +347,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
-	    (pregistrypriv->ht_enable)) {
+	    pregistrypriv->ht_enable) {
 		/* todo: */
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index a55f484f575b..4a55bfeb19c1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -153,7 +153,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -298,11 +298,11 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		spin_lock_bh(&pmlmepriv->lock);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED)) || (*pold_state == Ndis802_11IBSS))
+		if (check_fwstate(pmlmepriv, _FW_LINKED) || *pold_state == Ndis802_11IBSS)
 			rtw_disassoc_cmd(padapter, 0, true);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED)) ||
-			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)))
+		if (check_fwstate(pmlmepriv, _FW_LINKED) ||
+		    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 298f6cf6f2fd..81777a2ca1e2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1786,9 +1786,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
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
index bcc387844ff5..5f88fff2ec70 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -513,7 +513,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 
 	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
-		!check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
+	    !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		return _SUCCESS;
 	}
 
@@ -1239,7 +1239,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		pstat->flags &= ~WLAN_STA_HT;
 
 
-	if ((!pmlmepriv->htpriv.ht_option) && (pstat->flags & WLAN_STA_HT)) {
+	if (!pmlmepriv->htpriv.ht_option && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 43977f868d29..43b9f5fc08bf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -409,7 +409,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			if (bmic_err) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if ((is_multicast_ether_addr(prxattrib->ra))  && (prxattrib->key_index != pmlmeinfo->key_index))
+				if (is_multicast_ether_addr(prxattrib->ra) &&
+				    prxattrib->key_index != pmlmeinfo->key_index)
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -463,7 +464,7 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 		}
 	}
 
-	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt))) {
+	if (prxattrib->encrypt > 0 && (prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt)) {
 		psecuritypriv->hw_decrypted = false;
 
 		switch (prxattrib->encrypt) {
@@ -713,8 +714,8 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	u8 *sta_addr = NULL;
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -800,7 +801,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE)) &&
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
 	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
 	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		) {
@@ -847,8 +848,8 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE)) &&
-		     (check_fwstate(pmlmepriv, _FW_LINKED))) {
+	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
+		   check_fwstate(pmlmepriv, _FW_LINKED)) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -1590,7 +1591,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
+	if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
@@ -1943,8 +1944,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if ((!padapter->bDriverStopped) &&
-				    (!padapter->bSurpriseRemoved))
+				if (!padapter->bDriverStopped &&
+				    !padapter->bSurpriseRemoved)
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1984,8 +1985,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if ((!padapter->bDriverStopped) &&
-			    (!padapter->bSurpriseRemoved)) {
+			if (!padapter->bDriverStopped &&
+			    !padapter->bSurpriseRemoved) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -2092,8 +2093,8 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if ((!padapter->bDriverStopped) &&
-			    (!padapter->bSurpriseRemoved)) {
+			if (!padapter->bDriverStopped &&
+			    !padapter->bSurpriseRemoved) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2103,7 +2104,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if ((!padapter->bDriverStopped) && (!padapter->bSurpriseRemoved)) {
+		if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
@@ -2280,8 +2281,7 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 		}
 
 		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) ||
-		    !check_fwstate(&adapter->mlmepriv, _FW_LINKED)
-		) {
+		    !check_fwstate(&adapter->mlmepriv, _FW_LINKED)) {
 			goto set_timer;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index fc9910eeeeec..221d03b6a832 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1689,7 +1689,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 	/* dump for  adaptive_early_32k */
-	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done)) {
+	if (pmlmeext->bcn_cnt > 100 && pmlmeext->adaptive_tsf_done) {
 		u8 ratio_20_delay, ratio_80_delay;
 		u8 DrvBcnEarly, DrvBcnTimeOut;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 63972927433d..0f6c7ecb3893 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -386,8 +386,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en) &&
-			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS &&
+			    pattrib->ampdu_en &&
+			    padapter->securitypriv.dot11PrivacyAlgrthm == _AES_) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
@@ -487,7 +488,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	if (psta->ieee8021x_blocked) {
 		pattrib->encrypt = 0;
 
-		if ((pattrib->ether_type != 0x888e) && (!check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
+		if (pattrib->ether_type != 0x888e && !check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -652,8 +653,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -719,7 +720,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) && (!(psta->state & _FW_LINKED))) {
+		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED)) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -901,7 +902,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	SetFrameSubType(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
-		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true) {
+		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 
 			{
@@ -915,7 +916,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pqospriv->qos_option)
 				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) == true) {
+		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
 			SetFrDs(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
@@ -924,8 +925,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pattrib->qos_en)
 				qos_option = true;
-		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
+		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+			   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -1140,7 +1141,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || (rtw_endofpktfile(&pktfile))) {
+		if (bmcst || rtw_endofpktfile(&pktfile)) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 4727ba276d59..d10d1e587bf9 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -623,7 +623,7 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	}
 	odm_CCKPacketDetectionThresh(pDM_Odm);
 
-	if (*(pDM_Odm->pbPowerSaving))
+	if (*pDM_Odm->pbPowerSaving)
 		return;
 
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 9a1a1ec9ab89..8e5ae28fa28f 100644
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
+	if ((pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY) &&
+	    pDM_Odm->adaptivity_flag) {
 		if (CurrentIGI > Adap_IGI_Upper)
 			CurrentIGI = Adap_IGI_Upper;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 91fa289f81b7..5d4592bcac74 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -998,7 +998,8 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
+	    WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
@@ -2118,7 +2119,7 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 	/*  config RCR to receive different BSSID & not to receive data frame */
 	value_rxfltmap2 = 0;
 
-	if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)))
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		rcr_clear_bit = RCR_CBSSID_BCN;
 
 	value_rcr = rtw_read32(padapter, REG_RCR);
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
index 38b84c8b1143..4b8494f1bbbe 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -898,9 +898,9 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
-		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+		   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+		ret = rtw_cfg80211_set_encryption(ndev, param, param_len);
 	}
 
 addkey_end:
@@ -1208,7 +1208,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	spin_unlock_bh(&pwdev_priv->scan_req_lock);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
-		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING)) {
+		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY |
+		    _FW_UNDER_LINKING)) {
 			need_indicate_scan_done = true;
 			goto check_need_indicate_scan_done;
 		}
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 8be1a736c9d3..22e759571763 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -193,12 +193,11 @@ void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 
 	rtw_check_xmit_resource(padapter, pkt);
 
-	if (!rtw_mc2u_disable
-		&& check_fwstate(pmlmepriv, WIFI_AP_STATE)
-		&& (IP_MCAST_MAC(pkt->data)
-			|| ICMPV6_MCAST_MAC(pkt->data)
-			)
-		&& padapter->registrypriv.wifi_spec == 0) {
+	if (!rtw_mc2u_disable &&
+	    check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
+	    (IP_MCAST_MAC(pkt->data) ||
+	    ICMPV6_MCAST_MAC(pkt->data)) &&
+	    padapter->registrypriv.wifi_spec == 0) {
 		if (pxmitpriv->free_xmitframe_cnt > (NR_XMITFRAME / 4)) {
 			res = rtw_mlcst2unicst(padapter, pkt);
 			if (res)
-- 
2.53.0

