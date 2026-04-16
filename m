Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CEA37AA78
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322321; cv=none; b=jPoRLw7MVuhHcZ4R7rK7xz5DGVtQ8GBDb9KSv+g1F5+nH7gw+Ls86cLBECAbjPOx78JjZWi9CGk7JOFCuu1UR9l1BSlRrR2BVMyE41oTozIkwaSIYPetXrsyH5MNhzCxDTjfaCCF6rAFYnXimXaY/1oKB+eaVJbj17q8KW5yjfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322321; c=relaxed/simple;
	bh=/cnRsqWfWhNWUgWgkxXglzQ1GNerJRk1XXnfGhrxeI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFbEFKTtxG5SO3f0I0yT+R8mg8jFDg7YNP48xob/UBZrsdVWIml6P9299pqaR4KqchSy19BtnDKHdXbgBESH5IqxosW6f29OT4GUH4a1ufwukln6ZnvHIMtXNIiaAENXsCjZny93wdIDvPFL2UX5n1LWn3SoU/y+XdzVC7uzxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXMxTmPl; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXMxTmPl"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f9568e074so1176312966b.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776322317; x=1776927117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrcwJVOrLuk/AFe+po/SIs1Q3hHaDdqPoE+YLreuOlw=;
        b=mXMxTmPlKG1LA2m7FsW/ni7fxmVhQHO7lNG+6tMhaxFBLuHCPwsajf6Nmvmqq/PDYE
         JkJmzApch6rcT/8AlL0e6r8rwnm2CTEK3WrGHGshofBwkhBetJ77QGPN/VOAbw6E82Wg
         O52MHLfxKmaL9XmbPLiuCfaKvZvesndnNVWG756TcE9Onreq1Wv4wK3tIB4+wtG7lFh+
         Zb8LkLdskqflq2oINj+erpJZoaFahXCxd85UQRI6vqk+oDEf5573yskpJvMhmltJumIE
         kbmApVyEf2wgx51liednbcoag5VoXiOWHE99fD3ttY5xDuMWL92HzvBwdQ7rqTbn9va9
         ZvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322317; x=1776927117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrcwJVOrLuk/AFe+po/SIs1Q3hHaDdqPoE+YLreuOlw=;
        b=sVtOOwUIlkxHJVSppKN99v2gU06Ro6bZCkxElpCQ6j9GH5/i152Bsfhi6kSyHHPKB/
         Ot2wjv5IxgnAf/Kyb0uOGl0CJbMQEwfMX9mWqh8x3gExgO7sJ1N/VXJCJVNNyzhcA7g7
         V2YWBsDIuKCcisrCrclhVGSPN0l5VJTGnfrZ3XuJGhTGJI5QXD97mPFUseMh2u8PRxYe
         pIObM94M8AxyEZEKAu8+dLNjbWUI48DuVI+WbDXCNiIpC8yfpKCgqFmdnJPDx6N+Rp2n
         a+uzSBIysSAlPXYheIqdpkZ2qICYFNuKz82P5JwE4rAeuvdWz7Rb8E6LdtpWmhrAIdOA
         IBpw==
X-Forwarded-Encrypted: i=1; AFNElJ+8WJMQKyWIiMvpawZznqQnW5Nx77TFDV4nBbMDT36PxEhhUXgB37Ejr73U0oIJl2dPgfc2oGR/HuwDfF4y@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8y5NqZA2TWcOiSV37KSTaPCtSbrJrrB7CNqBrMsHuK0U925Nm
	7bZN/vZ54hLwipfgrGIjPklc3Z6+QqG7RAj3fpFhlxnksYObt/OgxfP1
X-Gm-Gg: AeBDiesjyGLlOUccOvHk8O6ZnYuBQzo3TjwxW3HTVaH0tsoRBumxDMIpEiTuFzGde+O
	/6nbdJYe3e16aH6SbKZ9pK3q1I7Q6cdu/dJ0CStwoW288XEWxR7u+5RtQPXY9tmlghUrLwQ1Whb
	RC+O1BwnDodUkAR1XZhrJLuxX++jcyrwXcoWdqC2077jBsO1UCC800Hz7wiuu1DL/BspAf46bhl
	sXKOfld1/y0bG3SnI7mj8PoXhjLWcEGfGqEf6AhOLvpvGburpS+l2fjJ37jExvkI3YJLBT5hfqE
	2An7IPITMGlzEVGlLHeVCLlRIqNAcRbc2x7cNWQk5nk4/jRMO05zS2+tIJLuFocLR9XU2kwIH8Q
	D15qyDVAzfwss8C4ivnzPeapRLhai0TWUL9e9bifeZZGgDw2gD/YoxNPf95i89PcSeGH4Y+i7TF
	544YBiEjT8zq5+lJAzkQSi+TH8LE//Wd2LdRIwac89h0HWOPY8kzhaxkCUfIJikQSfttVNb1FN7
	J314L++Wzz01BSp0PdrDQhWn456TP6/jj7EiRK2djb0QRYFvuZkg0LjS8PmkeXv0DNWkFsCmies
	wTCkAbE6rSMKqIj9qif33jbVlQ2UjR19hb3idAQwI4Qc3gsDR4tCJYAj+M5cCUIAyYLSyDtr28y
	ISik6pc2E5cxWY4qSj8bul9GbKxt+xZiXQjLjXM+pyq+WkSgTeOFADPricoSO82YY1nW7TRZbvF
	EAmhjoK98=
X-Received: by 2002:a17:906:6a27:b0:b9d:8697:73b8 with SMTP id a640c23a62f3a-b9d86977753mr1271579566b.22.1776322317229;
        Wed, 15 Apr 2026 23:51:57 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (119.230.32.34.bc.googleusercontent.com. [34.32.230.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341a8e3sm132530066b.6.2026.04.15.23.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:51:56 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 1/2] iio: frequency: ad9832: remove kernel.h proxy header
Date: Thu, 16 Apr 2026 06:51:17 +0000
Message-ID: <20260416065118.1299-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416065118.1299-1-joshua.crofts1@gmail.com>
References: <20260416065118.1299-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove kernel.h proxy header and add bitops.h for
better dependency control and code clarity. Also
removed slab.h and moved asm header below generic
<linux/*> headers.

Audited using include-what-you-use.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/iio/frequency/ad9832.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b..fbcfdbd398 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -5,21 +5,19 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
-#include <asm/div64.h>
-
 #include <linux/bitfield.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
-#include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
 #include <linux/unaligned.h>
 
+#include <asm/div64.h>
+
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
-- 
2.47.3

