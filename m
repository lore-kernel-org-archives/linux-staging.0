Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B70B2233A
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781896518; cv=none; b=qqrRoWUDpa/nWRv56QXxgLBFy4WtAFQpaHZHQ15rnlKuD/1DqDga8X3XMUjHBXK8E4nrOZ6oj64RO3KK5+8Oi8nmcZLQt+pj14okYxfSo/7+m6VVNzv81p0cajP7Tp2mL+a/75avSKyn8Rd0+qxYxQ7WCm4GbW0ZUeulelrApv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781896518; c=relaxed/simple;
	bh=fvSqkxxprQMrTOpMLxZt/z0GwqfIf7SI3KtJLVG93n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNXS18rsrDTVmDpq6C1aDIA43QYTQLkb22ob2PrkKg3abIrjfS9RstML2w5w1NKNkYjMoeISdQIhNlIby5mnGlPJSTyj8ykIML5XnYzhaBEWifcr0FeqRgFXWaJkCSKenVwKZNtwdYPyYzfCWDsk+5SiH+LQZ30Y09+1iAP3OmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYzBEcGZ; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYzBEcGZ"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-490b613a17bso19364115e9.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781896515; x=1782501315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waGPckFghLqiW6DdlxbVrpHRiV1SlAdaWjaMF78OucA=;
        b=ZYzBEcGZgZ+DjnHDP8rFDDhgv7cf/7kDIGc4xh92Rnm4zh3wrpWL+945EmKEQ6Eu/Y
         BaomuR84Q9pmCgFIgtFRpS6LrkKYXfFiplJEoa+8FegkEUq9YwYpSflAtuD0vkTwf7M/
         e/z9gzWtjGr5uZzMZXFRm4hElpzRVYJEaHb9pNjlkuL+77OXHwXhM9LelFUjbZa2t7os
         zIssYYG/6YerSpt0RmRIYRBcP0/A/4qySjFLskaq1EGh6VI9b9P/EgZz63waJ2Yf+NtX
         yiM/RdVQpySmIZJidRNMSW9nXfY0BoOqObqYH9+f6PB6Q0pJA0Hy7ltsk3hvHeZ5eSvJ
         n1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781896515; x=1782501315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=waGPckFghLqiW6DdlxbVrpHRiV1SlAdaWjaMF78OucA=;
        b=QW6dIZRvr9khSodBzW0JTHXzU0ZRODfU//2RWbHw5aq53QfV/XrQhKubxmXowwOyyz
         QBHuK4MJdANVA5M8h8YcG2TfA8eWfdwUvO7CwZ0p3uK3IOibCbSrn9Cs4r9Oa9YDSTgr
         vG+TptYf9o/rDcncWVUlIuDyIkX2ZxltzyhpWkS14ucdcT6642ijDmGVhAshHXzWfMNa
         EdloUxWFRtfrDunVheQRcXJdkINJmWQlKmu6YeJkahsLJwD289JWUhtiTAoCMnPp8whm
         FHAD5bs6Kd118NJVSFGIc4+sZKFU+SE5glsleQTot4AKqeo8DqlCGlLxZuhrTFFzMfce
         gtCg==
X-Gm-Message-State: AOJu0Yyh8KDMG1di1Yc9ZRVLWy/G/NaKihYt8v24sXdvzI7SYEpbTtB9
	S8JsobpMsxFi1vMoh3EmggU+HtnniCSsYHwfHHX/G4I+nlEdi8xxleGZ
X-Gm-Gg: AfdE7clqTdOWdmr621Q/WyXJRQ5D1MHJADcaH3PMrlKo7WuiCEuaJbh6RV1godIVSw5
	1OcTTDQvqd4DMU33ULLO/TeObijtDfiYB+5w6u+qp5SbmBOvCTTyNa3NUfII3SydKDtf47Lr3Lc
	fQxbznf8lPOwUFWX13lNl7bQp14ugv2apLssIR2b0gJifthPevVLVcHkfwVp4SCuciBQQzxGF3X
	tFUXVL/rf3M2qRSI99fZ2U94pImk+9YJcEYhC1nbc1NN1/vJCVij1qk8ZJ+KNuRBtlMsrv6prAE
	ilrwvgvhzLXpwjKOUHbn86Efpv9k9aAaVv8ZsOW2jWC8IsKZ90rIZ3izJufUvlAvtQ7Xtfw/sd5
	P9bKbsRU1ZsvSMT+jYBqCneE8B9z2Ip0ws3W4LnOe8Jlolt90ORPo+EMU8eoXo5zwKzk+npE=
X-Received: by 2002:a05:600c:4694:b0:492:4717:59fb with SMTP id 5b1f17b1804b1-492490a77a4mr8219515e9.17.1781896515022;
        Fri, 19 Jun 2026 12:15:15 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57a0esm1109034f8f.27.2026.06.19.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 12:15:14 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: rename ScanType to scan_type
Date: Tue, 16 Jun 2026 03:01:17 +0300
Message-ID: <20260616000117.126504-2-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616000117.126504-1-serhatkumral1@gmail.com>
References: <20260616000117.126504-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CamelCase field ScanType of struct rt_channel_info, as
well as the relevant local variables, to scan_type to conform to
the Linux kernel coding style guidelines.
This also fixes several checkpatch.pl warnings:
CHECK: Avoid CamelCase: <ScanType>

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 37 ++++++++++---------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |  2 +-
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0dcac7638..655e1e72b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -346,18 +346,18 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 				(ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
 				if (channel_set[chanset_size].channel_num >= 1 &&
 				    channel_set[chanset_size].channel_num <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+					channel_set[chanset_size].scan_type = SCAN_ACTIVE;
 				else if (channel_set[chanset_size].channel_num  >= 12 &&
 					 channel_set[chanset_size].channel_num  <= 14)
-					channel_set[chanset_size].ScanType  = SCAN_PASSIVE;
+					channel_set[chanset_size].scan_type  = SCAN_PASSIVE;
 			} else if (ChannelPlan == RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
 				 Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) { /*  channel 12~13, passive scan */
 				if (channel_set[chanset_size].channel_num <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+					channel_set[chanset_size].scan_type = SCAN_ACTIVE;
 				else
-					channel_set[chanset_size].ScanType = SCAN_PASSIVE;
+					channel_set[chanset_size].scan_type = SCAN_PASSIVE;
 			} else
-				channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+				channel_set[chanset_size].scan_type = SCAN_ACTIVE;
 
 			chanset_size++;
 		}
@@ -3689,7 +3689,7 @@ unsigned int send_beacon(struct adapter *padapter)
 void site_survey(struct adapter *padapter)
 {
 	unsigned char survey_channel = 0, val8;
-	enum rt_scan_type	ScanType = SCAN_PASSIVE;
+	enum rt_scan_type	scan_type = SCAN_PASSIVE;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u32 initialgain = 0;
@@ -3701,7 +3701,8 @@ void site_survey(struct adapter *padapter)
 		if (pmlmeext->sitesurvey_res.channel_idx < pmlmeext->sitesurvey_res.ch_num) {
 			ch = &pmlmeext->sitesurvey_res.ch[pmlmeext->sitesurvey_res.channel_idx];
 			survey_channel = ch->hw_value;
-			ScanType = (ch->flags & RTW_IEEE80211_CHAN_PASSIVE_SCAN) ? SCAN_PASSIVE : SCAN_ACTIVE;
+			scan_type = (ch->flags & RTW_IEEE80211_CHAN_PASSIVE_SCAN) ?
+				SCAN_PASSIVE : SCAN_ACTIVE;
 		}
 	}
 
@@ -3712,7 +3713,7 @@ void site_survey(struct adapter *padapter)
 		else
 			r8723bs_select_channel(padapter, survey_channel);
 
-		if (ScanType == SCAN_ACTIVE) { /* obey the channel plan setting... */
+		if (scan_type == SCAN_ACTIVE) { /* obey the channel plan setting... */
 			{
 				int i;
 
@@ -4185,18 +4186,18 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 				if (chplan_sta[i].channel_num == chplan_ap.Channel[j]) {
 					chplan_new[k].channel_num = chplan_ap.Channel[j];
-					chplan_new[k].ScanType = SCAN_ACTIVE;
+					chplan_new[k].scan_type = SCAN_ACTIVE;
 					i++;
 					j++;
 					k++;
 				} else if (chplan_sta[i].channel_num < chplan_ap.Channel[j]) {
 					chplan_new[k].channel_num = chplan_sta[i].channel_num;
-					chplan_new[k].ScanType = SCAN_PASSIVE;
+					chplan_new[k].scan_type = SCAN_PASSIVE;
 					i++;
 					k++;
 				} else if (chplan_sta[i].channel_num > chplan_ap.Channel[j]) {
 					chplan_new[k].channel_num = chplan_ap.Channel[j];
-					chplan_new[k].ScanType = SCAN_ACTIVE;
+					chplan_new[k].scan_type = SCAN_ACTIVE;
 					j++;
 					k++;
 				}
@@ -4207,7 +4208,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 				(chplan_sta[i].channel_num != 0) &&
 				(chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
-				chplan_new[k].ScanType = SCAN_PASSIVE;
+				chplan_new[k].scan_type = SCAN_PASSIVE;
 				i++;
 				k++;
 			}
@@ -4215,7 +4216,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 			/*  add channel AP supported */
 			while ((j < chplan_ap.Len) && (chplan_ap.Channel[j] <= 14)) {
 				chplan_new[k].channel_num = chplan_ap.Channel[j];
-				chplan_new[k].ScanType = SCAN_ACTIVE;
+				chplan_new[k].scan_type = SCAN_ACTIVE;
 				j++;
 				k++;
 			}
@@ -4225,7 +4226,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 				(chplan_sta[i].channel_num != 0) &&
 				(chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
-				chplan_new[k].ScanType = chplan_sta[i].ScanType;
+				chplan_new[k].scan_type = chplan_sta[i].scan_type;
 				i++;
 				k++;
 			}
@@ -4244,8 +4245,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 	i = 0;
 	while ((i < MAX_CHANNEL_NUM) && (chplan_new[i].channel_num != 0)) {
 		if (chplan_new[i].channel_num == channel) {
-			if (chplan_new[i].ScanType == SCAN_PASSIVE)
-				chplan_new[i].ScanType = SCAN_ACTIVE;
+			if (chplan_new[i].scan_type == SCAN_PASSIVE)
+				chplan_new[i].scan_type = SCAN_ACTIVE;
 			break;
 		}
 		i++;
@@ -5315,7 +5316,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 
 			memcpy(&out[j], &in[i], sizeof(struct rtw_ieee80211_channel));
 
-			if (pmlmeext->channel_set[set_idx].ScanType == SCAN_PASSIVE)
+			if (pmlmeext->channel_set[set_idx].scan_type == SCAN_PASSIVE)
 				out[j].flags |= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
 
 			j++;
@@ -5337,7 +5338,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 
 			out[j].hw_value = pmlmeext->channel_set[i].channel_num;
 
-			if (pmlmeext->channel_set[i].ScanType == SCAN_PASSIVE)
+			if (pmlmeext->channel_set[i].scan_type == SCAN_PASSIVE)
 				out[j].flags |= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
 
 			j++;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index a2e0596ae..786dc8055 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -323,7 +323,7 @@ struct mlme_ext_info {
 /*  The channel information about this channel including joining, scanning, and power constraints. */
 struct rt_channel_info {
 	u8 channel_num;		/*  The channel number. */
-	enum rt_scan_type	ScanType;		/*  Scan type such as passive or active scan. */
+	enum rt_scan_type scan_type;		/*  Scan type such as passive or active scan. */
 };
 
 int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch);
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index ff2072eb3..d201a18d7 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -74,7 +74,7 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 		freq = rtw_ieee80211_channel_to_frequency(channel);
 		ch = ieee80211_get_channel(wiphy, freq);
 		if (ch) {
-			if (channel_set[i].ScanType == SCAN_PASSIVE)
+			if (channel_set[i].scan_type == SCAN_PASSIVE)
 				ch->flags = IEEE80211_CHAN_NO_IR;
 			else
 				ch->flags = 0;
-- 
2.54.0

