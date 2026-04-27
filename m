Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68113B27E8
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281522; cv=none; b=lXE4v3ycqwBWrKBG5sWT2VzB7C7jH0pN6aFjGwP8oaNC4eig6tu+hR9Ui0ojdccAONvR3usSSTXWT4d0ugqHoc91PuuFhzplShjpPSwXfZ1rYVOgs3e8kAGfXtW1c//EDzv88puWFFgT3AZJcb5x5HLtuSJRFZM8in0IPBHs3Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281522; c=relaxed/simple;
	bh=Ni4GaulKXW4xU/O9c4rt29Ef2SvEIFSXcdj5zGz4+AU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AKT3tv49WiMtA6yn7aMrkHxkbFOOx4agd8V9hY9N9BJmROqDeUuexr1vmg+sVdIoy6K8tTzNrkN4Qmyy4wErn/Bks1HL57QcHy63i2jTtxYJxWgP068ad9/tk7GfEVU8NjY2a50i7L3yPUMrhW3pqRNvvEhrt84ZOIH0a9tVSaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjB8IQjz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjB8IQjz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cf636dac8so4163190b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777281517; x=1777886317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FOwhUJb/SmtgeaPsy05rPNsK992H1GdRGSYlww6cym8=;
        b=EjB8IQjzKPtychUqIHVeHZGlU2mxPgCRzs5TQKz6Q2TAa+vCwG7n0v28xE3H/kO0R6
         SjZhofCABbVvp0+Rj1tMxjPpQ4L9Op1w6NEuzay+cvqErq+XKHQdTHk1iEIXFl+9MYMa
         c7YYcpkoGxRQsZUcv1KeEBqJa6yr2HsjiwaDAfh8sRMod2ybUV4ZeS6UY0OPvNC6Vkrl
         tGRwYat7RNCmkKzXCl7K4mKO/Bmi063/I+UByhU2htPlsAJb3us9VqIoxNsFiBeCYfiI
         3dg+DnPD/da5YNA42ulwhSJv15yfFgulnOyqY6YtRariBi3NObXOXQgDGDfWRuZ65+Cz
         fm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281517; x=1777886317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOwhUJb/SmtgeaPsy05rPNsK992H1GdRGSYlww6cym8=;
        b=C0YXsN+oRONZQ66lNN8qOjib2D77SxB1UsmwWa/6iMorpwInvL1zgRHE79SOodmBpR
         XvnFL+c4pJyYUuds8f8kkF6Z2+LcMAurcogVNPX9+BNsaO0YYE8TsQuzCici/gtkUNqq
         1Gm5tjm72p2fKX4AsCoPmNObWJwsJads7MOjoPlKRK9fnkqLbZSF4A5qVpX4rsxCrhbe
         BerKDhfDgHJ2ye2p/7ZjfIEiJ+crkUmbUzwC/NZQnvHrm15AP/MT/KLwq4DecKj41s5M
         ZsAydJ3TjZ36xH54E8XIcBZszgKg/S3LUF2ipVqSVIznlWcBO+TvIgsOcVKe061bui9x
         6atw==
X-Gm-Message-State: AOJu0YyLJG+TSz6AR1RF3Rp0RT6pLnVVoxZ2pE13wDun+oCaP9E2Q6I2
	ojpPozxDMd7q+EE9I5oynPDmvNNtACBp5cl93X/sDMYQb83nLVpCuHRX
X-Gm-Gg: AeBDieuuP+XOHHrnUjQEVL9Tj4KrHl1lzfIeuwyxO1YIk8bmGo5dMPwi6V2Hgx8mPde
	zoYrLfbrhHY5EQswvG9KrhvWsk97aXTESL+5ZtP90mPRnwIzbiErNvCK3IKU/Wpt0A8V6xLYxzd
	8GuyXHwbIXhNi42gl0Z37UOGsnaA9kNbCXxCE/4Fa6vMw1Ny20+fGI+7FRm98lfLEW6WLmb8jZF
	PExYQGxIfgZRrnrUroM/ppqThhgM1qcdlzl6irYcMtiozb3DWwUjNBDj5SUWk3Oz7PEg+YUDro8
	lNoZllat2+WlPur3LEmIMKveZ+1b7/UttSRx0o5qoWzR+VWNbxAPrwH2CUhrw8bk9BgtDo4bs+t
	eTgZagf0QiHdTFmhns+BvAcSr2WjLUk3Xi2hiyqgw3+YTweZVLnkMIlLeyf/EVAmK16Lp1WueXY
	rzu7HAoENGYc34RVP27uk/
X-Received: by 2002:a05:6a00:1f18:b0:82a:5e9a:922e with SMTP id d2e1a72fcca58-82f8c94279emr48602592b3a.42.1777281517591;
        Mon, 27 Apr 2026 02:18:37 -0700 (PDT)
Received: from localhost ([39.125.214.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6439sm31802223b3a.41.2026.04.27.02.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:18:37 -0700 (PDT)
From: Seonbin Yoon <seonbin.yoon0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Seonbin Yoon <seonbin.yoon0@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix CamelCase variable name pHT_info_ie
Date: Mon, 27 Apr 2026 18:18:33 +0900
Message-ID: <20260427091833.30839-1-seonbin.yoon0@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pHT_info_ie to p_ht_info_ie to comply with
kernel coding style (snake_case).

Fixes the following checkpatch warning:
CHECK: Avoid CamelCase: <pHT_info_ie>

Signed-off-by: Seonbin Yoon <seonbin.yoon0@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..2116649bab6d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -798,7 +798,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	int ret = _SUCCESS;
 	u8 *p;
 	u8 *ht_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *p_ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1054,7 +1054,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		p_ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1091,7 +1091,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)ht_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)p_ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.53.0

