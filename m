Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF143362139
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075340; cv=none; b=nPR4yb8CGN47Xqln0bwjHAH+bkwQOFfRVpcyZUXGc5CIhKlzYFu+vP+nCvhe48Q2nlfRDHsgrjLGy79V1TVYh+j962cs3mAz5wasFR7eNxHWnaBhy9EJPJVr349gcgpwA6+xjkN6hXfADXLrcEIZN2A6co9nw6480/Y94AIJ3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075340; c=relaxed/simple;
	bh=emc6D3jEqy6qPsOZgfdRUxtE7wbvgcte90k5c1eoxI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVUz59rB37cOOBN3OxWzUbEAaVeU313rdBYoUkY23u+IlXtdrlx0Irg5jfvEhkk90fQol6a9tYPTiWQm9tEgOONWvZdmE8hgyjiBagucHcVFMcK+nDkvZrniWEXWyLUu2I+07BJkoMfbq24NDX4KoJALFfPbCQY0GZ8cyPmsYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vmpp+x/p; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vmpp+x/p"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNzoVxqZiSskPMCrR1dOLfBNs9Eq55ztE3MK61PCZkQ=;
	b=Vmpp+x/prw73aC/7SCb6aZ3kzi1HnN2X/GI8NBJ8fdD7uL0/s23Zhzv2dKw0TpXqG54gfy
	9ZFlnU3/4rnW/YVNInByhGjvkdOlQ4zX6tgFLadR11Uln9UenctlvT5rGr7rvoAi7YTKkf
	ZaR8hChCQd0MEq9ou9MBTpXPflE7Ics=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 04/11] staging: rtl8723bs: core: align parameters with open parenthesis
Date: Mon, 13 Apr 2026 12:14:25 +0200
Message-ID: <20260413101432.158925-5-luka.gejak@linux.dev>
In-Reply-To: <20260413101432.158925-1-luka.gejak@linux.dev>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Align function parameters with the open parenthesis in the core
directory to adhere to the Linux kernel coding style. This resolves
"Alignment should match open parenthesis" warnings reported by
checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  8 +--
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  4 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 16 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 52 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 24 ++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c |  4 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 20 +++----
 9 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd47..13f0120ddaed 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -107,7 +107,7 @@ int rtw_check_network_type(unsigned char *rate, int channel)
 }
 
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
-				unsigned int *frlen)
+		     unsigned int *frlen)
 {
 	memcpy(pbuf, source, len);
 	*frlen = *frlen + len;
@@ -700,7 +700,7 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 		*len_attr = 0;
 
 	if ((wps_ie[0] != WLAN_EID_VENDOR_SPECIFIC) ||
-		(memcmp(wps_ie + 2, wps_oui, 4))) {
+	    (memcmp(wps_ie + 2, wps_oui, 4))) {
 		return attr_ptr;
 	}
 
@@ -764,7 +764,7 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 }
 
 static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
-					    struct rtw_ieee802_11_elems *elems,
+						struct rtw_ieee802_11_elems *elems,
 					    int show_errors)
 {
 	unsigned int oui;
@@ -910,7 +910,7 @@ enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
 			break;
 		case WLAN_EID_VENDOR_SPECIFIC:
 			if (rtw_ieee802_11_parse_vendor_specific(pos, elen,
-							     elems,
+								 elems,
 							     show_errors))
 				unknown++;
 			break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 439b91862d55..380ce8c89670 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -280,7 +280,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 }
 
 u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
-	enum ndis_802_11_network_infrastructure networktype)
+				      enum ndis_802_11_network_infrastructure networktype)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct	wlan_network	*cur_network = &pmlmepriv->cur_network;
@@ -300,7 +300,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			rtw_disassoc_cmd(padapter, 0, true);
 
 		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) ||
-			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
+		    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 35ee65c7a458..e5748463a5ff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -265,7 +265,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 bool rtw_if_up(struct adapter *padapter)
 {
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
+	    !check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		return false;
 
 	return true;
@@ -331,7 +331,7 @@ bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
-		    (pnetwork->network.privacy == 0))
+	    (pnetwork->network.privacy == 0))
 		return false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
@@ -409,7 +409,7 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -458,14 +458,14 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	rtw_bug_check(&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -1073,7 +1073,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	}
 
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+			      (cur_network->network.ie_length));
 
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8)cur_network->network.configuration.ds_config);
 }
@@ -1441,7 +1441,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
@@ -1998,7 +1998,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	for (i = 0; i < NUM_PMKID_CACHE; i++)
 		if ((p->PMKIDList[i].bUsed) &&
-				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+		    (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
 			return i;
 	return -1;
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 07e1b30239a3..53af3902f716 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -256,7 +256,7 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 }
 
 static int has_channel(struct rt_channel_info *channel_set,
-					   u8 chanset_size,
+		       u8 chanset_size,
 					   u8 chan)
 {
 	int i;
@@ -269,7 +269,7 @@ static int has_channel(struct rt_channel_info *channel_set,
 }
 
 static void init_channel_list(struct adapter *padapter, struct rt_channel_info *channel_set,
-							  u8 chanset_size,
+			      u8 chanset_size,
 							  struct p2p_channels *channel_list)
 {
 
@@ -303,7 +303,7 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 				continue;
 
 			if ((0 < (padapter->registrypriv.bw_mode & 0xf0)) &&
-				((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
+			    ((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
 				continue;
 
 			if (!reg) {
@@ -513,12 +513,12 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) == false &&
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE) == false) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE) == false) {
 		return _SUCCESS;
 	}
 
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _PROBEREQ_IE_OFFSET_, WLAN_EID_SSID, (int *)&ielen,
-			len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
+		       len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
 
 
 	/* check (wildcard) SSID */
@@ -713,7 +713,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
+	    psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
 			psecuritypriv->dot11PrivacyAlgrthm != _WEP104_)
 		auth_mode = 0;
 
@@ -800,7 +800,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		} else if (seq == 3) {
 
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
-					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
+				       len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
 			if (!p || ie_len <= 0) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -889,7 +889,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
-				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
+				       pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
 			if (!p)
 				goto authclnt_fail;
@@ -1001,7 +1001,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	/*  now we should check all the fields... */
 	/*  checking SSID */
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SSID, &ie_len,
-		pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+		       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 
 	if (!p || ie_len == 0) {
 		/*  broadcast ssid, however it is not allowed in assocreq */
@@ -1036,7 +1036,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		support_rate_num = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
-				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+			       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
 
 			if (support_rate_num + ie_len <= sizeof(supportRate)) {
@@ -1246,7 +1246,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 
 	if ((pstat->flags & WLAN_STA_HT) &&
-		    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
+	    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
 		      (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
 		/* goto OnAssocReqFail; */
@@ -1984,7 +1984,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
 	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	    padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -2002,7 +2002,7 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	struct submit_ctx sctx;
 
 	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	    padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return ret;
@@ -2031,7 +2031,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	    padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return -1;
@@ -2148,7 +2148,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			u8 sr = 0;
 
 			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr + TXDESC_OFFSET + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_,
-				pattrib->pktlen - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_, NULL, &wps_ielen);
+						pattrib->pktlen - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
 				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
 			if (sr != 0)
@@ -2334,7 +2334,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				return;
 
 			ssid_ie = rtw_get_ie(ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
-				(pframe - ies) - _FIXED_IE_LENGTH_);
+					     (pframe - ies) - _FIXED_IE_LENGTH_);
 
 			ssid_ielen_diff = cur_network->ssid.ssid_length - ssid_ielen;
 
@@ -2524,7 +2524,7 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 }
 
 int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+		      int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2930,7 +2930,7 @@ void issue_assocreq(struct adapter *padapter)
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
 			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
-					(!memcmp(pIE->data, WMM_OUI, 4)) ||
+			    (!memcmp(pIE->data, WMM_OUI, 4)) ||
 					(!memcmp(pIE->data, WPS_OUI, 4))) {
 				vs_ie_length = pIE->length;
 				if ((!padapter->registrypriv.wifi_spec) && (!memcmp(pIE->data, WPS_OUI, 4))) {
@@ -3307,7 +3307,7 @@ int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short rea
 }
 
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt,
-	int wait_ms)
+		    int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -4134,7 +4134,7 @@ void start_clnt_join(struct adapter *padapter)
 		beacon_timeout = decide_wait_for_beacon_timeout(pmlmeinfo->bcn_interval);
 		set_link_timer(pmlmeext, beacon_timeout);
 		_set_timer(&padapter->mlmepriv.assoc_timer,
-			(REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO * REASSOC_LIMIT) + beacon_timeout);
+			   (REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO * REASSOC_LIMIT) + beacon_timeout);
 
 		pmlmeinfo->state = WIFI_FW_AUTH_NULL | WIFI_FW_STATION_STATE;
 	} else if (caps & WLAN_CAPABILITY_IBSS) { /* adhoc client */
@@ -4231,7 +4231,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 	/*  Adjust channel plan by AP Country IE */
 	if (pregistrypriv->enable80211d &&
-		(!pmlmeext->update_channel_plan_by_ap_done)) {
+	    (!pmlmeext->update_channel_plan_by_ap_done)) {
 		u8 *ie, *p;
 		u32 len;
 		struct rt_channel_plan chplan_ap;
@@ -4281,7 +4281,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].ChannelNum == 0) ||
+				    (chplan_sta[i].ChannelNum == 0) ||
 					(chplan_sta[i].ChannelNum > 14))
 					break;
 
@@ -4309,7 +4309,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
+			       (chplan_sta[i].ChannelNum != 0) &&
 				(chplan_sta[i].ChannelNum <= 14)) {
 
 				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
@@ -4328,7 +4328,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		} else {
 			/*  keep original STA 2.4G channel plan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
+			       (chplan_sta[i].ChannelNum != 0) &&
 				(chplan_sta[i].ChannelNum <= 14)) {
 				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
 				chplan_new[k].ScanType = chplan_sta[i].ScanType;
@@ -5423,7 +5423,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 }
 
 static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
-	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
+				u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
@@ -5671,7 +5671,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index d0d6efaee2af..f3c1ed9823f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -337,7 +337,7 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 		key_type |= NL80211_KEYTYPE_PAIRWISE;
 
 	cfg80211_michael_mic_failure(padapter->pnetdev, (u8 *)&pmlmepriv->assoc_bssid[0], key_type, -1,
-		NULL, GFP_ATOMIC);
+				     NULL, GFP_ATOMIC);
 
 	memset(&ev, 0x00, sizeof(ev));
 	if (bgroup)
@@ -701,7 +701,7 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 }
 
 static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-			struct sta_info **psta)
+				     struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	signed int ret = _SUCCESS;
@@ -714,7 +714,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -789,7 +789,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 }
 
 static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-		       struct sta_info **psta)
+				    struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
@@ -894,7 +894,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 }
 
 static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-		       struct sta_info **psta)
+				    struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
@@ -1416,7 +1416,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	    adapter->securitypriv.binstallBIPkey == true) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
-			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
+		    (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
@@ -1457,10 +1457,10 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 		} else { /* 802.11w protect */
 			if (subtype == WIFI_ACTION) {
 				/* according 802.11-2012 standard, these five types are not robust types */
-				if (ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_PUBLIC          &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
+				if (ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_PUBLIC &&
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT &&
 					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_UNPROTECTED_WNM &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED  &&
+					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED &&
 					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
 					goto validate_80211w_fail;
 				}
@@ -1580,7 +1580,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	/* convert hdr + possible LLC headers into Ethernet header */
 	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
 	if ((!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
-		(memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
+	     (memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
 		(memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
 		/* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
 		 !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
@@ -1644,7 +1644,7 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 	eth_type = get_unaligned_be16(&sub_skb->data[6]);
 
 	if (sub_skb->len >= 8 &&
-		((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
+	    ((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
 		eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
 		!memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
 		/*
@@ -2198,7 +2198,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
-			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
+		    !is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
 			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
 			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 			!psecuritypriv->busetkipkey) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff2910..e95daba50fbf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -786,7 +786,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 }
 
 static signed int aes_cipher(u8 *key, uint	hdrlen,
-			u8 *pframe, uint plen)
+			     u8 *pframe, uint plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
@@ -989,7 +989,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 }
 
 static signed int aes_decipher(u8 *key, uint	hdrlen,
-			 u8 *pframe, uint plen)
+			       u8 *pframe, uint plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 07a6db1d2317..f1c7a4fac42f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -249,7 +249,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 		/* init recv timer */
 		timer_setup(&preorder_ctrl->reordering_ctrl_timer,
-				rtw_reordering_ctrl_timeout_handler, 0);
+			    rtw_reordering_ctrl_timeout_handler, 0);
 	}
 
 	/* init for DM */
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..4d60f0ce5f95 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1209,7 +1209,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	bssid->ssid.ssid_length = ssid_len;
 
 	if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
-			bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
+	    bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
 		if (bssid->ssid.ssid[0] != '\0' &&
 		    bssid->ssid.ssid_length != 0) /* not hidden ssid */
 			goto _mismatch;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7bce0343d59f..136c6493b134 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -407,7 +407,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 				u8 HTOpMode = pmlmeinfo->HT_protection;
 
 				if ((pmlmeext->cur_bwmode && (HTOpMode == 2 || HTOpMode == 3)) ||
-					(!pmlmeext->cur_bwmode && HTOpMode == 3)) {
+				    (!pmlmeext->cur_bwmode && HTOpMode == 3)) {
 					pattrib->vcs_mode = RTS_CTS;
 					break;
 				}
@@ -564,7 +564,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
 
 	if (pattrib->encrypt &&
-		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
+	    ((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
 		pattrib->bswenc = true;
 	else
 		pattrib->bswenc = false;
@@ -653,7 +653,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -680,7 +680,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
 			if (pattrib->ether_type == ETH_P_IP) {/*  IP header */
 				if (((tmp[21] == 68) && (tmp[23] == 67)) ||
-					((tmp[21] == 67) && (tmp[23] == 68))) {
+				    ((tmp[21] == 67) && (tmp[23] == 68))) {
 					/*  68 : UDP BOOTP client */
 					/*  67 : UDP BOOTP server */
 					pattrib->dhcp_pkt = 1;
@@ -1017,7 +1017,7 @@ s32 rtw_txframes_pending(struct adapter *padapter)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	return ((!list_empty(&pxmitpriv->be_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->bk_pending.queue)) ||
+		(!list_empty(&pxmitpriv->bk_pending.queue)) ||
 			 (!list_empty(&pxmitpriv->vi_pending.queue)) ||
 			 (!list_empty(&pxmitpriv->vo_pending.queue)));
 }
@@ -1260,7 +1260,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
-			subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
+		    subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
 			if (pattrib->psta)
 				psta = pattrib->psta;
 			else
@@ -1274,7 +1274,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 
 			/* according 802.11-2012 standard, these five types are not robust types */
 			if (subtype == WIFI_ACTION &&
-			(pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_PUBLIC ||
+			    (pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_PUBLIC ||
 			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_HT ||
 			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_UNPROTECTED_WNM ||
 			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_SELF_PROTECTED  ||
@@ -1435,7 +1435,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 }
 
 static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+						enum cmdbuf_type buf_type)
 {
 	struct xmit_buf *pxmitbuf =  NULL;
 
@@ -1456,7 +1456,7 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 }
 
 struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+					    enum cmdbuf_type buf_type)
 {
 	struct xmit_frame		*pcmdframe;
 	struct xmit_buf		*pxmitbuf;
@@ -2486,7 +2486,7 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 			type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);
 
 			if ((type == WIFI_PROBEREQ) ||
-				(type == WIFI_DATA_NULL) ||
+			    (type == WIFI_DATA_NULL) ||
 				(type == WIFI_QOS_DATA_NULL)) {
 				list_del_init(&pxmitbuf->list);
 				break;
-- 
2.53.0

