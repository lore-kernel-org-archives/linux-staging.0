Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2031B838
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771419224; cv=none; b=LcQaF0u0KcE4dhPBUlCIQsa4UbsUtiDNk63Q8qsc2t30zPkNe3iVgFFHt8xIC6zXoYXUrDC6QUI95BRCoLh/NzGBTQRv18QwhuKfqlVrK2Clch5nsQb03fvRe3eb3zyUOiP4ztYkyI3qn6ijb7Wd+qJ3v9+zIlWwtpf7KjRy+sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771419224; c=relaxed/simple;
	bh=veU5TcgEYyCy1wNNBap2rC6OOe0JEAczI/QDmzajykI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lpOVMWnG4jGTkjDyMoGTFMBBDIM35h6BsoqhmNl0GHYZSOExTOnY+6ml9kuvEhpPe+Clmo4oLeCcNL/BoZG9UnrdVVxP68clBzL1qExor3WlzIPCm3UYcaaVKJtIwrqUx64RjLfBoHpMAd/XO19efzHu1IZf9czh9tNDr3UVA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oin5XAFV; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oin5XAFV"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c5513f598c0so2053551a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 04:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771419221; x=1772024021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFam5Du7VImRJOMy7ZXZVGOriiUs2AeEepbg/77PsKc=;
        b=Oin5XAFVnXfvVq/e9JwCKlIRm1tUQRUt6gojHQ2z1BdnLGUk0mAWsbADHJzSNnp6H0
         ABuJM4rXLCtN+HHF8bjRNGJFtqm1Ykb5RuqzoJyTT1qLsY26+XII4po2XRgw3EgfiPbo
         DMuhYKkML6hi5KUGMH2r3V3nd9OflFZx/hFHoAtHEG/VsharYu5kzeWFaDwcirZaQqcb
         0mS47Fs3uS+NFljcBJDYWSnOqw9RIjxCQmt0JIiuETtRtCnhrjXbh75O/TtF92ffHYJK
         M2qPYVamSPcABsEEsAhssrzdD15F4LqgDrxjZJZV3vs9kE1kIv1VP4xuDi4J7f8gEIA5
         Fshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771419221; x=1772024021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFam5Du7VImRJOMy7ZXZVGOriiUs2AeEepbg/77PsKc=;
        b=mw1iPNyh0URDqCFjBQlDIMRtbfQmYOYG+GeZvGUf259CVt6JK63d13EBc6PG+nQxcJ
         v6HfmLv5b2V37D8QMTJA2pOYp43lU2YomuIvCKbTJFbtk/FYoglcMBKqwjQu01EB2qfW
         S0n5scPZGZfrzPRBSt+2hXBToTa8rEWCHuLggGLOnj6e3kMI9sHUhLbVhfEtelgKw2dk
         3a88UTQ3ftlShiw48u2JAHWwMWF53GQkL1XkccvP0qwIxL/mCtPyiq0U8pWSsn06xw7o
         65aYQH11ADBM+L7JMw0DTC77ZK89tXBcenyb04XQH1YBEGmxDUkCa36+uPsFVe7VhVuO
         pMJA==
X-Forwarded-Encrypted: i=1; AJvYcCWh3ryuy1IPzLdeBiGAb0OWPc9/eF7ji1FMdVd2igF0Vti4jPO3HchZrBkwGkKz1hwlqWOdluB3IHTGlXX+@lists.linux.dev
X-Gm-Message-State: AOJu0YxvLJQBGfWL/Y/+U7Fy5Bt9CVKiDQRDE/xBgwO7cCGKv8AOLC7Y
	4gdwI5dp206v3xh1oz5oWiohyx47gL9xvcsReBrdxsDJsewhIzaEMirP
X-Gm-Gg: AZuq6aK+2/JuIy5yo6M7IG8jksH0xND7FkMF4f13lh7hpmBiOIVPAhPU8eJiFXt5oX1
	rvdTyqbyo36vQr9agB/FWWQCB+OUX8Xhi0JhQBKkcl2Aa1c8m1IQQo4bzQ7ElfX8bOjKOBzfLYu
	+ZJ9LjwBsey7v3L+LjY1D06mSkAVzkn0SE1EnZDU0EmbgrrtrU8BPihIhiW1x+n9E0CW5ijPaR5
	r3krRLhii2nXSvQRePAAS3MM0jqb8aA489rpulP6OJOFgUjK6yv5HizcndVsQmcCGtbQByC104J
	VtQnLcGn/wwTzLCHEDSMu0rV9ylVF874DxCp1cc1salhDKAvGt2WiWOgkq7ySBo4lUsLU6CJSHy
	M/sk9GPt8R8Cn5UblkLgnJcVlkdm/Y/dDcgunbeisaBuHc0rmxBlM5E25Fnlm8JHIBgBjZXRMhd
	DjGdBHGV+FuQZepmFcKp3mbmvkZ8CfVNZ7XirC0qyU
X-Received: by 2002:a17:902:ce06:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad50f742d4mr17178385ad.44.1771419221059;
        Wed, 18 Feb 2026 04:53:41 -0800 (PST)
Received: from debian.ari ([152.58.183.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a73c6easm179460295ad.39.2026.02.18.04.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 04:53:40 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Cc: gregkh@linuxfoundation.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v2] staging: iio: impedance-analyzer: ad5933: use div64_ul() instead of do_div()
Date: Wed, 18 Feb 2026 18:23:27 +0530
Message-Id: <20260218125327.21467-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace do_div() with div64_ul() since the remainder is not used.
div64_ul() is the preferred API for 64-bit by 32-bit division when
only the quotient is needed.

Also replace explicit casting and shifting with the BIT_ULL(27) macro
for clarity.

Note: A mathematical simplification to `(freq * BIT_ULL(29)) / mclk` was
suggested during review to improve precision. However, as confirmed by
maintainers, the original driver's truncation via `(mclk / 4)` might
be intentional or relied upon by userspace. Since hardware is not
available for verification, this patch preserves the original logic
to avoid regression risk in the absence of testing.

Issue identified by coccicheck using do_div.cocci.

Changes in v2:
- Replaced explicit `(u64)(1 << 27)` with `BIT_ULL(27)` as suggested by Andy Shevchenko.
- Kept original arithmetic logic `(mclk / 4)` to preserve behavior.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 85a4223295cd..f6d3d98b6c6a 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -194,8 +195,7 @@ static int ad5933_set_freq(struct ad5933_state *st,
 		u8 d8[4];
 	} dat;
 
-	freqreg = (u64)freq * (u64)(1 << 27);
-	do_div(freqreg, st->mclk_hz / 4);
+	freqreg = div64_ul(BIT_ULL(27) * freq, st->mclk_hz / 4);
 
 	switch (reg) {
 	case AD5933_REG_FREQ_START:
-- 
2.39.5

