Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5C39FCBF
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288229; cv=none; b=EL+h+ygQJOfPp8dHe9qLqGx4oOwlW3Vcl2E/AODAaRrD9X1M1NmOyuDjqSA0PYFo8ZS17CWIPqqFQ9/du6cHz0Uif9/XWOFszvKqyYWFTyLuVQcSw3Ymw9ccIJJrK4HbgFhpa/CWppDWLQRBSYe5DEgX09ebOZXVTSv8PTI6fQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288229; c=relaxed/simple;
	bh=Tmp5V2Z8IbIgaCUiCrc4bSFEd5LNVqOI7aY6BrS56DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YD/ftZ0aOLh053fl+uKaqK9Un3wiaHQ/CzvCG908SjTE1Qnpx7vnS9JRvHOFfPUAPJj3C1IYnjqT3ttNMFzdnXiXxl498GDV+LJ+izMm692mJkntvTr1EZYBKkY2HtYFs3NUkBOTW053s0T+fkPqdH3G6HthEM1ZqmHzP9EyBMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rW1Z5VD6; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rW1Z5VD6"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d95017a68so6652313a91.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777288227; x=1777893027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZTm1Mlkfdo7haKia/8nMkrCJjy+UFuTKmXwdOpqS2U=;
        b=rW1Z5VD6kJjW8O/v8J/dwX8QD+4S6iU3UJJegym1h+StZu30nQgb/iuqupgf1kuD0T
         naGoXKag9i2Sl+BkDO102EqtsF4dpziKlU4zni35qYftNx4qNtruT21tfpnrIa2oCtHh
         q1H6kKC0+cMGbGC2Rajv7dQ9BXMnUTrfwRD0zVJ9lhCAe6NIzHUjtkflZ+5SMtYaYwva
         +nm3pCDcll2MdSnPoTraagd9dK7/a1eX+3tA52xQ2gjvRxkBj+LSfKJVPpm2fOtZ31G4
         ibLqpbIUUBGw+AJt4sKz5FwQjrsqNJV7ZrAU0tpqIUCw7k+s9RBg2wsabH+p4KblfOdV
         M3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777288227; x=1777893027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZTm1Mlkfdo7haKia/8nMkrCJjy+UFuTKmXwdOpqS2U=;
        b=NoCPzlsxHt24EKk+knbTCjbu2/wnmRsS6/v/BuuGjmb+hQJQ1blTohQbUVzgcRinGU
         EzfzGRYHIZ7c2pFREncEUlXbtevu0timEm0MdZal6jxug79qNnHiweE/JAm/7/MoJxD+
         MuwBYiI3LXlcnqIdPbv3jsJ1CwdZHGCZELY1T3ybl5RvN/RZGaE2UpG6AKeknj15J5Gh
         +hfln+kd8yhPOfT1B2egXt9xKatX59m9PFy1J7g/DzjQqM2iIBH+cXYAGVzN1GGlNRL6
         DKpkuo6KU2NZG5oayQ9FLC+21VDFXPuVnrBnQfg/gnM2lAJTyfPtNJdgmYGPoyNcR6lP
         zeAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Z1shJqCPlCIv5SIvmDg7iatHypdBn3PS7yA8PcAJcyyn3tLxAmNZTW1cbSs4suHGGMF94pb2TMDopfd0R@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1I80a6yOVwNxqgalqHRQcb0jQj8nHv90t9uO898wt+UumIiDt
	tyB8/w0WSSvrNQD2HUnD4Qj4EU5BWitlUtP2cpUzG7Ve+1iUfjMTOfal
X-Gm-Gg: AeBDieuF6Oq5uebaGbDRw3QG2Zi0vptzsE5LGUoLT+N7hEqP3n1Z3+eGFV8SET3nJUh
	N5NdJGOA6qaWDumKog7XkThMMl5OdXLRBR8QLgteN4zyb96Xpkpv6Ec9lM/W6hsAyOyw0SqOmU6
	a8O5MSBfC1svKqtn63kJPrRtCI8LjMSvuWMzZCcyd1XW5EfHw1NR7nwGY1tGo9En7OhIwODvtcQ
	pqwFwWJ+Jmcw8YOVsI8ZDJquJjAuwuYuAlNTtyfCUk7wg7GXMYDI1dMxYTfXUGFQGKDLV+q7AA6
	88CTyeXMd5gOp/8XL39ywE5mAIeDT/BMMgsYGxuuDlHf4TnEFsuco1i4T95ZuYx6afNZaLDMqhj
	N36fB9hqmpN+EQtR6moiSBId0kgcwMSpbg7W27PshjIHNDYrl+4k8olqK+c8cjIkwVIOem4sURL
	NnvjA1kZwFcCdemIMzr6DF4REJ1pShLI0=
X-Received: by 2002:a17:90b:3c0f:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-3614046c9f7mr42625290a91.17.1777288227158;
        Mon, 27 Apr 2026 04:10:27 -0700 (PDT)
Received: from localhost ([39.125.214.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb9b121sm16592724a91.5.2026.04.27.04.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:10:26 -0700 (PDT)
From: Seonbin Yoon <seonbin.yoon0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Seonbin Yoon <seonbin.yoon0@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix CamelCase variable name pHT_info_ie
Date: Mon, 27 Apr 2026 20:10:22 +0900
Message-ID: <20260427111022.37282-1-seonbin.yoon0@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ae8x5glEKN_3Pnfl@stanley.mountain>
References: <ae8x5glEKN_3Pnfl@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pHT_info_ie to ht_info_ie to comply with
kernel coding style (snake_case) and remove the unnecessary
pointer prefix.

Fixes the following checkpatch warning:
CHECK: Avoid CamelCase: <pHT_info_ie>

Signed-off-by: Seonbin Yoon <seonbin.yoon0@gmail.com>
---
v2: Remove the 'p_' prefix from the variable name as suggested by Dan Carpenter.
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..36af7d07269b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -798,7 +798,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	int ret = _SUCCESS;
 	u8 *p;
 	u8 *ht_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1054,7 +1054,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1091,7 +1091,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)ht_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.53.0

