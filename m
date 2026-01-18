Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30988279DB6
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737294; cv=none; b=mVrCn0TPIJv1hY1e+qO5910hQZ/+fRQXMe7/u3JwE/grw+J0ftWbME53He4NbsdithfRtCXV6PYGxd9LsFzL+nmlYmddXaBX9E9GhRMoUvCFxucxoMx9kxzjGlEM4YGqMZKhlqNYkC+syGbWy7ggmW2riJKrnum8a7HoT6p58JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737294; c=relaxed/simple;
	bh=IPcbqWAsVwNeIyEkZ0qKAVG59xeJgPPN3ii7a9al9iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeGXKW6MFvh2Y77o9Q72jxSnJ9pBVqAAxOh13eoG7v+d0ADyU6JHnRPsFOnpVtboXZ9WTI6SOtBk4GgkD9knkZjwH5MXS5DdnEMd+2giCePAS9ESxxlq0dHveNLkOu7dCGquvegVl1jYu0dvoM/Wrh/8WCmZUUpttJIZcVEEhkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZpPDbtJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZpPDbtJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso18540155e9.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 03:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768737291; x=1769342091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf/e15dH3kpD6z1TEY6+wiUq/BevuPDNRQw5o3gS2fc=;
        b=YZpPDbtJFnErss9dN80LJ2dbm58FN39kA5Vi0vwWUHzt4xPU3UezF+qhfVyjMQ852Q
         JrbzEYS+X9+RWbs09NRAAjDalYze4iB20fmPhuD6lcoGpxRCFu0KOd+9cUuZunntz2Uu
         4Lvn0h1dd9KQdePkU+ofiqfihdUBe+w/cfgcNbdQnQudLVtMNt/qu4M8wNGOutB7MHH2
         lwrhOvAHkGPEJjkNBCMusyxpkbP5DRuhAs8RvRh2p+NiQiuS5zOQtY+7ncMVbRT24ru6
         Q/Y6EJBH3tCreubh7UEl16Fmq4wPd5X3/GhYhegZc+wYj76/ZFRZG/h1jZdEZSCYAByF
         gkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737291; x=1769342091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mf/e15dH3kpD6z1TEY6+wiUq/BevuPDNRQw5o3gS2fc=;
        b=l30/4nemY7pdBqh/eAlbeWbvabF5AVRXxUCOeFRpmbBwc+YeNSZe0aH4ypQQYiM2gd
         t37RBICy455cIytD4lu+vo+0xZQJRDppaVAu8jpJtkJ0J+0IANKyKZ8II1/mYgbvPSXl
         ibL9BoivCA690AwXeveaupBVke0nSQfjRY7OX4eFixF3n4lIWaqY40dTCC0ZA7XYIkpM
         SFIHvA2B9xLBo2F/acKUKVv6IWX7p7TjFL/StUnYhC7QlkM7HhDoayb2Xh8PJD1D1u2F
         WBJ3hlS0Z2mvsEnuqwx4/IgyIBYniKBGrEBs759oAA8Nu4c5QbSVEMP+QFSwHi1kZNcH
         QpHg==
X-Gm-Message-State: AOJu0YzIEt4p31GZ9iA6isJzSr+2FvUQZePqA8rsOErVSJvVXqgiOqhB
	IC/c1LE1CmwZ65axJ4UUAX1Qj3AnCKwZsvw4oQA4xIFvYdzcbD53hoJe
X-Gm-Gg: AY/fxX7PAewhrOpAgLVWyn70NibxL74uOvtQMKj/2yIEaCEb0pbH8d1kNiPbYwPR6uE
	PiSXBa7GbUqZwGolCj6C9sT5WOUSxiizSpS8c6uRsO3u14Sw0fKnXS4oTzxQGy0Hy/W2+exECki
	GpeebIvi2nP04B/qU2OB4/nVxcrWFbLpL/rpgmScWD1SAjroV7RGJD6tZjD/4uHkKTvvafYVi22
	pyvFixNbVw2GSAffAZ1enwJDnW4cWO11xOClibAZoqPOrLwlqY/iaO1FSQyLyvXqXx3FTtZSSBJ
	CV9f+j3go/mttpqsxBFm5KcDtweO+rqeb1nba/cuXtLSstf7U02vwS3G56k/GTjdZm3Ul15MWWS
	E3jr5HWtXlqDWCH8rLgpi+QT8pwJ0PLkiZINpgQzkklN1MhsPSoUh7Q45lOwvubXxQrTM+Yr44o
	huc3pVHV0s03vTa6nYMkZnsslb4/aNUidYx6ZNOGI=
X-Received: by 2002:a05:600c:4ec7:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4801e30a126mr86760345e9.5.1768737291385;
        Sun, 18 Jan 2026 03:54:51 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm16368686f8f.27.2026.01.18.03.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:54:51 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: fix open parenthesis alignment
Date: Sun, 18 Jan 2026 16:54:42 +0500
Message-ID: <f3d8af5fa82c3675ed759685a1ec6b1e2481576b.1768736361.git.mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
References: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl check regarding:
- Lines should not end with a '('

Collapse the multi-line function signature of CheckPositive() into a
single line to adhere to kernel coding standards.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 4 +---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index 5fcb9420fb3d..ab5af96c335f 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -8,9 +8,7 @@
 #include <linux/kernel.h>
 #include "odm_precomp.h"
 
-static bool CheckPositive(
-	struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2
-)
+static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
 		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index 9c07df254eaa..ac5e3d52b3bc 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -8,9 +8,7 @@
 #include <linux/kernel.h>
 #include "odm_precomp.h"
 
-static bool CheckPositive(
-	struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2
-)
+static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
 		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
-- 
2.47.3

