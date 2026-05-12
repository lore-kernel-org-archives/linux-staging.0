Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054B4779BC
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566255; cv=none; b=NxHczcHJxCWeCoxGJGCNkdwQebJXYZLGEIaGARhOKAAoOsLL1s9ivvgHBxHXySEwGbwcFK2zgniFr3rEcnLhUawr7fU2KiPA+3mO//iqWSriutqrWozbNU7Pxz9XnPbU1q2pLXV2OInyNrbut5tTwCrAjHO4ES3x81DpWeYnfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566255; c=relaxed/simple;
	bh=CQ0Pqhp/4QAbSk8gZsBCYrlwBk8J/VBMcD/nYEp7h/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dE3KYE1bDjCDH189kJEme52HxlFI/FBzklvvnJMPpc0mUqDXj7kSTPaq2czc5IF4saoBiafnLrxCy9a+1X6Lhua9d6B0Kc8FdEB6ejW5Mz1vpPgMZ9WPUYIwJR4XQFPnXDDP/GyleyGZHQj0FnAbEI5dgJlbN8eTxWiXFbyQdCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPxCq1S4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPxCq1S4"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3667cf0136fso3340120a91.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778566241; x=1779171041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bfTIHcuxdABvkVe+pMs5cot1hi6l98N1mvQQvDnmrQ=;
        b=iPxCq1S4Qiwif6rqLmfeef7G5rnsCpMsxDHWtcFqIbDzMXLO8Jn/dFuryoRbe7/Srg
         mPix8n/9zUtFslbx3BXf3/HyDSZ724SyoaEFa1omxNLynJ8rel6DyzhUA+pEYt5+l77S
         cQotEYoVL1M+HZ9uGQ0nax0ssBNkYc2qc1m57+HnY4PsT3aOzZ64v3BMXhEEg/+ef4fB
         mANnCxDy391CtqfQHVhusLHm0eGrHz152QeXVTMvQ0w2oa3yU28XNSiSGyYrsBQvfj+r
         z5ilgIZ0xUwXaT5pJ8pj9pQJFQlg2pF4KBGAEHbix+Q3UuEKN4y7uCJTG6URiq9gt1JI
         nExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566241; x=1779171041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bfTIHcuxdABvkVe+pMs5cot1hi6l98N1mvQQvDnmrQ=;
        b=jAO30yypnMoCZRCB09oUiIPy7DiogeklBRd+RsE+c8F+8E7AIW5ItssRAVQg9/dJQJ
         snkxUTqvRDErUJofmVn0RKOn8g0RI0PkfD0HHpN8wRtCetN/3YTY+qLVs2ZIJFVfR9VY
         M6rUZ/rWfrIlHWDKAageVt5KnjkNloLRi559DD2wjNAO3xpWWefVVFZqIgvBRYqfvV9v
         2hYnsGTVivl2Pb+v8rllgj7v/sPlWa/+cd8myV/zfVIVQ+uJg61XkLA9C+IxkOS8lydK
         KVY5r9Oy14bfy/npRkw78hjd3LZhEweIrd5n3ENOzO2N//8bTasGAHOSRO2fStgi+CW2
         34Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+eBral5jc834A4Ze3E+njfY5ZKVIkO78GTOUH8LOAKsJ7SlElq5CnCrUcVCGE0D453/MPH6M0umW+gQ4N8@lists.linux.dev
X-Gm-Message-State: AOJu0YyWYx+Bus/4LJWi73/g6ayJnDAIXIApaetbyQ4rs6eHGUfo5BPw
	ybTIhD1qGHkDzQNXNFLfAr8j9Np9OQxpVP38ryiTwUjQTpJYrAoX2X1Mbv9CSC7lbzg=
X-Gm-Gg: Acq92OHeYhTLgZj1ksTC39SEvgd7PsweZq0qqEVxP7Z+Tx24L+sUkKDugVtA+J1Wgsk
	JAjWmmkU39Rq42lBszsgt1fbNX+MENkNp9wfdPAH7aMS0+yk9T1Mp2617tAAmGWAHxKn/hIOT6k
	TGYRurmTMJvCn+GkjxeEvinM0nwe8MMzPy62HH45M2lYf0qgHxL+whOMVfpdy5DQqz6Z73HfdBE
	q/Y/6ontFlub6zo3CEHMB733uNrOxPyKV0ms+LHS4JGCpiZq+/SNluOqW5cxSfoLTqZX6FG2mz3
	ijw9qsEswIw6OOMvVmaro3PgeWPtR0u+9HBoSEpvD/Xcle1iCVP0ksE3kxMC9iXftned+DQ0OU+
	uV1iw3hSaTrEpjnSbaHOZh6boVzwCdPjBiVYmQuuvDbXigV8e+95+ZfHBIdWfrxuQlmABQJvtT2
	CCx3OnRKqVH5UaBR+Y88jJW45aZUuFpyQTLZHP4G1dLd3MI08CVBNkXhM/W4VLIR50kL5T8zvUq
	/Nh
X-Received: by 2002:a17:90b:5744:b0:35e:3b08:8fc4 with SMTP id 98e67ed59e1d1-368b22bd10emr2013834a91.5.1778566241263;
        Mon, 11 May 2026 23:10:41 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm9827915a91.8.2026.05.11.23.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:10:40 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v2 2/2] staging: sm750fb: remove unused <linux/platform_device.h> include
Date: Tue, 12 May 2026 11:55:12 +0545
Message-ID: <20260512061012.76252-2-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512061012.76252-1-yogeshdangal66@gmail.com>
References: <20260512061012.76252-1-yogeshdangal66@gmail.com>
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

