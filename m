Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AA3BFACF
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837247; cv=none; b=SFhqVe7NZeVjaN4LuOzKS3xsl5pdVNWCgcNXeA/6wjqtuQZWGldUgLYawIkvRRIRwf85DujQ3Awo7KYOVvcr2k5We/9DWBa4DsA8WrjNoqlxc3pRkMe9wkbMDUVcrH2x++OA2Ed/9V6Jd3JgAjeAVjQMpK2sXjGgoW0Henw4RE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837247; c=relaxed/simple;
	bh=B4Q2wXKxSv7dDA2LXaAqvi+czZSOvFr9vegOyXRNwT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTVwm3+bWM+vFCfOYC1OSxRYQeGx8eyUuxcsgVwx7c29pO6jUBrW783hYVrp6QySxUwOJXlMZSkoePDdumvm1wQOIXEEK+A+wgl/+kkaZC5Sbf/h8TzaWZIWv2JMIOznGvpU65vC3tr0RF0N5OdScH9/hp3aaMG8uQMCrNwXw6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=KWC/WST7; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="KWC/WST7"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gqTHf0YW5z9sKl;
	Tue, 30 Jun 2026 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782837246; bh=pemP1IfxbflWREGCcc5R5pGnBWhWzMsu6094QMpgwaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KWC/WST7PzNdLZxPZ/xSTuhVChGiEXzcyPwFd62FDJTDPVjHcvsxABuwDqo3NMG8c
	 uEE82ItO3V0KkAYAxVJYppeG32fWpw1M8ogogaffjRnlql/Z5eXpg16fLuUmmaKXb+
	 IIweZciiVl32CAB/dwLBvhTkUYKTQZWcfIn3gMtU=
X-Riseup-User-ID: 515AB7E85ADCD04C53D2957B45FF230E6479AEFC7B4F0650E7DFB87ED6A88F9D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4gqTHd3H23z1yJP;
	Tue, 30 Jun 2026 16:34:05 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH 5/6] staging: rtl8723bs: remove unnecessary parentheses in rtl8723b_cmd.c
Date: Tue, 30 Jun 2026 17:33:15 +0100
Message-ID: <20260630163316.1128319-6-agarrigues@riseup.net>
In-Reply-To: <20260630163316.1128319-1-agarrigues@riseup.net>
References: <20260630163316.1128319-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around address-of structure members.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 44 ++++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 47985b498fb2..e4af4348e037 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -102,17 +102,17 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
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
 
 	SetSeqNum(pwlanhdr, 0);
@@ -154,7 +154,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pktlen);
 
 	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pktlen);
+	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&cur_network->configuration.ds_config, &pktlen);
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
@@ -184,13 +184,13 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
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
@@ -199,10 +199,10 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
 
 	/*  BSSID. */
-	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
+	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network));
 
 	/*  TA. */
-	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 
 	*pLength = 16;
 }
@@ -221,8 +221,8 @@ static void ConstructNullFunctionData(struct adapter *padapter,
 	u32 pktlen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
@@ -234,21 +234,21 @@ static void ConstructNullFunctionData(struct adapter *padapter,
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
 
@@ -587,8 +587,8 @@ static void rtl8723b_set_FwRsvdPagePkt(struct adapter *padapter, bool bDLFinishe
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
@@ -687,7 +687,7 @@ void rtl8723b_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rss
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

