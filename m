Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38944C62E
	for <linux-staging@lists.linux.dev>; Thu, 19 Dec 2024 02:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734575955; cv=none; b=An2ctBgnhmjiGfZVKKwcViEd8s37e2wDqs15Z+l3Jzwa/POSKaKmsnudxJ6nLDS8howk4Z/M3TGdGC8B0G0FAPApZsSPUbfpQg/bkRumR61t1/Rw3NEgg1ljA7tYVa0UqIzfBuUS+pLRp4H8CgTYf7s5V4UF9/ZKJMYHm7HEBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734575955; c=relaxed/simple;
	bh=jIM9fOqcR7haxlGnqj9DETKtQ1U544iCkTxQZetDk7I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QG3F/C2LqeRb+sEcaOv8Md6u3+xGdVMUzxUNPpFiXRhPwiVdK2jlPSmfTUpMRit/NaibNv6ZBIOH3Xm1UMbxfyD8YklaLBpLH6jv/gzpQi8lTqb6GUm3iTXVIdfypghewFcwlEAUpdV+fCklHLigVq4vbdJMm6swz8ARstvYsi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK81fHT/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK81fHT/"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so263907b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Dec 2024 18:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734575953; x=1735180753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+v/vdte2Kq8gnROS9NJV8yM8eVS77LonN5sAlNjLdM=;
        b=bK81fHT/6Zztuluz78p3M0iZKthFw6V1w016gap/1P8c/SnVJ4q2hTQ081g0BYr+UB
         ONadqHfbr9mN28pxuOQhufsHqCk3+AQDEhzeatzbhq18BaXs9jxnH0PM2KZlVKxSs98C
         FdvBFd9s605nPwaEHkLF3eO7nte3qm19uwiS3Rh0gzV1lYsaeeIsBrqkD6wPZs8C7+Nh
         wr9W1I5ZeSv5zgoba2SwRZkc6YExFTRyCmEJqYWqSTFmSPE89QzDh0atAYC/dhK2qTwS
         HSdhVI7//DS76PgJuaZhqPdNJb9aGM60dV2D52SZN9+z/ByoaCv/Hughh/lerpgZggbD
         orKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734575953; x=1735180753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+v/vdte2Kq8gnROS9NJV8yM8eVS77LonN5sAlNjLdM=;
        b=KtxD4DZivdZEqXKeSUUY2bi6mGLg3cCnonBEX0Gi/iZfqEMn8R6uCeU3tYtPRAb1R7
         sFR9/1IWruKzghUbfBhvwt8KDkuhGziujcIuzodK/ocZwQ9+qYww9q8RwEjknJM3g0c+
         H2LSeax4xE8eWzomjGMjQfwGUhjopD1TFDsOTVYhul7Hzm6YTGNHRg4TbMkXVXKKZupO
         eCfl9LsGgYTrILqqPK9eORfRI5hSGw9xeNs2Z/w1W3hFGpoBS0FrBYM6AXeNHhIX7+D/
         pv+FqzfVuWfvNZ3aS18q41stGvEuO5hEnd5POP/XQN0s6rNFL2HUvxWSQyg9n/F5j5rV
         gE9A==
X-Gm-Message-State: AOJu0Yx/pc8WXzjaNh9DbBgKUpCBrTEAFjebQbymnBSscONekafG9qQ0
	R+OfEh6gPnUZCZo38xKqmhH6ExY0BexBeDbvRb1fB+FmCQsTLxuP
X-Gm-Gg: ASbGnctRrasOEWXQASYgAtzaLmtbq1F53Mq87TPeQ63VeJnuh5HljnjfXmT0tRU2W8D
	gpSaxTPJxXbRFW+uJPVrfMpx21qbdeo9WVs8pU2EFUz+/6rQmT1k2OMIAyJmpFS0otUGYS6dS3y
	10RsI8O3hx8YaEWsX8a7dkpxvDQ7A+icu3b23gtRB5m8vfjvnrX0+6ivtSHui73t35bA2xzArZ6
	Acp21d9ko/W5WnSSl2o8qwqrwF0sz2SetcMR1bTLJ/eJftxN5+wsiTuTLo=
X-Google-Smtp-Source: AGHT+IFqwRX1Od8kvYG4oww2GHUgR56fcYOkw035wU9tG5QLyNseuazB2liPSfoLUWFlBfXhzig8Cg==
X-Received: by 2002:a05:6a00:2906:b0:725:df1a:285 with SMTP id d2e1a72fcca58-72a8d26174fmr7418652b3a.12.1734575952915;
        Wed, 18 Dec 2024 18:39:12 -0800 (PST)
Received: from localhost ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm178622b3a.97.2024.12.18.18.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 18:39:12 -0800 (PST)
From: Sandeep Salwan <salwansandeep5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sandeep Salwan <salwansandeep5@gmail.com>
Subject: [PATCH] staging: fbtft: Remove unnecessary parentheses in fbtft-core.c
Date: Wed, 18 Dec 2024 18:37:41 -0800
Message-Id: <20241219023741.11100-1-salwansandeep5@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4cfa494243b9..b4e9d6000b9a 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -664,7 +664,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		txbuflen = 0;
 
 #ifdef __LITTLE_ENDIAN
-	if ((!txbuflen) && (bpp > 8))
+	if (!txbuflen && bpp > 8)
 		txbuflen = PAGE_SIZE; /* need buffer for byteswapping */
 #endif
 
-- 
2.39.5 (Apple Git-154)

