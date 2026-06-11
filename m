Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC639372B32
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165821; cv=none; b=G6VG/LKK8iN/lN2hVX8zXWyNSnv04LLUE5r95Vp2dbswemIx8RrBIjers9VNjuBDU2lfIybKpgFNUh4aGX+3TzJbgsRPi81h9ycZ6AIDw9+JPlnVtrvnB3fbYtUF0g9IOpG4vNRT7whntXFILjeibAESE4AWwRqevAhKTTxpsS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165821; c=relaxed/simple;
	bh=qVJDGawjPd7M51JNdC8/Dw/QLFz0Ciisz7gZR+UtwBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oTLkiuGsWDdANs0Mp31y2dlSSLtRstsJf3qnZHIb6XegGU8gsgU96QJ0RLmtZ4h7sqcY7oO33sjCNT/abT3Nu1tYf/ZSANSmF5IlF9LdjOwgRQQbRFzFatN54pr5p8ynax2LxyubkI6VzQP2+PLTb2ogFmTwimh4A7WxSlY7RKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oi2evsJe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oi2evsJe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8422a816c89so656822b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781165820; x=1781770620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDmCnUvjUCQFPEZ2JqUnap+u2HG8xujoPJw+0caDX/g=;
        b=oi2evsJekwIDNK6WJPpQmbAry54bJ98p6/5Y9G9qbK5NbodecDly33c9i/Bj6vxL16
         ql2l6yr2thc77pbPraDDVWzTMRfZw9o687m9lSM/D7bf285vSsOslQxzogs3W4ckSxyC
         79CP0835DbjwyxDSUTj0iSf/ZBOnwnxGHS9B9k7KY/HULTuNGF8jjt4EUBbqtLpKAHxs
         XJTpfB9LZBjxOTnf/HKTKQBSKG0jLmfJtakFvPcumCazMKl4dW/rqxtxevpE+TDk9OeZ
         z7JrIJTavW+BAy6AHafcHExbUQH4bKR/+lalH7JRkck6bGfF09ew5WICdQQQ39mHx8w6
         AkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165820; x=1781770620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDmCnUvjUCQFPEZ2JqUnap+u2HG8xujoPJw+0caDX/g=;
        b=l7Ia/x506UDmd7LP/ij+xidVzmbXAiu2zP7/KLz/G80YX//mKLsJM4pnyWRDwwYyxd
         kMYk6zOMrg8rVVXpLJIRSkIAV8r1xaL9oJAFywITpwBvKg3QqmXqCPAaNNGVP/f9bL+t
         6IAJb7rT+l72jnrC6MgoR/ekJWd+z8dM3Pm/qlRmRjKLcBDQDwWhXZfDU/r5hJPTDDsY
         /eX7behhz9wjK8Mge0GjO9JOxjmzAWGCsErKyvf34OQpm5Am45talNGBb7Dya49UbjoO
         laAXrHZq4NMor88MAgHPCtN3g/zHonJ6f9v3C5zWwBzyDfbaTuesVHm+nFsUGaQcuS/u
         xqlw==
X-Gm-Message-State: AOJu0YzhE7rnJZ4DWNz0jNFH5vYhDu7g7qukTusFjf1yh9HjcQHp4Njg
	AdwBgnpcn5tStAFzfBaGzRr1bQU2jZW/y3ZpX0Xuv/JY6N/31XZPcAJv
X-Gm-Gg: Acq92OFWh2U0bpS3DGxQJWVpQyf7MBWu9xT6Lb8jMKiqwBLYWxjbYIGtNkbfDwt4WXy
	mfiu0XtKP2LzEtF7mHBOkNgLQ0oyvjQVN9DVqHQEV+OtEVrBOrZhFwZcCEWbAWAHwv8l0NuHdJ3
	7Zh6nz0DMVQ0GCCSGL2Kkixe7MumgN7UY7KIKxSV0GYZ7Ca26m28Xy130i5O++hUZ8jEC0lshfr
	Y6M9+B7hG4ysF7h3cQ8z1SQuXgRvjKDNyMThyu4oubqhOJztdEnaw/3ufT8keLY8/aoXEvvpSq3
	vRDNutTkSEwNM/Z6bWUZ3KnmfRYpBJ5pOJboEK6EhpCrEK5NXcD89pkpxHhUZNebrClctGpuCox
	NauwWuoA/csuqeizxyO7l6g0b0Cbyc0i0g0hTztOE/wWqrVZASL3I/EI80BhNraFH5/m4XynwNq
	A1w1kY8l3/9eqT9ZbXM+1J7mO//ShxRM8FLwEU7w==
X-Received: by 2002:a17:902:ef52:b0:2bd:9875:d457 with SMTP id d9443c01a7336-2c2f334cedfmr11531465ad.8.1781165820087;
        Thu, 11 Jun 2026 01:17:00 -0700 (PDT)
Received: from chenyou.. ([140.116.226.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm276526735ad.8.2026.06.11.01.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:16:59 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused channel format/arg macros
Date: Thu, 11 Jun 2026 16:16:14 +0800
Message-ID: <20260611081644.1553264-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CHAN_FMT and CHAN_ARG are defined but never used anywhere in
the driver. Most of their content is commented-out dead code.
Remove them.

This also fixes a checkpatch error:
ERROR: Macros with complex values should be enclosed in parentheses

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 39ee139f1..bb7c2ecb1 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -623,32 +623,6 @@ struct rtw_ieee80211_channel {
 	/* int orig_mpwr; */
 };
 
-#define CHAN_FMT \
-	/*"band:%d, "*/ \
-	/*"center_freq:%u, "*/ \
-	"hw_value:%u, " \
-	"flags:0x%08x" \
-	/*"max_antenna_gain:%d\n"*/ \
-	/*"max_power:%d\n"*/ \
-	/*"max_reg_power:%d\n"*/ \
-	/*"beacon_found:%u\n"*/ \
-	/*"orig_flags:0x%08x\n"*/ \
-	/*"orig_mag:%d\n"*/ \
-	/*"orig_mpwr:%d\n"*/
-
-#define CHAN_ARG(channel) \
-	/*(channel)->band*/ \
-	/*, (channel)->center_freq*/ \
-	(channel)->hw_value \
-	, (channel)->flags \
-	/*, (channel)->max_antenna_gain*/ \
-	/*, (channel)->max_power*/ \
-	/*, (channel)->max_reg_power*/ \
-	/*, (channel)->beacon_found*/ \
-	/*, (channel)->orig_flags*/ \
-	/*, (channel)->orig_mag*/ \
-	/*, (channel)->orig_mpwr*/ \
-
 /* Parsed Information Elements */
 struct rtw_ieee802_11_elems {
 	u8 *ssid;
-- 
2.43.0

