Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B84366066
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773587222; cv=none; b=OG82uPYo0rT25wnXzYmD+rcV+3gfMkDOgwVQ6NlTY02+NF4lGe/pqwbSbYFQ7ZUI6u4cfl5lw0SO7KVNobk00wfs5NHWlJVuWyPAm+QYENrmgQv9Wkkv+vr8wYY0cXnRWdbWm+iYGCQ7eLYvnnnGGtPOW3XOo1ucxDxVL0pr0KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773587222; c=relaxed/simple;
	bh=lHBKOQBGm6Fxx9EJIkZRGsrEONe2639UKB4uauCnkoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JevzxGvoFSZfMGj614gD8HwgYS9IDWaZgSkymsFiraM8LzV9EU9k64Xsw1QimsSapiJ4/dNBO2iU7nksW9Mawc5Cp5F0l5NLx3NaTKLaUDgM6FLnLJXZulLjnGn/8mYYy1m204Cb6E/mxuo9s74Kfes5s79nUbSstYIQPBOo6L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrSPfEiI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrSPfEiI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so40061945e9.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773587219; x=1774192019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+oFKCqczy45ErhHsr9BjH0dVnyXksSjS9S6Ban9x4A=;
        b=RrSPfEiIRMQ6eCK9HtUG1DiPla7OLPlnPPOxAnvkQpcvZCb6mWzgWcYZNEZ1Pv9Gbt
         GPGfWoOdmyh8HyJkdumvds3AmwYSXOoEu9od477cNFhz+mHlnvCcuIU67AAITjCrmoil
         wWknUUy8yOmrCyPG41NLgwCV9AvZiVQ2h2K0TAW4DHcEur0Tu7VkvnWE+EAQ5dBvb3Bc
         ZybE68/fPauHQ8HI1HkT1HvdHnZWpnl1qnsR//MtG6yVtFAZNTVCjXhJIVfI97Qb8CrQ
         5spd9pGd0l1kbwwexLhFJfPA52fzzVU00a8xhyTsm0Sv+PxpvHW4TRv0HVXFzMnCtIVU
         GO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773587219; x=1774192019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+oFKCqczy45ErhHsr9BjH0dVnyXksSjS9S6Ban9x4A=;
        b=HPaAwL9Qr8pt6ndmR51hp9N+CPhLLrYG7g1/UFwXWWBfeqsmuXFci8Wdl7Y/eabENH
         bYNG3JKcQfm9+tNiS+nXr6cgkEsBTABaXuDe4FnXEMdAUGuizqqMPj9W/cb8bB8PKkJx
         hQsYTW0crfPWcs5L1oQMBWbsLM5AG/JtD/uZpPxwdEz9bSDxQqUV8h5P+ACCIclqiNWD
         ArLTvfwJzRPd0dduU8HbNnzZbMYGMKqsyf1lJLK5w9uisWIVVaTRadpESF5S0fC7ZkxK
         rcdROm6WKskYOurg6f13eMY0qVF/ncxLeNmcaHVecOCKI8HSGsOHPtdReuvKrMB8WmbH
         c1ow==
X-Forwarded-Encrypted: i=1; AJvYcCUkmsT7HUxiZbNhjDE0qJJGT0eTjLbIRctXWww29TsSDfL5vNHzTqp/QxCZBdheSHTUoZLuzH/AiBBKJGG+@lists.linux.dev
X-Gm-Message-State: AOJu0YyX++sBXGCWbbICB6n4x+5g86we1oLyhXJ+mKF+Fso+cC9GhZ42
	ti0sNX1Omu5q/X/Z4w8y/DJ5y/5TqoJo3jEpPkL6HzKV5zZ9Ii6yqz0A
X-Gm-Gg: ATEYQzxp73pcKtoNw+vs5Kt7ZxMDlBJtLy03oeiC4RWW/yipm/4N1k/5EUnm8LdxHCr
	imLC1uFKDMHVW6Z7YNmjoQo2fA5OFl8Z9dLox/3+83bz5/iBa1hLxGA3iskbkhn6BsTj2uiQ/Ek
	AoNsI66sBsa1bTeZWCC3tckaN4z6qw0Jwj5WPSQiZ1c18TBz/JK8BE3BEdZHbuKJiNgVwmC8qua
	51p2eZnFQeXCUmHRRtkgVoz6w6xKYBwz4FGHq4JylmUBOx+PHBHW4af1qwrPJteCkZ2Xf2YvFUC
	8w2xkBekE/qRrq1OabXLgofBj31bcTCAefQcr+1Cw3V2rglr0bHcnIdKnBKY6hGgTQiB0emNCoI
	iumz4dAbDt8+DEclFoem4LBI7YACuI4mMGPYGb6l4GRJHla7R3Fei2rq47H4V+eP/ul5i5tyvCV
	2lacNRDUSiCQdRUe1J8uoDzNKMsRbvGc4Dr210qXYVBhFAWO5wpHDXkDw=
X-Received: by 2002:a05:600c:a46:b0:485:358b:e80c with SMTP id 5b1f17b1804b1-4855649971bmr180990195e9.0.1773587219183;
        Sun, 15 Mar 2026 08:06:59 -0700 (PDT)
Received: from OaroraEtimis.tail60902c.ts.net ([2408:8956:4c20:952e:71d2:7185:4299:35a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c0b4sm36924829f8f.25.2026.03.15.08.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 08:06:58 -0700 (PDT)
From: OaroraEtimis <oaroraetimis@gmail.com>
X-Google-Original-From: OaroraEtimis <OaroraEtimis@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	OaroraEtimis <OaroraEtimis@gmail.com>
Subject: [PATCH] staging: sm750fb: Replace busy-wait loop with udelay()
Date: Sun, 15 Mar 2026 23:05:32 +0800
Message-ID: <20260315150532.87280-1-OaroraEtimis@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The empty for-loop in sw_i2c_wait() triggers a -Wunused-but-set-variable
warning and can be optimized away by modern compilers.

Fix this by replacing the unreliable loop with a standard udelay(2).
This also cleans up the unused 'tmp' variable and outdated comments.
Include <linux/delay.h> to resolve the implicit function declaration.

Signed-off-by: OaroraEtimis <OaroraEtimis@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..d0aeb917be92 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -11,6 +11,7 @@
 #include "ddk750_reg.h"
 #include "ddk750_swi2c.h"
 #include "ddk750_power.h"
+#include <linux/delay.h>
 
 /*
  * I2C Software Master Driver:
@@ -80,24 +81,7 @@ static unsigned long sw_i2c_data_gpio_data_dir_reg = GPIO_DATA_DIRECTION;
  */
 static void sw_i2c_wait(void)
 {
-	/* find a bug:
-	 * peekIO method works well before suspend/resume
-	 * but after suspend, peekIO(0x3ce,0x61) & 0x10
-	 * always be non-zero,which makes the while loop
-	 * never finish.
-	 * use non-ultimate for loop below is safe
-	 */
-
-    /* Change wait algorithm to use PCI bus clock,
-     * it's more reliable than counter loop ..
-     * write 0x61 to 0x3ce and read from 0x3cf
-     */
-	int i, tmp;
-
-	for (i = 0; i < 600; i++) {
-		tmp = i;
-		tmp += i;
-	}
+	udelay(2);
 }
 
 /*
-- 
2.47.3

