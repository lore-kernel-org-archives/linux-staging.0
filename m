Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8103EF0DD
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312752; cv=none; b=UpfHxVmOkhnUfe5AZQc8vlZ23B56E2rlI1LaqXSvb2QURRa4DSfl2fTKh54vAXs+99kVaxWtIDwNBWZIwdUc/1EIZYnfegErUibKZxDmJf5n8FNN7i0YJXjlpIaXpk/YxjmIAIYm1nuilaJwxVbLa+bl/LLtCfOeukIPsWupmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312752; c=relaxed/simple;
	bh=c5o8EshMqgTdjKkaRqqTkB8DiJMECAw0yaJ3V3HLjIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apolliJ3tquV2sEKSfMXHYrnYl5dkw9qIAYdQZCP2jkiqaLrtuaEEL27GAe3EbJXPGwI7uAteOiLiINhTsBxzJdxq7Uv9ilPBCiEJZsupT/aJzEHBuua8GRo20n/4GIrBNyz8TYPe2enYoE8tqNwfXUAuZZm6e/w31wsv603/dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MH2JyehQ; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MH2JyehQ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g4BCH2288z9tnJ;
	Mon, 27 Apr 2026 19:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777312747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBBe84umNd5sxIHU+CoZhsAA+UoUMKx1w2kw9dxPxOU=;
	b=MH2JyehQpV5wditUZqv7iGkOZ7ghGsMBayUk2uyTvSQORm3wIkKBghx1OA1gySXL2hy1tX
	2JGs2haWgOdzfg0zogv9oPIgnZmprzbi5xRZh/BeA2lUJXPjloY3y+KQcIdrZwTyOrnhxh
	BdsmM8hw9WghpE/fKBlrtpO0/+twYIAmvAH/VtkBTJONo6RNNiJ2RSvkEeCUgkWfUBiXLz
	M/RewQ0mo+fLPjxreyEOnuP1+0Uh4Qw98uKSQnRS7VXlwPpu/RLivoZ9oW9aGGMvMwfuYv
	WJbdgQ8T74IdVYJM2DWv6kYxve0QFYC+XzOUHyr2iY2hvLNSSk6QE1PuX55M4Q==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v6 7/8] staging: rtl8723bs: fix alignment of continued conditions
Date: Mon, 27 Apr 2026 20:58:45 +0300
Message-ID: <20260427175846.23470-8-khomenkov@mailbox.org>
In-Reply-To: <20260427175846.23470-1-khomenkov@mailbox.org>
References: <20260427175846.23470-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qu9diodx6tewjzm4dh1q1bf3496ojpji
X-MBO-RS-ID: e0d626585c30bf60f35

Fix alignment of continued conditions to improve code readability
and conform to the Linux kernel coding style. This fixes the
PARENTHESIS_ALIGNMENT issues identified by checkpatch.pl.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c      |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_xmit.c      |  4 ++--
 drivers/staging/rtl8723bs/hal/odm_DIG.c        | 16 ++++++----------
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c    |  6 ++----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c   |  6 ++----
 8 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index b5a363df7eb7..b6cc15ccf717 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -300,7 +300,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			rtw_disassoc_cmd(padapter, 0, true);
 
 		if (check_fwstate(pmlmepriv, _FW_LINKED) ||
-			check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
+		    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
@@ -471,7 +471,7 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 	u8 short_GI = 0;
 
 	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
-		!check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
+	    !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 		return 0;
 
 	psta = rtw_get_stainfo(&adapter->stapriv, get_bssid(pmlmepriv));
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3c4c7d902295..4381df2b89d6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1758,7 +1758,7 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 
 	if (rtw_to_roam(adapter) > 0) {
 		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms ||
-			!is_same_ess(&competitor->network, &mlme->cur_network.network)
+		    !is_same_ess(&competitor->network, &mlme->cur_network.network)
 		)
 			goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f870e6c1f209..0c84973f7545 100644
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
index 098a08c11fe5..d61b0fd4bfcd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -704,7 +704,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -834,7 +834,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		}
 
 	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
-		     check_fwstate(pmlmepriv, _FW_LINKED)) {
+		   check_fwstate(pmlmepriv, _FW_LINKED)) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -2170,10 +2170,10 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
-			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
-			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
-			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
-			!psecuritypriv->busetkipkey) {
+		    !is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
+		    (prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
+		    psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
+		    !psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
 
 			if (recvpriv->free_recvframe_cnt < NR_RECVFRAME / 4) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9ac8a8f74397..037a426ed15e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -691,7 +691,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -963,7 +963,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (pattrib->qos_en)
 				qos_option = true;
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+			   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
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
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f27970ef54c8..b801a78f69e0 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -583,10 +583,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
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
-- 
2.53.0

