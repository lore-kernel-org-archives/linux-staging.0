Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1EC2D46B6
	for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 19:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766516408; cv=none; b=URRzNBH8CoR3M1AROX7+tRSKfZ63UzT1hLvfa5yvvcjTPnFvpdp9BZrdyebF+ooaj+m20qebS8k3HbGIoAL/ZNf2x0Fi8HeuQII/QXB9L8Gd8hnE5zoxCGVLEcABaMe2hL4LiO02C0so+VhqfBx2FPfj83rDKR0Qu33iYQU0NP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766516408; c=relaxed/simple;
	bh=0Y88mplztIxM7HXKshrFYXfqzTchd2WEF2D5dxep1s8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=STZiRu5XWuQRuUacaSI5fmuS3T9/k03KEsRSMHsVL9WGV5ljMlkM4+FGxGbNPzmEH7Rrcim5XB8UcCNSZdVAlRl+/3AvGT2Wtvqj+10p+AyP0t2EiKC35J/ybDhJrFWCUJeNgAQWZDe+J5RETMyxrdZTYO8UmaIBRyo3Ou5UHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f93o3MdS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f93o3MdS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f30233d8aso64725695ad.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 11:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766516403; x=1767121203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jBtO4dndspPVV4A9wtVY7GwksvV1hpeoiNFJc4zK5Q=;
        b=f93o3MdSnCnsvUcB0ELTUxGK6RYKRDodtrP+Ke8FngwjCnMiVVjPVnZC6NdNOau01l
         SFXHkkuvY67qGfHu4T8aMHOpXeM5pGbgYFojSQfErC7Bf1wW1T04zgvvrUEd1WV3EgOG
         RzeDW2WRo8jPc4+KrOx9lT0jthdKvxIrR9UYKk7dB0bwB28L/QBQxgoBbVqvXWRGP0NW
         EVgjZkpgBdvPWt1r3DSEIpvNfnHVFOjRj8UWaBlCR/BCAOE0lDm3DJb/Gd62rmUNXXA4
         QZUtF82QeGMnNxQTTUtBjWHypwmFY/+8T0Qyua4ybrpG+gJCbVvmV0FlfZNrf96nkwEo
         TMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766516403; x=1767121203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jBtO4dndspPVV4A9wtVY7GwksvV1hpeoiNFJc4zK5Q=;
        b=GfK28qgZfeh8VVPCUP9sqzRHuv0BwlRdR9spji1yhxlouDYTvvDgLyzcF9XhzJvnpu
         DpBlXbHv+i8qfD2V7nSs6zt7ra9TDkE1MAneGyIKb2czkUID7xF52EF1AGqI15AusC6n
         wQeQFyT623yg+krFuBeIT8eXdbyynSVR5fP195E3XDz8jaeosHtFrxhVOzJ/ILMuQv5Y
         rZ9RVcczLKwTP7HjGU8qoMBERCWnxXDxTowCrvL0G+JfyTe2too+JDPLGI+p6MiP11zt
         FoV4+wxvTtZYAw+1I5/CAlUhvdVFV1955Bn+IBPGfxswOeHXNFlOTXZTzzF6ESP/YKgz
         /BJA==
X-Forwarded-Encrypted: i=1; AJvYcCXXlQ7Yrhys6o/kqy81RfzKPLgsd1Jr6LdoH5QY7qaXHGAfh0dGmajUqUKOAY98UxWwRc3db6JQ7OBJ6k+s@lists.linux.dev
X-Gm-Message-State: AOJu0YzXfc3KYNeiAfbGLgLsHFMRUjw/xFW8HVDoRYrj77VIK0jg/Gqx
	DvEwR/Q6YcGrYo0nJMsT2jiWky5CFEAs14cE7GibUFVUWnyM/JITiy/u
X-Gm-Gg: AY/fxX4+fKbJeHiJIX0y01xtVNInZE4RS3H2E7g5ruv7RINlNQs6Z1OC7AtjM3KFj3P
	INzfDj8cpMZkuBInUnTQV6M9hEZc6Dy7V/0cvuCnF0A/xiPdRKSGLj/1rJJmbyz5UYoj8GUUNl2
	EzLSgj9nd9ojmBjyRelvJx1eH/DhCCExo7GUWr5wrugoKFMmpilzLlJCBmmsosY6Mx2S5deIDj1
	nPsA+I1FAqhdDbuElj/DlsEYQyaAgjOd0JbK+X2Nd7slX4lrbv2+ldjIexv2ZBynMJve3fyVj8Z
	PstI6dyr5oGVsyG0lJHblw+XyDpCrEgE7lgmvlmxEO7UvAhEEmy/d/o/scbkjpcxE02BeioGTRj
	n73J1gYekBgL9NhTxJVetqhN78xB9R50Y7kGBKi786TTXALbrk6/gFyIIE1PxJlLE72nGq64btg
	gIw4xrLjnUYdLRAQ+L/L7cH//FnzL6kgjfcjfaCiWfX8v7ATpFUQz32RY=
X-Google-Smtp-Source: AGHT+IE7jfEB8WE9Di5kUUN3m+9BJnxw1dEA/zZLfCeFxaE4nVXyo/8F8TLSXBu/nrwFR+4JHbVQ/w==
X-Received: by 2002:a17:903:248:b0:2a2:f465:1271 with SMTP id d9443c01a7336-2a2f46512famr118389975ad.44.1766516403432;
        Tue, 23 Dec 2025 11:00:03 -0800 (PST)
Received: from localhost.localdomain ([2409:40c2:1052:c28c:d56c:4c53:fd22:65f7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm135320905ad.65.2025.12.23.11.00.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Dec 2025 11:00:03 -0800 (PST)
From: Tejas Chaudhari <tejaschaudhari038@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	Tejas Chaudhari <tejaschaudhari038@gmail.com>
Subject: [PATCH] staging: sm750fb: improve clarity in TODO file
Date: Wed, 24 Dec 2025 00:29:50 +0530
Message-Id: <20251223185950.12328-1-tejaschaudhari038@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve wording and consistency in the sm750fb TODO file
by clarifying references to checkpatch.pl and improving
sentence readability.

No functional changes.

Signed-off-by: Tejas Chaudhari <tejaschaudhari038@gmail.com>
---
 drivers/staging/sm750fb/TODO | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/TODO b/drivers/staging/sm750fb/TODO
index 7ce632d04..56ffd9b36 100644
--- a/drivers/staging/sm750fb/TODO
+++ b/drivers/staging/sm750fb/TODO
@@ -1,8 +1,8 @@
 TODO:
-- lots of checkpatch cleanup
+- lots of checkpatch.pl cleanup
 - use kernel coding style
 - refine the code and remove unused code
-- Implement hardware acceleration for imageblit if image->depth > 1
+- Implement hardware acceleration for imageblit when image->depth > 1
 - must be ported to the atomic kms framework in the drm subsystem (which will
   give you a basic fbdev driver for free)
 
-- 
2.39.5 (Apple Git-154)

