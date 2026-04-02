Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8B3EF64D
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142302; cv=none; b=UwNHVfhvnl/PQUXvMySxdiRHjT90lGvz4wER5SA+Qb1O/cqcUjRRnQ3TjWVpHHNohuvnXw0x6RmeKhKsS1UdjDOAv4sFCnh35mhzHL+qo/w4uTPe2douSP0dGXa5r5xCdwlGAthhsh8M8HgLfGAuH1kKH5nAQiqvG7+JkP5/b/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142302; c=relaxed/simple;
	bh=6HIiO6Sa043JFfWnA9J1XJtpQi9AFkZjzQe2Rv9s6f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUCsp7mWiP50DIVsW3YHb0G1yDLhvg07usquLoybf2AyD0RIbrQYYXVkt4/cIgqPxcIGE1jqAChD87zYyVnnNuoGIRSmPBDTrybzqRdOgPDCL/Dq1wWASFewP2paRB5RaXw1B1v2lBjVRQVBKxg//IKR2GTDwT4H2Mm8eLc89ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tJsyekGQ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tJsyekGQ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fmlWk5TJ2z9vGl;
	Thu,  2 Apr 2026 17:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775142290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJrgjwoDPk/9M3mqIyLU2hcLOZFGlli4wD5iQlGcPaM=;
	b=tJsyekGQ8qAj3PdtgGmEt0GIx27Iqdpp79749ucV0QQNDylETAQj2mTOMqx/k032l1Lclm
	w3ojzKb/g0vFDggu8I574v/E5rN9GkU4B8CUN/7SqUsa0OzEpBb9W11udRpsqJ4ZmB449V
	JwkwAd1Zgf09YSw5d0wEFGrf+eooqbxZAd4cm43p/jZ4wALUHPiPObiB8JFNItDwgonMNe
	5hsPhVqY2gthND56CwCVj/KejssMRMLqAYNdME6X+DmHfWtHnWSvRw4ttynL8UEEmctGNr
	ctw7AzYkx6Y2ISLIHyXs2QfT1vLonb8L1oIc1lswCnkNklTbTQMFRw7VTtETEg==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 4/6] staging: rtl8723bs: core: style cleanup
Date: Thu,  2 Apr 2026 18:04:27 +0300
Message-ID: <20260402150429.14761-5-khomenkov@mailbox.org>
In-Reply-To: <20260402150429.14761-1-khomenkov@mailbox.org>
References: <20260402150429.14761-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1429d9bb0967c4fa381
X-MBO-RS-META: z4n16u5ihk1u8r5iubxc988za6gajnpf

Cleanup coding style errors in the lines modified by the
previous logic changes. This includes removing extra
parentheses, fixing line wrapping for if-conditions, and
adding spaces around bitwise operators.

These changes are only style related and do not affect
the logic.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 12 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  5 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 49 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 21 ++++----
 7 files changed, 48 insertions(+), 49 deletions(-)

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
index 557813117b91..971a1db49015 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -151,7 +151,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -296,11 +296,11 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
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
@@ -471,8 +471,8 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 	struct sta_info *psta = NULL;
 	u8 short_GI = 0;
 
-	if (!(check_fwstate(pmlmepriv, _FW_LINKED))
-		&& !(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)))
+	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
+	    !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 		return 0;
 
 	psta = rtw_get_stainfo(&adapter->stapriv, get_bssid(pmlmepriv));
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c3457dc57851..ecf520115f4b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1767,9 +1767,8 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
-		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms
-			|| !is_same_ess(&competitor->network, &mlme->cur_network.network)
-		)
+		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms ||
+		    !is_same_ess(&competitor->network, &mlme->cur_network.network))
 			goto exit;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 7b70df548412..56ef19c37d88 100644
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
 
 
-	if (!(pmlmepriv->htpriv.ht_option) && (pstat->flags&WLAN_STA_HT)) {
+	if (!pmlmepriv->htpriv.ht_option && pstat->flags & WLAN_STA_HT) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 8d6bbc52e6e0..a05775e5fc14 100644
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
@@ -800,10 +801,9 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE)) &&
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
 	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
-	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
-		) {
+	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -847,8 +847,8 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE)) &&
-		     (check_fwstate(pmlmepriv, _FW_LINKED))) {
+	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
+		   check_fwstate(pmlmepriv, _FW_LINKED)) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
+	if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
@@ -1950,9 +1950,9 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if (!(padapter->bDriverStopped) &&
-				    !(padapter->bSurpriseRemoved))
-					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
+				if (!padapter->bDriverStopped &&
+				    !padapter->bSurpriseRemoved)
+					rtw_recv_indicatepkt(padapter, prframe); /* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
 				if (amsdu_to_msdu(padapter, prframe) != _SUCCESS)
@@ -1991,8 +1991,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if (!(padapter->bDriverStopped) &&
-			    !(padapter->bSurpriseRemoved)) {
+			if (!padapter->bDriverStopped &&
+			    !padapter->bSurpriseRemoved) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -2099,8 +2099,8 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if (!(padapter->bDriverStopped) &&
-			    !(padapter->bSurpriseRemoved)) {
+			if (!padapter->bDriverStopped &&
+			    !padapter->bSurpriseRemoved) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2110,7 +2110,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if (!(padapter->bDriverStopped) && !(padapter->bSurpriseRemoved)) {
+		if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
@@ -2198,10 +2198,11 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 
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
@@ -2287,10 +2288,8 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 		}
 
 		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) ||
-		    !check_fwstate(&adapter->mlmepriv, _FW_LINKED)
-		) {
+		    !check_fwstate(&adapter->mlmepriv, _FW_LINKED))
 			goto set_timer;
-		}
 
 		/* update value of signal_strength, rssi, signal_qual */
 		tmp_s = (avg_signal_strength + (_alpha - 1) * recvpriv->signal_strength);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index ad05f62bec4a..885053665cb7 100644
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
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) && (!(psta->state & _FW_LINKED))) {
+		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED)) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -915,7 +916,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pqospriv->qos_option)
 				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
+		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
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
-- 
2.53.0

