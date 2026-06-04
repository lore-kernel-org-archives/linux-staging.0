Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256D31985D
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566985; cv=none; b=kg+NhV7NHjGCSYfZkcXK4G8WdTs0h5rVErAs9FCUOZxWDJVMfCWyHVXBOTxoSVnbawBDt2lRKt/+4L8M3UHnKdbeJmEg6Orupi+t8NgGEpmWyRc9Q60xZYYcZyDiwOEwWjxL71xKEkDldPf42tUwFQ7F+Z8AaA2Jf8Cc33wcetk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566985; c=relaxed/simple;
	bh=Ubl6o5J9OUfG19shIuDTFW3W+CzGjQXgzcWZc5jXRc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSPjvn5zY2/RzZeFJ507HT2gkJIfNQyaiI6jd4KkklwRVq2bNJbGLzFKYutSElDvHaaHXZEAjxTz6PaEJmSwhriksxIIvOF83LVLK7WN4RTWw9w7TEIxw4CR9dWmKdtgc379GdNr5hfrYj/midPwESQf43PNzBMkRPV6pfG/HpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mavick.dev; spf=pass smtp.mailfrom=mavick.dev; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mavick.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mavick.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4gWKhh3RCJz9yYS;
	Thu,  4 Jun 2026 11:56:20 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of m@mavick.dev designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=m@mavick.dev
From: Eugene Mavick <m@mavick.dev>
To: gregkh@linuxfoundation.org,
	error27@gmail.com,
	khomenkov@mailbox.org,
	ethantidmore06@gmail.com,
	m.steinmoetzger@gmail.com,
	tomasz.unger@yahoo.pl,
	arthur.stupa@gmail.com,
	jannik@jrehkemper.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Eugene Mavick <m@mavick.dev>
Subject: [PATCH v6] staging: rtl8723bs: remove unnecessary parentheses
Date: Thu,  4 Jun 2026 17:56:17 +0800
Message-ID: <20260604095617.852425-1-m@mavick.dev>
In-Reply-To: <20260604074923.841460-1-m@mavick.dev>
References: <20260604074923.841460-1-m@mavick.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4gWKhh3RCJz9yYS

Remove unnecessary parantheses around &(foo->bar) type statements to
improve code readability

Signed-off-by: Eugene Mavick <m@mavick.dev>
---

V1->V2:
Fixed following checkpatch warnings on modified lines:
CHECK: Alignment should match open parenthesis(line 1114, 1249)
CHECK: Logical continuations should be on the previous line(line 1251)

V2->V3:
Removed comparison-statement-parentheses-removals(CSPR) per Dan Carpenter's review:
https://lore.kernel.org/all/ah1s_Eveaka0SHvQ@stanley.mountain/

V3->V4:
Removed overlooked CSPR;
Removed misleading fixed-warning-example in commit message suggesting
CSPR were still present

V4->V5:
Remove none &(foo->bar) type statement parantheses removal

V5->V6:
Remove overlooked none &(foo->bar) type statement parantheses removal 

v1: https://lore.kernel.org/all/20260530031621.443015-1-mavick4022@gmail.com/
v2: https://lore.kernel.org/all/20260531061022.573089-1-mavick4022@gmail.com/

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 68 +++++++++----------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b10d..604cc991c713 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -351,7 +351,7 @@ int is_client_associated_to_ap(struct adapter *padapter)
 		return _FAIL;
 
 	pmlmeext = &padapter->mlmeextpriv;
-	pmlmeinfo = &(pmlmeext->mlmext_info);
+	pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
 		return true;
@@ -362,7 +362,7 @@ int is_client_associated_to_ap(struct adapter *padapter)
 int is_client_associated_to_ibss(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		return true;
@@ -374,7 +374,7 @@ int is_IBSS_empty(struct adapter *padapter)
 {
 	unsigned int i;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	for (i = IBSS_START_MAC_ID; i < NUM_STA; i++) {
 		if (pmlmeinfo->FW_sta_info[i].status == 1)
@@ -477,7 +477,7 @@ void clear_cam_cache(struct adapter *adapter, u8 id)
 
 	spin_lock_bh(&cam_ctl->lock);
 
-	memset(&(dvobj->cam_cache[id]), 0, sizeof(struct cam_entry_cache));
+	memset(&dvobj->cam_cache[id], 0, sizeof(struct cam_entry_cache));
 
 	spin_unlock_bh(&cam_ctl->lock);
 }
@@ -629,7 +629,7 @@ int allocate_fw_sta_entry(struct adapter *padapter)
 {
 	unsigned int mac_id;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	for (mac_id = IBSS_START_MAC_ID; mac_id < NUM_STA; mac_id++) {
 		if (pmlmeinfo->FW_sta_info[mac_id].status == 0) {
@@ -645,7 +645,7 @@ int allocate_fw_sta_entry(struct adapter *padapter)
 void flush_all_cam_entry(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	invalidate_cam_all(padapter);
 	/* clear default key related key search setting */
@@ -657,19 +657,19 @@ void flush_all_cam_entry(struct adapter *padapter)
 int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 {
 	/* struct registry_priv *pregpriv = &padapter->registrypriv; */
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (pmlmepriv->qospriv.qos_option == 0) {
 		pmlmeinfo->WMM_enable = 0;
 		return false;
 	}
 
-	if (!memcmp(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element)))
+	if (!memcmp(&pmlmeinfo->WMM_param, (pIE->data + 6), sizeof(struct WMM_para_element)))
 		return false;
 
-	memcpy(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element));
+	memcpy(&pmlmeinfo->WMM_param, (pIE->data + 6), sizeof(struct WMM_para_element));
 
 	pmlmeinfo->WMM_enable = 1;
 	return true;
@@ -709,7 +709,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 	u32 acParm, i;
 	u32 edca[4], inx[4];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct registry_priv *pregpriv = &padapter->registrypriv;
 
@@ -810,9 +810,9 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 	unsigned char  new_bwmode;
 	unsigned char  new_ch_offset;
 	struct HT_info_element	 *pHT_info;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 	u8 cbw40_enable = 0;
@@ -867,7 +867,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 
 	if (true == pmlmeinfo->bwmode_updated) {
 		struct sta_info *psta;
-		struct wlan_bssid_ex	*cur_network = &(pmlmeinfo->network);
+		struct wlan_bssid_ex	*cur_network = &pmlmeinfo->network;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
 		/* set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode); */
@@ -897,7 +897,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	u8 max_AMPDU_len, min_MPDU_spacing;
 	u8 cur_ldpc_cap = 0, cur_stbc_cap = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
@@ -960,7 +960,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
@@ -974,7 +974,7 @@ void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 		return;
 
 	pmlmeinfo->HT_info_enable = 1;
-	memcpy(&(pmlmeinfo->HT_info), pIE->data, pIE->length);
+	memcpy(&pmlmeinfo->HT_info, pIE->data, pIE->length);
 }
 
 void HTOnAssocRsp(struct adapter *padapter)
@@ -983,7 +983,7 @@ void HTOnAssocRsp(struct adapter *padapter)
 	unsigned char min_MPDU_spacing;
 	/* struct registry_priv  *pregpriv = &padapter->registrypriv; */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable)) {
 		pmlmeinfo->HT_enable = 1;
@@ -1010,20 +1010,20 @@ void HTOnAssocRsp(struct adapter *padapter)
 void ERP_IE_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (pIE->length > 1)
 		return;
 
 	pmlmeinfo->ERP_enable = 1;
-	memcpy(&(pmlmeinfo->ERP_IE), pIE->data, pIE->length);
+	memcpy(&pmlmeinfo->ERP_IE, pIE->data, pIE->length);
 }
 
 void VCS_update(struct adapter *padapter, struct sta_info *psta)
 {
 	struct registry_priv  *pregpriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	switch (pregpriv->vrtl_carrier_sense) {/* 0:off 1:on 2:auto */
 	case 0: /* off */
@@ -1078,7 +1078,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	unsigned int len;
 	unsigned char *p;
 	unsigned short	val16, subtype;
-	struct wlan_network *cur_network = &(Adapter->mlmepriv.cur_network);
+	struct wlan_network *cur_network = &Adapter->mlmepriv.cur_network;
 	/* u8 wpa_ie[255], rsn_ie[255]; */
 	u16 wpa_len = 0, rsn_len = 0;
 	u8 encryp_protocol = 0;
@@ -1296,8 +1296,8 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 	u32 i;
 	struct ndis_80211_var_ie *pIE;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex		*cur_network = &pmlmeinfo->network;
 
 	if (rtw_get_capability((struct wlan_bssid_ex *)cur_network) & WLAN_CAPABILITY_PRIVACY) {
 		for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
@@ -1332,7 +1332,7 @@ int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps,
 {
 	unsigned char bit_offset;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (!(pmlmeinfo->HT_enable))
 		return _FAIL;
@@ -1438,7 +1438,7 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 void update_IOT_info(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	switch (pmlmeinfo->assoc_AP_vendor) {
 	case HT_IOT_PEER_MARVELL:
@@ -1468,7 +1468,7 @@ void update_IOT_info(struct adapter *padapter)
 void update_capinfo(struct adapter *Adapter, u16 updateCap)
 {
 	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	bool		ShortPreamble;
 
 	/*  Check preamble mode, 2005.01.06, by rcnjko. */
@@ -1520,8 +1520,8 @@ void update_wireless_mode(struct adapter *padapter)
 	int network_type = 0;
 	u32 SIFS_Timer;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 	unsigned char *rate = cur_network->supported_rates;
 
 	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable))
@@ -1544,7 +1544,7 @@ void update_wireless_mode(struct adapter *padapter)
 
 	SetHwReg8723BS(padapter, HW_VAR_RESP_SIFS,  (u8 *)&SIFS_Timer);
 
-	SetHwReg8723BS(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&(pmlmeext->cur_wireless_mode));
+	SetHwReg8723BS(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&pmlmeext->cur_wireless_mode);
 
 	if (pmlmeext->cur_wireless_mode & WIRELESS_11B)
 		update_mgnt_tx_rate(padapter, IEEE80211_CCK_RATE_1MB);
@@ -1569,8 +1569,8 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
 	int	support_rate_num = 0;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_SUPP_RATES, &ie_len, var_ie_len);
 	if (!pIE)
@@ -1596,7 +1596,7 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct ADDBA_request *preq = (struct ADDBA_request *)paddba_req;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	psta = rtw_get_stainfo(pstapriv, addr);
 
@@ -1639,7 +1639,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	__le32 *pbuf;
 	u64 tsf = 0;
 	u32 delay_ms;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pmlmeext->bcn_cnt++;
 
-- 
2.51.2

