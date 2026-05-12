Received: from forward204d.mail.yandex.net (forward204d.mail.yandex.net [178.154.239.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA663CC32E
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604902; cv=none; b=bAVU9wLsXGyHAQi1YKZNjr5tqY/Y52owQtoMCDURkluTO89iBteqESiP61q7Dz7q8/z4Zno/I4QYb5sCWX734sk2P3WeL+jszIRti2Z2+9+ohxhj5OAz9Z2HEdVCGfPOTGSjeezReWndO18BmNtik0+VJfshU2NJeM8cvopA6NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604902; c=relaxed/simple;
	bh=NFH6lP7AnuuCgQP4N2w+t3hFItzEvEzxSfBFITYcqEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiCy43HIOOju8sqHLPh942jJeye+oxuKWxwBKgKRg5FaGG/AsFqD7jO32QMYab3RPdzlLw/EQz2ORdr4l0BbSbrZ+ubWGgvmlpYeTJ+6MZrNfPYr3wizsw0qdH5W6BjSCW5fRGBA2I5Ik6C9EutIJcINYLboktDihWTIaTVZv+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=CDUSx+D8; arc=none smtp.client-ip=178.154.239.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="CDUSx+D8"
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward204d.mail.yandex.net (Yandex) with ESMTPS id 9ACF987373
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 19:48:02 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1f87:0:640:a06a:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 10DD7C00A3;
	Tue, 12 May 2026 19:47:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (smtp) with ESMTPSA id nlNSSYsRFCg0-kt0HFlLp;
	Tue, 12 May 2026 19:47:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1778604473;
	bh=/K1xA0pNH+Mstfy9sWoEymUCD5DBap6C3W78i/RVEyw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=CDUSx+D8KfYE72X2BI0LDhIBPSCwgmEqvfIzKpkPkIdTepE8Yd4jw2sTNLtzYjUqH
	 9cVTRmvHzGlhNikZXjeVNHO2nCNZeT4Vu3+QK4EL2fpkDla4Mj34iGGXn8mwWEdO2s
	 cOijCao/2ZALFh/DB3V9SQsWEmoShkzJXf4H6NJE=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 1/4] staging: sm750fb: remove unused includes
Date: Tue, 12 May 2026 16:41:21 +0000
Message-ID: <20260512164124.188210-2-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512164124.188210-1-ahmet@sezginduran.net>
References: <20260512164124.188210-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused header file includes from multiple source files to
declutter the include sections.

Also remove the unused CONFIG_MTRR include block after verifying
that no MTRR interfaces are used by the driver.

No functional changes.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c        | 12 ------------
 drivers/staging/sm750fb/sm750_accel.c  | 14 --------------
 drivers/staging/sm750fb/sm750_cursor.c | 14 --------------
 drivers/staging/sm750fb/sm750_hw.c     | 17 -----------------
 4 files changed, 57 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 996a586a3727..d26e9fab846a 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1,19 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/aperture.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
 #include <linux/pci.h>
-#include <linux/mm_types.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
 #include <linux/console.h>
 
 #include "sm750.h"
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index ec2f0a6aa57d..f695a2a61c28 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -1,19 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/pci.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
-#include <linux/console.h>
-#include <linux/platform_device.h>
 
 #include "sm750.h"
 #include "sm750_accel.h"
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index f0338e6e76b1..9d6bca3106f4 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -1,19 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/pci.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
-#include <linux/console.h>
-#include <linux/platform_device.h>
 
 #include "sm750.h"
 #include "sm750_cursor.h"
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 6f7c354a34a1..34a837fb4b64 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -1,23 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
 #include <linux/pci.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
-#include <linux/console.h>
-#ifdef CONFIG_MTRR
-#include <asm/mtrr.h>
-#endif
-#include <linux/platform_device.h>
-#include <linux/sizes.h>
 
 #include "sm750.h"
 #include "ddk750.h"
-- 
2.53.0

