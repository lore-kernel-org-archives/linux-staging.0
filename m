Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC3481B1
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765227; cv=none; b=fPmKTrk4UjtfBC4y/DPCYH3t/cRSXYCTZcSAypKMvamvxF0DE1BsjlihMh06nm57MT59zoaRbFSWxe3CH0JBdTJGsvZl+uLY7sRW4VO3zKIW+DEDxVx8dbIzQDYpZD4ZPaZ+lIy9OmrtKXyQs52b8A1+4gICeXwWcHRGfx4pp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765227; c=relaxed/simple;
	bh=cc+an+SM+cIHC7FHYJXBcmdYeRDBZ0LpEYzmV49yTxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DF6vdxrjIgmEjAm1JpkKqVF6wV75BqXPNUqYgCwID8554GIg6DNTkme2d2bl1IHbuOqRTfH/EkxWDFqrdTJHAndB/LD5TSbbgO48gspIMHJJKpnvpsTvkQUGWHKKlqWWOq8vpEsKFaNiwYnXOVksnMux7lmgrLvPafI0Wp0W4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyctEZzv; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyctEZzv"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-953aacb9d78so153272241.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765225; x=1775370025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysejrTV2AB2ou+MZFcLfbgdnpWQTQns3Jqxq0mhdpzk=;
        b=gyctEZzvFiH0UrKR9LPf3elN8B3QOwNDDuEyMi5y3ghUDn5TOUVNYw4SgOm2Q3+C1K
         /j8mRuj9xRTw7R/IB/itvGgvAb/LJy8lwxrB84YGrkpobI4cKjyAdmQ+IzRggLCKwusq
         VDIRrwAlpuLB36zSn260z6qieCLnTUVUeu6hMxtTju7+1mfTODe9d/lS9mA8eLXzChST
         vMGArs0tGegGOAUwJ8MYkLmmt2rBf0YkBTv9CdRTRCX4gIkdEtVmnD2gYkRxHH/gMkME
         X8Ym8x69cZDGs/PxiaHk7eIZngEhSVLUS8p2mCudU4HURX8Hep7O0Og4qZ8ZLqH4gFJW
         iiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765225; x=1775370025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysejrTV2AB2ou+MZFcLfbgdnpWQTQns3Jqxq0mhdpzk=;
        b=VPOotagKMj5RCaqQsd5W4P731hPy6K9PqoHOAXAu7/jUf79zo6YH5io4u51PurCAtb
         Ylc2tM97n3+Fb8/7VwRHc7HILXapVHG3Q0rwiU1MPENMz8Dwj4oRBTaQo08Y8R1e+Isb
         8jwe1dhnJ60WTwvaOjxdnpgF0PQj7/cBPhnL/X5XP5kvSBEaAIZiwCsERyUcYCh95iNa
         KeimrGt4q4EFSswZPo1ATuOOkMdnzT5tHoJoq214w/cmOY9q9vW5T5md/GdK3hI5QUSy
         lRZg8JnwJrrsWUy13RDo3jR7Vq960cwtom4W96e1rZsdlmLPZuydnGL+D8YerzJV4x1p
         rVIg==
X-Forwarded-Encrypted: i=1; AJvYcCUUHtrp32eVBAjPQsH3y5lvtZhfOXl1kT7Rt0S5ohc+uGoiDAxRVDabtTGEgVtlNSXmMhsRYYQ4FJZLV+Io@lists.linux.dev
X-Gm-Message-State: AOJu0YxnaAqBkANm81TMe+ne26gdGGoOgRVgl/m5k1KFxR7pGJgxFnr8
	Vcm1Lzcihuedd85XJmnZkScSsT0+yPiwDPcP/WgLgxWEwLSMT9bqrn+p
X-Gm-Gg: ATEYQzzQ8TD8VeM2eoaCtpfVgnscyn9oK5PCrOgQ0HpBxGnKKa1V07ZHlHTR0IuRUsN
	/tWAKful6EZwpO4LpwnuRmaYaNtZdzSZR9n0TIekx/2CAsnnVfxj2N8JDTUpaGFWitvQjuq9jaM
	1cSy/rQ81OmVgVADxrV7L/VKpT3nWQhaxru02FNfGD+pJ7dLXlJ+0yVlW4u8PRBp1bG9G/DRPMT
	O7DGopfbZY5vNWQC9EsXXvq9Qa5o4AO2AiM1lOlmnDARqeG2uENsaGSmlpAFiKx+PzaxQgFRtiO
	QlGHWZNxIBEU9/mQjsZULfdsbeo6egCPhS/Ms2t/gLb9MZ4uptx6DZdHL8LvVv/wXvMb95A03Gf
	lhF1sDbc6l9atgXseAR2wABQf/Z5gZEdmsBJalx4w0u9vzjAembgJWf9id2zZEieIJyB5cDOpfO
	1mt2hvcyGhOxSLpftYuzhoZ8Q2
X-Received: by 2002:a05:6122:65aa:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56d4a6652f0mr3243971e0c.16.1774765224710;
        Sat, 28 Mar 2026 23:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d76:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893d21sm4429929e0c.2.2026.03.28.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:20:24 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 2/2] staging: vc04_services: vc-sm-cma: add address validation in clean_invalid_contig_2d()
Date: Sun, 29 Mar 2026 00:18:46 -0600
Message-ID: <20260329062004.492812-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062004.492812-1-sebasjosue84@gmail.com>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

clean_invalid_contig_2d() performs cache maintenance operations
(dmac_inv_range, dmac_clean_range, dmac_flush_range) on a user-supplied
virtual address without verifying that it falls within the user address
space. A local attacker can pass a kernel virtual address via the
VC_SM_CMA_CMD_CLEAN_INVALID2 ioctl, causing the kernel to execute cache
maintenance operations on arbitrary kernel memory, potentially leading
to data corruption or information disclosure.

Add access_ok() validation to verify the entire address range falls
within userspace before performing any cache operations. Also add
overflow checks using check_mul_overflow()/check_add_overflow() for the
range computation to prevent size_t wraparound.

The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
reachable by any unprivileged local user on 32-bit Raspberry Pi
kernels.

Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../staging/vc04_services/vc-sm-cma/vc_sm.c   | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
index d597d41b4..29aa5a939 100644
--- a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
+++ b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
@@ -40,6 +40,7 @@
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/of_device.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/proc_fs.h>
 #include <linux/slab.h>
@@ -1263,6 +1264,8 @@ static int clean_invalid_contig_2d(const void __user *addr,
 				   const unsigned int cache_op)
 {
 	size_t i;
+	size_t last_block_offset;
+	size_t total_range;
 	void (*op_fn)(const void *start, const void *end);
 
 	if (!block_size) {
@@ -1270,11 +1273,27 @@ static int clean_invalid_contig_2d(const void __user *addr,
 		return -EINVAL;
 	}
 
+	if (!block_count)
+		return 0;
+
 	op_fn = cache_op_to_func(cache_op);
 	if (!op_fn)
 		return -EINVAL;
 
-	for (i = 0; i < block_count; i ++, addr += stride)
+	/*
+	 * Validate that the entire user-supplied address range falls
+	 * within userspace. Without this check, an attacker could
+	 * invoke cache maintenance operations on kernel addresses.
+	 */
+	if (check_mul_overflow((size_t)(block_count - 1), stride,
+			       &last_block_offset))
+		return -EOVERFLOW;
+	if (check_add_overflow(last_block_offset, block_size, &total_range))
+		return -EOVERFLOW;
+	if (!access_ok(addr, total_range))
+		return -EFAULT;
+
+	for (i = 0; i < block_count; i++, addr += stride)
 		op_fn(addr, addr + block_size);
 
 	return 0;
-- 
2.43.0

