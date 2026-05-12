Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933412C3257
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778561371; cv=none; b=r1zeW2OaCSp+3nzJAwrD40kHdbwPmAjhsX2dm7tuNe2BbFQEnSB25xmERS940QL4AUOVb8UVu9d1sQPg2FKwdfQYP+6muCt8KiDqKoENIOJVXQp9HnfP8NE+Zek8It4jm6zX/VcGQkowEL4odwQumadZyIlil6O3i70NoG2OTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778561371; c=relaxed/simple;
	bh=Ma0BSUg9bsTO/AFUYgwKn9V2eUxec5cfDk/klMLGG78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzQcRJUcf68teOC2PcTo36mwO+erPb61Nz30BHiTx7VIETO/XaNyeigPwEKR+Bv22jZ9i1btFYOkST0ueyaufQ5Wc/v5rX9WUu3fF77qrhliEKgrLhwuRq7eDDhtcbf15drOU+z9+BZtW+NIcviSZ8rCRrIy1mjePH7Xre7IFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWTlipM2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWTlipM2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-365eecc5885so5037694a91.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 21:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778561370; x=1779166170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGtucP5dOBTG4jR9fIrSqVWI8MpzdYIq/BvnyuqHI4E=;
        b=NWTlipM2TqQQAbpus2uYnr2+leVewWzF9GlA78yRlyuoKispr3EsCMT32Qz7r0PRvf
         FRAwzBnz8H/4AOh4m8uogm6SJ0erQ3h33jZjSe4Tb/ntZK4Vl7Q6U9Xg+nVB2iUqrlwE
         iL2CyLOedMflUwUYQKH0O0eE1kgEwPdTbLCmk6xdAaiDks9+0vHg4t6ACTawRRJhJwiv
         IV18Q0hqaJDWeudHUFOB7oYJyfYm5kLZb+oujxD/UdLt+R/qFiAwpw+2vbvvwaOq3Gvz
         lNHuT9snRk/tzm0+JNZTcsHy9ix0Grg545806vNrW0KPGoPy8m665njvasoIWblU3gmB
         bOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778561370; x=1779166170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGtucP5dOBTG4jR9fIrSqVWI8MpzdYIq/BvnyuqHI4E=;
        b=YS2TJa7K86C4gAnqChy6NbfInIhQJsEF6mvf3yZE7dx5hbv8YSymLlJk05P4pr9oq2
         uXp38FuxLD5zYHRfigpZpNlVSX7Ryb3xEWJ8wErihTuIEIm858QHmHendsIzx56gu/+y
         8ZDF1Qb6eESB5Qpk1Zwj4ZRsYVtqAxCK7DMEOG2BMj5qfei0vJuEFtRwB9Z1oY+8gddz
         XTI6O6WCHLOqLCbrV0YbUYbqWFSr0HWOyGJ1yAZZMxez3gu1kPvHtcrYdkgMKbmgj9XV
         ErCx6TUMFZ4zQLi36W5eh0op2SyefJIPXaEONdCSxazSAgMl8INzKpZ/IMyOZUZZKj2C
         T+CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fvT34C2WRSSoO1ptr2M7yvmWjquOwZlOZeGdAFbhjpI7c5vbJoH53JHjsMCZSGmF/EMg57z+hJmkQRjrL@lists.linux.dev
X-Gm-Message-State: AOJu0YxWzrReqOgZMojmZPKHqFZxN8/F8/mB/aBISxxkrIfguSORcast
	R5cseKJ6yA/tKAnbj7Xtqsi9+fyLGR4p7Sr86WOobUxgXy2cyO24kmTW
X-Gm-Gg: Acq92OHdqgeKTPx1VZUtWzHiLuG+XYA3nI9w1Iyns5OTlG5Scb+PVGX+v5BxNdxf/wC
	bnMJ+CeiH/eUWT67hZ/oA4KKwsO7byQZxfJV4gydFHg5ApaaDEC+3B+FHfJDcJLQo7GdqWCM8G7
	Y1LcGlG7i452JafjWYUgyg6I7fCRXZJwG3vP1hYMexAZ7GbdRVq5sJ6LCHqlio/5cCeg8qC3k+Y
	o0iNMRVMEp5FNUN+06Qf/eilDQrwTc4lqyz8w/BHTPhjMwpknqb9fnfUoZlNTixdkvrnnN6J8ND
	6geArmaIK1mEB9DF8JbzX9FvmenWFpcgsbYf6mmEfgyun1gTFQcGzfoQa8+9zlQ7YmE3LuBtTS2
	0QS0/7L6QdSaV/euH1ccIT9+bSqHlN4cpAq7m+DbGAXfPo6WxgutBmRnE6qb1iUucND8tCKB07J
	olis8/NomuDk5C/y5xOvpSk0HKA9uf+DpK+gcOR8CiBHPs3AgFJytfV26rzxek9K+bl17Arw3v1
	b4C
X-Received: by 2002:a17:903:248:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2bc8ebdc2b7mr115945355ad.0.1778561369949;
        Mon, 11 May 2026 21:49:29 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2700dsm123919925ad.2.2026.05.11.21.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:49:29 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v1 1/2] staging: sm750fb: remove unused #include directives
Date: Tue, 12 May 2026 10:32:31 +0545
Message-ID: <20260512044732.56417-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_hw.c includes <asm/mtrr.h> under #ifdef CONFIG_MTRR, but no
mtrr_add/mtrr_del calls exist in the file; the driver uses
arch_phys_wc_add/arch_phys_wc_del in sm750.c instead.

sm750_hw.c, sm750_accel.c, and sm750_cursor.c all include
<linux/platform_device.h>, but none use any platform device APIs.
This is a PCI driver.

Remove these dead includes per the TODO item to refine the code
and remove unused code.

Tested by building the full kernel and module with CONFIG_FB_SM750=m
on x86_64:
  make -j$(nproc)
  make M=drivers/staging/sm750fb modules
Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c  |  1 -
 drivers/staging/sm750fb/sm750_cursor.c | 44 --------------------------
 drivers/staging/sm750fb/sm750_hw.c     |  4 ---
 3 files changed, 49 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0f94d859e91c..0100fec6533b 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -13,7 +13,6 @@
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <linux/console.h>
-#include <linux/platform_device.h>
 
 #include "sm750.h"
 #include "sm750_accel.h"
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 7ede144905c9..552fd30e0d38 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -13,7 +13,6 @@
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <linux/console.h>
-#include <linux/platform_device.h>
 
 #include "sm750.h"
 #include "sm750_cursor.h"
@@ -130,46 +129,3 @@ void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 		}
 	}
 }
-
-void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
-			       const u8 *pcol, const u8 *pmsk)
-{
-	int i, j, count, pitch, offset;
-	u8 color, mask;
-	u16 data;
-	void __iomem *pbuffer, *pstart;
-
-	/*  in byte*/
-	pitch = cursor->w >> 3;
-
-	/* in byte	*/
-	count = pitch * cursor->h;
-
-	/* in byte */
-	offset = cursor->max_w * 2 / 8;
-
-	data = 0;
-	pstart = cursor->vstart;
-	pbuffer = pstart;
-
-	for (i = 0; i < count; i++) {
-		color = *pcol++;
-		mask = *pmsk++;
-		data = 0;
-
-		for (j = 0; j < 8; j++) {
-			if (mask & (1 << j))
-				data |= ((color & (1 << j)) ? 1 : 2) << (j * 2);
-		}
-		iowrite16(data, pbuffer);
-
-		/* assume pitch is 1,2,4,8,...*/
-		if (!(i & (pitch - 1))) {
-			/* need a return */
-			pstart += offset;
-			pbuffer = pstart;
-		} else {
-			pbuffer += sizeof(u16);
-		}
-	}
-}
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..f491d3aca468 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -13,10 +13,6 @@
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <linux/console.h>
-#ifdef CONFIG_MTRR
-#include <asm/mtrr.h>
-#endif
-#include <linux/platform_device.h>
 #include <linux/sizes.h>
 
 #include "sm750.h"
-- 
2.54.0

