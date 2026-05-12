Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0B4DD6C2
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 06:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567725; cv=none; b=eFYMs3IiKfW+QYl0LdDp6pDIY3LAoaFy6YwWTBSOPL0ICjlHE2hLK+rptLTnpvYnpyqxQqyJIkE1My2YsvyOkj8eQVRcXYnRFZ/wyUsyeucs0yui7W0OiNHQCSe0Pxj/W5VhdelAmWbokDXOIopJNim5O8oBvToXIFBaWARxdyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567725; c=relaxed/simple;
	bh=CQ0Pqhp/4QAbSk8gZsBCYrlwBk8J/VBMcD/nYEp7h/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U57U5NcmcbS3RDZIhzOlBOfj8zBfdvjPv+CrxTTDFRYjjbyboWAK/TpOAjZBEbJvlf5JsCXGaDhsS54OBW6DH8WCCeXlnUe6DgAMN5GhvbkeGXISmKMEFJnrrnjFLh3YYncA1RfR8SWNj9WIetVRto26n1Iu9GKutG4VzXhILsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9DylbuB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9DylbuB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8383fb7143aso2410699b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 23:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778567709; x=1779172509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bfTIHcuxdABvkVe+pMs5cot1hi6l98N1mvQQvDnmrQ=;
        b=e9DylbuBbHaEkXKqSGZwOj6Y16Ss01YFfYU/zKH0OSwFgtpKwrqCRgt9Mel3Xeh0Jn
         P2fkyU0p3B9WhEPBTNpgX7v8eclfD5KuXxS+F4BZ+H/AqLlsG0Lyhlkf96f2ENqvkEUL
         wqWvH3SmSOBUyrOWgoTjQ8GcOdop/tnkHBPo1BNxcB4SVOM4mN08Q+U2zvl7XXAx4s1o
         bYJWI9vMS1Q1xeEl4IgRZBUWxvpVqVxdlOrDdlSTAyXa2DfuxHoeTWLKmJwI2NoMm1vZ
         oU/nbWpxridPNEiPsVNQ9A1DVH/X0G4kjlqiTdgAwCGYlTHukZ6V2FgXBFfc8LjIWLUP
         jDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567709; x=1779172509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bfTIHcuxdABvkVe+pMs5cot1hi6l98N1mvQQvDnmrQ=;
        b=mACs3d4k0B1xxsNi0dpLq21zYsR1lTiIcenvU5I4V1ThgUt5K+kGWZ/wdjtyMFLR30
         Ns2Ig4x2K7V+LEM93kHPATLJw9/p3URBZD5wOmyQnaWTVOO4Yp+Ci79s+IvqS+dEYklr
         jJIyWaI2apBM2Dv6xyi9NWJWg0Eef8cU5DRLsQlx1X1QwxhgeO192q24KaB4qXFtGSt/
         l0RNkpMvHVG1Ojlk7cZtERzdR7wOb4iPI2GlS5kxbL8dPgnJOOaCePB6xwqUysUQEdEh
         sNNLQFJKEUYP+Vq63PvsZbORSLqIjHx3bVbyKROfQmHVOxd4y0vQkqK1AeK1jbYaP9bS
         I7Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+p8DbpjzlNqBIan6caAV1JnN5x48DYjg0/A5yhl3cl/vKOdIxVC34PNrxtvNKxdkjuH3E9Yh5GdRELDacL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1OI0HMImMvuv37dM1eDfk2iq9LRM4kquG4JBI5fQqWj6Tp01z
	z0f0LF29CYsx1OX+o2QBK0zK3R61VmmHRZFVIvfy3HYTWc6xS3+hKAlZ
X-Gm-Gg: Acq92OGrovTaqxnNIX1A08GDHnDiM49I8dO63ttkJCW3/C/oCqc7A/7+slA0CSGj0Nc
	OGCsHHMqQWnyp1DgDB7QtADrxAWLRju85oSAOpGFnfd0r8/XsnbYE3s48TOIVs/+aOl0XFAUB4j
	D/h1xUKTR5ZXqJbLuDhaMB84gO1xtw8hYL1ZhFa4srHnI1lJ4wBLhgkLuHWmjl+9V36RCtN4NFZ
	te36+FZGf+CB5q+q9Mw78PxS3RgFykc5eqMtl0AabRKySlvqw1UwuV6nQi5RsOQsZHhhY+sYA8+
	lrzy30AIQNJAdjVMjNuPkPUQXU2AjJ84+q4PaR8CL9J54YxwIEqfRofehuNmuDr2sfbq5AWdH8g
	6twE0mQaPvCbT2ABmhUKUM/9Iass73MJmknK7PPjsf8Koxp4/y6kAXh3zSijXsyiHrAONKvMYYQ
	wr6LEXZrJkvFklLvSW0x/nTp5tTRavuSPfiK6Cu7epeubVj1GTBvO6/ka4EKsz
X-Received: by 2002:a05:6a00:4ac4:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-83e39c3312cmr12860106b3a.11.1778567709152;
        Mon, 11 May 2026 23:35:09 -0700 (PDT)
Received: from localhost ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm29994346b3a.48.2026.05.11.23.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:35:08 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v3 2/3] staging: sm750fb: remove unused <linux/platform_device.h> include
Date: Tue, 12 May 2026 12:19:56 +0545
Message-ID: <20260512063457.80882-2-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512063457.80882-1-yogeshdangal66@gmail.com>
References: <20260512063457.80882-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_accel.c and sm750_cursor.c include <linux/platform_device.h>
but never call any platform device APIs. This is a PCI driver.

Remove the dead includes.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c  |  1 -
 drivers/staging/sm750fb/sm750_cursor.c | 44 --------------------------
 2 files changed, 45 deletions(-)

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
-- 
2.54.0

