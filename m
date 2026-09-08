Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BACC59B68A
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 18:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892498; cv=none; b=L6PIEY4Ymw4zOuqsVipZTerTSQARTmXih4hupjLq1Kkrsbwe5FmYOczCcI/EzV5MkZePtiD7nz0x89K+lcpPu8I/eSqU2g3dlyehKZxa2HcTU05gsn5cqaRD28eIQH8cDPBHU2CVSYmj90qmbRaHKrNRoO/cBjSZqbPiCsV0+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892498; c=relaxed/simple;
	bh=p73uIhn90vkjA4n++9xzUcN7kt4Mz0jQtzZuhnvlpqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAWD8QbhDSAbpBbfF7AhUR1jiEGF1e8GjF95W2ufC7HS2JPdgv6A+avuhyK1mPK2u4LE6wLekGEwLT2k2JncIpwXvjIUoqCtcTWR+/j57Xl1pmgE0jq5PALz0fZRBdjWTUSnmkHYfcBxjaQ9rfCWIEvaMnbQ9rPCu43L8wq3uiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4udGpDG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4udGpDG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so40399145e9.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892490; x=1789497290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYkOJfL2Luh0LmRnAEnNC7cqyiQXe+QAe+A4B9EKt44=;
        b=k4udGpDGily5vkVY5ngF7xKmWfsWJrR8f0e/Kuh6IUSH/5nom9vd/Q0bwuK6zOCP1f
         16N+1XADElE9bpck4eFVJG+m1lI8iay1vW3pcNqp2swwWvwwP/LRzxZE7lrO4krQQ5/Q
         qRco1c15JPwojuS0hOjfLJNMzHyywZVfbAbBvNn8h2lji0FCYZQ9Zqeuo5G9FYomuYQ7
         YcfPJtN6uP6leQaNjhCNre9yJPcI8A6LH8H+4Wi5Uv9nUvQsTu3dfNwhtQCVvkyC939+
         D3+towfbKm83XkK8AGCAozTfugPKcwUThmcIeDkaBZ/FSMA0vgWDMRk075vHxQMntfNG
         mLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892490; x=1789497290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYkOJfL2Luh0LmRnAEnNC7cqyiQXe+QAe+A4B9EKt44=;
        b=rnSpU91JCusN3Ap1YFP+ZU0uVomMj+n51jyJP2j/z5iylZ9/yLS64AWTvlFFLlt2KA
         hQn86cbGUSB5YjaNV0LSQzYJn/PegzpjSn5bgU9c55ZYmb5Fm0TfBrCWclGR8VP/fT20
         HDb8inuroU4AIk9R0BgKHlZKqNEp+g6+lq7TuKv6gKH1sFL/b64s/AFzaJp2v7oKvLeO
         miNL474FRHhWTv6VFnf/qaVwHmsksc9XfW5F/jdlEaBPRH9ha9KWgeNnPWrXidXwdOuj
         1+VWXBc4Kke1y9TteXjeMBjrkRFZlOdns9v/kXJ5beA86OF3NeA12pzBa0C9l/rmbUz6
         XUZw==
X-Gm-Message-State: AFuF++kRez9pzWe4+/XyQimBmrKZx4fYehoPtEy8tadLQNUPmj+KRgZS
	/UVZwS9bSBhkgcMPCISPZxoYapGD53ar/IIgtosXfE5b07hBkakGLMBOLSmr0w==
X-Gm-Gg: AYBFou2oq9w9VHFcW2hL7EX4a9IgYRKaHUlCaiVa2P8N9gL1s4liZbWmDA5Chy0Rbva
	1MWgQpyEA1a5IuWZGJTFqUkzjJnoUa0MlQ2I7WYv75rES+KhTGwQI6y2tcTJYKHMeHfs7qNPBcd
	PU+c3Q8F15OmPBX1TLYmAuidh4PTRe7CGYZY4i2qr8BPD0jP7fL2ly19yX4p1iZu8cTbed1b+Xd
	5cKxwlp/EoLWKCL+VE5U+72Ssnnlihlvmym5+IhTS7gmvKepZlSVN+AwYpeI/VMqZzZT2+xp8BZ
	uLLqTPOxMskZ/qrby8QmDSUb7sgWqFGfkveheDmRHDEwo/qGgOZcgoC/V0PmrfXhI5NLMYlelR3
	V2NeMlBQ9zSZy0YAbcshcTfD40gwC1XK2CaPDBAgg5hygiLRxJJRJcN8MoVnjFf1D8JfvMnLzqn
	0pG0P99xgb0nsMVM6WbJxMeTX+6PDYmUIhMRymWdO0zM+rN7QjRs6+r63EnpNXUovqQ6Y=
X-Received: by 2002:a05:600c:83ce:b0:49c:fa20:cbff with SMTP id 5b1f17b1804b1-49cfa20cd37mr273835735e9.22.1788892490458;
        Tue, 08 Sep 2026 11:34:50 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:49 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: hal: clean up header files style
Date: Tue,  8 Sep 2026 21:34:30 +0300
Message-ID: <20260908183430.3256-4-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183430.3256-1-predescuciprian99@gmail.com>
References: <20260908183430.3256-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h              | 2 --
 drivers/staging/rtl8723bs/include/hal_data.h     | 6 ------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 8 ++++----
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index a20b48660..c511d70a0 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -529,8 +529,6 @@ struct odm_rf_cal_t { /* ODM_RF_Calibration_Structure */
 	u8 DeltaSwingTableIdx_2GA_N[DELTA_SWINGIDX_SIZE];
 	u8 DeltaSwingTableIdx_2GB_P[DELTA_SWINGIDX_SIZE];
 	u8 DeltaSwingTableIdx_2GB_N[DELTA_SWINGIDX_SIZE];
-	u8 DeltaSwingTableIdx_2GA_P_8188E[DELTA_SWINGIDX_SIZE];
-	u8 DeltaSwingTableIdx_2GA_N_8188E[DELTA_SWINGIDX_SIZE];
 
 	/*  */
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index f67ca4969..a8aa38eb6 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -14,12 +14,6 @@
 
 enum rt_ampdu_burst {
 	RT_AMPDU_BURST_NONE	= 0,
-	RT_AMPDU_BURST_92D	= 1,
-	RT_AMPDU_BURST_88E	= 2,
-	RT_AMPDU_BURST_8812_4	= 3,
-	RT_AMPDU_BURST_8812_8	= 4,
-	RT_AMPDU_BURST_8812_12	= 5,
-	RT_AMPDU_BURST_8812_15	= 6,
 	RT_AMPDU_BURST_8723B	= 7,
 };
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 179fae4d8..322d7153e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -428,7 +428,7 @@ extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
+void get_rate_set(struct adapter *padapter, u8 *pbssrate, int *bssrate_len);
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
 void update_basic_rate_table(struct adapter *padapter, u8 *mBratesOS);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
@@ -446,8 +446,8 @@ void rtw_set_oper_choffset(struct adapter *adapter, u8 offset);
 u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
 unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode);
-void r8723bs_select_channel(struct adapter *padapter, unsigned char channel);
+void set_channel_bwmode(struct adapter *padapter, u8 channel, u8 channel_offset, u16 bwmode);
+void r8723bs_select_channel(struct adapter *padapter, u8 channel);
 
 unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval);
 
@@ -508,7 +508,7 @@ void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
 
 unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason);
 
-unsigned char get_highest_rate_idx(u32 mask);
+u8 get_highest_rate_idx(u32 mask);
 int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps, u8 bwmode);
 unsigned int is_ap_in_tkip(struct adapter *padapter);
 
-- 
2.55.0

