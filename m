Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3023F23AD
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209744; cv=none; b=GcMvp+FmZ5sTTiYNYssaG3UShQEln/CfEillRsMs3senm1A7FrtNt8eMqP8i4n2EBWtwRUUH/lC97nnQjABXOPOQoo6qtTeA0TXWQPMUall0zNzfL6UmR3o0mXBPu/n6NKTPEsY/yY6xiwwIJefqQp9e6LGUan0tGakTzC/BNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209744; c=relaxed/simple;
	bh=vnSqf6Q6+jykaOkTPY6+JdqtPH2h+eJqb9PmvzMyeNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Km3fDLPKN57iUAI8b+R4xch/wouG2wAvTMnXbLeBw/lXMQciTBIfHTAP+ZDikIq6an/Nc7hqv0zBGch6ZnjrJ25ONsWQLpOklVHk6jlcjK5WKBxdMiOpNunM2o1uOSGhQ+XyvkbOhgwTluEzLQmTGmt/XUCcDtKo1QEtydmLwbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqI+PJuY; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqI+PJuY"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-823081bb15fso3633567b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770209744; x=1770814544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PlsqnjjagAEsGQw5SlDMIqzia0vvHEg+g1ssaAuOLLg=;
        b=eqI+PJuYVD2EDT7mkI7oxKwtEWMHbmmh8aIpoDBh2FA/Oikr4LpazpkgRSF4pCypIj
         ETDDkG85YOoUnYP54o1KRInCK/9aAzql0blRBjovzvKtv/Bbm6DFKeJIjsBVm5hSEVLB
         BGwf1hXILreQFdGVCnuPFA9x0FekCG1xioViPoWIwVdiBmEAgYgTf+dncNdYDlFQFFfO
         2YTV33hjW6+rwutacRKxvWE0fNXg4YEzb6bYr1HcV9B6UzLwWNErOrIkxZbmh3Nsll3d
         SQvK27y8sTlTZLu56trr2RSMDH3nvCgQTFUDOXEO1bUfATlAi1q4iKLaPSqw5VO162F6
         yr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209744; x=1770814544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlsqnjjagAEsGQw5SlDMIqzia0vvHEg+g1ssaAuOLLg=;
        b=ZYrxQD3TJD4Fl7rdYiSRR9U3lQ9K0YfVugq6IZWRkBw9NJCzE8K5YtgmNnpqu49emj
         1UAxngWWKrvtwUZNjbbo793fVQPL+hIs/1s6tTO0SQwKOXIc5AolZpLfEcHyQmRIXL0m
         qSkNHexeLAP2TlHmK/j4gsotZ7zx2ODyLVuTQRciEpnx1eUf0R++bwA6Cc6oI+o0PoN0
         A0WPs2rr9QAohMSlhztAtV5V6+mAe78Qbspisslfv5UeT1/7xU2b/gyMBkop/UJgZ2bo
         L8DFMsDAiVH3scrxaTRJifqh9KRA5qz8pkI4Y0nMUlKxMWcItuO+/mbliA5WqquVK4t9
         OlBA==
X-Gm-Message-State: AOJu0YxkDLVS9MF0tteuXGW8VLSeY36hrTXCk/0QjzWrO9IeWrHZNd07
	V1b7nSNmWc5Hxki+sE3UDkW3tdDHmYbuQx9QRof6aNLU2C/dmIz2xRRE
X-Gm-Gg: AZuq6aL/xJSojMO12QkPP0VyXnkpWE+jcn+s4HFvyMTEkJYTv2ME2D7aHzJL2Ohp5Em
	t5kTu+rECrdnKWrksFOo1omGFL2+jF64BpGChggd4Ius+pG1SR5TYdCgfxY0ucW2feVZB7Mm78F
	K5tHReYyj6XFMHyOQA3aIpsD0TJyYUHqTr/lVtKpudrcLjHN1QdkePCrg5RscxVb09nSr4DVuLf
	1/zze14c2V4u+cxoxbmInFP2F5W4N1pajraO772VrAsaDsbL7eihwC2sGCHEoEvRFo8tHq7gFpX
	mzacqq5FK2KFt4u9b2LKEbzZAXfoSnjseCYE3Ic5fYzWKRxnVEX8mPWASMl8yzeTmNZ11A3EtIo
	pkH3rjMSruPfq1XH31+2xGRrOCcqhroRcKgQFRh+/D5/4spwRyWPVc7PhydztlzgynCr9Y2TxZx
	IXq2rbGhF/ziN2hufD+Nt9x01qykXqypQhfH/c2kOJR66rJYikjqRvWy93
X-Received: by 2002:a05:6a20:ce4b:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-3937211e956mr3301077637.35.1770209743878;
        Wed, 04 Feb 2026 04:55:43 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c84c70b79sm2360353a12.18.2026.02.04.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:55:43 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unnecessary parentheses in ddk750_swi2c.c
Date: Wed,  4 Feb 2026 17:55:25 +0500
Message-ID: <20260204125525.5498-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reported "Unnecessary parentheses around 'clk_gpio > 31'"
and 'data_gpio > 31'.

Remove the extra parentheses to clean up the code and satisfy the
coding style guidelines.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..50e51d730d86 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -393,7 +393,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * Return 0 if the GPIO pins to be used is out of range. The
 	 * range is only from [0..63]
 	 */
-	if ((clk_gpio > 31) || (data_gpio > 31))
+	if (clk_gpio > 31 || data_gpio > 31)
 		return -1;
 
 	if (sm750_get_chip_type() == SM750LE)
-- 
2.43.0

