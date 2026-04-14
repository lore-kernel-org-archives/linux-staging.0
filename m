Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790FB3B9DAC
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157996; cv=none; b=WXnEXJszW9mExqJg88ueZ6wza8W0J9PCMKTZEu3H2IRTyph1UJtezSIwKB4/rrEfVVkBnbcwiO4vNuvVokIx8PT/Wi/TPXVhw2ScCcisUGoAwNqnDz7g5G05lfEnF/lJpi1B+3h66RZRBeQfWqXK6AEHw7rZsXx1BJ07Y8MGeNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157996; c=relaxed/simple;
	bh=RzEL6YecJLWxbFnpd/tO+rbow5SRmVdpl86aYOarnDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEPYn8AlKW1wrHrN4TB0wjSHLqWd6B9672G1Ls0k/Oi3aMC/VSe7XczPeFuqXhcP6fZHTo4a0d101Rwdoeiv9CpKy41i4ECHOi51jfjiHTQ2IsvKcYR07sFO3jwDDBIyr9ABemjbopohBicBeUy5QLUV2Dq6QJQLTYLuejFmTcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnrR+FMG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnrR+FMG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so729839866b.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776157994; x=1776762794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/UqgvYl0+LgOmppPltA1iiWZIT64IsidcStLZbzccQ=;
        b=VnrR+FMGvw5iB8LoQrwTZgM3Nwo1cdq8I6D4gyMS+37r+nJ++ZiDBGJD7NNce5jTF/
         bAf5V71LGsO2Sijzj+Jr8qkpxC8l47qfemQdPtZaIypE3tJtLsxw2MenMpcfGm9yUycX
         vhiiVKBXvx1gLE8WqxjofVIqgIPpUC/j+eI+UyzEHvpeZU+K/zq1AIZ00blbPwmEdjuy
         iXbsCHQtjb7aI8Gs8eRb3AavCGbCaNq0N4Ax4GyRvq61g+MbTbw3LDrM3eBRMsgBiGvB
         +h8lSq4lyE82pH7Pp4sSTlg7M4MdowOxRB24Scevfj2x0oYTQKsGfjg6M9ho/01kJRZA
         HpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157994; x=1776762794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/UqgvYl0+LgOmppPltA1iiWZIT64IsidcStLZbzccQ=;
        b=Sl2WxB7CtqSJhGSNTQfJpQlV+QW/lnrwnFGwxhfmwxU0O4IbbXo5uXUVoRPgibaCaB
         BFfiqYWPXe5p0+OuXsTxFnc85Hd07etOhkMiCLk3q8VNYNErdH98AHv5RUyq4KUd1kvJ
         VsM9ZUY3Mef65u5GxeDFx9Z20sAAeKOKQ6LeOCJgAa4SA0xxmQPFBRPPcKD34NB3hvZf
         bDcgdlK6IKU7szKNmWUUo3ZPTyIF26adDAFKF4/vTYraQzz5OLMlVmAzJWr1MLK6Edej
         uqonSWF9pa9l27pVyRdnc+0uB+j3LbFkXufVD135nXefFs6+ZEAXcPmJ66rL0TPq+P4c
         r7tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/siHA9Ra4f3EvEiSK2sGor1plKeoFhGdxjlVOHqofCOoFuu9w/ujBjhL7jmltRwcHBb+MARQc44mrCT3P+@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd0e95QSzkKC/Cx4aIZxEmq8k1EcCZftqj1O/UJYqr/DhfMXvd
	YaXYU69L46TZpMhG3lEoAZ25hDsmhtHs8W9DDFm1oL4PJsLpuLrgxW3U9PYOxCpxLco=
X-Gm-Gg: AeBDietcPtYXZ5nsfGBTHLq8kWu0A2hNm9JL8YdpDy+IWxcx/v+i0L846YSMp4VtHLW
	nob+4BYEh6Rv0wxr74aaMC6ptUIvv/Y1UibB0YOhSuQmCvSP8J/rQ7DUo+WjwsLW4bfjImFfJ4I
	Zyv+CllfguL833TenKATtA1R/38pltv18duWBW/AOtjlUZFqOtgWJqZAFkAt77BJ3akvwFpdWnE
	ZzeWAd37114Y3i7E0shlRPwnxYMpTi9DEVrqDggeNnHJqGPdixx4GLzpTUMWaz0y0qVxX7lywV5
	8B3U6BX/pWW3N8cYOh2L7XZoRfkdEHH5/Vuor7auXyDC06xX31p7BIqREQwL2sdJnzgYM9UCI15
	bxwAA6/kAp/LGImSsB2+xX5S2uOSnNor1Uq9NhV64lwH44HwhfNrc/LtpRiN5zjJgQNrhMNwAUl
	1ImLUxrTfSuRk1z1gsoQxuUixEkAyG/R7dXwbb27/OdolTysrGPdaS73yOCUVcAQSVC28U2Bwbd
	2+3id39oB7yEPP1m7npExxM8oKZOrl1VESLypj5PdrAvu6cPWC3uzTPKygRJMRvOZNaLvfIvkRh
	h8od3rxqsGE4TxSdYAq58yZ4yClHvec53kpr8rD+HftVwWHv7jL4K22gXDdHF3WZ64uj8V7zBEX
	vmJdwdZATStaSW8fCQg8SzVCHfjw84zBA1j3peVJXcXvIjbBpbtBGziAmqiw57wbV7ERVJu9GoK
	2DWd/7Ajs=
X-Received: by 2002:a17:907:94d3:b0:b9d:6483:6711 with SMTP id a640c23a62f3a-b9d7281491cmr945606466b.46.1776157993612;
        Tue, 14 Apr 2026 02:13:13 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (63.152.141.34.bc.googleusercontent.com. [34.141.152.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a44sm384466866b.52.2026.04.14.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:13:13 -0700 (PDT)
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
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 1/3] iio: frequency: ad9834: clean up includes
Date: Tue, 14 Apr 2026 09:12:48 +0000
Message-ID: <20260414091250.1295-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414091250.1295-1-joshua.crofts1@gmail.com>
References: <20260414091250.1295-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up includes by removing proxy kernel.h header,
add bitops.h header and order includes for better
readability.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index d339d5e8e0..eed4e08920 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -5,19 +5,19 @@
  * Copyright 2010-2011 Analog Devices Inc.
  */
 
+#include <asm/div64.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
-#include <linux/interrupt.h>
-#include <linux/workqueue.h>
 #include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/list.h>
-#include <linux/spi/spi.h>
-#include <linux/regulator/consumer.h>
 #include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
 #include <linux/module.h>
-#include <asm/div64.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-- 
2.47.3

