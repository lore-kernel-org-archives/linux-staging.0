Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10581494820
	for <linux-staging@lists.linux.dev>; Fri,  4 Sep 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525410; cv=none; b=eU8x2Q0NPe7/C1JmPMTYejWLyJkiI+5pm92CoDo7rfu56yVA81FQ7WPlWsw44silfajxewPL4EUvJR43kLDqk1ySAGIKSJjsSGJdQqMbMxudh3rYvkCPXrK+D/uhGFXTdrB87wlBF86p03hrGQoKqaUbcm0soxQ401EHd6j3rMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525410; c=relaxed/simple;
	bh=tH5joQ+dbJ4gmQwRc26THdyfzzcCWvanW+iPGsvkOcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1AEbPxPndJ1B9hKrXx86wmGRwHzYXc47y95dav8WMmDcQoHgj3V1edjXgyK3OLPeMlI8h8+2wNKCsCUzSPkA9TbGZXpKfaNv9V2N8tvOToU0f5b5slvgOM/Bfr9nEUclxSGAWfFIGkcRvF8UjyKui57HDUXPVBeahKzPbqFXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1SFbAzU; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1SFbAzU"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97bf8e907b0so625982241.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Sep 2026 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525408; x=1789130208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaXFEfCbqyYB3STA0VXC5iTAUczjE1vXIyyNkAxzA4s=;
        b=d1SFbAzUX0XIOM5aR4pIoAdX1socQG7vEehGKx8/bsCoTBTKic4ScuWtxA7c0YZXnH
         yzenPfBmjO5BJXnMHZY2B7eUg+tLIyrPNvwTUryQbfjWnqDW+cw/bPzo+W7ML054sbxR
         6GExCbWbyHrd6+Sl+4troudo9taxLxv8GibK0nPKvMA2kwN2JPflbdxgTjskNshZzV0f
         MFvXysoD2KWvzcqMFdZdAHhxRWwykXnnJPaIL4owwr9LbBZcmPSjwAgEQTHUswKJzzys
         VX10NvXhxfvMeLgvRZndEd7x1Gdp7SGwW1xudne0E6BsyO7Diy7Xo2Ohu+P+xIdrnBe4
         q2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525408; x=1789130208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vaXFEfCbqyYB3STA0VXC5iTAUczjE1vXIyyNkAxzA4s=;
        b=O/a2kJiSA0XeN3btoY7E/7S3puNtdBez02fdgR6/TrsYdpoSB0oZmC/2TZGpY741N9
         gdz6uZ2Y6J0aCt0561SrlNZaMX5y6eSsy8D3LY5Ads7kA/7dUBlFRbh4cszQtTbEZKR7
         efg8/pcCw8jwuc8yRj3Mz02iIUSpU9g3ALNythHMR+ly+OgIqlS8i5krEcs3bMQ1ok4n
         SuPcRonXlbQvx/+PxL2kn85OOgdmd+fBFsKQgU8Dt4pDb7QXqfueVzrEuhdhtmcRxbXb
         /GExPuoZh5SpQwbiAUoFlwuzp+o9AVblOAqIgDsh4T3lOgmmBTBxCcj4/0O+Rqsi4jTS
         hu/w==
X-Gm-Message-State: AFuF++kyyfAbwEWqpdrob07f2uEjTFaDfFvMJhW89lXK/q23zMioKry6
	d7pdjB9R19y/FV+3B7dSRoCJYl5v4S3FAyTAFPGXgX8yRGrcZsPv84KH
X-Gm-Gg: AYBFou3RF5XWS3cMxYhUGR33FifoLPurmsZpuxN2u1hCSTUBNNZLsJ7HynBnGp2wpLb
	cUEe7IJjK8IJfK2pxkkVNsdOkFWlnVjY6WD7v3PHShwJbtoUDOmaP55JRi7fM9wzKAr2f/1A/8e
	AAzTFY4HM3f6P3IoKOHgytDdozLbiua8oDoHDG7vsDYWrDcw9kxzsNU6c/KbJ5GS+2bwCkf0NFl
	yyg64SqwQzyfeMIKBbITGcyIw5vUiJWbMHgN7VGX0PeNd/s2Bok1BDLHwsh0XWbkkd7Xu5UJ1KQ
	wsXcbUqt5o3IUsYilQQIBgD9ilWJhCgjuRQ9tmxLIPkc0iL9vSjGgpnQRJIKajge1AzqQf4FC0x
	Iyn4hUPFyWFcU/hbXZqQuKtCA30lVtEZ22DJ00BZzfEkQj/wiWxzN3sBRcXJ+qQot40z9cGRQ+c
	qmrfS2qdLBtprdG53TLDKgS+BKqjRMGC1RFjC+yaZBu4SFoUgzvdmU
X-Received: by 2002:ac5:ce1c:0:b0:5c7:ed31:3c11 with SMTP id 71dfb90a1353d-5c7ed796b9amr2110769e0c.3.1788525407840;
        Fri, 04 Sep 2026 05:36:47 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b36cbsm1924498e0c.17.2026.09.04.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:36:47 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused field in false alarm statistics
Date: Fri,  4 Sep 2026 08:36:23 -0400
Message-ID: <20260904123623.175042-2-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260904123623.175042-1-adrianox@gmail.com>
References: <20260904123623.175042-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cnt_Ofdm_fail_pre is never used, so remove it.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.h b/drivers/staging/rtl8723bs/hal/odm_DIG.h
index 5517ef79bd..1482290b26 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.h
@@ -65,7 +65,6 @@ struct  false_ALARM_STATISTICS {
 	u32 Cnt_Crc8_fail;
 	u32 Cnt_Mcs_fail;
 	u32 Cnt_Ofdm_fail;
-	u32 Cnt_Ofdm_fail_pre; /* For RTL8881A */
 	u32 Cnt_Cck_fail;
 	u32 Cnt_all;
 	u32 Cnt_Fast_Fsync;
-- 
2.51.0

