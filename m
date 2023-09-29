Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25F658A9
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:52 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57ba2cd3507so5855923eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008352; x=1696613152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gkx5P/I+qjqJv4UaL/3S8ec+xgMfUSpu8JHr+ZyL9fM=;
        b=Lc6ZGGA7EWiQdRsG9ThdAz9d5gkSFofpfcZrdqAPmue/ugQ73aFjsWokOguGBhupU2
         g7F746RUpiKtZgNp7A3XDmhQWZlG/Syv3LrgSdl4JfTdSV6FdWnkeLkqecbvBVDg1+lB
         4fh9ICzBvc6drYFcFq40cIQzg0+2kR9rWFnGUZW2WKNkk0lULVgPlUHyaUqEz88rbnJ+
         Xv4Crmm/yd6WxVkyP/jvkksFe/ztghl5u4s+Zfa894L2amM1tcFPh1B6ugV9oxrgxHZE
         m8gklNa+6cD+NMx4LKauahmP/dYV7oYkoFYz5q0k2eoo+moEPBs3NymWLhJHNYIRCigV
         bHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008352; x=1696613152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkx5P/I+qjqJv4UaL/3S8ec+xgMfUSpu8JHr+ZyL9fM=;
        b=bS5XzzweaR/T0HSFb0JCHEjgOvenAhAzhys9Jsn4k933o9YqgcDmJ1VjHYZnu+omks
         Hu62LyeD9HjRB+RoTp/UXs7Bi4yWa/QQCJ4x7qJKH0KgCk9lZPkkwmq2p9MZSdgEqiQH
         QK2JfG36wuwwVms+8BXxJmMEdyFMJpVjABAHGEwiPfEn0PfQaGoyA3s6s7uENMrHkgER
         yOgn9osc+KiVBTL5TLkvMhkN4G6NRbhvj1XAETln7BvueCJZeTL82SDFiH11rhHTAZyE
         jmbwxIhRRpsEVp29zvO+nz6L5rxZnZdb4yCPRnL9iTmMgZ+KYgohZktk+QF2cXBcngnn
         87IQ==
X-Gm-Message-State: AOJu0YxDGuur491uRKD/ILhJ5O6MJLXd2aoK8+yUWJP6Lnn+SPxEPCtV
	zwpRKn+/ctb5shOlLNBtR02lUQ==
X-Google-Smtp-Source: AGHT+IFxikc/8KvEMGZ+gJBnorvyfx+jDYYgmBwRwAiusDLE/tDFFURBfLomSTduLrTMqWfQBD006Q==
X-Received: by 2002:a4a:3c07:0:b0:57b:6f5c:c90a with SMTP id d7-20020a4a3c07000000b0057b6f5cc90amr4717791ooa.8.1696008351927;
        Fri, 29 Sep 2023 10:25:51 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 06/27] staging: iio: resolver: ad2s1210: sort imports
Date: Fri, 29 Sep 2023 12:23:11 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-6-fa4364281745@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

From: David Lechner <david@lechnology.com>

From: David Lechner <dlechner@baylibre.com>

There are quite a few imports and we will be adding more so it will
make it easier to read if they are sorted.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* This is a new patch split out from "staging: iio: resolver: ad2s1210:
 use devicetree to get fclkin"

 drivers/staging/iio/resolver/ad2s1210.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 28015322f562..832f86bf15e5 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -4,16 +4,16 @@
  *
  * Copyright (c) 2010-2010 Analog Devices Inc.
  */
-#include <linux/types.h>
-#include <linux/mutex.h>
+#include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/spi/spi.h>
 #include <linux/slab.h>
+#include <linux/spi/spi.h>
 #include <linux/sysfs.h>
-#include <linux/delay.h>
-#include <linux/gpio/consumer.h>
-#include <linux/module.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>

-- 
2.42.0

