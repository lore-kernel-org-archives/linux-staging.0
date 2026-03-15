Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D023EAAB
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773604105; cv=none; b=O8ddBds8yvKANXXlLACRoSPLxkaDl08XUxlFFHl+gwbgwKRapAhJmuS/jqalMf2/qwHphu3t+Y4Xk+EmNsgUINY4867OG0I52E6wxJA7eBTaIkczYnA78VRQUWVhFM6MvKLJ3EDC9d4IVYZAbb3PXObR9cjBYiJDkwrmPgYQwJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773604105; c=relaxed/simple;
	bh=gHDJ36QPykvS3xO3QZ/KLGfToUNHfLkIMyX0bCEKbA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nPQE6snpFYLVfVzv86K3GQHPGOzYAoVaYzhgBom70i9+I9T1Ic2Gr+yJfwgYieHkpNYopEB4OWMVxIG1LPUOiQL9pCMKztAWQHF20WBTHZFEt2/qr4ELPyRpedLoNJ9BX2Kxe8P/vLxbUSAvqdCDHR6fNxHtxtIzIIKawpV4jqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a++QM3Ei; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a++QM3Ei"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so35145635e9.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 12:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773604102; x=1774208902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDa+1bVuIqzJ9zEFM2cwV5Ez23sgmv4PTl6ruXCXLoc=;
        b=a++QM3EiY+5G+n9xt4QUwduaIsDbze3+HlMYWSYU+5NVuJwDWcZYuCRVxN9NEek450
         rHZEpVcPj+BXPoqcYDjNAW9x6NWHElbcHUAuVFC5phS2rT1nk3ISdp0jUBfWIq0PIskm
         1TUj8w6eEqXZpylDYP6TmmLqBqy8PcDkAgtt3Jhvy0UVivIaHhptMZfstFjiFBeLVHZ5
         bSFNSGdcNTKQPdZmZ2RqL7/r9sBhC1kedQqelWe7XqDu6i8MQTH0JzA1/L5NU76B2jHC
         0nPnLnEduJPVgzFt5B7CHythg+QkvAkhUgmydiQrHm2skR+iKycBQMr29ik6K0qfuP5x
         SVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773604102; x=1774208902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDa+1bVuIqzJ9zEFM2cwV5Ez23sgmv4PTl6ruXCXLoc=;
        b=OC+JztTZpMDtFGIKFXuokXiwlNo59+g7FLTU770xNPlWVmITThOXcIqmvjlWTTHfq+
         BVM4VudOpCAW4RMLja2y0PkP6CWiMJ+KX81Frvmveh85CB2CWemBjqq0gr8Ufa+Xsha9
         PRmN91UDAmT4o9lBg5Evry8HXch1clE+Jo8GCdUSvL9qT1FY8rYEhizzKp2ehN95j8P4
         4apBJ7X21KV9gXFvE4NfloA3eUi2mkOeNVX6nLP77d6qMB7fGf42UxbG3WnItkchSV4w
         nuMPG6yWNG3HedBQKy91Gp/ifsqWHav1sFyQwsikYs8RzvnPLAfVv7wtfOIQQXtVsLSx
         MsDw==
X-Forwarded-Encrypted: i=1; AJvYcCU3oTd2QzzNuov/IEtUwEd2N1hj7NSQl9fTPjisHTGhag6gzzyAZnftQs/EOTPYSeALRQBz8dKwL7z4GTch@lists.linux.dev
X-Gm-Message-State: AOJu0YyEDwd089bRw49bYhDrqtHMKePAvLHKRpDwGMcZry9LroJPKm+A
	TOeKFXHMBMBGj0giyKi6BtqDBebNYhkUMLFDZfpetm7wEzzfMeOTyHmG
X-Gm-Gg: ATEYQzzewTEvM2cGGCqgGWH6nD9cskgBSxcgeKKD8tDSVdanmR4nIZJmbKK+9+S86oX
	QQY0bVQeSaPidps1wOMwBUuXu0qg0w/RF4cVlzirpwNVrfklujrEVrO7FSYeqOOBfLrgl5U4OnT
	lp7L3wAYb3MfUqOGirLtjT0ZDaZ28ZlLT53ajkI0D4Mqfh9XbLhxlN2Rle29j6vo2dgDjTreCes
	0W3iVVnCmxHwlDF3gFE8Og0aBQqDdwASwn4g0ZEHk7ubU84nwaVD49pHJaAzZktb107anHPjjms
	G2LthYnNdQE/U7BWIbWlO4Xc+YgBpebbPldUl1RiQ8APj0GHbuEwQiDKg34z+X0HFFiP1mRmvrf
	gGB43nW1hKrAgomuIJimNAiCBYdUTeHThCJZN0GtsiYGXo37y2CeH5vWNAABnnhzHmF9E1dr8O1
	MRQAgYP+5PwQO89IZzN87RqQgitDRCP7Q387vkVKbboEADHgJWsjX1Nc0=
X-Received: by 2002:a05:600c:8486:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48556700ca5mr172516905e9.22.1773604102306;
        Sun, 15 Mar 2026 12:48:22 -0700 (PDT)
Received: from OaroraEtimis.tail60902c.ts.net ([2408:8956:4c20:952e:71d2:7185:4299:35a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm210510095e9.7.2026.03.15.12.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 12:48:21 -0700 (PDT)
From: Oarora Etimis <oaroraetimis@gmail.com>
X-Google-Original-From: Oarora Etimis <OaroraEtimis@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minu Jin <s9430939@naver.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oarora Etimis <OaroraEtimis@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Use kmemdup() to replace kzalloc() followed by memcpy()
Date: Mon, 16 Mar 2026 03:47:38 +0800
Message-ID: <20260315194738.154324-1-OaroraEtimis@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kzalloc() function allocates memory and zero-initializes it.
However, in rtw_cfg80211_set_wpa_ie(), the allocated buffer is
immediately overwritten by memcpy(). This makes the zero-initialization
completely unnecessary, wasting CPU cycles.

Use kmemdup() to simplify the code, eliminate the redundant memcpy(),
and remove the unnecessary zeroing overhead.

Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22bf3..2f7fa5841578 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,16 +1430,14 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
-		ret =  -ENOMEM;
+		ret = -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
-
 	if (ielen < RSN_HEADER_LEN) {
-		ret  = -1;
+		ret = -1;
 		goto exit;
 	}
 
-- 
2.47.3

