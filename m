Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263952;
	b=hsnegg9p/QY1acpZ4O32MRQLpBPvz3RwI6ztkbQLaDOYYNnGSNJP+NK67B5JNQYBJHpJ
	 qmFI7sJoWo+6UgLTa/fFHJDp1FDTASqAOqSCqvDU3Ys1kX1CaWorY0S7PWb7/NzKhy7Zt
	 mWMj/rbmxkLfBgEsCX3gE4zY7zy9wuxSnxW1EdQ18uarwM96IXWee5GfoJ8KnSWasV+UA
	 74Acl0howwa3GBdAL8govxEC18NLFwbSHhMNQO5M6XUVxksG8XRRLl+6r1s4bWh7JHysK
	 0yxdSv5G5zzZHtaOh2TgTJwcNoiD32EXOP4/thbqzQRHxSgOIX5zdxKAzuicX2O8Y4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
	b=OSKACwbyADVnvdh6WHA+KeT53dcH2PPU527v6kkRifAYUSa2spyAzxzqOqGEYD21TusT
	 dir71yk52G4ODaqkrQKWpuvZQTZsI662QA/OamjwCT1mjG5mLN2XHJP2kP2mRV5ozfnHe
	 x5AveJJRdzjnsAGpkbHICK0egERHBSuxLNQIFFKExl3qBl3ngaWDBd2gmfcK6sgB9zAzG
	 IRHAjZbNnMSfKqyuLZUG5mjIBEU7qjoWfzpVRQUBqgsbkLNGDXByQ9yUcb5e7QOyrX8rj
	 JsgYcSZeJyNgwc+c3OGR89cV7IEBOq4oI2D8wSQ3r1TvSqSV/7f9eXZdFPXWC7bM70Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARdqtYET;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624F606A32C
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 12:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6624F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARdqtYET
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso1247182a91.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 04:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263951; x=1795868751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
        b=ARdqtYETyL7/6z6xUNTnEjgUIrnDa/L7yHL8DSX/RJqTmEWZQfEQD4Zw7u8vnp6lMq
         LUcB7gI/Jcb3U9xXBtDTpQhrncZMGpvku6dY0GIJdJ6ISyEKLe6jH012AsnohQI/c9xf
         Nut+xWJ3zQu4TvaoAIIVHgkNsTYXNkmGRNqO6KMmcU9nV3j+Nc5dSMh+3cNO9MOZ7hck
         zngZyN53/r7ZGmfqlmgLOssllMwj9LbhnrTB9agvxFhZ9Ktq03OY0SDFrOvwYQAcZ1zx
         bERQd21wMCp/e+yvlZpgNrLutz76le9hD54F8baiDL9cEO2PQUqVO3IzmbqVXOYd+dZe
         7yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263951; x=1795868751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
        b=h9ZFyWse2r6MVdZLZmYbhAKyFLBTTVskv5901VFH2mA487cmJ8QSwopesKODCLb2NY
         vCt7topyADLVT4z3ahvUk9KZ21ZYS0VHCn7G7zBKMCAJ/gZz0LCtmp4bS10sWUKgIdxM
         gJSu1bafmG5aWp8L93etEWNOOoG19CteJ3E6uVWJvcpV15Xo564SGJtqbc7tb5RLgIW6
         yhvR3dAJsCQfN2Ik+LPNnDZhiuKXDjxqiEJRZ5/sFlQhkdHkY4Z3eE/ObAHar4TQtTjj
         AS9b6eCxzcpqehuXv6+MXfsh9DqpSjJ1wFrMCB3iQa1AoEJtY6DNKqeJB85e0HwJkoRJ
         tyLQ==
X-Forwarded-Encrypted: i=1; AL+hErHvb+UBs+tCJInxswiY8+ygOU9x8Q+0cynr1GSx/46lx96oq4oVgJDNDEz83KvP7l+04+9ijK1otzhQM983@lists.linux.dev
X-Gm-Message-State: APuU4Z+bXvrtHCSHSyHsexkLuJnVs8BSkooUJLlc/xRn/o/9HB1mBUUU
	zO9IQo9svLH4kaPtBEXHpnmC1x+zqk9f+iWb5mJEzEZiapXkHGvgifNj
X-Gm-Gg: AZFdTZdiYsnYDEztRN1101vCaGyH2kzkqUvRMT/Kw5z8Iy4n9H/65x+BViLRcfD4RaR
	CJddQsOsG/w69s26zDqW42JdLVu2ndYu2OsZkSNl9Pe0jf6ne0Yp+DEbJJ0eX51XChb7ABnzKYF
	/5S9wYlMEi2BDhCy05eZVmXuSUeJ21e3/H4qgTAsl+XIsJooWF8coxagZ05cbMq02jRWA0Pr5DI
	M0mxqZpbJDyCVe+wH00p0ihsF7m5PMOFOXGo3cPeIm5y38WedYQ5NWxN9JQJeGcWlY/wXXkkdtC
	0GRYJKbEmsu7KDGumIdMXN0YNIK/cr4AQLXROhdbM6g9Ft/ZVfGoLNKVo3tDZNfj45AEztJP7M7
	t568g6X/uMYfLdscQznMoMRXPFYdcGiMmbgtlMP3YX3EAgxn53B1t0QYKGJ7wN1BwY1CrkWCHYc
	H18F9mjfQBQck8kvAXyqbMrH18rFgFzndVMlcfa3IwB6LgW02LiJPaQgCQ3NqyhPUH44f72+A64
	goQwoXXuFB/+r365jRWVro0jh2CIOUNR5ncjkA5iHjGxEgXG6XoDC1p9R6FtKj8KO8+RbJyHGHG
	1+gH7Slrr8JYxc8ZnFD7VQb68TYReAtgygeWci4CicBeNcT55oFkzT9cZWfkMizAcoSji89a1TM
	q/uh+VX7Mwof/fmdg1hE=
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr5500808a91.22.1795263951403;
        Sat, 21 Nov 2026 04:25:51 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.238])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm2616474a12.2.2026.11.21.04.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:25:50 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused ISP state control functions
Date: Sat, 21 Nov 2026 12:25:44 +0000
Message-ID: <20261121122544.428-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abhishek Chaulagain <chaulagainavishek14@gmail.com>

isp_is_ready(), isp_is_sleeping(), isp_start() and isp_wake() are
defined in isp.c and declared in isp_public.h, but have no callers
anywhere in the tree. Remove the four unused functions along with
their prototypes.

isp_wake() was the only user of udelay() in this file, so drop the
now-unused linux/delay.h include as well.

Signed-off-by: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../pci/hive_isp_css_common/host/isp.c        | 32 -------------------
 .../hive_isp_css_include/host/isp_public.h    |  8 -----
 2 files changed, 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index 39cccbfa3..13ea6d2a5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -4,8 +4,6 @@
  * Copyright (c) 2010-2015, Intel Corporation.
  */
 
-#include <linux/delay.h>
-
 #include <system_global.h>
 #include "isp.h"
 
@@ -29,33 +27,3 @@ void cnd_isp_irq_enable(
 	}
 	return;
 }
-
-/* ISP functions to control the ISP state from the host, even in crun. */
-
-/* Inspect readiness of an ISP indexed by ID */
-unsigned int isp_is_ready(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	return isp_ctrl_getbit(ID, ISP_SC_REG, ISP_IDLE_BIT);
-}
-
-/* Inspect sleeping of an ISP indexed by ID */
-unsigned int isp_is_sleeping(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	return isp_ctrl_getbit(ID, ISP_SC_REG, ISP_SLEEPING_BIT);
-}
-
-/* To be called by the host immediately before starting ISP ID. */
-void isp_start(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-}
-
-/* Wake up ISP ID. */
-void isp_wake(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	isp_ctrl_setbit(ID, ISP_SC_REG, ISP_START_BIT);
-	udelay(1);
-}
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
index 78abd77c5..f778922f6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
@@ -153,12 +153,4 @@ STORAGE_CLASS_ISP_H uint32_t isp_2w_cat_1w(
     const u16		x0,
     const uint16_t		x1);
 
-unsigned int isp_is_ready(isp_ID_t ID);
-
-unsigned int isp_is_sleeping(isp_ID_t ID);
-
-void isp_start(isp_ID_t ID);
-
-void isp_wake(isp_ID_t ID);
-
 #endif /* __ISP_PUBLIC_H_INCLUDED__ */
-- 
2.43.0

