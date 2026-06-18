Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91C33BBD0
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781816186; cv=none; b=cORyvkpik2TpQhj8yVvpliIZcP4DWsJew8eQJYYc4E8m80LcFKUd41Qw/f0EqBwIanA2hWawBKOyFn9riyOKNhgtUxcCPNz52Cg+CTCFILscx8iQRmLaN0eaZsLuuTZ3Dv62/rtcmNztLOGED91LNM7o4CttNhj06jGsC8rEkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781816186; c=relaxed/simple;
	bh=75DEZDKM+ALc1JKRRaQRR+F+PqF88Y1mPJtKxLCM1oI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgYWwqWrvZFuMRK6OKZH3KOARJ3dsXLdpncnOedcm+SiAPGIaLiGFppIpMVJVqsK3rCEXLoGGO1T8yBseH08NJ5gQShCC+9ozFSOa1qTTKn/RkAg+FYgIprucwY9C1ARJj19YoYOJQtsn9tf09GVBvXY60Ynurs7jB6OTNqEd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRwn1aol; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRwn1aol"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11007745e9.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 13:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781816183; x=1782420983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em1OfFqQWif6gwJw3F8hEm8p7ircExMpUwYzNd5hs9w=;
        b=PRwn1aol6JHWPon1KRM9TB3m3740NnspAz4r07YyZFn0aw5ZDFPp6O+Rn0Kv0Xh+4Q
         eTpaexH8DdzsMhYsEqB8Q4AtfQMTjfYsDPwVA/mJdJPTAem1qzPP0AhI624UXEglxwMd
         B8qEsDm98Mewcnpi/p2pqSDYMMCKzUDxo7byEHFWNmKeXSdE+B9PO9jdmSgvZnrDUnIQ
         IpHsykNvMfc+BIOqoGfJZlear39QA3dRD/xW7Qtt3OZH87LwOW4qm9vRk5UE9/Ezg1C1
         ynWA1fnlVU87fkkjgc6B4O4t4dgoGOwB5YLRk15SDWmnO7RV6D1Y1oCa1B7UbFZgtw8I
         x33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781816183; x=1782420983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=em1OfFqQWif6gwJw3F8hEm8p7ircExMpUwYzNd5hs9w=;
        b=k/vsoO9RMt0HP3M3UA2e42htAQ5jLYz8/yVliAScQBvoS9cxuDbXKWuyAUk1OvH4vd
         Lo11a+giDI2nyg9EEH/cZ9KIvZUzkkFZTIfjKn3gKLFojMsCrsM+8nS7rdixTW7BcBB0
         G9YQM8wv9ATTS4VeYWlz9wir0RD+fbv9MhtSgC5wLAhSAMwbmfVYUCJzo825HaBvWtL3
         f6P1tj+WKgpFtju5BKosD5GbU0HwBKUAx0Unj9itwdGrJtefgcizQXeYWth+1eJbyVPd
         pAU/FcI0c/yVT5TXHBvmLdXOEBINFf2RvVbcpA1unzL0US9u7oPJd6Kmah7sI15h+Jdu
         xOAA==
X-Gm-Message-State: AOJu0Yx57P8OISiR4K3ize7+/gKCkSp4z8Kp6g10u1PldpU+jd/ONOP1
	R4TfrfnAoGiK21muvndmK5lUZTvIdYAp0Af19MgFbprwRqG7jcsh0RXc
X-Gm-Gg: AfdE7ckfude1H+ISA9JbRljpjSrNBNI1oi6qhCu6xwlWdFNhcYDvVjjL3Hkb3db0tl5
	mevEy8GwoWmLg1sdH1FlzzRqcc9P5Ku6E7IhwW8wK2N7l7Gt5IE4xrDbU/nfjqKLDQamNvfsJR1
	kXH2tvkseb1RImGb6DrPHO3xIV1djVrVrpgYOGdtC894dppZ7oG2LJO4PTN6WhabFeeLyneTLb8
	YuFeazFvEFjhOfzCcuPAcvvzLm9533ka0+bXwVJ9unJx6oiY2EP1i09Sn5N5aQ8iJ9XF5+Q8BAP
	IgfK3VBRlRrdT2WRMzJjS39m9un42qIch+uE/yKN60gV1HkfnjdtLEE911qmgLMtjTcopx3J4dN
	Suqq2U0UMC+MEziNpvR5xwRmxT8+XcjZ72qGn95MaVEChAVQYdfxKIEN1iq8HMhZA3fSL42G9or
	EFTEN12ZyLvGCgHnKugrRbEoDvIZhkKzfj3GrswI2vHsh8q5coLnPXIwyUBIjR6h+mdA==
X-Received: by 2002:a05:600c:a4e:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-4923f33d128mr22502325e9.11.1781816183442;
        Thu, 18 Jun 2026 13:56:23 -0700 (PDT)
Received: from fedora ([196.112.75.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc42a3asm1674015f8f.31.2026.06.18.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:56:23 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unused AMPDU burst mode values for other chips
Date: Thu, 18 Jun 2026 21:56:02 +0100
Message-ID: <20260618205603.452858-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618205603.452858-1-inasj268@gmail.com>
References: <20260618205603.452858-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove enum values from rt_ampdu_burst that correspond to chips not
supported by this driver:

  - RT_AMPDU_BURST_92D
  - RT_AMPDU_BURST_88E
  - RT_AMPDU_BURST_8812_4/8/12/15

These are leftovers from the original Realtek multi-chip codebase.
Only RT_AMPDU_BURST_NONE and RT_AMPDU_BURST_8723B are kept.

While here, remove the stale comment referencing 92C.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index ff4383e30322..4383f404c7da 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -37,13 +37,7 @@ enum rt_regulator_mode {
 
 enum rt_ampdu_burst {
 	RT_AMPDU_BURST_NONE	= 0,
-	RT_AMPDU_BURST_92D	= 1,
-	RT_AMPDU_BURST_88E	= 2,
-	RT_AMPDU_BURST_8812_4	= 3,
-	RT_AMPDU_BURST_8812_8	= 4,
-	RT_AMPDU_BURST_8812_12	= 5,
-	RT_AMPDU_BURST_8812_15	= 6,
-	RT_AMPDU_BURST_8723B	= 7,
+	RT_AMPDU_BURST_8723B	= 1,
 };
 
 #define CHANNEL_MAX_NUMBER		(14)	/*  14 is the max channel number */
@@ -363,7 +357,7 @@ struct hal_com_data {
 	u8 RegIQKFWOffload;
 	struct submit_ctx	iqk_sctx;
 
-	enum rt_ampdu_burst	AMPDUBurstMode; /* 92C maybe not use, but for compile successfully */
+	enum rt_ampdu_burst	AMPDUBurstMode;
 
 	u32 		sdio_himr;
 	u32 		sdio_hisr;
-- 
2.54.0

