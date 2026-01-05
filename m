Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D32D77FE
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599368; cv=none; b=TWJ1VmmeTaaF8ppsiX1l0dsXK7dKKy2spbGLX2c/8+izOJjPpDKaKYep7oQK97ibRk5NBJVNZiq7LogIa3UwmEL/CWIPxqlap7+3mpjyzZQJ0zZ+jQYHaVgFOUN5a2zBXEvoswwG5sdam40WTA+kPFEfLCfKHIIHbeq/AJW/5/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599368; c=relaxed/simple;
	bh=2e+qUZBzZPaB+8JASPhZhCBLmvrbB/WcJwRR95/MPoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjKAS6G3Iq+Oi/QNwh3Q2r+WwWlvaN6TrhDl6SYBDjQ3HXVtGddUYxcsBQWaPORRAMmclq0m84ljZkgSpvSSCAjkDVyKXc4gMu9k1CaHK2fiQD5V0s7KGAqMNQHso2UZqdgYaspxSB11lUc/cb9Y5Dd5ivtC3RQCOTYnEQJnYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbDFfuCh; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbDFfuCh"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0d67f1877so182495455ad.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 23:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767599365; x=1768204165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Tw+5UZKK2a5tWrH7+zI3XadSX9Gy4gWxqz5gPACZqA=;
        b=MbDFfuChr6aexZRkRiVsM6wranE/PkKKBIApRrPjUWLM/l91WHNtRAvt8mlzWnsR68
         p3GIFSIPxoXzsAJn03mFZ7R876K25eHwdJAXajpX5NUpBrPA/W1o1ov5GZ3vxFJhfgEF
         v1fLQl/yOqKovZZcfFG+T90MRZORKwDi4OhkqYlQ/gE98dngKPnZwTkLqfJE3Wp/sT1H
         DqfAm13U5Q/s153ZjEEb2h0eFBcDNmeFDW8RBkC/5yt0TilwnvMxmRoIc0nOiRwwHx+N
         Nt6UnzbwfCmqgGNdFz56LHVocotq6W5BTW8JfRUR16M2r4oAlvG4cnf8/5ERWe4Btlne
         ahNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767599365; x=1768204165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Tw+5UZKK2a5tWrH7+zI3XadSX9Gy4gWxqz5gPACZqA=;
        b=PYXpJckD6DE1aHS7PSKqccw2SgkFjl0fCsFgIKSKDHCxyQ7DpSyr/cg0C60xJbSznm
         4yNWmARIm6Rh8dmQhYgj+kXJIpZoOUwROvKxbZaNZ57fzx6NHp0GwJDpXbWfK5n8JHBD
         HZKURgpWGtF28d6VT/jHlIwPX5NhqRPc9pO9pIwrxgWDqxquI/ezPZc3ZP7eTUzzgBBC
         UNvKSifBEbbzNxPbky5uZl5/YrgkcZ9iUQNTjun6YD9ECZa10Yp30KXuY7r1sWT+W0oT
         GtB93HKFOt/iNgS7wqhGaeU2wpdrkT908zebmkbjxg0VC8xpQ60CfWDLhv3fJAdxk+oV
         R1og==
X-Gm-Message-State: AOJu0Yzed3uRMotj/uAGOVlv0updN80RnfGksLJ2/oyF0Kgu+rnpQ9KY
	mJsowvnT1rvVGMhIucYHbGqhMWTc01wn8leb4zreZDQBZBEBx6SZW+CzCaLpnKtUSyhH6NkD
X-Gm-Gg: AY/fxX7chDoVbtwctfZVum4qL/7sEnsMiaU6FQEOl51qH1j45t3GpyawzKsFYJWp3ok
	I5vFxviWfx/RtkAdu+SeZBBadPJGZhoAKLm+AFNdPtBf+yo+cLn0YxlSFEZ7Luzj5xiDvm0BcWY
	n4XyN69v4+zZ2u0Oifu6TVST/9M2GrlDNLf2as7GMKrRwjrcDbc/w1nWf7obQOZIKGG7vkWeZQd
	/4iPaYYgLiQ9RZ7XMX5pVTQ/StyhzKiE57zv6ZxmCUDuEs8szqSV16vnVDS32tlsTBxU4VGgv0W
	JMnseCCcdVORiBSp1uzLDflYRsH5YSHj49wIlJ/RDEhiW5auOecOMFAX2tcMFZMyYAckwhc/pYH
	19mVvFcMs7cH42Kr6rvCvtV2k7bjuRg6AKfA4y7dAYCXlDeAhmM59nzQfyaXJYyac5+5FwOkoUB
	JbQ8T7W74us0YsqcY5WZNMTOT4Iuzu3uV2u0esdBQj/1JnWJx91c9xuLJWamUnZthcRI82liyDO
	JDjyG0=
X-Google-Smtp-Source: AGHT+IEDGBEmVFhFh6A8gmS92Or57SIz9MAqhTSuilHM60miXSe8yjL0NRxA9oXSA/2fwTAZDrIQYw==
X-Received: by 2002:a05:7022:61a:b0:11a:4ffb:9825 with SMTP id a92af1059eb24-121721acbf1mr46920289c88.6.1767599365350;
        Sun, 04 Jan 2026 23:49:25 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm190874535c88.12.2026.01.04.23.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 23:49:24 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: linux-staging@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2] staging: sm750fb: fix unused tmp in sw_i2c_wait
Date: Mon,  5 Jan 2026 15:49:17 +0800
Message-ID: <20260105074917.607201-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105021026.556244-1-sun.jian.kdev@gmail.com>
References: <20260105021026.556244-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang W=1 warns that 'tmp' is set but not used in sw_i2c_wait().

sw_i2c_wait() provides the delay between bit-banged I2C GPIO transitions.
Replace the loop-count delay with a time-based udelay(1) to avoid CPU-
dependent timing and fix the warning.

Compile-tested with clang W=1; no hardware available to validate timing.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
v2:
- Replace cpu_relax() delay loop with time-based udelay(1) to avoid
  CPU-dependent timing (per Greg's feedback).

v1:
- Used cpu_relax() in the loop to silence -Wunused-but-set-variable.
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..d5843fa69bfa 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -11,6 +11,7 @@
 #include "ddk750_reg.h"
 #include "ddk750_swi2c.h"
 #include "ddk750_power.h"
+#include <linux/delay.h>
 
 /*
  * I2C Software Master Driver:
@@ -92,12 +93,7 @@ static void sw_i2c_wait(void)
      * it's more reliable than counter loop ..
      * write 0x61 to 0x3ce and read from 0x3cf
      */
-	int i, tmp;
-
-	for (i = 0; i < 600; i++) {
-		tmp = i;
-		tmp += i;
-	}
+	udelay(1);
 }
 
 /*
-- 
2.43.0

