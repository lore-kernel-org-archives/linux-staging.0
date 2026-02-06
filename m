Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE934BA56
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364531; cv=none; b=Bvnxk5pgMxQoVuT0gUNZVQNsZEx8Gr5wvXym2mM7kxL47lJqGR3lpHJjHGHA4CpWJR+m/bC3LZbeo6HCR+xEJstWgl6eydKYaotd67JGO922CqGNmht4z/MXpTBj2Q2EkpEopykodsOJLlk7HrtcxzbVwkDbVcLrdBqAp9QwSi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364531; c=relaxed/simple;
	bh=NvZ+Ohk/ELsImHlF9Phk8fTFMqmbGoZXrHR4ETwmFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uy6Ts5n75LXp0ggAc8gsjmp6Vo9k5QIwTM/aTVQDFn8XmG0UaS4jz+pPGgMUfX0mp1WwRv5D6AUW33WOWH1Vj8nzv+6hZSIZcRWVKB9jzb5piPNkemyees5Y1trB/OGxoaOelMpzcGWK3ElJKfo0hIN2PAlEom8pVA68jifGHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCQarXXf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCQarXXf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso22850025e9.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364529; x=1770969329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wJcdfl4Z4reZKMqKpQhsE3g0fJELUoIy4wFtm3iM4g=;
        b=FCQarXXfyAfsh5JLGA+4BBRUy2sPeggxxMr0RG39Eymeyn5GGdquHdx08xax90ap7r
         urCp6kRDchW6MFOwhMOoj5lhoWJUQHUaFbo+cIzHia8zN+fzROjbOPdqhXJMYzY4GRak
         5zrLAEL8gpNtvdO5LOkjA7YnrrgTBtnkczc+02a4RuNNdri4dcwal+I7q18IqZP0dQqD
         xC71f+8k74hf6UkD3oXE9BgSJPnG6trhXsfVveZaYEsEMS+J/NfxNFISdfH5Y+0qlVLw
         Ys660TGJz7Bo/ijRSTsLSj5SV1aU9/NdY0sSj1woqB1ElAEfdxgoT6xIOLi0z6Lmu/Ad
         nfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364529; x=1770969329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wJcdfl4Z4reZKMqKpQhsE3g0fJELUoIy4wFtm3iM4g=;
        b=VnLQB+Dy+HJwjsEf8VZWdL5+yhtgRuesonxazP+LoSol9jhj0nS7iPsGEKhXuGwk5a
         f5d1jbZOsdBpoaTYPM0Rqfb43D/tDCbcxBQr7HEQqIrGEbQwvCISp+khgss0VVYRbSzK
         Geyicvhn076hpqdhvP6hJ0Rihs/GckgEE9MTzOZqFJVRvthoxqkFKBcX6UuU8WYakKBs
         MG1VSa1BAzO6Pr73NB7W5QKauQ1ua6yxfLWkEU4nN5FYN6lM1YrPmWBpKzzqJeuz+pYC
         Cm3lRHKSQFHFSrtYhArCeUZ3wqaXXVHfwRo/0w2Q64KcOVbfmHe9Mavrr5eZ8Lpm/gmN
         wZqw==
X-Forwarded-Encrypted: i=1; AJvYcCVY9nItpO7yecpnbxi8ZRwwVTWJiOZf9QfbaPDeVPKvnIxVqDKzZra7iNPUz6E+3qVCfOIib3tzMpMCc7rZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwfJl+TuPa+hpHwS9rmAUUBer1W3+AKUShElLTzvw/0gINSSqL0
	bpbs0GiCzzYgiGzr4x4zrTztBImtmAuX25+UeH17CYjNfwzCCFJLlAc=
X-Gm-Gg: AZuq6aKhUHH53ZeWOyP9JDCWsPSCUrydT90A5x63kVqZ0s3Ij+y9Xk5ofiac6yBmrOB
	6F8DM26w/kJighfLXeuzdavtXHVEkY95crjJfvXLI9rLpL6vfH9kCAk++yobofWsMY3jKlflwPG
	Fm7Znedim4QcGBvNrdA/RaW+gmG5RHqe9SA61fWKM2ia6FIDWUYbBxRcRz0JySm/T1FjKnNAigD
	Qs6a94lB7SXAgxEy0cti7erRFoOlIFOsZTUXfQmP4QCSq87aOJj5eeRJodFVvLkrAXzPLHhDG9C
	jgxQHEb4pFoYJRYZuWdJNrjzrVzfqm0sdXnvqhS0fhlvzMOARhBCjIpfu0gPFdrf1vajpgnJpzC
	4tgIO0AhwGigkI6vUme8a6lL8mp8w7pe10tN4g2AISVVSZi+TSHuxGndDeVv3vfq6hWrXXFeR4+
	l0VMUjl+O0NvFXOVp8IwMtR9qqTqfiE7+OnH4/7qQnQbmL5lMU1b0Kv2Z5vY90Pio=
X-Received: by 2002:a05:600c:c84:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-483203d54ffmr24089285e9.13.1770364528978;
        Thu, 05 Feb 2026 23:55:28 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:28 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 23/26] staging: rtl8723bs: core: fix line lengths in rtw_mlme_ext.c
Date: Fri,  6 Feb 2026 08:54:36 +0100
Message-ID: <20260206075439.103287-24-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 471 ++++++++++++------
 1 file changed, 325 insertions(+), 146 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f2b0233627c8..000d6f353a34 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -62,12 +62,14 @@ static unsigned char REALTEK_96B_IE[] = {0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20};
 
 /* ChannelPlan definitions */
 static struct rt_channel_plan_2g	RTW_ChannelPlan2G[RT_CHANNEL_DOMAIN_2G_MAX] = {
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x00, RT_CHANNEL_DOMAIN_2G_WORLD , Passive scan CH 12, 13 */
+	/* 0x00, RT_CHANNEL_DOMAIN_2G_WORLD, Passive scan CH 12, 13 */
+	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x01, RT_CHANNEL_DOMAIN_2G_ETSI1 */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, 11},			/*  0x02, RT_CHANNEL_DOMAIN_2G_FCC1 */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},	/*  0x03, RT_CHANNEL_DOMAIN_2G_MIKK1 */
 	{{10, 11, 12, 13}, 4},						/*  0x04, RT_CHANNEL_DOMAIN_2G_ETSI2 */
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},	/*  0x05, RT_CHANNEL_DOMAIN_2G_GLOBAL , Passive scan CH 12, 13, 14 */
+	/* 0x05, RT_CHANNEL_DOMAIN_2G_GLOBAL, Passive scan CH 12, 13, 14 */
+	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},
 	{{}, 0},								/*  0x06, RT_CHANNEL_DOMAIN_2G_NULL */
 };
 
@@ -194,15 +196,24 @@ int init_hw_mlme_ext(struct adapter *padapter)
 void init_mlme_default_rate_set(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-
-	unsigned char mixed_datarate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _9M_RATE_, _12M_RATE_, _18M_RATE_, _24M_RATE_, _36M_RATE_, _48M_RATE_, _54M_RATE_, 0xff};
-	unsigned char mixed_basicrate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _12M_RATE_, _24M_RATE_, 0xff,};
-	unsigned char supported_mcs_set[16] = {0xff, 0xff, 0x00, 0x00, 0x01, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+	static const unsigned char mixed_datarate[NumRates] = {
+		_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_,
+		_6M_RATE_, _9M_RATE_, _12M_RATE_, _18M_RATE_,
+		_24M_RATE_, _36M_RATE_, _48M_RATE_, _54M_RATE_, 0xff
+	};
+	static const unsigned char mixed_basicrate[NumRates] = {
+		_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_,
+		_6M_RATE_, _12M_RATE_, _24M_RATE_, 0xff
+	};
+	static const unsigned char supported_mcs_set[16] = {
+		0xff, 0xff, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+	};
 
 	memcpy(pmlmeext->datarate, mixed_datarate, NumRates);
 	memcpy(pmlmeext->basicrate, mixed_basicrate, NumRates);
-
-	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set, sizeof(pmlmeext->default_supported_mcs_set));
+	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set,
+	       sizeof(pmlmeext->default_supported_mcs_set));
 }
 
 static void init_mlme_ext_priv_value(struct adapter *padapter)
@@ -319,7 +330,8 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 
 }
 
-static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_channel_info *channel_set)
+static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan,
+			   struct rt_channel_info *channel_set)
 {
 	u8 index, chanset_size = 0;
 	u8 b2_4GBand = false;
@@ -340,22 +352,27 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 
 	if (b2_4GBand) {
 		for (index = 0; index < RTW_ChannelPlan2G[Index2G].Len; index++) {
-			channel_set[chanset_size].ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
-
-			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) ||/* Channel 1~11 is active, and 12~14 is passive */
-				(ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
-				if (channel_set[chanset_size].ChannelNum >= 1 && channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
-				else if ((channel_set[chanset_size].ChannelNum  >= 12 && channel_set[chanset_size].ChannelNum  <= 14))
-					channel_set[chanset_size].ScanType  = SCAN_PASSIVE;
+			struct rt_channel_info *ch = &channel_set[chanset_size];
+
+			ch->ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
+
+			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) ||
+			    (ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
+				/* Channel 1~11 active, 12~14 passive */
+				if (ch->ChannelNum >= 1 && ch->ChannelNum <= 11)
+					ch->ScanType = SCAN_ACTIVE;
+				else if (ch->ChannelNum >= 12 && ch->ChannelNum <= 14)
+					ch->ScanType = SCAN_PASSIVE;
 			} else if (ChannelPlan == RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
-				 Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) { /*  channel 12~13, passive scan */
-				if (channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+				   Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) {
+				/* channel 12~13, passive scan */
+				if (ch->ChannelNum <= 11)
+					ch->ScanType = SCAN_ACTIVE;
 				else
-					channel_set[chanset_size].ScanType = SCAN_PASSIVE;
-			} else
-				channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+					ch->ScanType = SCAN_PASSIVE;
+			} else {
+				ch->ScanType = SCAN_ACTIVE;
+			}
 
 			chanset_size++;
 		}
@@ -391,8 +408,11 @@ void init_mlme_ext_priv(struct adapter *padapter)
 
 	init_mlme_ap_info(padapter);
 
-	pmlmeext->max_chan_nums = init_channel_set(padapter, pmlmepriv->ChannelPlan, pmlmeext->channel_set);
-	init_channel_list(padapter, pmlmeext->channel_set, pmlmeext->max_chan_nums, &pmlmeext->channel_list);
+	pmlmeext->max_chan_nums = init_channel_set(padapter,
+						   pmlmepriv->ChannelPlan,
+						   pmlmeext->channel_set);
+	init_channel_list(padapter, pmlmeext->channel_set,
+			  pmlmeext->max_chan_nums, &pmlmeext->channel_list);
 	pmlmeext->last_scan_time = 0;
 	pmlmeext->chan_scan_time = SURVEY_TO;
 	pmlmeext->mlmeext_init = true;
@@ -417,7 +437,9 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	}
 }
 
-static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, union recv_frame *precv_frame)
+static void _mgt_dispatcher(struct adapter *padapter,
+			    struct mlme_handler *ptable,
+			    union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 
@@ -571,8 +593,10 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	int ret = _SUCCESS;
 	u8 *p = NULL;
 	u32 ielen = 0;
+	u8 *ie_start = pframe + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_;
+	int ie_len = len - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_;
 
-	p = rtw_get_ie(pframe + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_, WLAN_EID_EXT_SUPP_RATES, &ielen, precv_frame->u.hdr.len - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_);
+	p = rtw_get_ie(ie_start, WLAN_EID_EXT_SUPP_RATES, &ielen, ie_len);
 	if (p && ielen > 0) {
 		if (p + 2 + ielen < pframe + len) {
 			if ((*(p + 1 + ielen) == 0x2D) && (*(p + 2 + ielen) != 0x2D))
@@ -599,7 +623,12 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			}
 
 			/* check the vendor of the assoc AP */
-			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe+sizeof(struct ieee80211_hdr_3addr), len-sizeof(struct ieee80211_hdr_3addr));
+			{
+				u8 *ap_ie = pframe + sizeof(struct ieee80211_hdr_3addr);
+				int ap_ie_len = len - sizeof(struct ieee80211_hdr_3addr);
+
+				pmlmeinfo->assoc_AP_vendor = check_assoc_AP(ap_ie, ap_ie_len);
+			}
 
 			/* update TSF Value */
 			update_TSF(pmlmeext, pframe, len);
@@ -618,7 +647,8 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			return _SUCCESS;
 		}
 
-		if (((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE &&
+		    (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
@@ -650,9 +680,17 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 					goto _END_ONBEACON_;
 
 				/* get supported rate */
-				if (update_sta_support_rate(padapter, (pframe + WLAN_HDR_A3_LEN + _BEACON_IE_OFFSET_), (len - WLAN_HDR_A3_LEN - _BEACON_IE_OFFSET_), cam_idx) == _FAIL) {
-					pmlmeinfo->FW_sta_info[cam_idx].status = 0;
-					goto _END_ONBEACON_;
+				{
+					u8 *rate_ie = pframe + WLAN_HDR_A3_LEN + _BEACON_IE_OFFSET_;
+					int rate_len = len - WLAN_HDR_A3_LEN - _BEACON_IE_OFFSET_;
+					int ret;
+
+					ret = update_sta_support_rate(padapter, rate_ie,
+								      rate_len, cam_idx);
+					if (ret == _FAIL) {
+						pmlmeinfo->FW_sta_info[cam_idx].status = 0;
+						goto _END_ONBEACON_;
+					}
 				}
 
 				/* update TSF Value */
@@ -800,9 +838,11 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->state |= WIFI_FW_AUTH_STATE;
 			pstat->authalg = algorithm;
 		} else if (seq == 3) {
+			u8 *auth_ie = pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_;
+			int auth_len = len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4;
 
-			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
-					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
+			p = rtw_get_ie(auth_ie, WLAN_EID_CHALLENGE, (int *)&ie_len,
+				       auth_len);
 
 			if (!p || ie_len <= 0) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -1021,7 +1061,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 
 	/*  check if the supported rate is ok */
-	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SUPP_RATES, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+	{
+		u8 *rate_ie = pframe + WLAN_HDR_A3_LEN + ie_offset;
+		int rate_ie_len = pkt_len - WLAN_HDR_A3_LEN - ie_offset;
+
+		p = rtw_get_ie(rate_ie, WLAN_EID_SUPP_RATES, &ie_len, rate_ie_len);
+	}
 	if (!p) {
 		/*  use our own rate set as statoin used */
 		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
@@ -1070,7 +1115,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.rsn_ie;
 		wpa_ie_len = elems.rsn_ie_len;
 
-		if (rtw_parse_wpa2_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+		if (rtw_parse_wpa2_ie(wpa_ie - 2, wpa_ie_len + 2,
+				      &group_cipher, &pairwise_cipher,
+				      NULL) == _SUCCESS) {
 			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(1);
 
@@ -1132,8 +1179,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
+				u8 *wps_ie = pmlmepriv->wps_beacon_ie;
+				uint wps_len = pmlmepriv->wps_beacon_ie_len;
 
-				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie, pmlmepriv->wps_beacon_ie_len, WPS_ATTR_SELECTED_REGISTRAR, &selected_registrar, NULL);
+				rtw_get_wps_attr_content(wps_ie, wps_len,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 &selected_registrar, NULL);
 
 				if (!selected_registrar) {
 					status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
@@ -2155,11 +2206,18 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			u8 *wps_ie;
 			uint wps_ielen;
 			u8 sr = 0;
-
-			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr)+_BEACON_IE_OFFSET_,
-				pattrib->pktlen-sizeof(struct ieee80211_hdr_3addr)-_BEACON_IE_OFFSET_, NULL, &wps_ielen);
+			u8 *bcn_ie = pmgntframe->buf_addr + TXDESC_OFFSET +
+				     sizeof(struct ieee80211_hdr_3addr) +
+				     _BEACON_IE_OFFSET_;
+			int bcn_ie_len = pattrib->pktlen -
+					 sizeof(struct ieee80211_hdr_3addr) -
+					 _BEACON_IE_OFFSET_;
+
+			wps_ie = rtw_get_wps_ie(bcn_ie, bcn_ie_len, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
-				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
+				rtw_get_wps_attr_content(wps_ie, wps_ielen,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 &sr, NULL);
 			if (sr != 0)
 				set_fwstate(pmlmepriv, WIFI_UNDER_WPS);
 			else
@@ -2190,33 +2248,47 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	pframe += 2;
 	pattrib->pktlen += 2;
 
-	/*  SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pattrib->pktlen);
+	{
+		u8 *ssid = cur_network->ssid.ssid;
+		int ssid_len = cur_network->ssid.ssid_length;
+		u8 *rates = cur_network->supported_rates;
+		u8 ds_cfg = cur_network->configuration.ds_config;
+
+		/* SSID */
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len, ssid,
+				    &pattrib->pktlen);
 
-	/*  supported rates... */
-	rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pattrib->pktlen);
+		/* supported rates */
+		rate_len = rtw_get_rateset_len(rates);
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+				    min_t(int, rate_len, 8), rates,
+				    &pattrib->pktlen);
 
-	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
+		/* DS parameter set */
+		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ds_cfg,
+				    &pattrib->pktlen);
+	}
 
-	/* if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) */
 	{
 		u8 erpinfo = 0;
-		u32 ATIMWindow;
-		/*  IBSS Parameter Set... */
-		/* ATIMWindow = cur->configuration.ATIMWindow; */
-		ATIMWindow = 0;
-		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
+		u32 ATIMWindow = 0;
+
+		/* IBSS Parameter Set */
+		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2,
+				    (unsigned char *)&ATIMWindow, &pattrib->pktlen);
 
 		/* ERP IE */
-		pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo,
+				    &pattrib->pktlen);
 	}
 
+	/* EXTENDED SUPPORTED RATE */
+	if (rate_len > 8) {
+		u8 *ext_rates = cur_network->supported_rates + 8;
 
-	/*  EXTERNDED SUPPORTED RATE */
-	if (rate_len > 8)
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    rate_len - 8, ext_rates, &pattrib->pktlen);
+	}
 
 
 	/* todo:HT for adhoc */
@@ -2295,7 +2367,10 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		return;
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
-		pwps_ie = rtw_get_wps_ie(cur_network->ies+_FIXED_IE_LENGTH_, cur_network->ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
+		u8 *ie_ptr = cur_network->ies + _FIXED_IE_LENGTH_;
+		int ie_len = cur_network->ie_length - _FIXED_IE_LENGTH_;
+
+		pwps_ie = rtw_get_wps_ie(ie_ptr, ie_len, NULL, &wps_ielen);
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
@@ -2391,33 +2466,49 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		pattrib->pktlen += 2;
 
 		/* below for ad-hoc mode */
+		{
+			u8 *ssid = cur_network->ssid.ssid;
+			int ssid_len = cur_network->ssid.ssid_length;
+			u8 *rates = cur_network->supported_rates;
+			u8 ds_cfg = cur_network->configuration.ds_config;
+
+			/* SSID */
+			pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len, ssid,
+					    &pattrib->pktlen);
+
+			/* supported rates */
+			rate_len = rtw_get_rateset_len(rates);
+			pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+					    min_t(int, rate_len, 8), rates,
+					    &pattrib->pktlen);
+
+			/* DS parameter set */
+			pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ds_cfg,
+					    &pattrib->pktlen);
+		}
 
-		/*  SSID */
-		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pattrib->pktlen);
-
-		/*  supported rates... */
-		rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pattrib->pktlen);
-
-		/*  DS parameter set */
-		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
-
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			u8 erpinfo = 0;
-			u32 ATIMWindow;
-			/*  IBSS Parameter Set... */
-			/* ATIMWindow = cur->configuration.ATIMWindow; */
-			ATIMWindow = 0;
-			pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
+			u32 ATIMWindow = 0;
+
+			/* IBSS Parameter Set */
+			pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2,
+					    (unsigned char *)&ATIMWindow,
+					    &pattrib->pktlen);
 
 			/* ERP IE */
-			pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
+			pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo,
+					    &pattrib->pktlen);
 		}
 
+		/* EXTENDED SUPPORTED RATE */
+		if (rate_len > 8) {
+			u8 *ext_rates = cur_network->supported_rates + 8;
 
-		/*  EXTERNDED SUPPORTED RATE */
-		if (rate_len > 8)
-			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
+			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+					    rate_len - 8, ext_rates,
+					    &pattrib->pktlen);
+		}
 
 
 		/* todo:HT for adhoc */
@@ -2496,8 +2587,11 @@ static int _issue_probereq(struct adapter *padapter,
 	get_rate_set(padapter, bssrate, &bssrate_len);
 
 	if (bssrate_len > 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate,
+				    &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    bssrate_len - 8, bssrate + 8,
+				    &pattrib->pktlen);
 	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
 	}
@@ -2532,8 +2626,8 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 	_issue_probereq(padapter, pssid, da, 0, 1, false);
 }
 
-int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
+		      u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2640,14 +2734,16 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN);
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
-		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		/* setting auth algo number: 0=OPEN System, 1=Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
 
 		/* setting IV for auth seq #3 */
-		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
+		if (pmlmeinfo->auth_seq == 3 &&
+		    (pmlmeinfo->state & WIFI_FW_AUTH_STATE) &&
+		    use_shared_key == 1) {
 			__le32 le_tmp32;
 
 			val32 = ((pmlmeinfo->iv++) | (pmlmeinfo->key_index << 30));
@@ -2669,8 +2765,11 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
 
 		/*  then checking to see if sending challenging text... */
-		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
-			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128, pmlmeinfo->chg_txt, &(pattrib->pktlen));
+		if (pmlmeinfo->auth_seq == 3 &&
+		    (pmlmeinfo->state & WIFI_FW_AUTH_STATE) &&
+		    use_shared_key == 1) {
+			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128,
+					    pmlmeinfo->chg_txt, &pattrib->pktlen);
 
 			SetPrivacy(fctrl);
 
@@ -2693,7 +2792,8 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 }
 
 
-void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type)
+void issue_asocrsp(struct adapter *padapter, unsigned short status,
+		   struct sta_info *pstat, int pkt_type)
 {
 	struct xmit_frame	*pmgntframe;
 	struct ieee80211_hdr	*pwlanhdr;
@@ -2754,18 +2854,25 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	pframe = rtw_set_fixed_ie(pframe, _ASOC_ID_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
 
 	if (pstat->bssratelen <= 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, pstat->bssratelen, pstat->bssrateset, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+				    pstat->bssratelen, pstat->bssrateset,
+				    &pattrib->pktlen);
 	} else {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen-8), pstat->bssrateset+8, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8,
+				    pstat->bssrateset, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    pstat->bssratelen - 8, pstat->bssrateset + 8,
+				    &pattrib->pktlen);
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
 		uint ie_len = 0;
+		u8 *beacon_ie = ie + _BEACON_IE_OFFSET_;
+		int beacon_len = pnetwork->ie_length - _BEACON_IE_OFFSET_;
 
 		/* FILL HT CAP INFO IE */
-		/* p = hostapd_eid_ht_capabilities_info(hapd, p); */
-		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
+		pbuf = rtw_get_ie(beacon_ie, WLAN_EID_HT_CAPABILITY,
+				  &ie_len, beacon_len);
 		if (pbuf && ie_len > 0) {
 			memcpy(pframe, pbuf, ie_len+2);
 			pframe += (ie_len+2);
@@ -2773,8 +2880,8 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		}
 
 		/* FILL HT ADD INFO IE */
-		/* p = hostapd_eid_ht_operation(hapd, p); */
-		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_OPERATION, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
+		pbuf = rtw_get_ie(beacon_ie, WLAN_EID_HT_OPERATION,
+				  &ie_len, beacon_len);
 		if (pbuf && ie_len > 0) {
 			memcpy(pframe, pbuf, ie_len+2);
 			pframe += (ie_len+2);
@@ -2789,7 +2896,10 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		unsigned char WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 
 		for (pbuf = ie + _BEACON_IE_OFFSET_; ; pbuf += (ie_len + 2)) {
-			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2)));
+			int remaining = pnetwork->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2);
+
+			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC,
+					  &ie_len, remaining);
 			if (pbuf && !memcmp(pbuf+2, WMM_PARA_IE, 6)) {
 				memcpy(pframe, pbuf, ie_len+2);
 				pframe += (ie_len+2);
@@ -2879,7 +2989,13 @@ void issue_assocreq(struct adapter *padapter)
 	pattrib->pktlen += 2;
 
 	/* SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID,  pmlmeinfo->network.ssid.ssid_length, pmlmeinfo->network.ssid.ssid, &(pattrib->pktlen));
+	{
+		u8 *ssid = pmlmeinfo->network.ssid.ssid;
+		int ssid_len = pmlmeinfo->network.ssid.ssid_length;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len, ssid,
+				    &pattrib->pktlen);
+	}
 
 	/* supported rate & extended supported rate */
 
@@ -2927,10 +3043,15 @@ void issue_assocreq(struct adapter *padapter)
 
 
 	if (bssrate_len > 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
-	} else
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate,
+				    &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    bssrate_len - 8, bssrate + 8,
+				    &pattrib->pktlen);
+	} else {
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len,
+				    bssrate, &pattrib->pktlen);
+	}
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
@@ -2952,7 +3073,9 @@ void issue_assocreq(struct adapter *padapter)
 					vs_ie_length = 14;
 				}
 
-				pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, vs_ie_length, pIE->data, &(pattrib->pktlen));
+				pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC,
+						    vs_ie_length, pIE->data,
+						    &pattrib->pktlen);
 			}
 			break;
 
@@ -2962,15 +3085,22 @@ void issue_assocreq(struct adapter *padapter)
 		case WLAN_EID_HT_CAPABILITY:
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
-					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
-					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
+					memcpy(&pmlmeinfo->HT_caps, pIE->data,
+					       sizeof(struct HT_caps_element));
+					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
+							    pIE->length,
+							    (u8 *)&pmlmeinfo->HT_caps,
+							    &pattrib->pktlen);
 				}
 			}
 			break;
 
 		case WLAN_EID_EXT_CAPABILITY:
-			if (padapter->mlmepriv.htpriv.ht_option)
-				pframe = rtw_set_ie(pframe, WLAN_EID_EXT_CAPABILITY, pIE->length, pIE->data, &(pattrib->pktlen));
+			if (padapter->mlmepriv.htpriv.ht_option) {
+				pframe = rtw_set_ie(pframe, WLAN_EID_EXT_CAPABILITY,
+						    pIE->length, pIE->data,
+						    &pattrib->pktlen);
+			}
 			break;
 		default:
 			break;
@@ -3071,7 +3201,8 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
  * When wait_ms > 0, this function should be called at process context
  * da == NULL for station mode
  */
-int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms)
+int issue_nulldata(struct adapter *padapter, unsigned char *da,
+		   unsigned int power_mode, int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -3216,7 +3347,8 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 
 /* when wait_ms >0 , this function should be called at process context */
 /* da == NULL for station mode */
-int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms)
+int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid,
+		       int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -3345,7 +3477,8 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 	return ret;
 }
 
-void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short tid)
+void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr,
+			   unsigned char action, unsigned short tid)
 {
 	u8 category = RTW_WLAN_CATEGORY_SA_QUERY;
 	struct xmit_frame		*pmgntframe;
@@ -3412,7 +3545,8 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short status)
+void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
+		     unsigned char action, unsigned short status)
 {
 	u8 category = RTW_WLAN_CATEGORY_BACK;
 	u16 start_seq;
@@ -3515,17 +3649,20 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			else
 				rtw_hal_get_def_var(padapter,
 						    HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
-
-			if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_64K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_32K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0800); /* 32 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_16K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0400); /* 16 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_8K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0200); /* 8 buffer size */
-			else
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
+			{
+				u16 ba_mask = le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f;
+
+				if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_64K)
+					BA_para_set = ba_mask | 0x1000; /* 64 buffer size */
+				else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_32K)
+					BA_para_set = ba_mask | 0x0800; /* 32 buffer size */
+				else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_16K)
+					BA_para_set = ba_mask | 0x0400; /* 16 buffer size */
+				else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_8K)
+					BA_para_set = ba_mask | 0x0200; /* 8 buffer size */
+				else
+					BA_para_set = ba_mask | 0x1000; /* 64 buffer size */
+			}
 
 			if (hal_btcoex_IsBTCoexCtrlAMPDUSize(padapter) &&
 			    padapter->driver_rx_ampdu_factor == 0xFF) {
@@ -3541,8 +3678,16 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			else /* auto */
 				le_tmp = cpu_to_le16(BA_para_set);
 
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(pmlmeinfo->ADDBA_req.BA_timeout_value)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp,
+						  &pattrib->pktlen);
+			{
+				unsigned char *ba_timeout;
+
+				ba_timeout = (unsigned char *)
+					&pmlmeinfo->ADDBA_req.BA_timeout_value;
+				pframe = rtw_set_fixed_ie(pframe, 2, ba_timeout,
+							  &pattrib->pktlen);
+			}
 			break;
 		case 2:/* DELBA */
 			BA_para_set = (status & 0x1F) << 3;
@@ -3656,7 +3801,13 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 			pbss_network = (struct wlan_bssid_ex *)&pnetwork->network;
 
-			p = rtw_get_ie(pbss_network->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pbss_network->ie_length - _FIXED_IE_LENGTH_);
+			{
+				u8 *bss_ie = pbss_network->ies + _FIXED_IE_LENGTH_;
+				int bss_len = pbss_network->ie_length - _FIXED_IE_LENGTH_;
+
+				p = rtw_get_ie(bss_ie, WLAN_EID_HT_CAPABILITY,
+					       &len, bss_len);
+			}
 			if (!p || len == 0) {/* non-HT */
 
 				if (pbss_network->configuration.ds_config <= 0)
@@ -3694,7 +3845,9 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 				}
 			}
 
-			pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
+			pframe = rtw_set_ie(pframe,
+					    WLAN_EID_BSS_INTOLERANT_CHL_REPORT,
+					    k, InfoContent, &pattrib->pktlen);
 
 		}
 
@@ -3761,9 +3914,12 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll%10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while ((poll % 10) != 0 && !bxmitok &&
+			       !padapter->bSurpriseRemoved &&
+			       !padapter->bDriverStopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+	} while (!bxmitok && issue < 100 &&
+		 !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
 		return _FAIL;
@@ -3803,10 +3959,14 @@ void site_survey(struct adapter *padapter)
 		if (pmlmeext->sitesurvey_res.channel_idx == 0) {
 #ifdef DBG_FIXED_CHAN
 			if (pmlmeext->fixed_chan != 0xff)
-				set_channel_bwmode(padapter, pmlmeext->fixed_chan, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+				set_channel_bwmode(padapter, pmlmeext->fixed_chan,
+						   HAL_PRIME_CHNL_OFFSET_DONT_CARE,
+						   CHANNEL_WIDTH_20);
 			else
 #endif
-				set_channel_bwmode(padapter, survey_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+				set_channel_bwmode(padapter, survey_channel,
+						   HAL_PRIME_CHNL_OFFSET_DONT_CARE,
+						   CHANNEL_WIDTH_20);
 		} else {
 #ifdef DBG_FIXED_CHAN
 			if (pmlmeext->fixed_chan != 0xff)
@@ -3857,7 +4017,9 @@ void site_survey(struct adapter *padapter)
 			/* switch back to the original channel */
 			/* SelectChannel(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset); */
 
-			set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
+			set_channel_bwmode(padapter, pmlmeext->cur_channel,
+					   pmlmeext->cur_ch_offset,
+					   pmlmeext->cur_bwmode);
 
 			/* flush 4-AC Queue after site_survey */
 			/* val8 = 0; */
@@ -3894,7 +4056,8 @@ void site_survey(struct adapter *padapter)
 }
 
 /* collect bss info from Beacon and Probe request/response frames. */
-u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, struct wlan_bssid_ex *bssid)
+u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame,
+		    struct wlan_bssid_ex *bssid)
 {
 	int	i;
 	u32 len;
@@ -3941,9 +4104,13 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	memcpy(bssid->ies, (pframe + sizeof(struct ieee80211_hdr_3addr)), bssid->ie_length);
 
 	/* get the signal strength */
-	bssid->rssi = precv_frame->u.hdr.attrib.phy_info.RecvSignalPower; /*  in dBM.raw data */
-	bssid->phy_info.signal_quality = precv_frame->u.hdr.attrib.phy_info.SignalQuality;/* in percentage */
-	bssid->phy_info.signal_strength = precv_frame->u.hdr.attrib.phy_info.SignalStrength;/* in percentage */
+	{
+		struct phy_info *phy = &precv_frame->u.hdr.attrib.phy_info;
+
+		bssid->rssi = phy->RecvSignalPower; /* in dBM.raw data */
+		bssid->phy_info.signal_quality = phy->SignalQuality; /* in percentage */
+		bssid->phy_info.signal_strength = phy->SignalStrength; /* in percentage */
+	}
 
 	/*  checking SSID */
 	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SSID, &len, bssid->ie_length - ie_offset);
@@ -3972,7 +4139,8 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		i = len;
 	}
 
-	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len, bssid->ie_length - ie_offset);
+	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len,
+		       bssid->ie_length - ie_offset);
 	if (p) {
 		if (len > (NDIS_802_11_LENGTH_RATES_EX-i))
 			return _FAIL;
@@ -4030,7 +4198,8 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	if ((pregistrypriv->wifi_spec == 1) && (false == pmlmeinfo->bwmode_updated)) {
 		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - ie_offset);
+		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len,
+			       bssid->ie_length - ie_offset);
 		if (p && len > 0) {
 			struct HT_caps_element	*pHT_caps;
 
@@ -4074,8 +4243,8 @@ void start_create_ibss(struct adapter *padapter)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DO_IQK, NULL);
 
 		/* switch channel */
-		/* SelectChannel(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE); */
-		set_channel_bwmode(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+		set_channel_bwmode(padapter, pmlmeext->cur_channel,
+				   HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
 
 		beacon_timing_control(padapter);
 
@@ -4203,7 +4372,8 @@ void start_clnt_assoc(struct adapter *padapter)
 	set_link_timer(pmlmeext, REASSOC_TO);
 }
 
-unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
+unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr,
+				 unsigned short reason)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -4250,7 +4420,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		u8 noc; /*  number of channel */
 		u8 j, k;
 
-		ie = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_COUNTRY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+		ie = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_COUNTRY, &len,
+			bssid->ie_length - _FIXED_IE_LENGTH_);
 		if (!ie)
 			return;
 		if (len < 6)
@@ -4511,7 +4682,8 @@ void report_join_res(struct adapter *padapter, int res)
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
-	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
+	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)),
+	       &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
 	pjoinbss_evt->network.join_res	= pjoinbss_evt->network.aid = res;
 
 
@@ -4681,7 +4853,9 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 		psta->htpriv.ampdu_enable = pmlmepriv->htpriv.ampdu_enable;
 
-		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para&IEEE80211_HT_CAP_AMPDU_DENSITY)>>2;
+		psta->htpriv.rx_ampdu_min_spacing =
+			(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para &
+			 IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
 
 		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps), CHANNEL_WIDTH_20))
 			psta->htpriv.sgi_20m = true;
@@ -4896,7 +5070,9 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	rtw_hal_update_sta_rate_mask(padapter, psta);
 
 	/*  ToDo: HT for Ad-hoc */
-	psta->wireless_mode = rtw_check_network_type(psta->bssrateset, psta->bssratelen, pmlmeext->cur_channel);
+	psta->wireless_mode = rtw_check_network_type(psta->bssrateset,
+						      psta->bssratelen,
+						      pmlmeext->cur_channel);
 	psta->raid = networktype_to_raid_ex(padapter, psta);
 
 	/* rate radaptive */
@@ -5417,9 +5593,12 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	u8 val8;
 
 	if (is_client_associated_to_ap(padapter))
-		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms/100, 100);
+		issue_deauth_ex(padapter, pnetwork->mac_address,
+				WLAN_REASON_DEAUTH_LEAVING,
+				param->deauth_timeout_ms / 100, 100);
 
-	if (((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) ||
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
 		val8 = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_BCN_FUNC, (u8 *)(&val8));
-- 
2.52.0

