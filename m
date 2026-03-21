Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6C3921E9
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106050; cv=none; b=B7ynA6GLy79dhQAEvcfFbpj/kjA2HAyrZBBoB8GBdi9lATpvLosR3jbIaKP+swODQ7zGp28kr7Ge/iWj36Xm8IWHy4TiEWMsdfW+pqys2KltYOohuFj7/ugoOn2ocXPE7tqSt+sFeLYeP32lA38XcY3o0mR8TMNNIn2IOVHShEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106050; c=relaxed/simple;
	bh=K01UlUlAa4uYjkxcopUvHC1sUvDjc2kmcWT5ZDtrVv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViFhA/TUYGjusi6QBeuqTXro7YQAO8Szi1+pX+usZG+oYn634+NRVViZfNt2zXbdren33Z5XSRsyw6KgC0VoJZO2TIt9GqkcuIKTzfKN8jvx10fYuWKXdiDBPsUXWicPab7aTR+B9b2G8D+F8wu0CCa0CoMKHgL3IqDS4T9Ze5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvciOy+t; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvciOy+t"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-950d235b500so730981241.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774106048; x=1774710848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI4+8X4n+G2iMDTn0KkI2YL1KJvStPFAB72yb/b9zgA=;
        b=gvciOy+t2lDiPDAd2bskxcGSJZWXtzPbs1b03dUXYivIlaTItIJ1UXJ4v60SoRsIPd
         cwRSEOaoz6oxKWdhWOZTKnC5FzOzqQE4Ge1VcGQsnmyLmwJo1dGaW3Tlxvzc+d+JdRlU
         j3WCNGUJo8lepSbV0DltqOHCot2zqMdVQSkslK3N5eeC4X10qkngKgrWjstP4wj1XQa6
         WNprOEGtBwQe9UYRqzrxXl+9nmXGdFx64Jt2xmjc8fp8GuEZudTGLAAma/4+U+DQIWke
         v5jBaROm1aKiELaKZ5RSiyfHEkBrMYTUtLmbCLLot4Zvr2dLy8nZFY+HTNehr6NlNHUF
         tPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774106048; x=1774710848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RI4+8X4n+G2iMDTn0KkI2YL1KJvStPFAB72yb/b9zgA=;
        b=rknMcLBODbBGvVs6s0xfg6OIbSsoY+te5t8eGP7wEN1wLvjwz3yzS5n7oo6e38PDUU
         jTNQgYSLGthP7ufrMVvIsdlndA0Tow4L75mQBDq8JtwW5ltuMckDCzJcQJ1tBUE8/6ll
         4vyywMzFx17LNiuP5ux42QKQCWWVo2Y7cIiYoAVRhxDoqCmYaVytJU/Pb+b8PqokugfD
         tntOzeNxfAcsOFhZtCYrumVo/hpzhSZIi/+O2ifvjFcNEm3cje52oFSupkPjD/RB45X7
         5J4n59gePIvBgcq5VJ+tyWYphrTKh19jXZ97U/5b99PdxKubwqnpDqEqdsLHQpax7s6r
         xMxg==
X-Gm-Message-State: AOJu0YzNb7H+/X2EOZJGv4VgjwWjr+S8CWbdDkB/7nhy9Fz86lJ+2K28
	AlzsFWvRKbjQ9Mr+25IwM0CCYfgQUu3RPP9dKH48T1C2R5iniukA+1bA
X-Gm-Gg: ATEYQzwgVh/vuLXOYmLnNO0wEP0SZ7tULXvkH3TgX1Ht8DRAmBM4CaKOkCl3LnlWxpS
	DNYokNJprm1811ihXMUKu3uv0XXn6X1Hn0fA/gPM8s8d2ZjJQ5MQsFvo48H+TN2udrkpzZ16e0U
	qPKltjewJ8nKQE95/tB+6kncuweb9/hWCVaPk64D2MmcQI9vLSamUbx8dMMFVYEi217hzIIaI6W
	4XiNUUSzZAwElrnYF4T9bGeDRHuacCuEr0SWO+Wf0lThkBRJ5/PQZ7pAz0zUNbEFosc+c4ZcQ00
	hniJ0ZQ8Bk38wx+aI4YflXNebqndt1cLZh/c0lADfj+Wf+icpnL9W38ibr9Vzawrfs+mhy9VcdR
	yfmlajgrLSB/u6tU2XlrRMTW+gKlS9306TCCA71ZtQ2Ti8LNHAtUrwVIcp2nNyYh926lHiJeYMW
	Th8xNC7X0Z69Aw0YWTHOtBRxpb2PF3QFe7FTTvGNAGFHa4yajr
X-Received: by 2002:a05:6102:f97:b0:5ff:a51b:9f02 with SMTP id ada2fe7eead31-602aeccfea0mr2611223137.19.1774106048047;
        Sat, 21 Mar 2026 08:14:08 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb4ed6esm3186753137.10.2026.03.21.08.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:14:07 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: rename rt_channel_info members to snake_case
Date: Sat, 21 Mar 2026 15:13:41 +0000
Message-ID: <20260321151342.19864-3-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321151342.19864-1-marcosandrade95963@gmail.com>
References: <20260321151342.19864-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all occurrences of the CamelCase member names ChannelNum and
ScanType in rtw_mlme_ext.c with their snake_case equivalents
channel_num and scan_type, as defined in struct rt_channel_info.

This change brings the code in line with the kernel coding style
as described in Documentation/process/coding-style.rst.

No functional changes intended.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 82 +++++++++----------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81efb..1f2590dd4243 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -171,12 +171,12 @@ int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch)
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
@@ -261,7 +261,7 @@ static int has_channel(struct rt_channel_info *channel_set,
 	int i;
 
 	for (i = 0; i < chanset_size; i++)
-		if (channel_set[i].ChannelNum == chan)
+		if (channel_set[i].channel_num == chan)
 			return 1;
 
 	return 0;
@@ -340,22 +340,22 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 
 	if (b2_4GBand) {
 		for (index = 0; index < RTW_ChannelPlan2G[Index2G].Len; index++) {
-			channel_set[chanset_size].ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
+			channel_set[chanset_size].channel_num = RTW_ChannelPlan2G[Index2G].Channel[index];
 
 			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) ||/* Channel 1~11 is active, and 12~14 is passive */
 				(ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
-				if (channel_set[chanset_size].ChannelNum >= 1 && channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
-				else if ((channel_set[chanset_size].ChannelNum  >= 12 && channel_set[chanset_size].ChannelNum  <= 14))
-					channel_set[chanset_size].ScanType  = SCAN_PASSIVE;
+				if (channel_set[chanset_size].channel_num >= 1 && channel_set[chanset_size].channel_num <= 11)
+					channel_set[chanset_size].scan_type = SCAN_ACTIVE;
+				else if ((channel_set[chanset_size].channel_num  >= 12 && channel_set[chanset_size].channel_num  <= 14))
+					channel_set[chanset_size].scan_type = SCAN_PASSIVE;
 			} else if (ChannelPlan == RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
 				 Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) { /*  channel 12~13, passive scan */
-				if (channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+				if (channel_set[chanset_size].channel_num <= 11)
+					channel_set[chanset_size].scan_type = SCAN_ACTIVE;
 				else
-					channel_set[chanset_size].ScanType = SCAN_PASSIVE;
+					channel_set[chanset_size].scan_type = SCAN_PASSIVE;
 			} else
-				channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+				channel_set[chanset_size].scan_type = SCAN_ACTIVE;
 
 			chanset_size++;
 		}
@@ -4279,27 +4279,27 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
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
-					chplan_new[k].ScanType = SCAN_ACTIVE;
+				if (chplan_sta[i].channel_num == chplan_ap.Channel[j]) {
+					chplan_new[k].channel_num = chplan_ap.Channel[j];
+					chplan_new[k].scan_type = SCAN_ACTIVE;
 					i++;
 					j++;
 					k++;
-				} else if (chplan_sta[i].ChannelNum < chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
-					chplan_new[k].ScanType = SCAN_PASSIVE;
+				} else if (chplan_sta[i].channel_num < chplan_ap.Channel[j]) {
+					chplan_new[k].channel_num = chplan_sta[i].scan_type;
+					chplan_new[k].scan_type = SCAN_PASSIVE;
 					i++;
 					k++;
-				} else if (chplan_sta[i].ChannelNum > chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_ap.Channel[j];
-					chplan_new[k].ScanType = SCAN_ACTIVE;
+				} else if (chplan_sta[i].channel_num > chplan_ap.Channel[j]) {
+					chplan_new[k].channel_num = chplan_ap.Channel[j];
+					chplan_new[k].scan_type = SCAN_ACTIVE;
 					j++;
 					k++;
 				}
@@ -4307,29 +4307,29 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
-				(chplan_sta[i].ChannelNum <= 14)) {
+				(chplan_sta[i].channel_num != 0) &&
+				(chplan_sta[i].channel_num <= 14)) {
 
-				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
-				chplan_new[k].ScanType = SCAN_PASSIVE;
+				chplan_new[k].channel_num = chplan_sta[i].channel_num;
+				chplan_new[k].scan_type = SCAN_PASSIVE;
 				i++;
 				k++;
 			}
 
 			/*  add channel AP supported */
 			while ((j < chplan_ap.Len) && (chplan_ap.Channel[j] <= 14)) {
-				chplan_new[k].ChannelNum = chplan_ap.Channel[j];
-				chplan_new[k].ScanType = SCAN_ACTIVE;
+				chplan_new[k].channel_num = chplan_ap.Channel[j];
+				chplan_new[k].scan_type = SCAN_ACTIVE;
 				j++;
 				k++;
 			}
 		} else {
 			/*  keep original STA 2.4G channel plan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
-				(chplan_sta[i].ChannelNum <= 14)) {
-				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
-				chplan_new[k].ScanType = chplan_sta[i].ScanType;
+				(chplan_sta[i].channel_num != 0) &&
+				(chplan_sta[i].channel_num <= 14)) {
+				chplan_new[k].channel_num = chplan_sta[i].channel_num;
+				chplan_new[k].scan_type = chplan_sta[i].scan_type;
 				i++;
 				k++;
 			}
@@ -4346,10 +4346,10 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 	channel = bssid->configuration.ds_config;
 	chplan_new = pmlmeext->channel_set;
 	i = 0;
-	while ((i < MAX_CHANNEL_NUM) && (chplan_new[i].ChannelNum != 0)) {
-		if (chplan_new[i].ChannelNum == channel) {
-			if (chplan_new[i].ScanType == SCAN_PASSIVE)
-				chplan_new[i].ScanType = SCAN_ACTIVE;
+	while ((i < MAX_CHANNEL_NUM) && (chplan_new[i].channel_num != 0)) {
+		if (chplan_new[i].channel_num == channel) {
+			if (chplan_new[i].scan_type == SCAN_PASSIVE)
+				chplan_new[i].scan_type = SCAN_ACTIVE;
 			break;
 		}
 		i++;
@@ -5448,7 +5448,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 
 			memcpy(&out[j], &in[i], sizeof(struct rtw_ieee80211_channel));
 
-			if (pmlmeext->channel_set[set_idx].ScanType == SCAN_PASSIVE)
+			if (pmlmeext->channel_set[set_idx].scan_type == SCAN_PASSIVE)
 				out[j].flags |= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
 
 			j++;
@@ -5469,9 +5469,9 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 				break;
 			}
 
-			out[j].hw_value = pmlmeext->channel_set[i].ChannelNum;
+			out[j].hw_value = pmlmeext->channel_set[i].channel_num;
 
-			if (pmlmeext->channel_set[i].ScanType == SCAN_PASSIVE)
+			if (pmlmeext->channel_set[i].scan_type == SCAN_PASSIVE)
 				out[j].flags |= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
 
 			j++;
-- 
2.53.0

