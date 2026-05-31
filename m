Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABFE31ED81
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 06:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207821; cv=none; b=k8BcXsQ/qVT3sy+hu2zKj9MUTUykV03Y08qBFzTK0IgT5hOrsw6N8hnC6v3mk0F72Ual24NnYlRLdP28LJaPwk3ONtnNO1afooJZpoq9K4Np43dz4LUvBnP1uFhXvQb8XopAT70Cgk+aRMgQlj1XuB7YrloWhz1KHD4J66MFOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207821; c=relaxed/simple;
	bh=WESUedYVX8cc0kE8TkryHRvaNZuaSGHBIY6RF4Y85kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iob/pwNHBqALQ4g+x9D/k/HEYaMNaJEUicwh0b2Go577rjpdwgmwx7xkVAYpxHn4J3YYosMF3Iz59FO6auX/TrIB6iu4xxkv9nSaqXtOAHxOCbSEUEfzuOmCAi6Scev/vN1q72rJ+qx3HbSSCRdOUjzz/VYgrTZZO1vKFvPI2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VesYo+6X; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VesYo+6X"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso947586a91.0
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 23:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780207819; x=1780812619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tiPpXWJvPtYUg+JKdaQxmc7DWf3TuATn2wHq5oT3B0=;
        b=VesYo+6XI3QfVvODOfe6+qFLNyAnmYMqSe/WFepi2u8XwQjUxmIgHol+jHAZwXoKXO
         D8r+Hwuo87eGDj0dX0E2/kE6HOGMw7JeBv9wf9AOp6vQgLur3yGFWSACG4Nq2DIxkfzn
         u8YhsPyRnicurEmM1EIESkuqx1T6gR2lxd5kYTWNIvyxmeL/izln+gyNDTo3i0SAiBxw
         +x8HXB2odYPYjl3+fLquy7eXMf1oi6lAKX6UsyG6DTHD0b1IjPhZ3u3lumnSyB23Q7Af
         K0v8GQTFAb99DJSiF4Qb0TfaDa7LMRWK1+OOVJdCvxuPWYkEFYGhvs+XgNXuLa9cpiTJ
         rsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780207819; x=1780812619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+tiPpXWJvPtYUg+JKdaQxmc7DWf3TuATn2wHq5oT3B0=;
        b=ZvVcFJR7G/zYQAi7F4+fKIO7caHXiK8L95ggsv3zMr9U2zwU/+NTV87KbijPb3ASMd
         MY4igSIrAXqbCW2Cy32S+FoSiWBll4jYySF518xP/DK8XUxrapSHsRfa82GPi+kIsKy8
         mFTEY86X0478m2E3PxWqtHqvj75P6aeIwfH1okUQjYbTo01fIj2kw4XJvBznTPoXCxxC
         DY3NbIlJMXEPfypriaZxnVaMpB0rCYueDjNmz+ubGVUZVHWexeoBQDT6KV9C+PzE4wKb
         +WE5gjDLhX3wgWYYFqVBBRE+HPsXcqTidRGpaX55kYssV0WEsXvplCXp9hJg0U2GWsCj
         O+OA==
X-Forwarded-Encrypted: i=1; AFNElJ/KNACxJvmPMXrVPMeWqMuGkg8QpPL55xkglJ4NvLQC4zmYgWQJ2JlRBvZo/NaAf62j3Qj3MLmZdLLIcqU3@lists.linux.dev
X-Gm-Message-State: AOJu0YwJmNfOdXytMsOThey1ButhAev2gKXjgOYCO+YtGMVW9zU2yS/c
	kItyxUbiWfEd8aCPXbrowiVw64VA/lYp05lO3VWGo7b7os3s2ri4Hbuy
X-Gm-Gg: Acq92OEysFnE6wVt+ake/35uybDKEqoUbSPgQ2twJOaiLUzqxzN22qcy7lAnR213miK
	hc/NzdGtlQxHaGjCTo4bHB5BB1j6+acE7bY1rSsfrcm+8a6tDBci/UB4gs7biKcBoxYz0YEPWft
	DBat3etqviDxvsNUxKN4Zb3JYDwWhq7Tiv/gM/L6CHx4qavU9KQyRB3LmC01vjefvoboEgk2A/e
	Izdz46fThMMaFqqzJf7HBinllrm8i40Y/qvyTPDBAUQVx4eTLhDIbmAgHuQM0YLTIWczOMA6tXA
	2t8wKSRrtb0zqD0/5Yieva6X/upP0AVcB2kKTVDWvJFoxFvd3fk3Vz3r+7ypw5yhNkAnNlb6mPT
	YNohqh8w3Butj4rTGpzfFXABNpqgL3mlKs/DXnS7uJPKb7n6owDnuOSJuo8UmOjHnUv4DJGvbPM
	93WQ3uM1I86KyhKJ6TTQbdgCl87zDAoUztEuEKieOjR9g0M7VtGLqC2T16TQBk
X-Received: by 2002:a05:6a21:9f10:b0:3a8:1350:ba47 with SMTP id adf61e73a8af0-3b428216710mr6502551637.47.1780207818940;
        Sat, 30 May 2026 23:10:18 -0700 (PDT)
Received: from localhost (bb219-74-228-4.singnet.com.sg. [219.74.228.4])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85772b9591sm6238680a12.22.2026.05.30.23.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 23:10:18 -0700 (PDT)
From: Eugene Mavick <mavick4022@gmail.com>
To: gregkh@linuxfoundation.org,
	error27@gmail.com,
	khomenkov@mailbox.org,
	ethantidmore06@gmail.com.m.steinmoetzger@gmail.com,
	tomasz.unger@yahoo.pl,
	arthur.stupa@gmail.com,
	jannik@jrehkemper.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Eugene Mavick <mavick4022@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary parentheses
Date: Sun, 31 May 2026 14:10:22 +0800
Message-ID: <20260531061022.573089-1-mavick4022@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260530031621.443015-1-mavick4022@gmail.com>
References: <20260530031621.443015-1-mavick4022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses to clear checkpatch.pl warnings

Example of fixed warnings:
CHECK: Unnecessary parentheses around dvobj->cam_cache[id]
CHECK: Unnecessary parentheses around 'val != 0xfe'

Checkpatch warnings regarding line length above 100 columns on modified
lines were also fixed

Signed-off-by: Eugene Mavick <mavick4022@gmail.com>
---
V1->V2:
Fixed following checkpatch warnings on modified lines:
CHECK: Alignment should match open parenthesis(line 1114, 1249)
CHECK: Logical continuations should be on the previous line(line 1251)

v1: https://lore.kernel.org/all/20260530031621.443015-1-mavick4022@gmail.com/

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 93 ++++++++++---------
 1 file changed, 49 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b10d..84e9772a39c2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -118,7 +118,7 @@ int is_basicrate(struct adapter *padapter, unsigned char rate)
 	for (i = 0; i < NumRates; i++) {
 		val = pmlmeext->basicrate[i];
 
-		if ((val != 0xff) && (val != 0xfe))
+		if (val != 0xff && val != 0xfe)
 			if (rate == ratetbl_val_2wifirate(val))
 				return true;
 	}
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
@@ -853,7 +853,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 		new_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 	}
 
-	if ((new_bwmode != pmlmeext->cur_bwmode) || (new_ch_offset != pmlmeext->cur_ch_offset)) {
+	if (new_bwmode != pmlmeext->cur_bwmode || new_ch_offset != pmlmeext->cur_ch_offset) {
 		pmlmeinfo->bwmode_updated = true;
 
 		pmlmeext->cur_bwmode = new_bwmode;
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
@@ -983,9 +983,9 @@ void HTOnAssocRsp(struct adapter *padapter)
 	unsigned char min_MPDU_spacing;
 	/* struct registry_priv  *pregpriv = &padapter->registrypriv; */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable)) {
+	if (pmlmeinfo->HT_info_enable && pmlmeinfo->HT_caps_enable) {
 		pmlmeinfo->HT_enable = 1;
 	} else {
 		pmlmeinfo->HT_enable = 0;
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
@@ -1213,13 +1215,13 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
 		pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
-		if (pbuf && (wpa_ielen > 0)) {
+		if (pbuf && wpa_ielen > 0) {
 			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
 					 &pairwise_cipher, &is_8021x);
 		} else {
 			pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
 
-			if (pbuf && (wpa_ielen > 0))
+			if (pbuf && wpa_ielen > 0)
 				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
 						  &pairwise_cipher, &is_8021x);
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
@@ -1520,11 +1525,11 @@ void update_wireless_mode(struct adapter *padapter)
 	int network_type = 0;
 	u32 SIFS_Timer;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 	unsigned char *rate = cur_network->supported_rates;
 
-	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable))
+	if (pmlmeinfo->HT_info_enable && pmlmeinfo->HT_caps_enable)
 		pmlmeinfo->HT_enable = 1;
 
 	if (pmlmeinfo->HT_enable)
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
 
-- 
2.51.2

