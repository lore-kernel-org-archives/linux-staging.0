Received: from v57.v51e342bd.use4.send.mailgun.net (v57.v51e342bd.use4.send.mailgun.net [69.72.42.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAB93BBFBB
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.72.42.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781900202; cv=none; b=nxZHZc1KQNRRSVOzWs06Qm1DStB5l/Vno2tNhwoL6jXO0JH/IZjmRotfeMMR90ILzSwztOBXVCyA12i3tOcvmG3BpAOykO1annlzHAzWSDOcGgDirAWqXK3XtenD3fpcG4V5e3iEjBmQnV8v3wApHg5vTqSeyY7E5Ap7D8ks02M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781900202; c=relaxed/simple;
	bh=NQ5oebZqaioTZCdlT5G57SDgxqCHjgnQHPV940x4c/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxjyxJBtHzt9De2NRoLS3eT1QqqUDyW17nYUHZm04XG/4YT+QIQJ+Hj8xni6o5Vx4AsdMERIFMKKJoElhBynBomgIwQ1Xcq6La0Z2qFgex4anSEmJEpmWbFVCE2yh3xmXpOkZ7z0Fp3ahX2cmWVKHEF9gqEPnkl55O0RdiAKsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com; spf=pass smtp.mailfrom=kylejin.com; dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b=Q3tT0mxG; arc=none smtp.client-ip=69.72.42.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylejin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b="Q3tT0mxG"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=kylejin.com; q=dns/txt; s=pic; t=1781900200; x=1781907400;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=iM7A3h00NR9pHbaRvdw8k8PaIzY71GZriGP3Glj/Njg=;
 b=Q3tT0mxGxS7yLyS5FJMMD2lZgeHIfat/Aj+3zpNh6l8TeIW7vfHmrpARtttCit/0WndOwc9hpF9i76gTu3szHQAbbn1ZgQ5lKybMWo+O8x89pmTdPQ+A2hsvbImG5fAEDqZt1TZcC6gaw5O0DqAUJ2SaagihDfE08sFcTw5ON38=
X-Mailgun-Sid: WyIzZGNmMCIsImxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2IiwiZmYyZGE4ZSJd
Received: from ampere-a1.vcn05022301.oraclevcn.com (unknown [147.224.12.124]) by
 e3d870b472b01418d57d40ffe2a2b89346762891e9115f87a6bcaf4a979c433f with SMTP id
 6a35a3a809d9b2084b775601 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 19 Jun 2026 20:16:40 GMT
X-Mailgun-Sending-Ip: 69.72.42.7
Sender: kj@kylejin.com
From: Kai Cheng Jin <kj@kylejin.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Kai Cheng Jin <kj@kylejin.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: remove unnecessary parentheses in rtl8723b_cmd.c
Date: Fri, 19 Jun 2026 13:15:59 -0700
Message-ID: <20260619201600.973619-2-kj@kylejin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619201600.973619-1-kj@kylejin.com>
References: <ajT4n4p7CKiApCPF@stanley.mountain>
 <20260619201600.973619-1-kj@kylejin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses after address-of operators,
as reported by checkpatch.pl.

Signed-off-by: Kai Cheng Jin <kj@kylejin.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 44 ++++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d92dde57b720..b4e43c3b7718 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -103,17 +103,17 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	u32 rate_len, pktlen;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
-	fctrl = &(pwlanhdr->frame_control);
+	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 
 	eth_broadcast_addr(pwlanhdr->addr1);
-	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
@@ -156,7 +156,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pktlen);
 
 	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pktlen);
+	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&cur_network->configuration.ds_config, &pktlen);
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
@@ -187,13 +187,13 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 {
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	/*  Frame control. */
-	fctrl = &(pwlanhdr->frame_control);
+	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 	SetPwrMgt(fctrl);
 	SetFrameSubType(pframe, WIFI_PSPOLL);
@@ -202,10 +202,10 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
 
 	/*  BSSID. */
-	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
+	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network));
 
 	/*  TA. */
-	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 
 	*pLength = 16;
 }
@@ -226,8 +226,8 @@ static void ConstructNullFunctionData(
 	u32 pktlen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
@@ -239,21 +239,21 @@ static void ConstructNullFunctionData(
 	switch (cur_network->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
 		SetToDs(fctrl);
-		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
-		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network));
+		ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
 	case Ndis802_11APMode:
 		SetFrDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
-		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
-		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&pmlmeinfo->network));
+		ether_addr_copy(pwlanhdr->addr3, myid(&padapter->eeprompriv));
 		break;
 	case Ndis802_11IBSS:
 	default:
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
-		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
-		ether_addr_copy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)));
+		ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
+		ether_addr_copy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network));
 		break;
 	}
 
@@ -605,8 +605,8 @@ static void rtl8723b_set_FwRsvdPagePkt(
 void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	bool bcn_valid = false;
 	u8 DLBcnCount = 0;
 	u32 poll = 0;
@@ -710,7 +710,7 @@ void rtl8723b_Add_RateATid(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_info *psta;
 	u8 mac_id = arg[0];
 	u8 raid = arg[1];
-- 
2.54.0

