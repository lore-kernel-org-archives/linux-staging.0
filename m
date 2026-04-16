Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F709361DB1
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776369238; cv=none; b=qoTNfvF4lKKgvH1soIa3+hZ3P4DOg3YeVDoHczC16/pPN0XZc0+UOsrFRlxMlBw80AF0P+uljZGY11nxGen6O16MSPatZaSYm42RMuLb5uHeMQLMtBUL8leS5x9Hxf9k5jhDrFPOfOwhKDyFNkGK3Q54ZuVkEJkUqwRpvRubP1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776369238; c=relaxed/simple;
	bh=6Jrg7ZEu3ts+xEI6yiDMGIHHp/99b5C546RiAMKQIos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrGuStgXlToqrjskCAZOkvxaGNJJcyI2oC8aXAg4g0CRLKE3vHaXQzbx2p4ISY8JexAyODL01t0s3hMxSP4kDUyVRqaBb5vrxX+Dv6iKORG/3AE6u7xG9VQJaPpRqI6yP0CjFRGtD2E9m8xhNLSDU9ovl6A0HongTU41e29lbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kN54msQl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kN54msQl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so81934495e9.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 12:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776369229; x=1776974029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg+S9q/R/3SeDF5gi73CV8qTEzLqBwSJAMbj9sVqfDw=;
        b=kN54msQlJqiGgu3tTqZyjw6p0yXZnPyF0+6ozGOBVhB9GzKYmMnH2lj1fJAk/RHgBF
         +/tAR4erG5qyVhuqCYvroc7sOvGMW22UIMRoXMBMFnf/dNjlIK7YNysZBhr2NrBUjFCO
         NgIk9XzgPDaMdo8R/5H8iCfS06Gu/wDKgovlKWSJQo1BEEp3Wh78lXWIGOocbqGyC6kU
         wEe+wp944uLdY6+7iDtnvkPfZNKO/kfudpWZiEmXzYIJrTWBUkqdC76l5nyYFD8md/Ri
         BQp+fJQ9y0HFvZ/JVlYADnDL3trMkyf8sD7W2xb36jKp3KZOQVwAgNY1o9ZwpmrtjK2L
         IC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776369229; x=1776974029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rg+S9q/R/3SeDF5gi73CV8qTEzLqBwSJAMbj9sVqfDw=;
        b=Mlu2SP6sMHrEletp3n9ETyDL5dHFPw4qnb4by6MZjMt+uRJzUxGri6KqnbLU6UViEJ
         6vJzEtwCyqW3u5l2HhlDhBuDZlZ4Lm2iaAEUyLwLCqOuGQNFLYveD9Eha1AyP9b4IeL6
         ASW2BDE9/qeHiQzKCq8QjnB54wP9rfhOg781/IO7fVHtLZ2FedsS6AknEqC/GfH0l/JS
         PIjFmLT0OnMYKyj8Oz3G4EgqwMjFlr0Dau+88JWjpYJxvPcNM3xBSmu3I/pMzn3LZF6a
         epQ2gjMvAHwWm0LjEI2ESryrGPbxvgy3vA2H0LlGCAN9YIjATBasBUTZQ5+Y0SwcNmea
         Z82Q==
X-Gm-Message-State: AOJu0YwQbfAnI/OqaUXFR3jh0D+Q5ezsmabIHB2mFfROtmKx1Kbm6x9L
	iUmULYRRdRo+uEXhEx+G9fcYfC7ou0+ct9KvOmC/pSHHvizxTEtwBaO9
X-Gm-Gg: AeBDiev/q2thc7QUD/gBSNDj1R5arj2ImoZ4c+VOk3mGQyHbyLvaKX36b7Qw3V4P+y8
	EiOzBw52wN3toubJVb3kFxT8zpztpEtW89MT9jwkvLMgnp41zK03Cqa3BS/ELq2JM9T9AYIII75
	Ivk8mCX9QFKfcyGNcPQTRO8lxYcCkUT4aDTZr5knCdfH74tLGVodPXceinPNt8yeWemohopzIYB
	rc7Yp7W7SR86/GuwIuIqSF8L2GHZe6TVBCf3xtIi7frTJZzjGcipimmRZvV/ImH94fVuJnb10gV
	P2lxTI9BsXaEAr9i+s61l6bwD70P06ipTwSmJH8z5dGnt+iU9oAHYVBBnxCQKXLN44foQ8TLFrz
	FkIIJqGLJ76oYccgIRi1So0qNeTtB2SNvDlO/8Q474qKYoX03glkrdGxqrs5eMDo1O6IwlrK1um
	0cZsGGcTrATp+0XMNVeYbK/t1LxJpI
X-Received: by 2002:a05:600c:c09c:b0:485:3423:727d with SMTP id 5b1f17b1804b1-488fb78c1efmr80745e9.26.1776369229270;
        Thu, 16 Apr 2026 12:53:49 -0700 (PDT)
Received: from moxi ([178.134.243.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5818e51sm125156685e9.5.2026.04.16.12.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:53:48 -0700 (PDT)
From: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
To: gregkh@linuxfoundation.org,
	ethantidmore06@gmail.com,
	starpt.official@gmail.com,
	straube.linux@gmail.com,
	sameekshasankpal@gmail.com,
	arthur.stupa@gmail.com,
	luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: fix stainfo check in rtw_aes_decrypt
Date: Thu, 16 Apr 2026 23:53:37 +0400
Message-ID: <20260416195338.324428-1-mpikhotskyi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260415184727.285753-1-mpikhotskyi@gmail.com>
References: <20260415184727.285753-1-mpikhotskyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
Invert the guard, so it returns _FAIL on invalid pointer.

Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo check")
Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff2910..f467cb5b1dca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1212,7 +1212,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt != _AES_)
 		return _SUCCESS;
 	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-	if (stainfo)
+	if (!stainfo)
 		return _FAIL;
 	if (is_multicast_ether_addr(prxattrib->ra)) {
 		static unsigned long start;
-- 
2.51.0

