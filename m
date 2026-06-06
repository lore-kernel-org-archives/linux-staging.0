Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C32E7370
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780763622; cv=none; b=HWAaiG1FdNPUjlAja6+9t821GGOudoydRZoiEVQAcdnRYgwQoGGL1kVG0iZQi2RQBr7iJ1aWO31CVuSw9xyUFs28grmf4dHe6qAqOsawdrldv4l3oU/2UgWW/xDYQ74h3xPtHqltzYwPebnB3abmiwS/TmtH2nXFIRE0N6E2QBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780763622; c=relaxed/simple;
	bh=L/6EeJzT0yZejJQv1SAkq5CYZ/DziCx1C9T1zd4yj8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0MjiZ7Cc9Lc3RB1+p8KZepZomWzhnBqj5v4Q8UZUK+430x4WL1p+NKGKSRCgs0fnH2aDGmuXEP7wvteR6qyRWgT7iX5JKiShX6QXEzirIPHylP0SrgccoD+UiVKTCFJddy1k5QRzeOMe3rxFwoHhh6OPmUcHiA6pB/R8sg+nY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VghQaKad; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VghQaKad"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so26311405e9.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780763619; x=1781368419; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ranq11fW3A4HrYhFSmIyxe4gm9OCXuYwliEffhozihg=;
        b=VghQaKadK11K53khCxZBo+vfOf6SFy8JDwEh6hzo0EC6+XhQmxCdyC573V3qbnePSL
         yOsWfJMx30ShPxAIAVCQm4UdO3dkb92r1ctDHR2K5DwR4R6pmuaGO8LP8pMyY1H6DZpC
         pojuJyg7y6G8LqILEJITW1TjF3vXqd+6aRwW/0jJNIPo35yWG4GrBBAJ0wOI4vnp9IZV
         9Ajh5n6z2XRMHHtBRD54b9oOYehm4WxG/yX7HraVS06wHgeFyRB4kQ1SETNgmZespCpC
         nxKfaYVJhx8DChkFYOxpLWyyyHM9mXVYy7DIqDDrRIaPcjPBHqnBpl1ZAbUBFWOjjQO8
         G7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780763619; x=1781368419;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ranq11fW3A4HrYhFSmIyxe4gm9OCXuYwliEffhozihg=;
        b=d9cNqkYmRmzhFG72qiYB1qhcC1mpke3OkDGbDTF+qbV9iOSW/VhWEpzLMyL3M8ncEL
         zThaGSP+FVD2mdL+KFLKiQ4h4VLFoMvi3NIScS18SdV6jizlHddNTu1Ro6QrgGRrydd7
         eMOuuWBJYANXTolCaMF0OtNt6yS6ab+ZunuZLWDgRN95taaUHQErW9wjpeatPvLIiXjG
         fkHDs8cqXKaT7CYObmsYuFpwA3Ik7KVC50/tMll7Tq9Bv498Wt5QFcXmAwq3/2R/vuRA
         OvBRy5jYIvlYXBik5wmYfaXy0FZsqyGBV36kAnkkC8tCK/FI85XLZXtDHFYOEwjXiMni
         c4Xg==
X-Gm-Message-State: AOJu0Yy6LjinGEPG2uXZQlimrZLmmUxctWkICmU1AzwJ5xAIVCTfWxje
	ULfvyUf4hzbFsUdj/XVA+X/ROum+MLWNRKCQ1mC1xjc7IR4SnT1xRQII
X-Gm-Gg: Acq92OGk+eM5w1/XUI6ZWRUY1AmggRYZG7Ugr6sAmTfjGSUhOBaAiMSzDEvL7ZVIOCb
	Py7QrwSwxAOyQVXeQPPknIbG+p2qjaYCgTUmvBByXy2N8A9gsbaS+icy5m7R9SvXQJoWKsNJV5o
	+pw77jJxy+gZiAtN6jUYYpVPeL+BzENmWpH0lzrW3d1ZT4YdEoMG7TEy6uGJGi0/Xqlt5UpbDKy
	1F/9FfPo77fHvVJhaiwj1gqqgQelu+W7slee5Hzr83oaGyQR8BrspkzF4aZHpRb7Mc8ADRow90/
	5P8wwm2UrHq7KaRT9DPs09U9FxJemSzzTBxWf+fcsWZ0bXMUFHWDsE3yM++vh/Kq6wNY3uEnu5t
	2AZP5Y6OdobZ73hRLgpAuXoWvPh+/v4ujoQmeQhDRdQ59geq0MVdR6IRl4cmwFikgrhrURDS4bG
	+3/9Tu+BaYhUtLBDiAVNFgfH63fawxkuPKtL9A
X-Received: by 2002:a05:600c:3588:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490c2cf5433mr126533295e9.11.1780763618837;
        Sat, 06 Jun 2026 09:33:38 -0700 (PDT)
Received: from frassi ([151.95.31.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2c9ea37sm238103485e9.0.2026.06.06.09.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 09:33:38 -0700 (PDT)
Date: Sat, 6 Jun 2026 18:33:37 +0200
From: Andrea Frasson <andreafrasson1995@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723: remove multiple blank lines in
 rtw_security.c
Message-ID: <aiRL4dekV140SPGw@frassi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary multiple blank lines.

Fix 5 checkpatch.pl checks in rtw_security.c of the type:
- CHECK: Please don't use multiple blank lines

Signed-off-by: Andrea Frasson <andreafrasson1995@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 0cfd7734c174..da61a552bdb3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -409,7 +409,6 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 	rc4key[2] = Lo8(iv16);
 	rc4key[3] = Lo8((PPK[5] ^ TK16(0)) >> 1);
 
-
 	/* Copy 96 bits of PPK[0..5] to RC4KEY[4..15]  (little-endian)       */
 	for (i = 0; i < 6; i++) {
 		rc4key[4 + 2 * i] = Lo8(PPK[i]);
@@ -417,7 +416,6 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 	}
 }
 
-
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 {																	/*  exclude ICV */
@@ -491,7 +489,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 {																	/*  exclude ICV */
@@ -593,11 +590,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	return res;
 }
 
-
 /* 3			=====AES related ===== */
 
-
-
 #define MAX_MSG_SIZE	2048
 
 /****************************************/
-- 
2.48.1

