Received: from outbound.st.icloud.com (p-east2-cluster2-host8-snip4-10.eps.apple.com [57.103.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C92E173D
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434299; cv=none; b=JJz0ke8AeA+ZLi7S+O/mvv3/mSVPeO0IlYSp2eW2+sq8JRbOmVms+kyNSn7cIxuJdOJOr31+CNI8ca/VNQkK5IPF/WgJ5qB2KFBmw0DDHM/DImnm2HpJ6PhbiNynD2ksMsHGWwCCebLIVKPiXT8HQkGEZhB2uRMh5nQ9M+sxtoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434299; c=relaxed/simple;
	bh=4qb5JIggQPeMiPi0VrHGF6Lx3igAUdIalXayhvwrKP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcanTsLReIBXAtYtgnQGOmnaWOHRnuqupO0iPOH+tEBLx6LkDy6HV4PTt9B1RRVRdLtLrA/IiVX32IpH48Jk529JZzpxAxqmw9xtcfI0GZTjaaVoWXLhTbAkRgluitGKnpXgxqtc1WkW8EsD2Czd8aB772OZie9TXdStnMVt0dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=m6fYHR4m; arc=none smtp.client-ip=57.103.78.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="m6fYHR4m"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPS id D48571801FCB;
	Tue, 02 Jun 2026 21:04:56 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQBLHVQFRQNHF0kEWhcOVk1TDV8IRA9XElsZRhl3AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBEsTBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQJGCUoBXAdfAkcXTABbA0YHXVMNXwhED1cSWxlGGXcCURxWDVdDVARfThkMSh1SVlsTVRdGCQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1780434297; x=1783026297; bh=qZggW1jhYpe5GtFQIMMKZqWcrhZMR6apd4LRpYsrGCU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=m6fYHR4mJgGjxPt8PuVXEbbm8TJqnvqK6CWWK8cx1PREN6MInble3Kp++FiJFGhcE7eOYmvhCReiV9MDjEYw/bBdJ+dfWn/6hPLfq2EKBMi065sw3ETD/psMuqwimmIrjE7WN5Rzt7Tykippr/46JrW3F1QszTBNUO9pcDxO2F6TJybQVnSdnKijv06p6dmOAVewzRtE2lZxYvhdc8rcuHNWyhM90VHWG+j88zUmcb3DqWiB21f7F0aDdlfnJmcXocm0Nu2ogzRq0UZqo/+2TQRBZk5uspFH6ELt6Qz+7rL60YxpSVisDPVmvGr/YfqTJKLeTOHwDLs6xnssXTxFjg==
Received: from DESKTOP-MKLAF7C.tail7ab390.ts.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPSA id 892E418000B1;
	Tue, 02 Jun 2026 21:04:51 +0000 (UTC)
From: Jules Debbaut <julesdebbaut@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jules Debbaut <julesdebbaut@icloud.com>
Subject: [PATCH 5/5] staging: rtl8723bs: fix lines exceeding 100 columns
Date: Tue,  2 Jun 2026 23:04:07 +0200
Message-ID: <20260602210407.4364-5-julesdebbaut@icloud.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602210407.4364-1-julesdebbaut@icloud.com>
References: <20260602210407.4364-1-julesdebbaut@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=F9xat6hN c=1 sm=1 tr=0 ts=6a1f4578
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=x7bEGLp0ZPQA:10
 a=PddA0_aAOYkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=nWqTTy_IXcg3zfwLrR4A:9
X-Proofpoint-GUID: gFHKxSyYx4fu9nT1x4303be8Q9P_QsL3
X-Proofpoint-ORIG-GUID: gFHKxSyYx4fu9nT1x4303be8Q9P_QsL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNSBTYWx0ZWRfX+H2cEDuxfrcr
 V6YsASgtT2n2Z+RxFzhs/lCNaOVmIF9YYYk+I2InxRAsCNDfskkZZT2mbHWpuWeVoM0TKWjfSMF
 COSIviM7FoFurpbU8IHzndE8mbKtOu/CaVbFvJ4hYw7auRWwmCGOu9WbF+JtNmhE9MvdCrZ7FP8
 F01PI9PI0wHEdpaElJyhyqH9BUrapL08ol7zYBS+nqUWpu4Diher/hmSW/xab50UQw50tVKdChU
 C3C0wpJABDTWBzC48YMudvKYu09/b2/FKumiYQlf36Hdr9KYL06zdMHGwdtgkhJzCH3BwNUH/Pv
 aEikvjnB2Xu8b7wdCulzNYuZI8fr4BtZtBzzoutdM5QDlhH8dmBOz934wCSlbY=

Break long lines to fit within the 100-column limit. Extract
local variables for repeated expressions in rtw_get_bcn_info()
to shorten long rtw_get_ie() calls.

Signed-off-by: Jules Debbaut <julesdebbaut@icloud.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 42 ++++++++++++-------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 7cf014e25..8f08d7e74 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -237,7 +237,8 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 	search_len = *ies_len - offset;
 
 	while (1) {
-		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
+		target_ie = rtw_get_ie_ex(start, search_len, eid, oui,
+					  oui_len, NULL, &target_ielen);
 		if (target_ie && target_ielen) {
 			u8 *remain_ies = target_ie + target_ielen;
 			uint remain_len = search_len - (remain_ies - start);
@@ -274,7 +275,8 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 	case WIRELESS_11_24N:
 	case WIRELESS_11BG_24N:
 		memcpy(supported_rates, WIFI_CCKRATES, IEEE80211_CCK_RATE_LEN);
-		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN, WIFI_OFDMRATES, IEEE80211_NUM_OFDM_RATESLEN);
+		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN,
+		       WIFI_OFDMRATES, IEEE80211_NUM_OFDM_RATESLEN);
 		break;
 	}
 }
@@ -301,7 +303,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie += sz;
 
 	/* beacon interval : 2bytes */
-	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration.beacon_period);/* BCN_INTERVAL; */
+	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration.beacon_period);
+	/* BCN_INTERVAL; */
 	sz += 2;
 	ie += 2;
 
@@ -320,7 +323,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie += 2;
 
 	/* SSID */
-	ie = rtw_set_ie(ie, WLAN_EID_SSID, pdev_network->ssid.ssid_length, pdev_network->ssid.ssid, &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_SSID, pdev_network->ssid.ssid_length,
+			pdev_network->ssid.ssid, &sz);
 
 	/* supported rates */
 	wireless_mode = pregistrypriv->wireless_mode;
@@ -332,17 +336,21 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	if (rate_len > 8) {
 		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supported_rates, &sz);
 	} else {
-		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->supported_rates, &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len,
+				pdev_network->supported_rates, &sz);
 	}
 
 	/* DS parameter set */
-	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&pdev_network->configuration.ds_config, &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1,
+			(u8 *)&pdev_network->configuration.ds_config, &sz);
 
 	/* IBSS Parameter Set */
-	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&pdev_network->configuration.atim_window, &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2,
+			(u8 *)&pdev_network->configuration.atim_window, &sz);
 
 	if (rate_len > 8)
-		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8),
+				(pdev_network->supported_rates + 8), &sz);
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
@@ -442,7 +450,8 @@ int rtw_get_wpa2_cipher_suite(u8 *s)
 	return 0;
 }
 
-int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher,
+		     int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -507,7 +516,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 	return ret;
 }
 
-int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher,
+		      int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -746,7 +756,8 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen,
+			     u16 target_attr_id, u8 *buf_content, uint *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -1053,6 +1064,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	unsigned int len;
 	unsigned char *p;
 	__le16 le_cap;
+	u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+	uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
 
 	memcpy((u8 *)&le_cap, rtw_get_capability_from_ie(pnetwork->network.ies), 2);
 	cap = le16_to_cpu(le_cap);
@@ -1062,7 +1075,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	} else {
 		pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_OPENSYS;
 	}
-	rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL, &rsn_len, NULL, &wpa_len);
+	rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length,
+		       NULL, &rsn_len, NULL, &wpa_len);
 
 	if (rsn_len > 0) {
 		pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_WPA2;
@@ -1076,7 +1090,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 
 	/* get bwmode and ch_offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(ies, WLAN_EID_HT_CAPABILITY, &len, ie_len);
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1084,7 +1098,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		pnetwork->bcn_info.ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(ies, WLAN_EID_HT_OPERATION, &len, ie_len);
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		pnetwork->bcn_info.ht_info_infos_0 = pht_info->infos[0];
-- 
2.53.0

