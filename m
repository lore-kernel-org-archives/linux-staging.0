Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F313815D0
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770654963; cv=none; b=frMYqIHfIQj4XmhxEsI84Lk3BisR7UOUEZt/Tonl2CKLadq96W8+dVM7RKwCT8Vdr1A+uar6YdwDzVSE/XEGCDB8jgAXFAJrwbayXakK8KGavjnuruTkFMiBSSnwhVhcLOfkhxqTgZUST4NQA9RJz7F3I6tmfP/IDAbVJCOLdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770654963; c=relaxed/simple;
	bh=OTUexOd3VcBWUHQ7MAhWUSjUtlwn3oPc50i10o7xgIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AKTktjbeL5xOAurvZIpG4fJ6RBRH1QqfEx03MHiJooBsx51D+CS/WdjfNOBl9PeBFZlRRmcSYBv4fqMP9agi6OH8SLhYms4aj+ThyWuuR5EyTXi80mrT+suQYBSGoqyR5x3Y/DJSzqp/eMNLNUKgKz48Ho9KehQWZQozKma22Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLkbvLTS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLkbvLTS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4362197d174so2697742f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 08:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770654961; x=1771259761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ht2iDYe8UdHTKix2d3ugZgVcYP845JR6yAYvYD1nnus=;
        b=mLkbvLTSgb8Fg5mkL9RqoWaaoiyA/465vUBTKmIa8isnIGCPmG1XtRbSdjK9exmcdt
         t3gftVGbF8bIURzaJQNZmKFdzmMms3AAx4Rp5KoBVSAhKJa/JlXr9WA+9vjPpX8LDZJ8
         HirXVsZnMOJfAeUQgfhGzsYvCF34R3V2ftRH88cq7gMmjmS+L/ChRq+GeX+ICfCksxan
         TnubWZUrdgeN1QIQeQn6GNhMSc6JIel8lPxQSXPU5axY2tY6gQ+N6YqeOOz0P4nuvxLY
         DsVckp1G2aZnIVHg0T1FOV0O3TxeOBKYIoA6pTViY40WsNYm24SJRQ5tPIgX9fVy1H7V
         o9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770654961; x=1771259761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht2iDYe8UdHTKix2d3ugZgVcYP845JR6yAYvYD1nnus=;
        b=nsvCTmQsxX11R4RA0Ad49s8O4J//j0+j2eJu1PayO0OydXGgetWuoY+OwHkoHozBYY
         Jzgm/zeLZiI/5GBMMAa2F6f6HM4+1tt/wgBKnRgzSQ9AEp6rsJsE6xsTdtVXEyjX3ogr
         Sd+sGUB9xsEVbxtieCwXeEN5kBdTetUHNrHgaFi/Iv4NAPfQLovW8ay5urCT8ZZBq1z3
         54ppLmt/cjGzHB/8tpZ6BLOsvODcjCLUfRn8CERX89/5GZ6kosgjJb3V2/Bl+eQTQzfX
         axtlFwhlt5+oFzckbgLtwwY+H13pRLVsIaN35qnF4s6teYxfbq2eP352o763e906ZS2x
         OPtg==
X-Gm-Message-State: AOJu0YwzH6EtXio/w/dkdr4KbCbe38JQH+feA27vWq6hrpVs2B4YuHQr
	NSY8/3U7WyPGGGNP+4ZiYFZdPrP/9F+ki5wtm/ZIGFZbobLvQxKwdU7A1aIzpWsA
X-Gm-Gg: AZuq6aK7ke/+SH2ayXaBaP5ASBkmF2XuWG/GS09BsqRz73LajgNO8k1Gs9Pj5TIRaJB
	1Ok4nDQCstRRLWAxuIG3nYpqo/z5I6+xPCCYCsB/JHuKAqes8YztQq+BNUV98YIXoncbFOV4me2
	HnpjxBxqh3mvfK/SCcheNxEHRjY24tSjwq3OKNHuPwmmBJHt5gC99nc1fRixwQGc8oUaA1d9NCf
	uzkQhfXL2aVDWSEGyNtRXR20jxOOQZKFs1VPXrB0K4q2YmoUDiLXR4oI7P6PmeyBarhq49KZEIu
	ErnzYadaFvuVK1LFmQRZC828LqJ9gqIO9cgApt5W++ytACzyTDejE2rmXDjJA2dw212CjGuY19Z
	vRthacCtP6PDpJdWSqaK5QUcF3ZPy9JNUpqu9lmYqZnwGROMXrB1fEXasoW6sWhbilnjsK0zz4j
	CTA3NR4luRuR5FFnKf1BHPBXhACeXkhURKTdv4fRaLM3ACAKyo14M6XwSr
X-Received: by 2002:a05:6000:26c6:b0:437:770d:4d9 with SMTP id ffacd0b85a97d-437770d069bmr2092165f8f.18.1770654960952;
        Mon, 09 Feb 2026 08:36:00 -0800 (PST)
Received: from localhost.localdomain ([37.60.47.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297455eesm28246309f8f.29.2026.02.09.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:36:00 -0800 (PST)
From: Esther Zilberberg <esty5664@gmail.com>
To: gregkh@linuxfoundation.org,
	trohan2000@gmail.com,
	bryant.boatright@proton.me,
	bqn9090@gmail.com,
	dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	davidzalman.101@gmail.com,
	abrahamadekunle50@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Esther Zilberberg <esty5664@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename supportRateNum to support_rate_num
Date: Mon,  9 Feb 2026 16:34:58 +0000
Message-ID: <20260209163458.7149-1-esty5664@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename supportRateNum to support_rate_num to fix warning
reported by checkpatch.pl.

Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        | 16 ++++++++--------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  8 ++++----
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..81493dc3e1bc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -368,7 +368,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 void update_bmc_sta(struct adapter *padapter)
 {
 	unsigned char network_type;
-	int supportRateNum = 0;
+	int support_rate_num = 0;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -392,9 +392,9 @@ void update_bmc_sta(struct adapter *padapter)
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 		/* prepare for add_RATid */
-		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
+		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-						      supportRateNum,
+						      support_rate_num,
 						      pcur_network->configuration.ds_config
 		);
 		if (is_supported_tx_cck(network_type)) {
@@ -808,7 +808,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	uint ie_len = 0;
 	int group_cipher, pairwise_cipher;
 	u8 channel, network_type, supportRate[NDIS_802_11_LENGTH_RATES_EX];
-	int supportRateNum = 0;
+	int support_rate_num = 0;
 	u8 OUI1[] = {0x00, 0x50, 0xf2, 0x01};
 	u8 WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -878,7 +878,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p) {
 		memcpy(supportRate, p + 2, ie_len);
-		supportRateNum = ie_len;
+		support_rate_num = ie_len;
 	}
 
 	/* get ext_supported rates */
@@ -887,11 +887,11 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
 	if (p) {
-		memcpy(supportRate + supportRateNum, p + 2, ie_len);
-		supportRateNum += ie_len;
+		memcpy(supportRate + support_rate_num, p + 2, ie_len);
+		support_rate_num += ie_len;
 	}
 
-	network_type = rtw_check_network_type(supportRate, supportRateNum, channel);
+	network_type = rtw_check_network_type(supportRate, support_rate_num, channel);
 
 	rtw_set_supported_rate(pbss_network->supported_rates, network_type);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..73fd88eca0e2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -938,7 +938,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
 	unsigned char supportRate[16];
-	int					supportRateNum;
+	int					support_rate_num;
 	unsigned short		status = WLAN_STATUS_SUCCESS;
 	unsigned short		frame_type, ie_offset = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1025,7 +1025,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if (!p) {
 		/*  use our own rate set as statoin used */
 		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
-		/* supportRateNum = AP_BSSRATE_LEN; */
+		/* support_rate_num = AP_BSSRATE_LEN; */
 
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
@@ -1034,25 +1034,25 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			ie_len = sizeof(supportRate);
 
 		memcpy(supportRate, p+2, ie_len);
-		supportRateNum = ie_len;
+		support_rate_num = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
 				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
 
-			if (supportRateNum + ie_len <= sizeof(supportRate)) {
-				memcpy(supportRate+supportRateNum, p+2, ie_len);
-				supportRateNum += ie_len;
+			if (support_rate_num + ie_len <= sizeof(supportRate)) {
+				memcpy(supportRate+support_rate_num, p+2, ie_len);
+				support_rate_num += ie_len;
 			}
 		}
 	}
 
 	/* todo: mask supportRate between AP & STA -> move to update raid */
-	/* get_matched_rate(pmlmeext, supportRate, &supportRateNum, 0); */
+	/* get_matched_rate(pmlmeext, supportRate, &support_rate_num, 0); */
 
 	/* update station supportRate */
-	pstat->bssratelen = supportRateNum;
-	memcpy(pstat->bssrateset, supportRate, supportRateNum);
+	pstat->bssratelen = support_rate_num;
+	memcpy(pstat->bssrateset, supportRate, support_rate_num);
 	update_basic_rate_table_soft_ap(pstat->bssrateset, pstat->bssratelen);
 
 	/* check RSN/WPA/WPS */
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa50699e..ffbdef917251 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1596,7 +1596,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 {
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
-	int	supportRateNum = 0;
+	int	support_rate_num = 0;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
@@ -1607,11 +1607,11 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 		return _FAIL;
 
 	memcpy(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates, pIE->data, ie_len);
-	supportRateNum = ie_len;
+	support_rate_num = ie_len;
 
 	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_EXT_SUPP_RATES, &ie_len, var_ie_len);
-	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - supportRateNum))
-		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + supportRateNum), pIE->data, ie_len);
+	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - support_rate_num))
+		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + support_rate_num), pIE->data, ie_len);
 
 	return _SUCCESS;
 }
-- 
2.43.0

