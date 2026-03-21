Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03930CD9E
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774108976; cv=none; b=jL+OyPQ0mnqIuCLf2HlLgGMxpVgPtWzXEukwF5sBeQnnmazSBAVI5f7YDd06q9Cey9UvPpQ2Y5Xv51vL2NJ7gbekZVYHGPfECv7LJYzRMN+qBnP3WCaNvgoZEXmMXiiNwcuB4QcyuqlpbM87lGdx2k0n0/xBmLyI8QN/MozHfCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774108976; c=relaxed/simple;
	bh=szCXeduZguoIPvLL7U43b2UFIX3WZ2v/WqgYWIaT/Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/9aqoaKo9QXLkHlPjq4xdIBLWyexM4NJkxkqsQTr0x2rpW4Qf+bGyKCYUo1JWiv6mSoUhPRgeMJSM2jiUIUguPUh0D8K5GYggqHQYVFd+RUDQfnu1MHEAvxTKScmpV7ZdsXD0wEHNhQeNbDkAOMl2LOEzpBpaNlrTQZzWljDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqzxuOEF; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqzxuOEF"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso575718e0c.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 09:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774108974; x=1774713774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMTJ+JZRNEFKgPlIFAlccbq6vCjPo+L0egZvGvODbWM=;
        b=NqzxuOEFgBH9L+SsM37776R7P8b7HouXig3evPLhx+SfDI6l5j15fYME+jiAiF6uKi
         LsnyX0EC3/WouUml2z6056+oxLob6lEsU+blIWRLUCRHp+z9Q7hvnu0/UOi9pZO8XAnq
         jEdH+k55ZpkOQ4m8mJ0n+TDMEeeg1Dsl8NQSCxAfgs4OaGRlsTwOeRgtJ0wZmjKu5c+1
         A1+KXInRg7qopUvowoBNfMjZL/fC6WTOBUGTcZS87w0Ljgrrap6FVCNfaqNlF0vyHGuI
         fgNYnzKtxBdVOwATMQ9YcVFPGKMRSrBdAtmY3UyEdw5nWZrIMp/B3bxKexOCQNd1bY5F
         SJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774108974; x=1774713774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMTJ+JZRNEFKgPlIFAlccbq6vCjPo+L0egZvGvODbWM=;
        b=tREVAkQjA9+jXRFdf0u2FX/4FPVSXeb7+BZnp3f8P+qbQvDF5+uqswH+fTcc90mdUL
         sDR6jXZSF8FrwFbHUqm/gXbZ5L06T2dNN40juuyVyc6eoRbZXmbk12XkD+e8p8TJbK4T
         r5JkqvX2MT//x+P82U/LA+zFBY6OyvzTMVO5Ly5ZiwDEKwrQeSYVyOy5b5LbZZHBCeTj
         tfZcSMmXGkdw1ogJsW9yJjjQvMv0iGMWFHOmVKApx9Ui2rTOdOTz6iHO4yfG86kOs6b7
         R+Fp6IcGMKTSEpf/Yy19alS7yANhk0G5bfu4rF/iWTY208lE4xkQnankyfQmfRBlP31C
         UJBg==
X-Forwarded-Encrypted: i=1; AJvYcCW0sHhqri1Hgu0uTfALHUY/1R1YDxot7GK/ckDW/CF8NkV9bQW/sVkR0TOoFAlvkZKzZx58DwAb13LeL+SC@lists.linux.dev
X-Gm-Message-State: AOJu0YxGLKIQBY38ePTi/V8GMMFcbYnjUKWdInmCEgPoN6ZGxN02GVRZ
	kYoa9cjG2Hxaxki1osnqZvGTmO6QmnWHdU6xzJS6A9wtc1nkbIuG4JDz
X-Gm-Gg: ATEYQzyLLwhLBNP1XM/qI9C0aRiQRMrY1Ibuoh2g1lQ9BHzirDlCph+V2PzhAVvCXQQ
	AUMjDJjXOYfC0SP2Uk2IVW0gJXRQ6+78zr1cIPhdy7CcXvYPDLLCPvkgSXkayZj6J/TYWHVIh6/
	QU+HFnO4AxopT2JE3F1xpx4s6W8HXb/AmbIQ+jpuNEkCMjAv3LO7mS71MVL2IMYvmWGn9y1uKVY
	1bK3Fw059eAutDm3wsX24S5NAc8B6zde66gea6dXWSBVGdUIeMr+25P7s5272aTwd8UP+iIGFSb
	jydg7IHPujLwo7wMVnO79naG63QHofleZ7c3APp1RZOJ7D9JeymMg2jmcvF9TwRudkHspVNrg1Z
	bV4YFDtsMWCfPC21JaQTcbtis6Py5vVXbfjukpub2ZbbpU9+37axvmpT1UstnNxbTKDbxj14bxP
	50ejD64OiOsgAKXVT8N2DVQOJWlQBEI8WC7+3RvDObQCGRYdQv
X-Received: by 2002:a05:6122:e251:b0:56b:5893:d051 with SMTP id 71dfb90a1353d-56cde437244mr3257789e0c.13.1774108973624;
        Sat, 21 Mar 2026 09:02:53 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcc2d60sm4829916e0c.15.2026.03.21.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 09:02:53 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: rename rt_channel_info members to snake_case
Date: Sat, 21 Mar 2026 16:02:17 +0000
Message-ID: <20260321160217.36060-3-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321160217.36060-1-marcosandrade95963@gmail.com>
References: <message-id-do-email-do-dan>
 <20260321160217.36060-1-marcosandrade95963@gmail.com>
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
index b1f20aa81efb..d8bf44eaa577 100644
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
+					chplan_new[k].channel_num = chplan_sta[i].channel_num;
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

