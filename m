Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015C1FF7CA
	for <linux-staging@lists.linux.dev>; Mon,  3 Feb 2025 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738621397; cv=none; b=msALP+1DW5+X7PE4aSZ7FhQdNXBboRugGJekhD1DqyAeHABzk0Y6yUliB8ZRF915jN3ERzTz2OCM8FW8He5RU7+mOwPoY7Jncmksw7XUQeqKC1bHzKtUqHYje4eilt5VP/D5fjvdFay5/gF/eM81axGws1oZYfTrc324GH39pJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738621397; c=relaxed/simple;
	bh=b4vQFBH+beZs3eDzz7hiQrhI3LrChFuE0GKvkxo2jvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c75JyEbIFZf+iCeffoZEOxMgCN3YDnwJxWIDoezgGOO4zfPe56IEvR2eLeuG4l8kO1Dy5Pt+50LtmDPgvVqHhXbRZaN5hZmqD/afWTMDvppXwqp1KMN5MHR4htzoNYYNGnM9wf+MMgCQW8EzN9WWU0m9yX29HXbF4bDe74K/z4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZjx7rCf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZjx7rCf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so8258128a91.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Feb 2025 14:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738621394; x=1739226194; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUSFO3NySKbsa3TutFo5U69vrRCubtKi7OQZGsA6fWA=;
        b=YZjx7rCfN7JFXuCBYp96jmpXRCx+dKiHglSNbX13g9oN9PSrpRyluFyQd+H8V/Eb4U
         unE7CTTKDFy3a3XHvoQsrx+9LnyOsumGEPFz0u0jQgx5s5sO0IkTtPA1whokjmjMFTBq
         LUT2hwNWenzKRiX0KepJYDOFS/jywVCSQImfzunhHlAju8ITX8UnsaACpdkqMm1shewx
         g1TS5tkvf76YcndHfrqwD9GZzdOyeOAzcFq7ypMD9oLyhGhUwpjDi6UrwIENd21nX/k/
         hPlhzQpiIjcxWzRiTeW1YXvj3q5uckigkoJx40tw471Nh59Z2+MToZ5NU1qXeHDPDDB2
         JQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738621394; x=1739226194;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUSFO3NySKbsa3TutFo5U69vrRCubtKi7OQZGsA6fWA=;
        b=LYvmyD/kzjDD7Ts5Ab8w7gW77zpH/A4g9Ha/TXJvrdmnd9NubAQu+nrs8qHUOFGaYW
         q9QlGudvZFZ7NQyoLpLIf92C6SxGc8re24gCPRQjR0YXVP9D2FZFnajlIfWAVjexZmcf
         5Y5I/3b4eDtKOx3vDRpZr3MjmGJ3fbMxQrIoZRyU1nqGVx3YpqqzKEfH+wh68ub2ONjW
         Au1HEGLUhUrKyXvHmzyV1Eq8RU0mRGxZKztCiklt9jqgiFELircyOV2aY6gmOdtQHriz
         yAb6eaU2GbX0pFKsjnhfjpNQFf9J5AizKZ2uMrS3T7J5RUCMSl4pHmG87GbvfWW3HpSv
         MYSw==
X-Gm-Message-State: AOJu0Yx4tUxSvExEM1MCUFq+a+UvIluoGfJruv4YiF609UA5pnMtfiQp
	OWlCzDkKIUwW/lPBXEP6chh7eDRi8Hsgw5EnSa/C7zCU0aEslQak
X-Gm-Gg: ASbGncv3c1QN4eYvrRNLZbkk1s4Qy/WlY5TlcDWaq8tSLJTwfnwGBSTy+X3syYU95nD
	2ZLVtTB7CnzD0RhQ0cUTCw0K4wxXqbv3JIem0FLBm0gqHTpKgnH7+SvbTGxxIlD5i+U1KaWv5+W
	L6f/T/CTRa/+3UC99WJ+OHwOiDsMKttCtBG+0I4P92zXNe+LPgNIvBVHURAKX+CmYKRyNihUlb1
	NmH41ohPgGNjjc12DrUNfqxwYf1NmRm3JdhAF5wxRd34pqRL+5a1tCcGuwgPdH4hosC5Ngyz6+A
	UbCw5LHYIMS7TGz2wKPVBw==
X-Google-Smtp-Source: AGHT+IGreqhvO72cqofCN0PYnB+cIRSutwsFD/eP3TpuCVnoiImGf/Ajbsf7keijUPFcsngA9KBIVQ==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-2f83abd7da8mr37154378a91.10.1738621393869;
        Mon, 03 Feb 2025 14:23:13 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([205.154.31.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7260sm80904085ad.80.2025.02.03.14.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:23:13 -0800 (PST)
Date: Mon, 3 Feb 2025 14:23:12 -0800
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, vger.kernel.org@DESKTOP-GL3U3CJ
Subject: [PATCH] staging: rtl8723bs: Fix coding style checks and warns
Message-ID: <Z6FB0Idzrz_XSNWY@DESKTOP-GL3U3CJ>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Coding style issues were present in the file. Unnecessary parenthesis,
missing spaces, and exceeding line limits were the most prominent.
Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 179 ++++++++++--------
 1 file changed, 95 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 73c70b016f00..7ff0f5f22efb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -170,10 +170,10 @@ void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrat
 
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask)
 {
-	u8 mcs_rate_1r = (u8)(mask&0xff);
-	u8 mcs_rate_2r = (u8)((mask>>8)&0xff);
-	u8 mcs_rate_3r = (u8)((mask>>16)&0xff);
-	u8 mcs_rate_4r = (u8)((mask>>24)&0xff);
+	u8 mcs_rate_1r = (u8)(mask & 0xff);
+	u8 mcs_rate_2r = (u8)((mask >> 8) & 0xff);
+	u8 mcs_rate_3r = (u8)((mask >> 16) & 0xff);
+	u8 mcs_rate_4r = (u8)((mask >> 24) & 0xff);
 
 	mcs_set[0] &= mcs_rate_1r;
 	mcs_set[1] &= mcs_rate_2r;
@@ -267,21 +267,22 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 		dvobj->on_oper_ch_time = jiffies;
 
 #ifdef DBG_CH_SWITCH
-		cnt += scnprintf(msg+cnt, len-cnt, "switch to ch %3u", ch);
+		cnt += scnprintf(msg + cnt, len - cnt, "switch to ch %3u", ch);
 
 		for (i = 0; i < dvobj->iface_nums; i++) {
 			struct adapter *iface = dvobj->padapters[i];
 
-			cnt += scnprintf(msg+cnt, len-cnt, " [%s:", ADPT_ARG(iface));
+			cnt += scnprintf(msg + cnt, len - cnt, " [%s:", ADPT_ARG(iface));
 			if (iface->mlmeextpriv.cur_channel == ch)
-				cnt += scnprintf(msg+cnt, len-cnt, "C");
+				cnt += scnprintf(msg + cnt, len - cnt, "C");
 			else
-				cnt += scnprintf(msg+cnt, len-cnt, "_");
-			if (iface->wdinfo.listen_channel == ch && !rtw_p2p_chk_state(&iface->wdinfo, P2P_STATE_NONE))
-				cnt += scnprintf(msg+cnt, len-cnt, "L");
+				cnt += scnprintf(msg + cnt, len - cnt, "_");
+			if (iface->wdinfo.listen_channel == ch &&
+			    !rtw_p2p_chk_state(&iface->wdinfo, P2P_STATE_NONE))
+				cnt += scnprintf(msg + cnt, len - cnt, "L");
 			else
-				cnt += scnprintf(msg+cnt, len-cnt, "_");
-			cnt += scnprintf(msg+cnt, len-cnt, "]");
+				cnt += scnprintf(msg + cnt, len - cnt, "_");
+			cnt += scnprintf(msg + cnt, len - cnt, "]");
 		}
 
 #endif /* DBG_CH_SWITCH */
@@ -335,13 +336,13 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, unsigned char channel,
+			unsigned char channel_offset, unsigned short bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
 	center_ch = rtw_get_center_ch(channel, bwmode, channel_offset);
 
-
 	/* set Channel */
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
@@ -351,7 +352,8 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
+	/* set center channel */
+	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80);
 
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
@@ -379,9 +381,10 @@ int is_client_associated_to_ap(struct adapter *padapter)
 		return _FAIL;
 
 	pmlmeext = &padapter->mlmeextpriv;
-	pmlmeinfo = &(pmlmeext->mlmext_info);
+	pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -390,9 +393,10 @@ int is_client_associated_to_ap(struct adapter *padapter)
 int is_client_associated_to_ibss(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -402,7 +406,7 @@ int is_IBSS_empty(struct adapter *padapter)
 {
 	unsigned int i;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	for (i = IBSS_START_MAC_ID; i < NUM_STA; i++) {
 		if (pmlmeinfo->FW_sta_info[i].status == 1)
@@ -431,7 +435,7 @@ void invalidate_cam_all(struct adapter *padapter)
 
 	spin_lock_bh(&cam_ctl->lock);
 	cam_ctl->bitmap = 0;
-	memset(dvobj->cam_cache, 0, sizeof(struct cam_entry_cache)*TOTAL_CAM_ENTRY);
+	memset(dvobj->cam_cache, 0, sizeof(struct cam_entry_cache) * TOTAL_CAM_ENTRY);
 	spin_unlock_bh(&cam_ctl->lock);
 }
 
@@ -467,7 +471,8 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 void _clear_cam_entry(struct adapter *padapter, u8 entry)
 {
 	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 
 	_write_cam(padapter, entry, 0, null_sta, null_key);
 }
@@ -505,7 +510,7 @@ void clear_cam_cache(struct adapter *adapter, u8 id)
 
 	spin_lock_bh(&cam_ctl->lock);
 
-	memset(&(dvobj->cam_cache[id]), 0, sizeof(struct cam_entry_cache));
+	memset(&dvobj->cam_cache[id], 0, sizeof(struct cam_entry_cache));
 
 	spin_unlock_bh(&cam_ctl->lock);
 }
@@ -522,7 +527,7 @@ static bool _rtw_camid_is_gk(struct adapter *adapter, u8 cam_id)
 	if (!(cam_ctl->bitmap & BIT(cam_id)))
 		goto exit;
 
-	ret = (dvobj->cam_cache[cam_id].ctrl&BIT6)?true:false;
+	ret = (dvobj->cam_cache[cam_id].ctrl & BIT6) ? true : false;
 
 exit:
 	return ret;
@@ -537,7 +542,7 @@ static s16 _rtw_camid_search(struct adapter *adapter, u8 *addr, s16 kid)
 	for (i = 0; i < TOTAL_CAM_ENTRY; i++) {
 		if (addr && memcmp(dvobj->cam_cache[i].mac, addr, ETH_ALEN))
 			continue;
-		if (kid >= 0 && kid != (dvobj->cam_cache[i].ctrl&0x03))
+		if (kid >= 0 && kid != (dvobj->cam_cache[i].ctrl & 0x03))
 			continue;
 
 		cam_id = i;
@@ -571,8 +576,8 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 	mlmeinfo = &adapter->mlmeextpriv.mlmext_info;
 
-	if ((((mlmeinfo->state&0x03) == WIFI_FW_AP_STATE) || ((mlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE))
-		&& !sta) {
+	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) ||
+	     ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)) && !sta) {
 		/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
 		if (kid > 3) {
 			netdev_dbg(adapter->pnetdev,
@@ -585,7 +590,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 		cam_id = kid;
 	} else {
 		int i;
-		u8 *addr = sta?sta->hwaddr:NULL;
+		u8 *addr = sta ? sta->hwaddr : NULL;
 
 		if (!sta) {
 			if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
@@ -655,7 +660,7 @@ int allocate_fw_sta_entry(struct adapter *padapter)
 {
 	unsigned int mac_id;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	for (mac_id = IBSS_START_MAC_ID; mac_id < NUM_STA; mac_id++) {
 		if (pmlmeinfo->FW_sta_info[mac_id].status == 0) {
@@ -671,7 +676,7 @@ int allocate_fw_sta_entry(struct adapter *padapter)
 void flush_all_cam_entry(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	invalidate_cam_all(padapter);
 	/* clear default key related key search setting */
@@ -683,19 +688,19 @@ void flush_all_cam_entry(struct adapter *padapter)
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
 	else
-		memcpy(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element));
+		memcpy(&pmlmeinfo->WMM_param, (pIE->data + 6), sizeof(struct WMM_para_element));
 
 	pmlmeinfo->WMM_enable = 1;
 	return true;
@@ -735,7 +740,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 	u32 acParm, i;
 	u32 edca[4], inx[4];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct registry_priv *pregpriv = &padapter->registrypriv;
 
@@ -792,7 +797,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 			switch (ACI) {
 			case 0x0:
 				rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BE, (u8 *)(&acParm));
-				acm_mask |= (ACM ? BIT(1):0);
+				acm_mask |= (ACM ? BIT(1) : 0);
 				edca[XMIT_BE_QUEUE] = acParm;
 				break;
 
@@ -804,13 +809,13 @@ void WMMOnAssocRsp(struct adapter *padapter)
 
 			case 0x2:
 				rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VI, (u8 *)(&acParm));
-				acm_mask |= (ACM ? BIT(2):0);
+				acm_mask |= (ACM ? BIT(2) : 0);
 				edca[XMIT_VI_QUEUE] = acParm;
 				break;
 
 			case 0x3:
 				rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VO, (u8 *)(&acParm));
-				acm_mask |= (ACM ? BIT(3):0);
+				acm_mask |= (ACM ? BIT(3) : 0);
 				edca[XMIT_VO_QUEUE] = acParm;
 				break;
 			}
@@ -836,9 +841,9 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
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
@@ -898,7 +903,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 
 	if (true == pmlmeinfo->bwmode_updated) {
 		struct sta_info *psta;
-		struct wlan_bssid_ex	*cur_network = &(pmlmeinfo->network);
+		struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
 		/* set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode); */
@@ -928,7 +933,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	u8 max_AMPDU_len, min_MPDU_spacing;
 	u8 cur_ldpc_cap = 0, cur_stbc_cap = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
@@ -991,7 +996,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
@@ -1005,7 +1010,7 @@ void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 		return;
 
 	pmlmeinfo->HT_info_enable = 1;
-	memcpy(&(pmlmeinfo->HT_info), pIE->data, pIE->length);
+	memcpy(&pmlmeinfo->HT_info, pIE->data, pIE->length);
 }
 
 void HTOnAssocRsp(struct adapter *padapter)
@@ -1014,7 +1019,7 @@ void HTOnAssocRsp(struct adapter *padapter)
 	unsigned char min_MPDU_spacing;
 	/* struct registry_priv  *pregpriv = &padapter->registrypriv; */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable)) {
 		pmlmeinfo->HT_enable = 1;
@@ -1026,9 +1031,9 @@ void HTOnAssocRsp(struct adapter *padapter)
 
 	/* handle A-MPDU parameter field */
 	/*
-		AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
-		AMPDU_para [4:2]:Min MPDU Start Spacing
-	*/
+	 *	AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
+	 *	AMPDU_para [4:2]:Min MPDU Start Spacing
+	 */
 	max_AMPDU_len = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x03;
 
 	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
@@ -1041,20 +1046,20 @@ void HTOnAssocRsp(struct adapter *padapter)
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
@@ -1109,7 +1114,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	unsigned int len;
 	unsigned char *p;
 	unsigned short	val16, subtype;
-	struct wlan_network *cur_network = &(Adapter->mlmepriv.cur_network);
+	struct wlan_network *cur_network = &Adapter->mlmepriv.cur_network;
 	/* u8 wpa_ie[255], rsn_ie[255]; */
 	u16 wpa_len = 0, rsn_len = 0;
 	u8 encryp_protocol = 0;
@@ -1141,7 +1146,9 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return true;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
+	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) >
+	    DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 	}
@@ -1175,7 +1182,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		ht_info_infos_0 = 0;
 	}
 	if (ht_cap_info != cur_network->bcn_info.ht_cap_info ||
-	    ((ht_info_infos_0&0x03) != (cur_network->bcn_info.ht_info_infos_0&0x03))) {
+	    ((ht_info_infos_0 & 0x03) != (cur_network->bcn_info.ht_info_infos_0 & 0x03))) {
 		{
 			/* bcn_info_update */
 			cur_network->bcn_info.ht_cap_info = ht_cap_info;
@@ -1213,7 +1220,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	bssid->ssid.ssid_length = ssid_len;
 
 	if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
-			bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
+	    bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
 		if (bssid->ssid.ssid[0] != '\0' &&
 		    bssid->ssid.ssid_length != 0) /* not hidden ssid */
 			goto _mismatch;
@@ -1243,12 +1250,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		goto _mismatch;
 
 	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
-		pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length-12);
+		pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
 		if (pbuf && (wpa_ielen > 0)) {
 			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
 					 &pairwise_cipher, &is_8021x);
 		} else {
-			pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length-12);
+			pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
 
 			if (pbuf && (wpa_ielen > 0))
 				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
@@ -1274,8 +1281,10 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	pmlmepriv->NumOfBcnInfoChkFail++;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
-		&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
+	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <=
+	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS) &&
+	    (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 		return _FAIL;
@@ -1327,8 +1336,8 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 	u32 i;
 	struct ndis_80211_var_ie *pIE;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 
 	if (rtw_get_capability((struct wlan_bssid_ex *)cur_network) & WLAN_CAPABILITY_PRIVACY) {
 		for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
@@ -1336,7 +1345,8 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
-				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
+				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) &&
+				    (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
 					return true;
 
 				break;
@@ -1363,7 +1373,7 @@ int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps,
 {
 	unsigned char bit_offset;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (!(pmlmeinfo->HT_enable))
 		return _FAIL;
@@ -1439,7 +1449,8 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
+			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) ||
+			    (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
 				return HT_IOT_PEER_ATHEROS;
 			else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
 				 (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
@@ -1471,7 +1482,7 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 void update_IOT_info(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	switch (pmlmeinfo->assoc_AP_vendor) {
 	case HT_IOT_PEER_MARVELL:
@@ -1501,7 +1512,7 @@ void update_IOT_info(struct adapter *padapter)
 void update_capinfo(struct adapter *Adapter, u16 updateCap)
 {
 	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	bool		ShortPreamble;
 
 	/*  Check preamble mode, 2005.01.06, by rcnjko. */
@@ -1553,8 +1564,8 @@ void update_wireless_mode(struct adapter *padapter)
 	int network_type = 0;
 	u32 SIFS_Timer;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 	unsigned char *rate = cur_network->supported_rates;
 
 	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable))
@@ -1577,7 +1588,7 @@ void update_wireless_mode(struct adapter *padapter)
 
 	SetHwReg8723BS(padapter, HW_VAR_RESP_SIFS,  (u8 *)&SIFS_Timer);
 
-	SetHwReg8723BS(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&(pmlmeext->cur_wireless_mode));
+	SetHwReg8723BS(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&pmlmeext->cur_wireless_mode);
 
 	if (pmlmeext->cur_wireless_mode & WIRELESS_11B)
 		update_mgnt_tx_rate(padapter, IEEE80211_CCK_RATE_1MB);
@@ -1602,8 +1613,8 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
 	int	supportRateNum = 0;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_SUPP_RATES, &ie_len, var_ie_len);
 	if (!pIE)
@@ -1629,13 +1640,13 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct ADDBA_request *preq = (struct ADDBA_request *)paddba_req;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	psta = rtw_get_stainfo(pstapriv, addr);
 
 	if (psta) {
 		param = le16_to_cpu(preq->BA_para_set);
-		tid = (param>>2)&0x0f;
+		tid = (param >> 2) & 0x0f;
 
 		preorder_ctrl = &psta->recvreorder_ctrl[tid];
 
@@ -1653,7 +1664,7 @@ void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	pIE = pframe + sizeof(struct ieee80211_hdr_3addr);
 	pbuf = (__le32 *)pIE;
 
-	pmlmeext->TSFValue = le32_to_cpu(*(pbuf+1));
+	pmlmeext->TSFValue = le32_to_cpu(*(pbuf + 1));
 
 	pmlmeext->TSFValue = pmlmeext->TSFValue << 32;
 
@@ -1672,21 +1683,21 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	__le32 *pbuf;
 	u64 tsf = 0;
 	u32 delay_ms;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pmlmeext->bcn_cnt++;
 
 	pIE = pframe + sizeof(struct ieee80211_hdr_3addr);
 	pbuf = (__le32 *)pIE;
 
-	tsf = le32_to_cpu(*(pbuf+1));
+	tsf = le32_to_cpu(*(pbuf + 1));
 	tsf = tsf << 32;
 	tsf |= le32_to_cpu(*pbuf);
 
 	/* delay = (timestamp mod 1024*100)/1000 (unit: ms) */
 	/* delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval*1024))/1000; */
-	delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval*1024));
-	delay_ms = delay_ms/1000;
+	delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval * 1024));
+	delay_ms = delay_ms / 1000;
 
 	if (delay_ms >= 8)
 		pmlmeext->bcn_delay_cnt[8]++;
@@ -1696,12 +1707,12 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 
 /*
-
-	for (i = 0; i<9; i++)
-	{
-			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
-	}
-*/
+ *
+ *	for (i = 0; i<9; i++)
+ *	{
+ *			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
+ *	}
+ */
 
 	/* dump for  adaptive_early_32k */
 	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
-- 
2.45.3

