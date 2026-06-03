Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5048BD21
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780515481; cv=none; b=LP9Ob7LQvVVewFTcvlUNz3RX17ziP1nDIqvGTcQ12ltKTWDlzWm7obo8Jw+M8+668waFSnhJRt4/vwHE0D1zi2Rw3AqLiLNWo1DHp9refTpK4oK4yNi9/+sb7fBPh5Xpo9EYlV6PnJQGeVTS3GXkd6XtsXzkA/R0I+E/Xq8YGpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780515481; c=relaxed/simple;
	bh=0ozitBAMrJvwv8hC/10hZPw5Q1GIwmuvAtXfFxS1UwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AunEVljGBW7ILV5BHUXTFvLCmWWBf6NT0uwXeG+tRt6DzE/AhOwWVZErTIqogBsTM091jieJwP/2CnycSAVcEl1UUqhzAIEJ1hrMt/90iKlj1nw7t5I6PJnoc0deI9AjeKad0piEdgk8pBoyjUax3PBzBCF2du7abWYUafnabHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rci0ydyU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rci0ydyU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so3477775a12.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 12:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780515479; x=1781120279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQahfrouqVjSpdsk806Jg+r95FmYpzMVjKE9AkAHTlU=;
        b=rci0ydyUC2s2ggMA8EinvJ1PK+o7PwYRQYwxmOXU/p0gPvTnAumGpsRMDWLBJVevtk
         WVOUkDJkT9EBFAfxWsTvWU22M+9DeqrcDC/2+UkMG3yoUZo/Hi2E7vMvbD+jsheD1g3r
         Wifiu0d8uZuXE/cyMDQrvGLDOvKzXvb0cDZiC3kWl37Rq8wKsucDTPA3UKIRsGQbhVY4
         6R8SwESDdikSEV9rlvirAmxbY3RZa3DQivRBQecceyn9v21osJvU6Ktx9vM21GoRSeks
         CnVqcUZLeFTo6oltLo4MiEBfViwdJGF1T/ckwOjkdQ6kAlkP+TVgyPj5ntmtnO5iE8b/
         AX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780515479; x=1781120279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQahfrouqVjSpdsk806Jg+r95FmYpzMVjKE9AkAHTlU=;
        b=gdH8iLsTq1yQAenWCXDMBUK0OgR0OJvqam3YeeV6vnqTgKAYl7eB7wSCSB+0Mo/f8u
         cN3AFvq79Ur10AlSC2hTySwybZEAoQQYrjl389GmUgl6DllwAys7I215gdhw6KwycgC2
         xsWcw2tfNcOO+tuqPdiDvKdlFo1c7v1z0tkYc9N8cOwDIMShVfUeW5Jhhs+EmufwUudN
         8fnMrdTT6JN1WDfs8/XSVp9y/qaMFeyO4UjGTUSlr+Uw0TetcLwLYvYIRokUqjaLECI8
         tf+mLstcDFGGpb2ZwCVdu4YMG0XbfwmcjWfRkaX+Yxcdw7UZQ06dL5Kur0H0aCN2lT+c
         EVKQ==
X-Gm-Message-State: AOJu0Yyup59C8cOrjR2JTldJjaGjxbT33ozFPbFWadsaXOn7RiGGEv+J
	Hn8v6v5qO4S8Fmq/o6xsD6Q3WGKa+odQSyahH6jemzC9JsO9CJTP55pq
X-Gm-Gg: Acq92OG3jZ0MALklpUQ6bI5B4pFJqJaZcgTZkl7VYOVsvzqBbtJ24wV+5de7hIHyE6a
	YeBd1zToGr8XsDlR7m5+jgSYL4zfL3hzyuvsD+xpaJZDq7Phkz0m9XJCOOqBNfFmN9bzy04NGvd
	K81wiJXIGcLId1SqqbeIodeHkPJKuUEbkc3Tew5w51gEqn1spCs+ARUhdnzMQFVWuZTGRhE/C7A
	HjW2JPff58D67Czcv41yZTFtxXCjdoZ3XzG8svg0GzA48M6U8x/+vBg3qgj6xCmG3lRnFOGSoV6
	CM8HbSMeDqHsjmyc2Rj0jImYLiLAuqo8F8bQu95XFTnu233qId1D3NahIqXXI5OxiwtD9rS73DI
	ddImN6GZYPiljkC2HZEuVQimQJ0MVpBFYBjZqEjgAPw8UIz6FxopMDMQ3NjSJzv7gp0Oqcbj1xT
	sVbFD1U1StfQJNXCuLq8SgM53SyOCEU5Z+x27v+AOeLlX2OL1jGZIW8SokJUmNSwTmuqaoyWKZ
X-Received: by 2002:a05:6a00:1d96:b0:836:3f6a:3e77 with SMTP id d2e1a72fcca58-84284db2215mr4709363b3a.17.1780515478778;
        Wed, 03 Jun 2026 12:37:58 -0700 (PDT)
Received: from archslayer ([2607:fb90:7781:358:d68e:f592:7305:af5a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428235006dsm4024314b3a.13.2026.06.03.12.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 12:37:58 -0700 (PDT)
From: William Elder <williamxelder@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	williamxelder@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove comparisons to boolean literals
Date: Wed,  3 Jun 2026 13:37:53 -0600
Message-ID: <20260603193753.195640-1-williamxelder@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove comparisons to true and false as they are error prone.
Use the idiomatic C forms instead

Signed-off-by: William Elder <williamxelder@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..c58bb4ecda05 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -236,7 +236,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 
 void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 {
-	if (enable == true)
+	if (enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
 	else
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
@@ -340,7 +340,6 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 
 	center_ch = rtw_get_center_ch(channel, bwmode, channel_offset);
 
-
 	/* set Channel */
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
@@ -847,7 +846,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -892,7 +891,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 		pmlmeinfo->bwmode_updated = false;
 	}
 
-	if (true == pmlmeinfo->bwmode_updated) {
+	if (pmlmeinfo->bwmode_updated) {
 		struct sta_info *psta;
 		struct wlan_bssid_ex	*cur_network = &(pmlmeinfo->network);
 		struct sta_priv *pstapriv = &padapter->stapriv;
@@ -931,7 +930,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (phtpriv->ht_option)
 		return;
 
 	pmlmeinfo->HT_caps_enable = 1;
@@ -994,7 +993,7 @@ void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -1689,7 +1688,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 	/* dump for  adaptive_early_32k */
-	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
+	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done)) {
 		u8 ratio_20_delay, ratio_80_delay;
 		u8 DrvBcnEarly, DrvBcnTimeOut;
 
@@ -1737,7 +1736,7 @@ void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	for (i = 0; i < NUM_STA; i++) {
-		if (pdvobj->macid[i] == false) {
+		if (pdvobj->macid[i]) {
 			pdvobj->macid[i]  = true;
 			break;
 		}
@@ -1762,7 +1761,7 @@ void rtw_release_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	if (psta->mac_id < NUM_STA && psta->mac_id != 1) {
-		if (pdvobj->macid[psta->mac_id] == true) {
+		if (pdvobj->macid[psta->mac_id]) {
 			pdvobj->macid[psta->mac_id] = false;
 			psta->mac_id = NUM_STA;
 		}
-- 
2.54.0

