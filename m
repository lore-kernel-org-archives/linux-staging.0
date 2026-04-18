Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B225D527
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776532776; cv=none; b=l61+emmPJWRTGZOyvLgsn8Zv3rms+weJ+Y8F5QVjlwoWYaKVfq20J8hRpFibFzvdSa0vyouaGKw4a2+2V9Lj2fzK9BIwm5Sfp1Yz75EgPqwGhY2AmVrsNdTCgUCQP28bIornDtfRiYWdDGlosYQwpNO5adobl1Fddq1Av2JPa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776532776; c=relaxed/simple;
	bh=RgPHKZTg4KZC88S+eBgzYTrVB/GC6TMeYX8i3b7kYT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVEXcYTnoDQnkn6AJ5arXz6PHBzc7NLLahrp7PAwZqnCyne6CiTaHOVqRTTMiKNGf/FVgG1C3G//XpTIuENVewAV/LyeJXRHWboxsVEC4jWOzV0d9/KLs3F7IaYqAK6BCbd1Htm3TUqJs2Mwoe2lnO9EpnT+QmvmrUtARhQKP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaHrMUtd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaHrMUtd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82fa01e86e2so334758b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776532775; x=1777137575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I5+UOTJw9yH6kNSvP8/5Jc8KiCmj6gLT6Ey/DudICas=;
        b=HaHrMUtdFrW9VvyBt8nIg8lDFHvgvB7Wgx6e7yC29b1FoNB86cpE+tFdBMCqr/lCzn
         snxOUUsc1JHH9pbbO+Uak8W/zO8TXBXCKmCLkAYFdluoQCs3BLnBKTU+WiY8kF7o+7Be
         XstItsoKk68zdcNOXQcdOhsaHsbMOGCWg3jAuqJjFoClydOU98X95hW3CqRr4MegEQ3X
         II1s/tNTrGim4pC5Jx0biWurWxTLTJqonGCGvYmxofnzOwaMQFd4JnJ7y478JH4xiIxQ
         J/yhQmHKfDQs/SoSp7XRYGd01h+tq1dMNAEdlBUWbGl6DSrVsJfoFgmfmBYTy/lLhMNw
         cPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776532775; x=1777137575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5+UOTJw9yH6kNSvP8/5Jc8KiCmj6gLT6Ey/DudICas=;
        b=ZQXvP4D3bXYL030N8GZ4sSqZTWY6YhDZNVln1SN5ZZG/ygOYUMiALOARcp9exWA2CP
         0HvRtyeaXD0o87X0AU4OszrC+Vfx8gB2VxdPVKO2Cr2IMNuFBByceFaDotabBHNN08nO
         LN0DXW5YTcEfiIBrcSDJJYCL2Yn9dlM5GX5RpYOU+pRwxwc8qP9eUK++MIXfytMurUTI
         8FfL8WETPGUWPdHgUsdegkpRn8Ymb/03tjy67eTJF/EmkFl/5xdI6KNENshqjhKXCyrN
         px6ALJreUAPdwxkOTvfpZXi7qeXU0nwy1dW5nx7lmri7zybhTVz1J+JByI5nED/StwUB
         rWjw==
X-Forwarded-Encrypted: i=1; AFNElJ8upFd7Vu0ZSccIYcwRwTVka8lDHjVj9L0LN4VmIyghqMuwVXq4UkmIfp27iwBfArhOPm0RKW3QXKCUqsey@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb5WF4HGO3SQD6Lo+kBmJdsYGFN81jto5/ArohQHkRTXKK5O/b
	LNdNvwYh0FX7hr8MH53ZwViuDJ6qcPRWyuEMYiSo+rzgCgwtAYqQem1n
X-Gm-Gg: AeBDievGj/lQeh75sU9Yte6GkusI/WXBlhOALBek0RAC/T9vMyTBx6jfM+qcJLXnuIG
	RMsaRlCli0wuk0eAABu9Q6v/kTv11fXD+DAnGZs8LXlM0nFJEzw0KxWZjbgCqIaSIc7jNNBrPP5
	6RskmmQa+AfT5zMUSNML2AxgcckisMtxnauZ+oZ0LWX4ZyaheO1wNJrbPOopshRWQddR3Ig/YgB
	COUMYkR9sI6SrBH+8OGOgmW1EY+ll5iZuj1rcSQfZpdHUswNpTi+L2LSe/yJgYODSmMk/4Jcahd
	Ot0icLHeeHmOTAsbNhfA+J322WxCIi9mZ9Va9PkO3ABO056p0VpgpHHQPXiEOAgO2DJysLaLctT
	mZGvQpBAulqgcTd21Nzrx+tKjDqWDzaJK3qqFQtG4lXQavuEbhBojksDM0RBRZZm5wzuADChFNI
	lDxMlBFRCZg4zJxNTygB9nDrtLH07ApiHvEi90cAmKnAU452SJHeHSCjZlqy/8CUwd77nQMe2b6
	2cDvYntuWhPdlyXF6yU23TXunyKFRY7kw==
X-Received: by 2002:a05:6a00:3498:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-82f8c81273emr7664820b3a.11.1776532774888;
        Sat, 18 Apr 2026 10:19:34 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm6990103b3a.48.2026.04.18.10.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:19:34 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: rtl8723bs: os_dep: remove unnecessary braces for single statement
Date: Sat, 18 Apr 2026 22:49:02 +0530
Message-ID: <20260418171904.16479-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant braces around single statement blocks to follow
kernel coding style and improve readability.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..a86252ccac76 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.43.0

