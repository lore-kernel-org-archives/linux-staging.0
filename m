Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDCD2D6401
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771226939; cv=none; b=YkUhrN9ySW3YG3P54xu/vkjl2EQuJPdxS0lV27Hc+wQ6KmZu7O8Adm2TFOFdxzZqN0agb6DEANp3wzqSKaXI4fKQck6n8Z0WiBW4ZJTAEfAxhrZQljupxnPYSm2jQEWKhce47k88E+qnD3rInGAqprGu8B/oQm78mwT0XWe/wos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771226939; c=relaxed/simple;
	bh=hcYofmA4maQJSWJtb7Gyl6vUekVQj/bc1J9iO+doCDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akeEcy2P1ynN8CFI42ASO0kKqyUvcxWxV4XkfgfLBG3c524dtmGsZrPp517cObMkA/IazGUS/huqKJTYqs4HDMud2xX5bz08YzqOrP+lehwxoOXs6OYvtEInLSZTanut8nn4OJ2g/E5SNW+fkuktuzGOhulvqJY3SuEMMoBHQK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPhaW1jK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPhaW1jK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so23221265e9.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 23:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771226936; x=1771831736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6qO+NUkTv+NNBd6UAJaPNjk7R+vXdCr9cVsDroBWUs=;
        b=iPhaW1jKcSnSaxlV25RzLRuNB545kcA1Rvx1fpEbA9UT0QZbywW5F0t+mGWBB1tlkf
         UMSl7qSmeL5b7WhpE6n77P9NbHguagAUIEfbOzHmnqzNA5+a4iY8fpGdOoxCN+v0kVzC
         niPkbDnu1WcqvjwQqqTpvyDxmbcvmwHlZDMu6EaIsAQ4DoD83eNRcyYl65DI1H7/DGZU
         ai2Qg8+o2FWGaeBsUsMjUmZ66uisVq030dTftgsfer9QUSYqnkny4AH3uE7HCEv86vx9
         qJI6Lm1IwLjhoqcLAK3H7gTxTE+1pWAQamy9HNgbHtQ79mol9B38UdOpEOH6Ozx5J42v
         g/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771226936; x=1771831736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s6qO+NUkTv+NNBd6UAJaPNjk7R+vXdCr9cVsDroBWUs=;
        b=Nxs0H9rL/dj8jbWn63ZK/Aasy0SmWmUe9jFx56XVEd+cpBprl1aq80uCrZOaZKffWP
         6iIKnDnNNA3u5DiZt3Oe5VneYK4lnCX4KUrE9ykHZ5NlZWlBH1IWCGcHslff3YV6s87L
         A9XfvfUw7HghQtxNdE7P5wdCuVcW/UkMV61KOonVMho1PlVKL/ywTWbeMX9C09wjmprH
         ND21+cPoQ167g/+Wx3ycUC/Uh5LLqBCQ7+ntzEqNKq5GpVZDA6/31V3VBM/82rLmU/rp
         fPSPlakz3pHMJJAGg4+wx+HqUR7OzeD+waRQuNE9O40l70j5ZU8Fpp4sZSEfxZ3uN8Xg
         8DaQ==
X-Gm-Message-State: AOJu0YxpZ3PxeaY09kZzjzDIE07eadY0M+NFYoj8ErcGhk/2shczg+ql
	SCH04C+54lDO2o+lYd/vW80GIiBBBYrls9d/WzZRjBHVZqbQW/E7P+0K
X-Gm-Gg: AZuq6aL7PqfuSONCdR9neWi5hv2nvJBV3voMADCSzoXQa4J1yR5Mwvq1fOeB9cmhX1P
	jf+he2bSaTmcKXXjRngosomqKj2uXl7C2N937S1pKzRguNUIsZcKd5lSn/tcUtFYm7Z+3LHufaj
	dnaIJ5oV8PGFbpKv7kubxFX1a6ro6k5bIKv7gI7q3YPFGcSEPGWJoGVlpWB7FgdEHU5M8HkK8hS
	69Y/DjMfOQB+8Stq9owB1qWQzMD0an7IJbH9FRUUxa3Nm/rjlszFElovToSuP764wONYO/JPPoh
	49yiXbfuZEuztRyu3KtQDifz+H2ViGgIj8fWboW6ssCg3/KyBlBvmfxtVqREgltzNMHujFlFNQn
	JGE7kdIjVQLGcjYnJll2jDhHKHQyI9Q59hF0mGCuzJq6WQjFqf/xNxKni2lEq5c1Bt0NX8q6MSN
	39THyWPdraDyvKHBOLTI3bcw==
X-Received: by 2002:a05:600c:8189:b0:483:6de6:37b8 with SMTP id 5b1f17b1804b1-48373a61afdmr156593245e9.34.1771226935852;
        Sun, 15 Feb 2026 23:28:55 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483801ff9b3sm134956055e9.13.2026.02.15.23.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 23:28:55 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: rename camelCase variable
Date: Mon, 16 Feb 2026 10:28:06 +0300
Message-ID: <20260216072830.4260-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206123013.15533-2-nikolayof23@gmail.com>
References: <20260206123013.15533-2-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename "pHT_caps_ie" to "ht_caps_ie" local variable to comply with
Linux kernel coding style.

This fixes the following checkpatch.pl warnings:
	CHECK: Avoid CamelCase: <pHT_caps_ie>

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

Changes in v2:
	- Remove "pHT_info_ie" renaming

 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ebe73abab892..ecb92c8fd1e4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -800,7 +800,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 {
 	int ret = _SUCCESS;
 	u8 *p;
-	u8 *pHT_caps_ie = NULL;
+	u8 *ht_caps_ie = NULL;
 	u8 *pHT_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
@@ -1006,7 +1006,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		u8 max_rx_ampdu_factor = 0;
 		struct ieee80211_ht_cap *pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 
-		pHT_caps_ie = p;
+		ht_caps_ie = p;
 
 		ht_cap = true;
 		network_type |= WIRELESS_11_24N;
@@ -1094,7 +1094,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		if (pregistrypriv->ampdu_enable == 1)
 			pmlmepriv->htpriv.ampdu_enable = true;
 
-		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
+		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)ht_caps_ie);
 
 		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
 	}
-- 
2.53.0

