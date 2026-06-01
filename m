Received: from sonic306-20.consmr.mail.ir2.yahoo.com (sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B33DD87D
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337534; cv=none; b=DMmVYKyDLlVz42PBunLHNhQzkxES4uxZvTNw139tjjqZ+ktlgd4T5g0XjWZYORQ3DA5A0YV7wPolsrLrmZ1kf4CioCnDAx6jsjo6xeeS8owJ0Js0Gji6fwyqFOJ0fClZLNzJY7GvgCL6JFXhAzX9ilRMeUf8QhSSbEnGZRoCR+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337534; c=relaxed/simple;
	bh=Bo8S1sSUDV88QO+wfGySEgNIK9zbyRCkuw3jn4KkhDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=azZ+9xBGJDou8OfrxH1IRXDGQnyJMwvzcOCPEQZBqu67FqoEuPwLL+8GMbKA1281pADaeT1nu9KIr0lbNE0Yi/mFGv7JiztaPTDEKaY6lkccplP1jdWQaveC2z6uRZfTgGUybFK4Y/DsohiFi6a2VjXgEVxHfbqs8+T+IVQNiRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=VzObJ4H8; arc=none smtp.client-ip=77.238.176.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="VzObJ4H8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1780337524; bh=4bHvn5zjmjqUCTXmY2EhkQbHKPikeS/69xL76erym8I=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=VzObJ4H8TeOBK1KmuqWjETDfn9cOqtN8t5L0Avp0IRUtoVu4m0qbYqaj7FpEN7p5XLx12pWekPmeLUvypkfZ45LJYF3h7aks7tY1vE+XJevh2wVdbZwNpvRR6/miBWqZvXYkFWGkQ2zBHXkqEbMVIyj9S6I/Dj4ioHhcE3tFg1lbQ9LyswcDrwSQl7bjW3J36QvcL4Z01Y0XhnxZPjxQrrpARDjQU4FleWUKjxNfxAIvR8VSxhZ5tQTqOUpWWyrlcCXPLHhDlL0hOB8U5CNJPK5is9m+RvVvZu7+tZXv63jvVs1JI03YCA+WIPSZaDaLSbRceGmKV+EJCn3rN5l+NA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1780337524; bh=kbU2a24XDyMBZQaovvhvOpScSmHtp1/wszDjGY1EnBx=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=jhgBNNOwhAJTTbE7qs2Arq3IS3Smfw/+7Y6FHMFpp7WPh808ZxB3JrVFHFiL1KmbWUygQ6DUfF6ucSfFxVWj+BVJBZ9DXiP4NCfksL42mZzvTgjb7NIo4SrSgy3/fnmG6fuEDgZQwHO3s3rufxhNiQRx0OvCZQ8ngzy2TShTtPuyydQRWBmUZ5RosW9+5ghRsaBXvMbqSRW5AIGnz0wVWr+f2rRlzW4kYVWbn2STKm92gzNDbOOiwT6s4bTAwViclpfVzIFh1S/t0TBMaZMOl3Au5fXSNGX8d6q6xprjwZfOfb0lkAl/TWXySaKkC+F1QHKO0eqfFAj34WAWetAA/g==
X-YMail-OSG: GKBb1dkVM1kJcqkmYPHEM2NQMwovJ.A_thy4q4dERwPCOQGlak89piIiAgk91Qq
 xTHeNvvcVGdeWFmfsR_oVEXuV17zD1PiKFSVSWyHi1Y1KhxHRmKlKsGXJRNBpZu6bep2rRdvEfeC
 HtketGDFVggBwGXjXZ5ex_sGeErGdm.OBaiEL6io9f76re6lJF.DTDWXhatUUXvMNGXBNYM1vHDv
 pv_i0Qkl71RrJTR8P3pp1VBTH9S..0nhZKkz8NEEgGgAjjqNzdDIaX1TXsi5pVTyshk8N0CvoH7i
 lDioY5UjrwgCp6oo0gVRgjeLVVh_i5XkRxQBcV73ddVvxbIVxJVaDQXn_JPPaKfFdqGXM.B7RlkF
 iPeO3KgRV5nkN_gS6hGsOgiePRzkSSM3lJ442_RdQBtJfQHiSRWow8xuQ5JseLOurT99mGMMcgDc
 ZH2uuw_8ZqAWrWsUDbzOHlQRxXCdMYLXs2JRVP6Sr4_69hFYjtEjygOKVXVPUwcLA86HnqcN1JoJ
 J1Ux_AIHcsxD67PiR8CxCEqF_xCwcH7Nl3YLsRkhjZMebpqhFr9SwnPNU.BVSupgMjDekpjsjykd
 1PQcpXVeHLplj1_oXeV7uDgxNyuzHWDluzmyY._R0WMZK1UilXZGMTMfQ2.5GYKZw4M3NKNRXSoR
 zVg7lSIwf6LMrrLWVxy1aJycYNoU99BbKB9o6dvFVaSvN7E1dpNI9hbGX5khMgCMSjtBtyGxkPtU
 FZNzxWZ.4X.F8Dw2B5Qcx.WFy7kw4..QPMWnJNSqBT3E5azW5TXDCMbS.GQAc9B7TSc_WXSNUjo3
 zcOQBXdS.tB_H5SoQGfbNfKAQ_VW9wvC8IV5C1sukyqXPgHLp9bFh.k3cuicYXkvNKxlywymdM7b
 rCp7lr_4Sj9bIbQ1OZnO9IDs6rHeIkbZleZnVus5iz40PGX_EnMCNF14iJr43QrmeZrZzzwbc5UA
 bD2Th6rLDHeIUJ1ZInVBXhSe9Db_vRMJmsn9S77ZXVIM.GGQKi5wTHKJkY1RlCrclKNMd0unmvfm
 6qHgzlxjv_0loGkRPAjWbgMAHX.qVdWo1kN6gMo5A63n4o1JW9Y4J712Omt.jiTWgFpNaJZDNOEr
 b2sKGaySzumJgpMtAtx.SMzlzMqY7ezJDkFJecmDlVeU5FbvNG8KQf_h5xRKORzmeOXKvGGegF0l
 3d3GHHG8lk23k8y4xhOZz1a34m3t1niha23AeEnNW6_h2JefAqciXV1eVgcMo99AeWCMmyqJPlSY
 SElLzlxhkfy1TdQVAN7uHDU5G7mUDgCrnei44WRUaJFCmUDFLdYfh_JMwdG2jTspQbbNWU_TVLCJ
 IvfgY0miIEwk7cfV2hteiYmoPOfKQbebgXjQ6C1ONWrF9Fq_JgqgXWx7J5PCn9LKLmI4kOMI98Rs
 onpQ75xL5vN6hxtdRrCPnvakb5aqQXf335rCLvniLI2g0FXIGILhNH_w0BG3o1KDskmhcAhGLLjO
 vS0Inx_gfEcIMBwe24cUYrRCXTMiUW0p3IW_d8ByMyBMJ.UKlDRGsrGw9Brkd_a.MYCqOru3fTO5
 l_KMfzUmgJ5mOhBOMdjjRP.Fh6UdHM9n_0ScLZtIceOjEtD57nRrE9N6ZDiVE8hZ6Ly9p.9ogna7
 girQnkGI0M5rd_UylpvWvpBmV6cTordjISlb81Fluv.3xnFJsRLjcEhHcr8osYrYW7LbqE4EXktK
 JIU2j9fmhlX2X8khS1bB_oLxStGg4PPq.q36YL2CSt.RrRyTKaCaqE0SQDPnlQzf2tP7OiSMVnJl
 sG17PGVPnZvyoKhY4Vp5V4hN9Sa9D7mKErAAZPg2TcbhqvxOWgSBGKDsqPemKOh7Qbqd2SxyY1.m
 6XfgErdeqPv9UbEizo7TJONpkVRBS6v7iLlWmtoUM.ffNwpN2np09.s.soCNgPNEkWHxayl4_Mjx
 YpiJE.dZavLj6g77xXdX596UusUTs6bOtt5TifeyeF_.wRbcKe3m8Xod8fEulg7Yh7eCmWmQgggi
 PNPibqY03hkdGUJTgXl75LVirBKTYS5BuQ48unmYbK0Px1eKsjkCi_7__E31UZiih6VstdEBK.rM
 vILEHvaZENbJeCXmG9FMjsQPt77lBiYx2kCKavn8yLJgRK02s637k2jWovQ922jXLUD0Uo.7Wxdj
 dySUgfRtHKrAfTnOJdSzwn16xSX0F9BaX5dAFRuziDGc8p3p8cVX9d7_Qv5Lql_IPE68Dym90mjE
 YRvp5EZKx6xexRxIykfqBE2B1AjPI0nyxAj1Xz5YXI9NX_7ivzuxheXoznYsX1uIKqL5JCZut.bl
 IcHk97HlzTHQOhMb9EwdNEWM-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 3e982a50-2fba-4768-bd2d-b65fee07b803
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Mon, 1 Jun 2026 18:12:04 +0000
Received: by hermes--production-ir2-89844b765-md4df (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b803c1e73cdbfce24c3992574e215936;
          Mon, 01 Jun 2026 18:12:01 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 01 Jun 2026 20:11:59 +0200
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary parentheses
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-staging-fix-1-v3-1-331ec58683c0@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBBFr2JmXRrAgqQr79G4QEScpgED1tQY7
 16w624mefn/v9kh2Yg2wb3aIdoVEwafob5UYCbtnSU4ZAZOuaSCNyQt2qF3ZMQPYURrKW60low
 LBXkzR5uD0/fofpze/dOapUhKY8K0hLidD1dWev/cK8tHSj0oRXszNrLd9BTCdX5BdxzHF+n8E
 MS7AAAA
X-Change-ID: 20260527-staging-fix-1-aa6540361258
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780337521; l=15187;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=Bo8S1sSUDV88QO+wfGySEgNIK9zbyRCkuw3jn4KkhDE=;
 b=sYeEoTi9+ZreVtE0pp53jShZ3wD2WEBTwDUQbnve6hcBeTActATnrR4vWI9rDoTFcvpKriVod
 QGPfLjxYEBsCfQTzZlSZ4qC3ecaSfuzBjlQwPGf6Zw/R6EM/xsz6mXk
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260601-staging-fix-1-v3-1-331ec58683c0.ref@yahoo.pl>

Remove unnecessary parentheses to clear checkpatch.pl warnings

Example of fixed warnings:
CHECK: Unnecessary parentheses around dvobj->cam_cache[id]
CHECK: Unnecessary parentheses around 'val != 0xfe'

Checkpatch warnings regarding line length above 100 columns on modified
lines were also fixed

V2->V3:
  Reverted condition parentheses changes per Dan Carpenter's review:
  staging rules deliberately silence this checkpatch warning

Changes in v3:
- Reverted condition parentheses changes per Dan Carpenter's review
- Link to v2: https://lore.kernel.org/all/20260531061022.573089-1-mavick4022@gmail.com/

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260527-staging-fix-1-v1-1-66ad880bcf76@yahoo.pl

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 81 ++++++++++++++------------
 1 file changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b10d..6bfb2ebffa62 100644
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
@@ -1043,7 +1043,7 @@ void VCS_update(struct adapter *padapter, struct sta_info *psta)
 
 	case 2: /* auto */
 	default:
-		if ((pmlmeinfo->ERP_enable) && (pmlmeinfo->ERP_IE & BIT(1))) {
+		if (pmlmeinfo->ERP_enable && (pmlmeinfo->ERP_IE & BIT(1))) {
 			if (pregpriv->vcs_type == 1) {
 				psta->rtsen = 1;
 				psta->cts2self = 0;
@@ -1078,7 +1078,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	unsigned int len;
 	unsigned char *p;
 	unsigned short	val16, subtype;
-	struct wlan_network *cur_network = &(Adapter->mlmepriv.cur_network);
+	struct wlan_network *cur_network = &Adapter->mlmepriv.cur_network;
 	/* u8 wpa_ie[255], rsn_ie[255]; */
 	u16 wpa_len = 0, rsn_len = 0;
 	u8 encryp_protocol = 0;
@@ -1110,7 +1110,9 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return true;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
+	if (pmlmepriv->timeBcnInfoChkStart != 0 &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) >
+	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 	}
@@ -1243,8 +1245,11 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	pmlmepriv->NumOfBcnInfoChkFail++;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
-		&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
+	if (pmlmepriv->timeBcnInfoChkStart != 0 &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <=
+			DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS) &&
+				pmlmepriv->NumOfBcnInfoChkFail >=
+					DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 		return _FAIL;
@@ -1296,8 +1301,8 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 	u32 i;
 	struct ndis_80211_var_ie *pIE;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex		*cur_network = &pmlmeinfo->network;
 
 	if (rtw_get_capability((struct wlan_bssid_ex *)cur_network) & WLAN_CAPABILITY_PRIVACY) {
 		for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
@@ -1332,7 +1337,7 @@ int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps,
 {
 	unsigned char bit_offset;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (!(pmlmeinfo->HT_enable))
 		return _FAIL;
@@ -1438,7 +1443,7 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 void update_IOT_info(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	switch (pmlmeinfo->assoc_AP_vendor) {
 	case HT_IOT_PEER_MARVELL:
@@ -1468,7 +1473,7 @@ void update_IOT_info(struct adapter *padapter)
 void update_capinfo(struct adapter *Adapter, u16 updateCap)
 {
 	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	bool		ShortPreamble;
 
 	/*  Check preamble mode, 2005.01.06, by rcnjko. */
@@ -1520,8 +1525,8 @@ void update_wireless_mode(struct adapter *padapter)
 	int network_type = 0;
 	u32 SIFS_Timer;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 	unsigned char *rate = cur_network->supported_rates;
 
 	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable))
@@ -1544,7 +1549,7 @@ void update_wireless_mode(struct adapter *padapter)
 
 	SetHwReg8723BS(padapter, HW_VAR_RESP_SIFS,  (u8 *)&SIFS_Timer);
 
-	SetHwReg8723BS(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&(pmlmeext->cur_wireless_mode));
+	SetHwReg8723BS(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&pmlmeext->cur_wireless_mode);
 
 	if (pmlmeext->cur_wireless_mode & WIRELESS_11B)
 		update_mgnt_tx_rate(padapter, IEEE80211_CCK_RATE_1MB);
@@ -1569,8 +1574,8 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
 	int	support_rate_num = 0;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_SUPP_RATES, &ie_len, var_ie_len);
 	if (!pIE)
@@ -1596,7 +1601,7 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct ADDBA_request *preq = (struct ADDBA_request *)paddba_req;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	psta = rtw_get_stainfo(pstapriv, addr);
 
@@ -1639,7 +1644,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	__le32 *pbuf;
 	u64 tsf = 0;
 	u32 delay_ms;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pmlmeext->bcn_cnt++;
 

---
base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
change-id: 20260527-staging-fix-1-aa6540361258

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

