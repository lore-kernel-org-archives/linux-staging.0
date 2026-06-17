Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906733ED126
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699958; cv=none; b=YU9mjg6kjLJsxtCdCrWlJqdkqyw4P8L1YSYqnnn27hCPuV7GC6gwz3nPfRC8ITPCxNpfN4K4sNsqUFWVsNnja1FKa8imI5GJTFc4R3NvB8rRvky7SY4KM3WepMc+yLozcgqLvRG04Xjjhj/krM98lUaOfwFz4LsrYvvSyknOq/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699958; c=relaxed/simple;
	bh=NcsDi0WbKxtelMi3XRaHd4Jluu/RZs+o0DpezKoA/zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wcr2YmPqB13VrSha0tImUju3NRoD+XQ3D1m0hzW5OsfOQoKMxD9g5DHr3PaeHs1XN4f1z5k7QiIWSIa2qRkX5aCf4my+5YgxGYJ+a+7WDBkuapTwKJ8Y9PlnAMUGJKWas+qAXfkAQCjD+P13jAr3tKqvCjGwq88pbBUEph1k0ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l16udnLf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l16udnLf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2247e38eso51587955ad.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781699957; x=1782304757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzctF27Iyg9fnRtO/uZ/bqvQv0xKnTwQfF38gzGnHM8=;
        b=l16udnLflPiUbykaqYr5r8kXGpKuO9dVVNmBHIjO5PLUW1p1+SxS188ojmdDx26Cyb
         SViO4IVgdRMn+2VfIJwkDRE6PRsnxSzCcAQ6bwHIVE5oEKLTwHOqi1qCDtMQ7uIpawms
         Cp/nPgHkNGYUnyzMvp7XHJJriv3KQsW9Eewns0jWgdWjFd3943BY3ZxukmWEDzNcl2K4
         tlsVH8x6b+yGTKxnlGzkxLAq16DoA+F2NkazmCPEVrrcTR3j8zSU4WKU99+1Q5sTDNwQ
         AtqVdqdU0wYYsV0YO+ZqhbAvyNUck8diPpD0mQWVyfwsN1xUT4GxmiVeCbkbJS/eUW5L
         pDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699957; x=1782304757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzctF27Iyg9fnRtO/uZ/bqvQv0xKnTwQfF38gzGnHM8=;
        b=laAkdwONAMzXFs912rhTSxXRWJdjDO3+opapjPKi/k7yL5mxAYVH5AizH+iba5qYlZ
         oiVdR3pIdVmf5+5BQ5wWWrQT8SZKB3TZ264xbYQCQiaO2vlFyYPZuV4j84+XwPnXiXxU
         QzQjWawDo38FWDiOCoiBFn6mTlxpRJMQ9lXUTVf4q2Rfugl6LTjioYP7WqiASEVrK8MG
         Z/D0dWNzzp21YqwNe4PQKAlSd3PnK3Qg1TwCL9mf4FAFiSp5yPA7LdfDnmJ4U5ooBH9i
         PAZPV4PG6Ch89g7Yhga5GoisiyQFz7IIGxmwhMQoLKprY2n5LaBdDnz1bNeyokSgMzk+
         FWqg==
X-Gm-Message-State: AOJu0Yw17/xncUm0DY0lYa00micWsDoNSUgFr2Lsb9Dv2bB6QQd6yl24
	69QOIwZJsyCK2Psn0QUHBKP+1H5Pcs8YE9QBogq+P3kEAFYiG6pWzsfj
X-Gm-Gg: AfdE7cnPS83d8817Z4nYTjVich0No+rgqlID/gJNuhoLlc3ydFLDtYyUl8CK2sX3fXF
	beGOtstZm9rX3wY0JWHteUXHQjZHwX/1/zyUjFeCU8UmBC4WBy7T6MeclSL+Y+bUAQ1rUZ2KOB1
	PUtsL04PcBL8Hz+UzANFyatAhQyIfq8WhNgf9nbSelkyHkEsphxUwqzLrQ6VBIZzXWbdDnHAKk9
	QuygqPgukJm1FF1nRr8WySYwai30YmwTNsod1DpMOJFm60k458Z9ecThJjfW1ljSjtS8lpL0C5X
	RFd7Dx0GLqSfjZXHgRvuZ4JgddQrgyBoBu1B+gPffzJpXiDA/MOUwfCvfSSKAl33t+UM79bjo/K
	GRWU38U4PP6RaeVQvXFNK2gVJCjGRwcIF08QZOSP6MvJ21HnkR2+Z8bMiQDXRdDq4pv2MIiwUhX
	31EOG03FVzd9y9eSYLNizIPowGcLc7OGDaiGPitoR9juNkU4USL9c=
X-Received: by 2002:a17:903:2310:b0:2c6:b3dc:b831 with SMTP id d9443c01a7336-2c6bc23de6emr39519415ad.27.1781699956861;
        Wed, 17 Jun 2026 05:39:16 -0700 (PDT)
Received: from localhost.localdomain ([103.87.58.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8c1f9sm167722655ad.59.2026.06.17.05.39.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 05:39:16 -0700 (PDT)
From: Devansh Soni <devanshsoni874@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Devansh Soni <devanshsoni874@gmail.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: remove redundant rsp_allocated_buf
Date: Wed, 17 Jun 2026 18:08:53 +0530
Message-ID: <20260617123853.63022-1-devanshsoni874@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original code allocated extra memory and manually aligned the
rsp_buf pointer to a 4-byte boundary, however kzalloc() guarantees a
minimum of 8-byte alignment so this was unnecessary.

Also, because the pointer was shifted, the original pointer had to be
stored in rsp_allocated_buf just so it could be passed to kfree() later.

Remove the redundant alignment math, remove the extra 4 bytes of padding
from kzalloc() call, and assign memory directly to rsp_buf.

This allows us to remove the rsp_allocated_buf variable from cmd_priv
struct.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
---
Changes in v4:
- Dropped PTR_ALIGN() entirely as kzalloc() 8-byte alignment is sufficient.
- Removed the +4 byte padding from kzalloc().
- Completely removed the rsp_allocated_buf tracking variable and updated kfree().

Changes in v3:
- Replaced manual bitwise math with PTR_ALIGN() macro based on feedback from v1.
- Updated commit message to detail kzalloc() 8-byte alignment guarantees.

Changes in v2:
- Wrapped commit log text to resolve line length issue noted by Greg.

 drivers/staging/rtl8723bs/core/rtw_cmd.c    | 9 +++------
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 1 -
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5..fd1ba1b4e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -178,15 +178,12 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
 	pcmdpriv->cmd_buf = PTR_ALIGN(pcmdpriv->cmd_allocated_buf, CMDBUFF_ALIGN_SZ);
 
-	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_ATOMIC);
-	if (!pcmdpriv->rsp_allocated_buf) {
+	pcmdpriv->rsp_buf = kzalloc(MAX_RSPSZ, GFP_ATOMIC);
+	if (!pcmdpriv->rsp_buf) {
 		kfree(pcmdpriv->cmd_allocated_buf);
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
-		((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
-
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
 	pcmdpriv->rsp_cnt = 0;
@@ -232,7 +229,7 @@ void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 	if (pcmdpriv) {
 		kfree(pcmdpriv->cmd_allocated_buf);
 
-		kfree(pcmdpriv->rsp_allocated_buf);
+		kfree(pcmdpriv->rsp_buf);
 
 		mutex_destroy(&pcmdpriv->sctx_mutex);
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index f78aa0d7a..66b970955 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -45,7 +45,6 @@
 		u8 *cmd_buf;	/* shall be non-paged, and 4 bytes aligned */
 		u8 *cmd_allocated_buf;
 		u8 *rsp_buf;	/* shall be non-paged, and 4 bytes aligned */
-		u8 *rsp_allocated_buf;
 		u32 cmd_issued_cnt;
 		u32 cmd_done_cnt;
 		u32 rsp_cnt;
-- 
2.54.0

