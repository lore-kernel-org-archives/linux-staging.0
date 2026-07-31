Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8595F413D69
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494636; cv=none; b=NPX3TdCcRXntGIBcOuH5xhC6GADHiB96zZaulixQlM0arIYYm9ooI6aJ3jevGe0JKJ5UosZQZUtcacL/aVtBXdZ4ssQFdUUlLpEtEddip/pji7kdujReuf6JHSmuRm3tm61lGmF/FxUsfdhvNZojV7ew01sZmd2IuseTo0SKpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494636; c=relaxed/simple;
	bh=k9DXMZejTdyJ7RcE+SCt7jzXZ6JmG0z8IjpolHiFCzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IK0/27zzPeZ7EZWKc5K2oR2MuNAY/ZsIES0iajrO2i5H6ysS8dE3SHLJ7SAku2atL59GA/ca2CVH4InQjG0O062s+UB+blXoIHwDjjfQ+riX6aHJHbOkPneKJgMF/5V2md+q4BcxFiZiKm98mXz0uuGm22vrU+n25sYXwIX9mgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNuBdeud; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNuBdeud"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fd4531020so259897f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494623; x=1786099423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCRzzaqpndFinfR000FaVA8jGy2wj2bMul+CSVVldBY=;
        b=SNuBdeudeRcGy5xnQqgt2UTML0iHntweDXjxhKPcZ1DJTAMWmmI2zli8PAwlNyvuwN
         F/xyRzk3zsRmPq53EljYgPLOm5ND6H1fNwh4Bib9hk72XKgmfJwgl1tMqVXV735Ro0+8
         ecbHzkW5LAYGEGKFxKBBvLX022nNrapouM6m1fCyQHVeax7aFivIiXvVErqXXCSyJHA1
         BCgfUGUXzkl6tBouGwH5WYyF4OORHwuibF9YXhtJP32Kl5/V7pgVcXlCXpe6vXSN/Pcx
         nLhh7726BP3d0AcuMxCYdYXHiFwZQs9EyeEnxJO5KC/RJtrIWAY9EyYAHmXYkgKjudzK
         pEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494623; x=1786099423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCRzzaqpndFinfR000FaVA8jGy2wj2bMul+CSVVldBY=;
        b=VQ6J7DUEEQtrymdnYMjDMci4VXSUI72m00y2vVjPHvSBz1eoqKyNZWJxNmhvpZZIWw
         ydx5itmLvLJ+3epKIq3MfxsBaOn6FrH5DzONtISric6Qx/YrKHX0K9YP9cvLwFyDRlNq
         Sww5fHZviaKm5SrwIHMLfB3tfpAHNK184BGS09Z4PkaySBEdekiRbaQAkLNhAPBc9InU
         u0w+9vAfFXDj9qukYPBhcKvrVQ1vO559aD7RyXOtpFxqMufTdZ+2bu7NL9L6TW+Cy6GS
         hZ+4TpfUaLPQ+iVKOjWK8RP6lut5ZHJ37Cix89eoJcPIerprwIQMnZZGTsT3pT+NQkj+
         AfBA==
X-Forwarded-Encrypted: i=1; AHgh+Rp19l0oCKqcZwnx5pzdmB8PsvNW1wg7KojT3oY7mz1yISOQDgdg7ayAe4Q45Yr0EwCKBqaoCiyxM9LKKvG7@lists.linux.dev
X-Gm-Message-State: AOJu0YwgUfzGy4htZiJQ0gN2IFr8LSThvqMGcCm2gqG64A5/caR30f20
	5ium6PYyzwwoo+GrwLYIdrlmaGT8NahHodrEcZAKHF5wIBsvHxlDyfX0
X-Gm-Gg: AR+sD12Mk/dyZss/dA7DCZxI8Shf32jsZMPgL5btG3KMx+nmu/RiFIFOVoobR25GDgr
	3rVWOioozBEiNgH9hGPJYiap0e/dOdEqKifMpEXPKXizjNb1gB1Xa65TQpyyJZy/j3ATKJIsox1
	y/xouW8wr9uJqCg3OPSTnl61KjWCAd7OPB1YvSmU36I4yjKlcIPiSF7L6WXkRlo5rih6qnLTrUo
	z8ucAimZ/3Rj61zeT/TWQXPtJkj6kYII5nEZTqYg4LMJk4/a7D4iAGYMXAyPlBbWamVa2JbsdUI
	PQ10csm+ui91LRW8BwN+NX5I5UF9iwLR8gQvfCPlBcQa+oO9lpvt3P65bSdhG6bCAVzFfo/4HsN
	SQeiPaoFWYps1IICzsouRPGAf99W02zjy2S61rXxxvrTXpk5hxhFxL9vKIeaW08azW4zGUbEK/M
	ciquIhPBqglyhq9P3c2x+G8wRl1SH0w/3Ch+Gj30KYp5q2Kfmz4VSIfvJgisnSy4PKGR+Us8aPZ
	JAqnOO9rwqPYXs75GDTUGKMXWa9tkngHBqksvZgcXki466utms96tugcomNNOA=
X-Received: by 2002:a05:6000:2582:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-47fd2ab8b0bmr3474575f8f.6.1785494623197;
        Fri, 31 Jul 2026 03:43:43 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:42 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 06/11] staging: rtl8723bs: renaming variable phtpriv in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:29 +0000
Message-ID: <20260731104134.12754-7-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731104134.12754-1-fliegbert2@gmail.com>
References: <20260731104134.12754-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming occurrences of phtpriv to ht_priv since the prefix p is an
old naming convention to indicate a pointer variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 74 +++++++++++------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e46e137a1adf..7245f671075e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2154,7 +2154,7 @@ void rtw_joinbss_reset(struct adapter *adapter)
 	u8 threshold;
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	struct ht_priv *phtpriv = &mlme_priv->htpriv;
+	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 
 	/* todo: if you want to do something io/reg/hw setting before join_bss, please add code here */
 
@@ -2162,11 +2162,11 @@ void rtw_joinbss_reset(struct adapter *adapter)
 
 	mlme_priv->num_sta_no_ht = 0;
 
-	phtpriv->ampdu_enable = false;/* reset to disabled */
+	ht_priv->ampdu_enable = false;/* reset to disabled */
 
 	/*  TH = 1 => means that invalidate usb rx aggregation */
 	/*  TH = 0 => means that validate usb rx aggregation, use init value. */
-	if (phtpriv->ht_option) {
+	if (ht_priv->ht_option) {
 		if (adapter->registrypriv.wifi_spec == 1)
 			threshold = 1;
 		else
@@ -2181,54 +2181,54 @@ void rtw_joinbss_reset(struct adapter *adapter)
 void rtw_ht_use_default_setting(struct adapter *adapter)
 {
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
-	struct ht_priv *phtpriv = &mlme_priv->htpriv;
+	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
 	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
 
 	if (pregistrypriv->wifi_spec)
-		phtpriv->bss_coexist = 1;
+		ht_priv->bss_coexist = 1;
 	else
-		phtpriv->bss_coexist = 0;
+		ht_priv->bss_coexist = 0;
 
-	phtpriv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT(1)) ? true : false;
-	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
+	ht_priv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT(1)) ? true : false;
+	ht_priv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
 
 	/*  LDPC support */
 	rtw_hal_get_def_var(adapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
-	CLEAR_FLAGS(phtpriv->ldpc_cap);
+	CLEAR_FLAGS(ht_priv->ldpc_cap);
 	if (bHwLDPCSupport) {
 		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(4)))
-			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_RX);
+			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_RX);
 	}
 	rtw_hal_get_def_var(adapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
 	if (bHwLDPCSupport) {
 		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(5)))
-			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_TX);
+			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_TX);
 	}
 
 	/*  STBC */
 	rtw_hal_get_def_var(adapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
-	CLEAR_FLAGS(phtpriv->stbc_cap);
+	CLEAR_FLAGS(ht_priv->stbc_cap);
 	if (bHwSTBCSupport) {
 		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(5)))
-			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_TX);
+			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_TX);
 	}
 	rtw_hal_get_def_var(adapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
 	if (bHwSTBCSupport) {
 		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(4)))
-			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_RX);
+			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_RX);
 	}
 
 	/*  Beamforming setting */
 	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
 	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
-	CLEAR_FLAGS(phtpriv->beamform_cap);
+	CLEAR_FLAGS(ht_priv->beamform_cap);
 	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
-		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
+		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
 
 	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
-		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
+		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
 void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, uint *pout_len)
@@ -2255,10 +2255,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
-	struct ht_priv *phtpriv = &mlme_priv->htpriv;
+	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
-	phtpriv->ht_option = false;
+	ht_priv->ht_option = false;
 
 	out_len = *pout_len;
 
@@ -2266,7 +2266,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 
 	ht_capie.cap_info = cpu_to_le16(IEEE80211_HT_CAP_DSSSCCK40);
 
-	if (phtpriv->sgi_20m)
+	if (ht_priv->sgi_20m)
 		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SGI_20);
 
 	/* Get HT BW */
@@ -2307,17 +2307,17 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 
 	if ((cbw40_enable == 1) && (operation_bw == CHANNEL_WIDTH_40)) {
 		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH);
-		if (phtpriv->sgi_40m)
+		if (ht_priv->sgi_40m)
 			ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SGI_40);
 	}
 
-	if (TEST_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_TX))
+	if (TEST_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_TX))
 		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_TX_STBC);
 
 	/* todo: disable SM power save mode */
 	ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SM_PS);
 
-	if (TEST_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_RX)) {
+	if (TEST_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_RX)) {
 		if ((channel <= 14 && pregistrypriv->rx_stbc == 0x1) ||	/* enable for 2.4GHz */
 			(pregistrypriv->wifi_spec == 1))
 			stbc_rx_enable = 1;
@@ -2356,7 +2356,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 	rtw_set_ie(out_ie + out_len, WLAN_EID_HT_CAPABILITY,
 		   sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
 
-	phtpriv->ht_option = true;
+	ht_priv->ht_option = true;
 
 	if (in_ie) {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
@@ -2366,7 +2366,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 		}
 	}
 
-	return phtpriv->ht_option;
+	return ht_priv->ht_option;
 }
 
 /* the function is > passive_level (in critical_section) */
@@ -2376,21 +2376,21 @@ void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel
 	int len;
 	struct ieee80211_ht_cap *pht_capie;
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
-	struct ht_priv *phtpriv = &mlme_priv->htpriv;
+	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 cbw40_enable = 0;
 
-	if (!phtpriv->ht_option)
+	if (!ht_priv->ht_option)
 		return;
 
 	if ((!pmlmeinfo->HT_info_enable) || (!pmlmeinfo->HT_caps_enable))
 		return;
 
 	/* maybe needs check if ap supports rx ampdu. */
-	if (!(phtpriv->ampdu_enable) && pregistrypriv->ampdu_enable == 1)
-		phtpriv->ampdu_enable = true;
+	if (!(ht_priv->ampdu_enable) && pregistrypriv->ampdu_enable == 1)
+		ht_priv->ampdu_enable = true;
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
@@ -2400,7 +2400,7 @@ void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
 		max_ampdu_sz = 1 << (max_ampdu_sz + 3); /*  max_ampdu_sz (kbytes); */
 
-		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
+		ht_priv->rx_ampdu_maxlen = max_ampdu_sz;
 	}
 
 	len = 0;
@@ -2460,7 +2460,7 @@ void rtw_issue_addbareq_cmd(struct adapter *adapter, struct xmit_frame *pxmitfra
 	u8 issued;
 	int priority;
 	struct sta_info *psta;
-	struct ht_priv *phtpriv;
+	struct ht_priv *ht_priv;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
@@ -2479,11 +2479,11 @@ void rtw_issue_addbareq_cmd(struct adapter *adapter, struct xmit_frame *pxmitfra
 	if (!(psta->state & _FW_LINKED))
 		return;
 
-	phtpriv = &psta->htpriv;
+	ht_priv = &psta->htpriv;
 
-	if (phtpriv->ht_option && phtpriv->ampdu_enable) {
-		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
-		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
+	if (ht_priv->ht_option && ht_priv->ampdu_enable) {
+		issued = (ht_priv->agg_enable_bitmap >> priority) & 0x1;
+		issued |= (ht_priv->candidate_tid_bitmap >> priority) & 0x1;
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
@@ -2495,10 +2495,10 @@ void rtw_issue_addbareq_cmd(struct adapter *adapter, struct xmit_frame *pxmitfra
 void rtw_append_exented_cap(struct adapter *adapter, u8 *out_ie, uint *pout_len)
 {
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
-	struct ht_priv *phtpriv = &mlme_priv->htpriv;
+	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	u8 cap_content[8] = {0};
 
-	if (phtpriv->bss_coexist)
+	if (ht_priv->bss_coexist)
 		SET_EXT_CAPABILITY_ELE_BSS_COEXIST(cap_content, 1);
 
 	rtw_set_ie(out_ie + *pout_len, WLAN_EID_EXT_CAPABILITY, 8, cap_content, pout_len);
-- 
2.55.0

