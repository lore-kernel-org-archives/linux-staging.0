Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB128FFE7
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773616854; cv=none; b=b7oYOzumEnISnvhjB5j36Q5MzZvCwNfnmcG/Nlhoqy4vFVvhSxXVW54LAGsbch1uqLll8FJ7rz2IrRvWRr7456LenCCrP8b6lj4CK99V6c+Mrjt+kCeCH9CIwwADCHOQD0edAQbBYePFTBj9OixQKODRsTpwMOdtdx2iKx+w8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773616854; c=relaxed/simple;
	bh=KQK47r2le0rxX7oS8QCQCkyGSHeorWHnC5Ym4uWq5O4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GaKdfKaqPO3Zas2/ECe2bnzOWB49WokNCXvOV42DdgXHHwSD8/3XyRYJgVSRSWNF0U4pBWXzGGW++oea8k5qJ9kcZZCLVgdrnHFGiH9n6nLAzpxjhSbAsb60NBSBtYQYtNkURWXxQWDjfemd812erMWhDjA2hdpiqm3XYmo3rSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd/JO79I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd/JO79I"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so22274215e9.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 16:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773616852; x=1774221652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RimPbUvdW9AjfMzbYKRW24j+VJGJ9iTe06ziE7Uy0js=;
        b=Zd/JO79IFuEqq80Jh7cNh9Ets+2ceM/QTndk1aSqj4uI9/DMx2aaF1FEAa0lNhaBgY
         7ii8DDmKvZ5Gb7lBmYtE8FYRV6y383uilbuVLhCtfkUrJa/wzGlu4shm4Q1n7hX/7fRF
         5uuzu0BTAc8oAH9nxghjcqmp/BNZG6OnZ/cl16VAzBt06XmqHK+0v8DlHYxYWJTALKMS
         /74e9F1WVagKAX5/J6LTOL7XsMAibyJDqqvJz79ZONQJJ6gjInlgV7Mi3fqrJKV/dwRD
         Irf5KMm06fc57Bx7VtU0cxsne5fTIZiQ8HvstPZQg6+5D2DL5vlP0j4d8c3SQmiEH4Hk
         sTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773616852; x=1774221652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RimPbUvdW9AjfMzbYKRW24j+VJGJ9iTe06ziE7Uy0js=;
        b=U4PeLv+EQZC5yEjpph8DWXkelq67KAvZBaAsd3RQU3E1jwkNlwlQTbIjVWmo08eeN4
         e6+87xHyT1l6H+nEvAf0fDcWMemdQVXfo9zPs7cqQRmcOv7XNk9pyZQ9qRWV/i6SNInS
         goaHYbvtPH8c1KG09ThqKMaQtXmXY4iD5aDYp18pBN6C8+OaTlux2kvGmpC6xLEUONMU
         5XP5p1o25r/aNwaWf2S8r2ylKmMZaYhPsUEksPsYGfFYKJ2fcESt2/F2+qtep+GGO2Vf
         IfMqkRGFjec8hvM9CmauDHLCrJDuHY7Q5vVQCEjgODQq6rq1Cx2rUVz98kud3MbaV7V1
         WOsA==
X-Forwarded-Encrypted: i=1; AJvYcCV076wQkFNuWJGZtdtzE69vMSrMbnMfc+HZLRoZPI2W/KudOH5mWlfExwKg3TZEJ8Hb3Uae0Cs9Uh5bT4Vx@lists.linux.dev
X-Gm-Message-State: AOJu0YyRU+CeeFeg+RaRiyi0myu5GxMTUSL5e8vUHxzO85imO9T3bVs4
	vWtDxtkwOoFHilmDNs04SKZP+RaxkH797bHZT2bqpgIDMgzdnV2xslVR
X-Gm-Gg: ATEYQzxKFE2RQikJsi9ybXHFLqBk4fC8wO0qE8F2HJ0XEotPXMlsgi0/hbX/qhzaHTO
	G2NAXPmfKt3lu8sUM2JV8g3Cv9q0PG+koerpNJCpBdTpne424bKnwgW9olhIOWbYq55fpISQ3GT
	C6XpCe2h6VoHBZIr21IEB6+YzZo9chjeTHqQ0Igugg8M0dcpnIeiGzs7lmWSb2DUW9yNaD+N65K
	sucUsXfWJLhv4NE/hL1HP598MxaeiyWFat2lAM/TjTX/QTAqIDlfNg+lI0BACtVeKfwOSwHG7B4
	4VwWr/IMjFMFfDmU+DpEbWg3pSyCiDz2jOogjdkXu85cyv2szpGwPgfGo41E4x3mZRlTGQBNRf5
	FDDMpgztjpNDu/NYaAzn2VpQAF1napT8XK4nHaHqS4Pp8CCpD6Qr/B1rqwDSWYPwl6G1cs8Evkt
	oApVOk4tVWwGZ/vdRfDa103rpSPWxVDO0Qg1UmSwQlmE2JTGiqfvME
X-Received: by 2002:a05:600c:46d2:b0:485:3a03:ced1 with SMTP id 5b1f17b1804b1-4855672737fmr190627665e9.28.1773616851586;
        Sun, 15 Mar 2026 16:20:51 -0700 (PDT)
Received: from OaroraEtimis.tail60902c.ts.net ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm1133387005e9.2.2026.03.15.16.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:20:51 -0700 (PDT)
From: Oarora Etimis <oaroraetimis@gmail.com>
X-Google-Original-From: Oarora Etimis <OaroraEtimis@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	OaroraEtimis <OaroraEtimis@gmail.com>
Subject: [PATCH v2 1/2] staging: sm750fb: Replace busy-wait loop with udelay()
Date: Mon, 16 Mar 2026 07:20:42 +0800
Message-ID: <20260315232042.231620-1-OaroraEtimis@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: OaroraEtimis <OaroraEtimis@gmail.com>

The empty for-loop in sw_i2c_wait() triggers a -Wunused-but-set-variable
warning and can be optimized away by modern compilers.

Fix this by replacing the unreliable loop with a standard udelay(2).
This also cleans up the unused 'tmp' variable and outdated comments.
Include <linux/delay.h> to resolve the implicit function declaration.

Signed-off-by: OaroraEtimis <OaroraEtimis@gmail.com>
---
Changes in v2:
- Rebased onto the latest staging-next branch to resolve merge conflicts.
- No logical code changes.

 drivers/staging/sm750fb/ddk750_swi2c.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00ec4c..d579cb9da79e 100644
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

