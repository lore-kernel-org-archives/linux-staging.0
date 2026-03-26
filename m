Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1C39C63D
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489387; cv=none; b=TUu2n+oqJ/qHeWLbUYwJDdgmdpOjCv6mNzqVwlssX563u8GuxzXjzrB70ACO2D8x2itvBm47kCBcrS2r9dtgUSJZoJ3R9UnAeGR+Ew/tfsVIpvbACYgHUqlbd7zKn3o7s6oZDm0nCNWU8HR/LSWHc+sNVDAWgVQQZMe1r8E7aZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489387; c=relaxed/simple;
	bh=59bC//0dOQ4leVabfaDZKZKgmuHhrHNNwfW41UlUVp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQaMW+6yAW8pCnxoXI43Wr1qGnK7UIevPVvv21oRnOPdux/YcvE3bmEL0cYbtgxsCA9lRXzBLcXfvOKj0EWX+WkorREedWPhpUdHIzSthwmCDKIRQwcM9L4dcK1cfMCbI6wqdRq5/ubxcPogKDlZeQU5nL4g4Kg+1GdXpvCGdjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfcvoVH6; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfcvoVH6"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-602b7085a52so299158137.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 18:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489385; x=1775094185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLXaunln+3HsTOwtqtf6jxVt3H77rN2+Ymn72VKGXQs=;
        b=LfcvoVH6UF2WUzUxCKK0CeC3LXsk0pClwUw1VBhTo835iKeIGzm+Q/R5fA9mnblIUn
         c7cBx5vfPCknTuqevOAVer+QUBQXmQUtLuCQayBC5xvMAcpMj7ASVLvNADWg6ZSWSbqF
         Pdnr1AmXjw8UIIxPlsNpoZ8DHGUMNpOoqXFAAKeAQBszVzUf0EvErwwL2cVEBDr78nwr
         cW6aCapvd5/ZncRxIVnNURXA2wLRhkcCkqB/YEOT9zDO7doWQ4S4HoY/4plQj61962XR
         9PEbx9nuL0piiDzWx9u8wSDz1020g5K3GckZKoHQzTmVV+7t5e20rai/FVS0/pBBoWHP
         p8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489385; x=1775094185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLXaunln+3HsTOwtqtf6jxVt3H77rN2+Ymn72VKGXQs=;
        b=golB5vFpqJiyUXeTnUjw125JvZFIrFf5AZoZNmBCSEaAJ2yYKQQRr3uQ19+XqinHgA
         GqoeSpcnt4uwoYJG1qtT4ei7F4oRIl6avtopb6UmkqYOxUo40W9tahFhrkPQeq4KE97y
         S6Uytwr7XT5yV7zLjDByCenhcQCRAMTUXq4A44zv1UCW25mcV8CYtSEnhut+6KxemfK+
         18ifmVpyws21/jmr2UZIw+6anx2NsSYuPfxQfiaJVA5rW13iLhhTqduWSIiFL+6VVTn+
         FayjLRV3XqpoRtWSwcSwam0cEQhfpDeduhTETitP5/y8baeQSJ6NVsEAKXmiMsQMcA1k
         VWUg==
X-Gm-Message-State: AOJu0Yy7MIBILK3blDNE3Jd2X7XmGSbl1AkQVjdvjI2Iy46F77AGI4mY
	5vIerSOrHyJ4mvUFZEqrJxPheH2T4bFqoZY135m1YkDVfFdn20Sf+2K/TZ7nTg==
X-Gm-Gg: ATEYQzyg+kWb46owU6b8jxn/Jn0R31HceV5hHbm+mtZytLjVYo2/KqVmXk0ReCQnfJT
	GY9CkVNWND+a0AHuxw9JDhxVZX2SzbnakDeIqQ+TLgiwUf4eiXdwiBo2+SwdywBfPF/9FRWtBfG
	KxvZO9idDSDOBjIgaLPja7+ht7jCvO6l4vbDeAo2wAdnB9jTOH05ljq6na0IH7o/b1fN1E+LlZY
	YoUNY9mSDn6Dv0o04mwSMlUg8bKd5lWD/fHeqHBmk5Jx/HLxVm14mW0j4avznA+/hYCadIFrAAl
	PPwWaog8SRAt1V7twPkYWhi8dTV0fBNLm5eBOj/3Pz3mbVbtzfD1fhIjcrBZArq/yZ6135X5J8y
	cLq4EYqIZH+WDXcVSwgUTxiQRolVbNrnjsoDCXwdc9zbhcW3XV7GW/MCKKq7sLZBvTwtgtfXx1f
	0U4GeNRVEBTRPfhIAPG5VlUh8ld2SXKVtE943hd470kmmvV10MB+l9+u38eCC7RAYlyt+m/vWNF
	pZ6vwAlb8Dh3A6g2sg=
X-Received: by 2002:a05:6102:604f:b0:5ff:c3c2:81f3 with SMTP id ada2fe7eead31-60387434a6bmr3036887137.32.1774489384925;
        Wed, 25 Mar 2026 18:43:04 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.187])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm1661643137.5.2026.03.25.18.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:43:04 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: fix coding style and remove dead code
Date: Thu, 26 Mar 2026 01:42:21 +0000
Message-ID: <20260326014221.525368-3-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326014221.525368-1-marcosandrade95963@gmail.com>
References: <20260326014221.525368-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various coding style issues in rtw_wlan_util.c to align the code
with the Linux kernel formatting standards.

Specifically, this patch:
- Resolves lines exceeding the 80-column limit.
- Removes redundant and unnecessary parentheses in complex conditionals.
- Deletes commented-out dead code that clutters the logic.
- Fixes alignment to correctly match open parentheses.

These changes improve overall code readability and address multiple
checks reported by checkpatch.pl. No functional changes are introduced.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---

Note: checkpatch.pl reports some CHECKs regarding CamelCase variables
(e.g., ShortPreamble) in the modified lines. These were intentionally
left untouched to keep this patch strictly focused on whitespace and
alignment cleanups. They can be addressed in a future patch.

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 128 +++++++++++-------
 1 file changed, 82 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 41868dda3838..fdaaf9b5e178 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -276,7 +276,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 				cnt += scnprintf(msg + cnt, len - cnt, "C");
 			else
 				cnt += scnprintf(msg + cnt, len - cnt, "_");
-			if (iface->wdinfo.listen_channel == ch && !rtw_p2p_chk_state(&iface->wdinfo, P2P_STATE_NONE))
+			if (iface->wdinfo.listen_channel == ch &&
+			    !rtw_p2p_chk_state(&iface->wdinfo, P2P_STATE_NONE))
 				cnt += scnprintf(msg + cnt, len - cnt, "L");
 			else
 				cnt += scnprintf(msg + cnt, len - cnt, "_");
@@ -334,7 +335,8 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, unsigned char channel,
+			unsigned char channel_offset, unsigned short bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
@@ -350,8 +352,8 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
-
+	/*  set center channel */
+	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80);
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
@@ -380,7 +382,8 @@ int is_client_associated_to_ap(struct adapter *padapter)
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -391,7 +394,8 @@ int is_client_associated_to_ibss(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -452,7 +456,8 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 			break;
 		default:
 			i = (j - 2) << 2;
-			val = (key[i] | (key[i + 1] << 8) | (key[i + 2] << 16) | (key[i + 3] << 24));
+			val = (key[i] | (key[i + 1] << 8) |
+			       (key[i + 2] << 16) | (key[i + 3] << 24));
 			break;
 		}
 
@@ -466,7 +471,12 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 void _clear_cam_entry(struct adapter *padapter, u8 entry)
 {
 	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_key[] = {
+		0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00
+	};
 
 	_write_cam(padapter, entry, 0, null_sta, null_key);
 }
@@ -570,8 +580,8 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 	mlmeinfo = &adapter->mlmeextpriv.mlmext_info;
 
-	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) || ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
-		&& !sta) {
+	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) ||
+	     ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)) && !sta) {
 		/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
 		if (kid > 3) {
 			netdev_dbg(adapter->pnetdev,
@@ -588,7 +598,10 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 		if (!sta) {
 			if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
-				/* bypass STA mode group key setting before connected(ex:WEP) because bssid is not ready */
+				/*
+				 * bypass STA mode group key setting before connected(ex:WEP)
+				 * because bssid is not ready
+				 */
 				goto bitmap_handle;
 			}
 
@@ -597,7 +610,10 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 		i = _rtw_camid_search(adapter, addr, kid);
 		if (i >= 0) {
-			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwirte group only(ex: rekey) */
+			/*
+			 * Fix issue that pairwise and group key have same key id.
+			 * Pairwise key first, group key can overwirte group only(ex: rekey)
+			 */
 			if (sta || _rtw_camid_is_gk(adapter, i))
 				cam_id = i;
 			else
@@ -780,7 +796,8 @@ void WMMOnAssocRsp(struct adapter *padapter)
 			ACM = (pmlmeinfo->WMM_param.ac_param[i].ACI_AIFSN >> 4) & 0x01;
 
 			/* AIFS = AIFSN * slot time + SIFS - r2t phy delay */
-			AIFS = (pmlmeinfo->WMM_param.ac_param[i].ACI_AIFSN & 0x0f) * pmlmeinfo->slotTime + aSifsTime;
+			AIFS = (pmlmeinfo->WMM_param.ac_param[i].ACI_AIFSN & 0x0f) *
+				pmlmeinfo->slotTime + aSifsTime;
 
 			ECWMin = (pmlmeinfo->WMM_param.ac_param[i].CW & 0x0f);
 			ECWMax = (pmlmeinfo->WMM_param.ac_param[i].CW & 0xf0) >> 4;
@@ -895,8 +912,6 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 		struct wlan_bssid_ex	*cur_network = &(pmlmeinfo->network);
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		/* set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode); */
-
 		/* update ap's stainfo */
 		psta = rtw_get_stainfo(pstapriv, cur_network->mac_address);
 		if (psta) {
@@ -944,16 +959,18 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 			max_AMPDU_len = min(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x3,
 					    pIE->data[i] & 0x3);
 
-			min_MPDU_spacing = max(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c,
-					       pIE->data[i] & 0x1c);
+			min_MPDU_spacing = max(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para &
+					       0x1c, pIE->data[i] & 0x1c);
 
-			pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para = max_AMPDU_len | min_MPDU_spacing;
+			pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para =
+				max_AMPDU_len | min_MPDU_spacing;
 		}
 	}
 
 	/* update the MCS set */
 	for (i = 0; i < 16; i++)
-		pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= pmlmeext->default_supported_mcs_set[i];
+		pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &=
+			pmlmeext->default_supported_mcs_set[i];
 
 	/* update the MCS rates */
 	set_mcs_rate_by_mask(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS_RATE_1R);
@@ -1014,7 +1031,6 @@ void HTOnAssocRsp(struct adapter *padapter)
 		pmlmeinfo->HT_enable = 1;
 	} else {
 		pmlmeinfo->HT_enable = 0;
-		/* set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode); */
 		return;
 	}
 
@@ -1135,7 +1151,9 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return true;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
+	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) >
+	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 	}
@@ -1153,7 +1171,8 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	/* check bw and channel offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY,
+		       &len, bssid->ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1161,7 +1180,8 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION,
+		       &len, bssid->ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		ht_info_infos_0 = pht_info->infos[0];
@@ -1174,13 +1194,16 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 			/* bcn_info_update */
 			cur_network->bcn_info.ht_cap_info = ht_cap_info;
 			cur_network->bcn_info.ht_info_infos_0 = ht_info_infos_0;
-			/* to do : need to check that whether modify related register of BB or not */
+			/*
+			 * to do : need to check that whether modify related register of BB or not
+			 */
 		}
 		/* goto _mismatch; */
 	}
 
 	/* Checking for channel */
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_DS_PARAMS, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_DS_PARAMS,
+		       &len, bssid->ie_length - _FIXED_IE_LENGTH_);
 	if (p) {
 		bcn_channel = *(p + 2);
 	} else {/* In 5G, some ap do not have DSSET IE checking HT info for channel */
@@ -1197,7 +1220,8 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	/* checking SSID */
 	ssid_len = 0;
-	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID,
+		       &len, bssid->ie_length - _FIXED_IE_LENGTH_);
 	if (p) {
 		ssid_len = *(p + 1);
 		if (ssid_len > NDIS_802_11_LENGTH_SSID)
@@ -1207,7 +1231,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	bssid->ssid.ssid_length = ssid_len;
 
 	if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
-			bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
+	    bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
 		if (bssid->ssid.ssid[0] != '\0' &&
 		    bssid->ssid.ssid_length != 0) /* not hidden ssid */
 			goto _mismatch;
@@ -1268,8 +1292,10 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	pmlmepriv->NumOfBcnInfoChkFail++;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
-		&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
+	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <=
+	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS) &&
+	     (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 		return _FAIL;
@@ -1292,7 +1318,8 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
 			/* to update WMM parameter set while receiving beacon */
-			if (!memcmp(pIE->data, WMM_PARA_OUI, 6) && pIE->length == WLAN_WMM_LEN)	/* WMM */
+			/* WMM */
+			if (!memcmp(pIE->data, WMM_PARA_OUI, 6) && pIE->length == WLAN_WMM_LEN)
 				if (WMM_param_handler(padapter, pIE))
 					report_wmm_edca_update(padapter);
 
@@ -1330,7 +1357,8 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
-				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
+				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) &&
+				    (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
 					return true;
 
 				break;
@@ -1433,7 +1461,8 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
+			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) ||
+			    (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
 				return HT_IOT_PEER_ATHEROS;
 			else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
 				 (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
@@ -1502,17 +1531,21 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 	{
 		if (updateCap & cShortPreamble) {
 			/*  Short Preamble */
-			if (pmlmeinfo->preamble_mode != PREAMBLE_SHORT) { /*  PREAMBLE_LONG or PREAMBLE_AUTO */
+			/*  PREAMBLE_LONG or PREAMBLE_AUTO */
+			if (pmlmeinfo->preamble_mode != PREAMBLE_SHORT) {
 				ShortPreamble = true;
 				pmlmeinfo->preamble_mode = PREAMBLE_SHORT;
-				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE,
+						  (u8 *)&ShortPreamble);
 			}
 		} else {
 			/*  Long Preamble */
-			if (pmlmeinfo->preamble_mode != PREAMBLE_LONG) { /*  PREAMBLE_SHORT or PREAMBLE_AUTO */
+			/*  PREAMBLE_SHORT or PREAMBLE_AUTO */
+			if (pmlmeinfo->preamble_mode != PREAMBLE_LONG) {
 				ShortPreamble = false;
 				pmlmeinfo->preamble_mode = PREAMBLE_LONG;
-				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE,
+						  (u8 *)&ShortPreamble);
 			}
 		}
 	}
@@ -1525,7 +1558,7 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 		if (pmlmeext->cur_wireless_mode & (WIRELESS_11_24N)) {
 			pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 		} else if (pmlmeext->cur_wireless_mode & (WIRELESS_11G)) {
-			if ((updateCap & cShortSlotTime) /* && (!(pMgntInfo->pHTInfo->RT2RT_HT_Mode & RT_HT_CAP_USE_LONG_PREAMBLE)) */)
+			if ((updateCap & cShortSlotTime))
 				/*  Short Slot Time */
 				pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 			else
@@ -1565,7 +1598,7 @@ void update_wireless_mode(struct adapter *padapter)
 	pmlmeext->cur_wireless_mode = network_type & padapter->registrypriv.wireless_mode;
 
 	SIFS_Timer = 0x0a0a0808; /* 0x0808 -> for CCK, 0x0a0a -> for OFDM */
-													/* change this value if having IOT issues. */
+	/* change this value if having IOT issues. */
 
 	SetHwReg8723BS(padapter, HW_VAR_RESP_SIFS,  (u8 *)&SIFS_Timer);
 
@@ -1597,7 +1630,8 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_SUPP_RATES, &ie_len, var_ie_len);
+	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_SUPP_RATES,
+	       &ie_len, var_ie_len);
 	if (!pIE)
 		return _FAIL;
 	if (ie_len > sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates))
@@ -1606,9 +1640,12 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	memcpy(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates, pIE->data, ie_len);
 	supportRateNum = ie_len;
 
-	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_EXT_SUPP_RATES, &ie_len, var_ie_len);
-	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - supportRateNum))
-		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + supportRateNum), pIE->data, ie_len);
+	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_EXT_SUPP_RATES,
+	       &ie_len, var_ie_len);
+	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) -
+	    supportRateNum))
+		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates +
+		       supportRateNum), pIE->data, ie_len);
 
 	return _SUCCESS;
 }
@@ -1682,11 +1719,9 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 
 	if (delay_ms >= 8)
 		pmlmeext->bcn_delay_cnt[8]++;
-		/* pmlmeext->bcn_delay_ratio[8] = (pmlmeext->bcn_delay_cnt[8] * 100) /pmlmeext->bcn_cnt; */
 	else
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
-		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
-	/* dump for  adaptive_early_32k */
+
 	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
 		u8 ratio_20_delay, ratio_80_delay;
 		u8 DrvBcnEarly, DrvBcnTimeOut;
@@ -1697,7 +1732,8 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		DrvBcnTimeOut = 0xff;
 
 		for (i = 0; i < 9; i++) {
-			pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) / pmlmeext->bcn_cnt;
+			pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) /
+				pmlmeext->bcn_cnt;
 
 			ratio_20_delay += pmlmeext->bcn_delay_ratio[i];
 			ratio_80_delay += pmlmeext->bcn_delay_ratio[i];
-- 
2.53.0

