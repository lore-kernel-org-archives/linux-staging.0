Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05A3A2E28
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516377; cv=none; b=bdSrDU0ZbRI4BhMtG4YpTviQYdL0rkJiwYrkjWwe7ykfsa1GWNe0BUTgHRe6zlXWUBrSiyc4Y64MXCegpjC6V4gv/lHlo6sQg+xoZPKRaUUCigWanFnDUy+furkw0peJzaqREQEtu0AU93koP7LpYgNf2BdUdfBulyNcXTDBfU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516377; c=relaxed/simple;
	bh=lMdHmccPFgHqUtcZip0253tDRUzC2rxFG2WXTAelIvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+FOPg3M4PAZbTwGEqqiPnH+bM1EIonpCZ+A9ypwRVaGtyT3BdsaiYdYndilQekSIK47i6vktioe3S/Jw/fSfLXYLXSKP+/nuLNhl7OniQwWXNpyldhZg5ZuT085P74DZKIhjc7hgOuamqQtxp06TSIRpSlrkA1sxfYfEAfiD3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9s/3I1x; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9s/3I1x"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c85d8615b09so1132093a12.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780516376; x=1781121176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9tKCNwD4GU9LX//oe1xKz7alWoDBMbIfrdtn1ITaOA=;
        b=Q9s/3I1x1dIGppn4OZw0UDGfwScpxO1/EKPpWYR22Hsa5hO36zq5FUUE2G5QMGPFHt
         5CDW4LU4Wp75I2+2wnSYyRZ3zOUwbQ7kFCY9uKjcayhgzHLoHwiqdpgPxicTCLrcvN7v
         ocT9tB3GoupGbdgeOz128Sd5BoyAEGclXyuAm0olPCnklRnQZ6t5fr2OQMUcvTONOvMu
         hrOqA3L07Qapl+jP/0F8HVgkv8bkoJBNaQ3LsRVyRpfX3C1IAYJJBIAXOCTgdN2lQa8s
         Lm+jyre0TIw3kgtJFNp3uL8140pD9CMKR/5+EwygnRaMEaPpD4biWL20+OmhE3CKDYVw
         JXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516376; x=1781121176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9tKCNwD4GU9LX//oe1xKz7alWoDBMbIfrdtn1ITaOA=;
        b=kjYsXFp9DPBZSdQhKNsirUb+8KFOXqsjTDklWX5YoYxHZu0g3b0bUZ/TW01sTf3xN3
         N7zsHaHDqF16iWBThetLkHxdplHdGBOAkSZW8zTIGX06MJhCqCPnU2iBCiBxfaXnRiyr
         K5v4B8PvePPdEiPMw/+Dm0Tf44cCPIGp1awEMzpEhbTk8UVLxIfO0RcHfMirlwy0SRR7
         gWh9+OLnlGUy1xH5pRTq/jiGmIx0F/hrXEFgd4Y8GyYoZ4hLBEDQTZ0MGpBDzGaEjBEk
         EKcgUglAYhBh7NJobP1IUBgqbwua5NYXBuJSezwNdxK+dqV7LyiPmMHcv6M+Olif35XW
         Ci7Q==
X-Gm-Message-State: AOJu0YyFm3bGGQosjCqMQYbch45+5cglBUebywkYlAx0wfqeHEQdZLt+
	r+S/HB6iczvXZCAq9ZInZcjE7Gait6F1UGhI/lgFhoT+xa8a+EP9x3yqDHuZoLnZJX0=
X-Gm-Gg: Acq92OHaFhcLoBQVSFvCnekbst/1KoU2cTUbHn/wqQ048UoTZ/8td9P93Yq6EBdHJQy
	JK2k5cqqxQr/2zlIxQrC48BsrzIeVdKnlrqaIXuY7lqYoDBcm/ERdizXtUL0Yyq8rmq9osVbpRI
	Xx5kDPGsfNwPmQmShwx9Sdb8/VjA4KwZts2TQcQaZ0jSmgAeiOssEfAlDsYzykxg6JECyKXg3jm
	xZMdnFtRm1A/sn7EDeE4mNZZOSjp4Hkpwfzy5V32KyHK33JbwWt3LoBMDOa18KZE8UzkjxirOnq
	lpnOp4aeYhlbCBwmn8jEWfCPokZItE7j3oW8MQBj/dS6idaoCuMKJ8oJfySrMKF7bqBxWIqcVEf
	wAZprmPQQ7Hl7b/bwrfGNf7Ln6NxGOSCYb3D+W4sFXLljj2UAzCs9KIBsHvciPfXnTL5ZCJhAbq
	epNZAa3rtjTgzJFNqLdSbu6SHGXMmts9DT8F8WtRWQU8+7vjzwGgzR7GdfW63uD1qvawIEGqB9
X-Received: by 2002:a05:6a20:938e:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3b4978d5202mr4940025637.35.1780516375878;
        Wed, 03 Jun 2026 12:52:55 -0700 (PDT)
Received: from archslayer ([2607:fb90:7781:358:d68e:f592:7305:af5a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm3169719a12.14.2026.06.03.12.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 12:52:55 -0700 (PDT)
From: William Elder <williamxelder@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	williamxelder@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: remove comparisons to boolean literals
Date: Wed,  3 Jun 2026 13:52:39 -0600
Message-ID: <20260603195239.200775-1-williamxelder@gmail.com>
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
v2: Fix inverted logic for ht_option checks

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

