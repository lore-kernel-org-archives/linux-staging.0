Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2139527C
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095397; cv=none; b=fZmPlinau1dS94oAWPKDVbPSyCzLmymYTy36MFdnZKLSpbi13LaXEse+IGVmGW+tUWQqJ1POxkVtvYvqhP+aaK2dJiJM6KFMrkMTFQwhiUoyj3IGaxLtywL8V1l+McYXNa2D+uuRCy24/uvwm0N3b21IODk0dNV5ZDtzfyRwwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095397; c=relaxed/simple;
	bh=dJEB84D01OrHgCQ57qz1VyXVWwO94GSeAiTh1+8DOyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J0W++NqRi100zHmQ6Q4A9GXcQpGFc+NU9r4bW1M7H+ieDYI8mF7PVa4JNYX3Rho8nUpnvPuV4vZcCk5vPZN89APrAuCLGBjzPHjnsmALedxhOISByw92XAiKjzV5stLfKmX0UroSTvzhY7eM4IhkZho+aqjxkmLf+kfu9ZM1Brs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUw4Zciv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUw4Zciv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4399567ea8cso16359f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095394; x=1772700194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rvgRloFkPq3qNHB5OytPcC8BjT2kJzVmqd/6mNEWzs=;
        b=WUw4ZcivXTwua6qkSGQnbF2lLaOjHqxlkB5L4nQXmJRSkseYHt22SVkYbhrrdKUezN
         OCr1iJXoUKOvq67gtn9cvR1hiJLY5jz4lk3B06Ci1ln51DmD2w5NFk6+5KVoQ2Z6udEk
         Eqj+BBT7MRFRhxkgV5L2F3ReORDvtrWY2Aft+xhoDn3bQocSLtKFnJ2FsaA5W9SRs42i
         Lc11KDz4LFgpMhKgiOoo9oiIwgSYG9/L5JCCjL4+ediXLA1CZu4XjTZEbzfkyM5zEaLq
         UB0Ty+Nz5fIzciGdIZ/JT11kR5/ERmmHJJsU+84QRiugSTrW/ZSGJ3Hcw3efqHjfTOyN
         IeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095394; x=1772700194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rvgRloFkPq3qNHB5OytPcC8BjT2kJzVmqd/6mNEWzs=;
        b=EjLEmcZhA+p20eo4glMIXHeMwZjq1mVbdA1/VRJaNywCYyUlbYX4POYX0nDzBTQ3sB
         byIKmEnVL6bwpMIr2hDfSaU62fvv5IR0TpYYmoLGIgXjpKidzi0oEp8u3hgBfI7eaerR
         FR7olE8rHJC+HzBpBHmOLgtpIdmDRs7OflunSggPRv2XMYgqftwwPFiBzFDKvtPVyKAk
         lYPzU8x7eIs6u4Pw6u2EdSca5Hl4bFNV/FXC84KUeuOVesjZv2tbGpSJcaAXG3J94w9h
         P50OCImLsykHHDMz6x+v3tkcSR3TsCBBlyBI7btsHyYw1SAyP5oG8AqXgfcbjg2H/Lps
         vfAg==
X-Gm-Message-State: AOJu0Yykd5pGkgs1d8+UUA1BVqVj0r8ZzIowCK8qZQel80bbuhbc6DjQ
	bDDG5+JegAwn0rEAbTKdcvBvNEUGBi4nHgniFRn6HJjuhGcOsEYFo3K9
X-Gm-Gg: ATEYQzwLgFAnSA5X9LSEnMR+Rmw5LgoXMZjZvkV/KHnfIpFJS8/503cZp/hwyA9eJaz
	AsDcxzQGFmvtfgwiri7lxcRa2qhvzdQIDiNqgvCbUn4qed908x1M+ENwoWlbBgDrxZOAIYhCo2M
	iaBSKiJmWKM83uKidROe21/60M18dqnvfTe4S3ucbo/kt35ydL83lx/cJwY8eZjlqavcOMBLPpu
	AVAFoeqBNKSr103xCjeT0eeciNLbrOF1jNwOVk8xua1uSjZ1+bYvZKRZPpc3AX+5wbvEcE4he2o
	/D/+HHvu4OiI8ldr5lX+shhgwSDWOUaOPOGfmGftZ3cn3ZmbnP2umNz0BD0M7uQmiFa/QV48CTs
	UwA2GL+0UBI6dd6wv0bCBX2ko8tny++2coKKpTm1cAh080CrG8CB0R9BdueHIO1hykNbCSFVTrU
	xLc3Cggtvk9QeBKuhIC15dBJdPkkIcfcq/eW3VFmEtW70pGB3Ms/U=
X-Received: by 2002:a05:600c:154c:b0:477:7bd8:8f2d with SMTP id 5b1f17b1804b1-483a95f893fmr181755365e9.8.1772095393480;
        Thu, 26 Feb 2026 00:43:13 -0800 (PST)
Received: from rivka-VirtualBox.. (px140.isp.net.il. [195.60.235.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3addb3asm27130405e9.0.2026.02.26.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:43:13 -0800 (PST)
From: Rivka Bukchin <rivkab300@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rivka Bukchin <rivkab300@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix CamelCase variable name
Date: Thu, 26 Feb 2026 10:43:08 +0200
Message-Id: <20260226084308.2915-1-rivkab300@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename pHT_info_ie to ht_info_ie to address checkpatch warning.

Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>

---
v2:
- Use full real name in Signed-off-by and From fields
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4..9ab2219cd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -802,7 +802,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	int ret = _SUCCESS;
 	u8 *p;
 	u8 *pHT_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1060,7 +1060,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1097,7 +1097,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.34.1

