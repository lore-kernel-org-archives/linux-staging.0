Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05733B6FC
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781896508; cv=none; b=MmojrPe5Ln4yLuz1hOD0mDtiI6v0hxLoXoQnPktH7YmqQ85DpEySYD65Q58EfidGEx75TRh7A3s5Q4tacb1ZcG8vmbrMymskfbPA7G9dRHIJ03EdxwkurFpYNMtGrZKONEBadxFSLE1J3cuK0teXjYAWGSu0dvs3LZ1+rCARR4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781896508; c=relaxed/simple;
	bh=kqWZKkIi8T5WjPhR8t3S+04hi/unWWeXX1o3v+a/WvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DApEGPKSuBvz3ikpAaJ8U9HkbxWupX4XdsG+XF9kwXr1d8/+Bex2IWwqTLkLoKvb+tVemmocvOpzPiEAlfo6pDDX6vlrtjHXq/ytdMNA3v3mVbLUj3E2YL/M1Zj/srURLKoXNGx8W/abvvLDRvy0rCH5AsHV+p4rj13NEcqiYxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNQLuewz; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNQLuewz"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1870769f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781896505; x=1782501305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zinom0u4hcXmDrVB9mr2opoumQVGpQv8jhBfCF4MQo=;
        b=gNQLuewz3rWtDWArKzSQD0auUG88BSESSnoZ1Rj2mxqxj+bfvKUXWKKqzLw6bwx/E9
         z0ivrqzTk6xDokFfwvGtTURgI7Z9UTHaIfeFHDJ24Sd5vbaXR6C4dJvPwV5XF2sa7zCb
         2eD8fE5L/Dal6IteRtQl339jShz4BBxTHrUgrKEPUd1Z+K5i6OQ8IDB9P5L2sC5A0OLR
         Ecx4S+aYbDvCu612cGSopN+jc/klaLNOHfURacF3FB/WQGBdwREoDh+5J2GkY7v1AkBx
         NyemHuJsqegNbyuAPH6Ii6fE4Dw/4p6IfMsabVMDBlkk6JpplEriaFTYqtaEKTQLdhB/
         5WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781896505; x=1782501305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zinom0u4hcXmDrVB9mr2opoumQVGpQv8jhBfCF4MQo=;
        b=JU0Zp4jw3kaC1JHuCl+DoWcy6z32FONloXHQZ1N2pwH/TE9MVIuZGBv/WJ6kQs5abh
         xHbZ/YGxQlRqnjcODowEeFn9a40BXfE3xStnbxOV3zHCix+//eFSgfXmYe2WZYlFLrol
         Z53r+axXwsBRnyJZIsmMCZHuLW0IrAhfDFGfPC2BWZqHxiENJLo8UwBKjzYnXgctwBK5
         CdAlbleHjqWupDlgHcT6h1nSfNNR+aEy9xj47xCAJ/1PVAaQGR82a5mdwoiGgSOQyt7c
         +MGr5HXJs6zHpXHxFw20tvL4EVFDUHlx+IDfk5I06lGNQR1oemovcRtYikfYCk/9VX94
         Q+1w==
X-Gm-Message-State: AOJu0YxXhOHSHzGmOu/5MZyFpTNaZz2dftVcQ31XldT+oK7yL9IAxMJh
	PDECU2U0LiTZFiy1n9ZHo4jsuRQO5b797psy12b0kR4wXr/rzwLSunbCQcNj3DVjnpWxI3SW
X-Gm-Gg: AfdE7cntGXeE5qfPao0ZIIn7xp54m1zdsUzQqPLTBufSa7AKo7RKRi4CtUgNrNkXGuA
	N2xclMQ0uoPr/4t158Um2b1UAegeRTvj7lGOdqm/tyIzFvCW5ckVws5U77kGrETT3i5e+sm5DEi
	v1s5FWwVYus+VpYLo5a7qoZQ4apDuQD3DpPMrT1kDhtIuYcSOmr+t4ep2pd1hwDwjVVp7segRdx
	rF4VI3Xj3z1cFxL3Hw0nQL83A0kAWLu4Co44MB8U5e202YI/leAFXqP80Pq6SgYpf/OvHuN2XjK
	d8N0gbzeUs+aRBU8KSg8bscKNvSa2Vwg/3XIhoi6gReCjLOxwJX2KHeEHDhWL2FZf/Zyz0PWq7l
	qer/4VpvfZoggy4WAPTZrMoPc3tHFJ0FD5F9sKKcxkFe97NnMgSZ09DPhZKNu4Wxd24Ns088=
X-Received: by 2002:a05:6000:2881:b0:460:3a90:b2b6 with SMTP id ffacd0b85a97d-46660c10621mr1242344f8f.11.1781896504670;
        Fri, 19 Jun 2026 12:15:04 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57a0esm1109034f8f.27.2026.06.19.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 12:15:04 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: rename ChannelNum to channel_num
Date: Tue, 16 Jun 2026 03:01:16 +0300
Message-ID: <20260616000117.126504-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CamelCase field ChannelNum of struct rt_channel_info to
channel_num to conform to the Linux kernel coding style guidelines.
This also fixes several checkpatch.pl warnings:
CHECK: Avoid CamelCase: <ChannelNum>

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 55 ++++++++++---------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |  2 +-
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97c..0dcac7638 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -172,12 +172,12 @@ int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch)
 {
 	int i;
 
-	for (i = 0; ch_set[i].ChannelNum != 0; i++) {
-		if (ch == ch_set[i].ChannelNum)
+	for (i = 0; ch_set[i].channel_num != 0; i++) {
+		if (ch == ch_set[i].channel_num)
 			break;
 	}
 
-	if (i >= ch_set[i].ChannelNum)
+	if (i >= ch_set[i].channel_num)
 		return -1;
 	return i;
 }
@@ -262,7 +262,7 @@ static int has_channel(struct rt_channel_info *channel_set,
 	int i;
 
 	for (i = 0; i < chanset_size; i++)
-		if (channel_set[i].ChannelNum == chan)
+		if (channel_set[i].channel_num == chan)
 			return 1;
 
 	return 0;
@@ -339,17 +339,20 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 
 	if (b2_4GBand) {
 		for (index = 0; index < RTW_ChannelPlan2G[Index2G].Len; index++) {
-			channel_set[chanset_size].ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
+			channel_set[chanset_size].channel_num =
+				RTW_ChannelPlan2G[Index2G].Channel[index];
 
 			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) ||/* Channel 1~11 is active, and 12~14 is passive */
 				(ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
-				if (channel_set[chanset_size].ChannelNum >= 1 && channel_set[chanset_size].ChannelNum <= 11)
+				if (channel_set[chanset_size].channel_num >= 1 &&
+				    channel_set[chanset_size].channel_num <= 11)
 					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
-				else if ((channel_set[chanset_size].ChannelNum  >= 12 && channel_set[chanset_size].ChannelNum  <= 14))
+				else if (channel_set[chanset_size].channel_num  >= 12 &&
+					 channel_set[chanset_size].channel_num  <= 14)
 					channel_set[chanset_size].ScanType  = SCAN_PASSIVE;
 			} else if (ChannelPlan == RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
 				 Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) { /*  channel 12~13, passive scan */
-				if (channel_set[chanset_size].ChannelNum <= 11)
+				if (channel_set[chanset_size].channel_num <= 11)
 					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
 				else
 					channel_set[chanset_size].ScanType = SCAN_PASSIVE;
@@ -4173,26 +4176,26 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].ChannelNum == 0) ||
-					(chplan_sta[i].ChannelNum > 14))
+					(chplan_sta[i].channel_num == 0) ||
+					(chplan_sta[i].channel_num > 14))
 					break;
 
 				if ((j == chplan_ap.Len) || (chplan_ap.Channel[j] > 14))
 					break;
 
-				if (chplan_sta[i].ChannelNum == chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_ap.Channel[j];
+				if (chplan_sta[i].channel_num == chplan_ap.Channel[j]) {
+					chplan_new[k].channel_num = chplan_ap.Channel[j];
 					chplan_new[k].ScanType = SCAN_ACTIVE;
 					i++;
 					j++;
 					k++;
-				} else if (chplan_sta[i].ChannelNum < chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
+				} else if (chplan_sta[i].channel_num < chplan_ap.Channel[j]) {
+					chplan_new[k].channel_num = chplan_sta[i].channel_num;
 					chplan_new[k].ScanType = SCAN_PASSIVE;
 					i++;
 					k++;
-				} else if (chplan_sta[i].ChannelNum > chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_ap.Channel[j];
+				} else if (chplan_sta[i].channel_num > chplan_ap.Channel[j]) {
+					chplan_new[k].channel_num = chplan_ap.Channel[j];
 					chplan_new[k].ScanType = SCAN_ACTIVE;
 					j++;
 					k++;
@@ -4201,9 +4204,9 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
-				(chplan_sta[i].ChannelNum <= 14)) {
-				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
+				(chplan_sta[i].channel_num != 0) &&
+				(chplan_sta[i].channel_num <= 14)) {
+				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].ScanType = SCAN_PASSIVE;
 				i++;
 				k++;
@@ -4211,7 +4214,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  add channel AP supported */
 			while ((j < chplan_ap.Len) && (chplan_ap.Channel[j] <= 14)) {
-				chplan_new[k].ChannelNum = chplan_ap.Channel[j];
+				chplan_new[k].channel_num = chplan_ap.Channel[j];
 				chplan_new[k].ScanType = SCAN_ACTIVE;
 				j++;
 				k++;
@@ -4219,9 +4222,9 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		} else {
 			/*  keep original STA 2.4G channel plan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
-				(chplan_sta[i].ChannelNum <= 14)) {
-				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
+				(chplan_sta[i].channel_num != 0) &&
+				(chplan_sta[i].channel_num <= 14)) {
+				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].ScanType = chplan_sta[i].ScanType;
 				i++;
 				k++;
@@ -4239,8 +4242,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 	channel = bssid->configuration.ds_config;
 	chplan_new = pmlmeext->channel_set;
 	i = 0;
-	while ((i < MAX_CHANNEL_NUM) && (chplan_new[i].ChannelNum != 0)) {
-		if (chplan_new[i].ChannelNum == channel) {
+	while ((i < MAX_CHANNEL_NUM) && (chplan_new[i].channel_num != 0)) {
+		if (chplan_new[i].channel_num == channel) {
 			if (chplan_new[i].ScanType == SCAN_PASSIVE)
 				chplan_new[i].ScanType = SCAN_ACTIVE;
 			break;
@@ -5332,7 +5335,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 				break;
 			}
 
-			out[j].hw_value = pmlmeext->channel_set[i].ChannelNum;
+			out[j].hw_value = pmlmeext->channel_set[i].channel_num;
 
 			if (pmlmeext->channel_set[i].ScanType == SCAN_PASSIVE)
 				out[j].flags |= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index cb23c6939..a2e0596ae 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -322,7 +322,7 @@ struct mlme_ext_info {
 
 /*  The channel information about this channel including joining, scanning, and power constraints. */
 struct rt_channel_info {
-	u8 		ChannelNum;		/*  The channel number. */
+	u8 channel_num;		/*  The channel number. */
 	enum rt_scan_type	ScanType;		/*  Scan type such as passive or active scan. */
 };
 
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index c48a1e3ba..ff2072eb3 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -70,7 +70,7 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 
 	/* channels apply by channel plans. */
 	for (i = 0; i < max_chan_nums; i++) {
-		channel = channel_set[i].ChannelNum;
+		channel = channel_set[i].channel_num;
 		freq = rtw_ieee80211_channel_to_frequency(channel);
 		ch = ieee80211_get_channel(wiphy, freq);
 		if (ch) {
-- 
2.54.0

