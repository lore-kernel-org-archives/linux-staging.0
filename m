Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCA62857EA
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833578; cv=none; b=bS5LQNfvBqzZ1BqgNGBni64LX52ZXKDsKC4f/sG2cW5gxa5lsPgeTNeE/cKNxAZ5bG1d6f91lOCKZczUFGJ6wYKGT+42E8JYeOufR2fThEvzOthq3m5GdvL+LF22ga4u3QXFsQOZ85BdYOSZPkxpETKlDWSIc+HfQ0qZwmXQwag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833578; c=relaxed/simple;
	bh=UeqZgih//xcbMg5qWWo5PAoxCl0KtIgkLYghBcZd8sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVAN3mmOBoXqusVxtavWjKajoeSrqjmO8kij/BvPhMxeYb91tizfXTgbbqxXsX+pFjLtEMbzfuOX+DNpGMm9ABvCm8kpqpv5oNbnmDwSeY0fdvXyOCihq1LnlgdQZX/8lDSWMld7J/MiQKrttkj/HiPeqgiSXD6wNqF1tTcJZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQl86YtB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQl86YtB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29586626fbeso36982825ad.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833576; x=1764438376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm1Pttzi3WYdg/JYocWz9qt9ZsVaCfZIkXAx0tm4lFU=;
        b=PQl86YtBjqqxFiW940OgSsFdfBmnH4R3UqUZBRWYB2/tCDktDAHU5w6Xx0Vqx5gUh0
         7PfbsNxXJ2bBpd03n9HV+RlNM9fg5GhATyxr2llpoltfvTsyR5G5HqB7p4OA455dWGBg
         swtTlwB/zsA/YWT8jULyN1NhrKYiCEjj5SvbgQJrZalyS+018ls24bPhsUBBn9ptyUXp
         P2xxUQReJMoOLqHz1GMyOG3Z/4ceeE5Abo1Auc3BNJz/yn1Fa+qfUlrw1rz0QD59qtkS
         w/TDolRREk/sl/iWnPFDdYhI4HfsFywxDhjNWfLUJO5M1uqBEgnWdJlpAzrpHQ5JhH46
         2BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833576; x=1764438376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nm1Pttzi3WYdg/JYocWz9qt9ZsVaCfZIkXAx0tm4lFU=;
        b=bMnneTHwOZ0nDlu5JwNZd7rfFwOc33LlOprMYURdk1r400Ml8RzrWUleJjABoU3p2B
         Ml0GE8LqUZ30PsLSXIBlKDvhrk5m/216FiE8xcEDLU5PORniFiFxWQEhqhnRBpb/6T4S
         uTVzh5/NCIasXvbhkxQiWWDN0FM2ZkwV1ohJvdQLCME2lIiW0qE6Qya3C03O7hOF/vhP
         +VZ2POwCu3VwccI0XwbuAEfqDBTGLLDeBfOxyeE2LEvrvCb4Tbf5ALBXRS06CnPIU+4D
         BkgblsG0wv+g1tPOmhk9CAkKi9Mj3vC4+vqPoYEjVuW4s1C/Ln5yXO1h/mhfjBlv2qfY
         p4+A==
X-Gm-Message-State: AOJu0YzN3qXJ2gfLsVH+ueP4+bvAiz3Diw+Lh5vEVa56ynO/BnIN8z1n
	xYn9FR5BLck5/AUORAEeqmFxsrRxw1JmH7jFm4X3VCeLbrCxqHaepVnT
X-Gm-Gg: ASbGncvE8W1dMpskzVKytJxvPh8adjyeg0RVZZoNBtW/JkA4YGo/2jn/RA2hgvbngLT
	P3PGSQ9HmOykg0AxEHgD8x6/BROWGP4tariMVleLgIqDg4TK/ACAZVUos6LKIQZZ06PZ6gG2/ty
	KOs1Bphm3WD/pwQXyG5FIpAJDC6c5LWKPG/cRmT9LJzCWK0vUPW2BPtRP4IXBgL97rpqxcr25/m
	1L5OoYCx02haY7kCszXjaIK8ZkSlyGlYEhwBtljli0z/6xy/sATZ7WxU6fbWueN3dZE1KuRWR9o
	378AYtt1552BJDVZgKJaMBy0gWCWoDCJkqFdIX4Fa+SZzobkYT5VdCz3hfv60WRNsGR+cr37dUr
	/SHp2vnsLYeRxRB67o+DcXKDQnAPaP5+aF2zZ1Xja8Gn4JDOr3nqNzbi34Tl2KhxxNs3X2LH8s6
	rINcwxXtD+ISyHhObXdEi3m9iVtr5sJ7Djyz3+O7ZqNnRRW5CBeUVBOdIZmaSxjHNv98KxhKN4C
	306BiMfi4PdnghgJmFSYf1f3wtwZg==
X-Google-Smtp-Source: AGHT+IHONysqwYe+aWBhDxMqwYiRxC2vVD70ctO21dUdd4EvtxvCSA0AS1KTCPZXYwmu9feRlkvLMg==
X-Received: by 2002:a17:903:1b45:b0:297:c889:ba35 with SMTP id d9443c01a7336-29b6bf3bd93mr75597035ad.31.1763833576301;
        Sat, 22 Nov 2025 09:46:16 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm90186085ad.35.2025.11.22.09.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:46:15 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: use standard offsetof in cfg80211 operations
Date: Sat, 22 Nov 2025 17:45:53 +0000
Message-ID: <20251122174555.215109-4-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122174555.215109-1-knavaneeth786@gmail.com>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usage of the custom FIELD_OFFSET macro with the standard
offsetof() macro in ioctl_cfg80211.c.

This resolves coding style issues and standardizes
memory offset calculations.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 315bab373729..784c9ebf6f9c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1712,7 +1712,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 		if (wep_key_len > 0) {
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
-			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, key_material);
+			wep_total_len = wep_key_len +
+					offsetof(struct ndis_802_11_wep, key_material);
 			pwep = rtw_malloc(wep_total_len);
 			if (!pwep) {
 				ret = -ENOMEM;
-- 
2.43.0

