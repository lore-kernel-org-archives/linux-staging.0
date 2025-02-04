Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4F920409A
	for <linux-staging@lists.linux.dev>; Tue,  4 Feb 2025 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652306; cv=none; b=a+JXCc3JMOQm+aiwqzozteSonIClXqDnP0NPKjUrCW3UVnh6rbNoN3I0GwytADQXUaULxvitOx/PZ5m+mLT6fvMCVRC/kUm59OUlBD8F7hUkQ5fMst4g+hLMLFu6n21IBARK17FNdQyx1ssmCYZJPVNJN1JsC2paHnZeZ/t1LYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652306; c=relaxed/simple;
	bh=b3lijSXyE6x9SgjhtgDsqZA2uYCgMh+ewY1B6W4ithw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TY6f2Y8tR+bx34Xc631zOE/2npZilpQ8Duf9C/f4fpbjkQQ1nS5+32Qg6JNp9tfouciTiFjTPAei4K+BtKBB46srLGQm5APIPExTwdr9HeItOtOS68FVvEiSsb0HbfjC/EuxaHDJTRRd4J8Uk89mg9ZdiaXWHaxL5A5gG6fAr/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFSKYpPS; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFSKYpPS"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb87127854so1078535b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Feb 2025 22:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652304; x=1739257104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4762hkLrmSiaKdmQk784TxrThn/ycMKykakCzUArJk=;
        b=iFSKYpPSgco7upDyyumnOYB5L3J0BXqlAAf9A+w1d2VbEf0Fm1P1JDw5fWsgA9oaH8
         B42yOdrPOX9RZD3SCmsHzOcU6i3XvbJbB6NzpPAy2Q+Wp4Q04iZpnUuF8v65uAQxoCFH
         K3knEFQk1cLXRhQJmEk/CdHJqHYLja678amM5up7FrN3zwoqKycTMKo0IlRzydllCR+C
         nlaxcbVtUEuy2r6mThDF/BWqlOdOA8b1BPMTevId+q5Jznw9bj/Wj3s4rM3WpHpS6ZtH
         XeWC3VUsuPMpJ3OnKAhVS5pl8U5lLcjyKug45ApIWqkty6I9BfI5pvqRpJVMUt7j1q+d
         4KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652304; x=1739257104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4762hkLrmSiaKdmQk784TxrThn/ycMKykakCzUArJk=;
        b=SrVEle8leqY6YyAWOuSbdKsQwURGhb1DfAOfaExT1/Fn144nK58DeoApXLeIZ+jfGf
         7YLYjLo1Nji4TDlC4Ak5iUXUvHlCTP/2YCffKFWNrSUoYEnqjcIvlVdAEf7KcB3upd+T
         nzhAArFdK5KvYpvIoTwXujHn0h/zb8v9SpkCwtcIjSzZMjAG7Ez6P17EfGsHR/2154KR
         H8IIH37FYO2kmFA6HV7UYy3uNmHGxpQkvpyAYrZOprY+0iUrUuh8jMTITOpybEkW2Hnl
         DYAUao0pSgu1wEAQjsjc/pqNdq+1q6md4m5HVPtNcEmERUR2Fo1D3V/eUh1dRCPTWe3z
         GJpQ==
X-Gm-Message-State: AOJu0YxpXR7ocb2r2GDh5I3IuiTHgSxenBePqgvIwc7aK8QMeM85K7gN
	YPs+73khNM7cqHNeGmoVnIWD1AVPBr2oM3O0UvPTqjaQQRCM95+jiBFfkVEqj+Q=
X-Gm-Gg: ASbGncu39YBcEiKf0FgyHqb91kKLzoggjrwKesCKhRUZINWSKCMa+YKOtP6rdwPmXVD
	n9b+5X6XceYNNykzMzKC9vjNDpD0AqXgYeGsbSqaRYQEZqwfByKFy173RX1hRn8eT4b05Y5pMxw
	xoZsoNE8MIyvQ5aBfrph6jQdKs+7IgeuzEIlMJtffrtXuWQcqjCaCeq3YGZcoECUU5VhyK73Zui
	dMNSMAeGkKRXElFf23lqhJOlvZ9f/A30DmInEk8qQ07HLM0jEz7pNya1WA1g1KjeEATrAbfpOQx
	EQFwDai5wGILvnNxAITxUFWxJUoOMed3aY7Tg8uWiPimSsm34u42a5WbKB6rlIhoc98tPk30pcZ
	D
X-Google-Smtp-Source: AGHT+IFx7DNMU57U7g4/HUYZJ5bg9VweGyCmrkUIq81hlCJJ3ZMs79YG8u1S5Pw8uhNvInKMoMkVdQ==
X-Received: by 2002:a05:6808:4491:b0:3f0:8e41:a7a7 with SMTP id 5614622812f47-3f323820aa2mr18252090b6e.0.1738652303935;
        Mon, 03 Feb 2025 22:58:23 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc104b3c1dsm2984812eaf.8.2025.02.03.22.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:58:23 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: Split up long lines
Date: Mon,  3 Feb 2025 22:57:20 -0800
Message-ID: <d63d1cc70895976f4864740b82e40d0dbd6e6ccf.1738651582.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738651582.git.onlyian4981@gmail.com>
References: <cover.1738651582.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Long lines were present and split up.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index f73bde9ee4d3..7929e93c23ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -336,13 +336,13 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
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
@@ -352,7 +352,8 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
+	/* set center channel */
+	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80);
 
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
@@ -382,7 +383,8 @@ int is_client_associated_to_ap(struct adapter *padapter)
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -393,7 +395,8 @@ int is_client_associated_to_ibss(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -468,7 +471,8 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 void _clear_cam_entry(struct adapter *padapter, u8 entry)
 {
 	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 
 	_write_cam(padapter, entry, 0, null_sta, null_key);
 }
@@ -572,8 +576,8 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 	mlmeinfo = &adapter->mlmeextpriv.mlmext_info;
 
-	if ((((mlmeinfo->state&0x03) == WIFI_FW_AP_STATE) || ((mlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE))
-		&& !sta) {
+	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) ||
+	     ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)) && !sta) {
 		/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
 		if (kid > 3) {
 			netdev_dbg(adapter->pnetdev,
@@ -1142,7 +1146,9 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return true;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
+	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) >
+	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 	}
@@ -1214,7 +1220,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	bssid->ssid.ssid_length = ssid_len;
 
 	if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
-			bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
+	    bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
 		if (bssid->ssid.ssid[0] != '\0' &&
 		    bssid->ssid.ssid_length != 0) /* not hidden ssid */
 			goto _mismatch;
@@ -1275,8 +1281,10 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
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
@@ -1337,7 +1345,8 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
-				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
+				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) &&
+				    (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
 					return true;
 
 				break;
@@ -1440,7 +1449,8 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
+			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) ||
+			    (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
 				return HT_IOT_PEER_ATHEROS;
 			else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
 				 (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
-- 
2.45.3

