Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D335EBA28
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3216ba1b01eso997551f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306157; x=1695910957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gabiCx8aQ+iMVEJft2DL0LHbd3RWq71VIbUUi+w3JfM=;
        b=wyPYYf4iZzpNW8cK9PgmIhlvXUs7Hs0lNXSy/oEudWpqDfM1hJm+QdIaKEmYq+QEdp
         2oWdCkpuC/MiiMskNkf4e2Kk9UGBlt0QRrO4Ma+utD71WdhZ0eKIhLaTTxElVYkZ+XpC
         g5vtexwIl+vMf6UPkJrfh0cRzBqSgYfWpIK9KAh1zkOQ0UnOzb9/Z9AyXVObzpTDshSX
         Fk5N0oPFDDjEBCcBIujyJimvO3paMSdSJq4XAk27y8yie31OouGR8xfi6UmXQH005N60
         +592xstB5mHLTpVnUwYnse3Lz0/2EHyfbVHx1sV0EHFpJnh8NS/67EGeBDT4Avy5xHkV
         vIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306157; x=1695910957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gabiCx8aQ+iMVEJft2DL0LHbd3RWq71VIbUUi+w3JfM=;
        b=azWAIgoOeIUuSTW8xx18+7R9Mw5WzQ86HZFOL5CVNotKJ1slYod/MXP7yFPmoEJZua
         0HwN/nuazJQDvFZxZZD3QNLw9Kvl3VPT5MVVhHs4I8okRxmQM9Q9o3OdZbUPKA8SRrk+
         uu/dzeermI3UzrZqLSAL6ET0mbjndCalcq/TGq+zuwUPUbnixA+8yU8DfHffSAbxs1RI
         z0PiC1HA7Tv9Kp5nYj0/kLFkgUgCOlHkdX/38yEvaEkg/9Q2w875iGz+lpmU28UXeJIJ
         Xo8du0j3IpISglL/i7VUR/UYgavzHFnjWxHjHHY0mMweJqX+6j3JsnO70FIWAuHCMwex
         A3HA==
X-Gm-Message-State: AOJu0Yx2+Lg0kbLidLWO4V20WnWRkBhIZlUqIsuaXdHC66AfdZ7tAWpJ
	Yl2xbp90SY7JKWzVtgqCWl/xhBcjy4bxgNtqpzvJ+hxS
X-Google-Smtp-Source: AGHT+IE4sDvMSw/UkfMczfXLxgbpckMACuzljnUTY5SM6KE9BEVvGBveVsOv+3vfUogJ5wktpvrmbA==
X-Received: by 2002:a5d:6e54:0:b0:31a:e8e6:8a96 with SMTP id j20-20020a5d6e54000000b0031ae8e68a96mr5153996wrz.67.1695306157156;
        Thu, 21 Sep 2023 07:22:37 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [v2 06/19] staging: iio: resolver: ad2s1210: always use 16-bit value for raw read
Date: Thu, 21 Sep 2023 09:19:34 -0500
Message-Id: <20230921141947.57784-9-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921141947.57784-1-dlechner@baylibre.com>
References: <20230921141947.57784-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes the special handling for resolutions lower than 16 bits.
This will allow us to use a fixed scale independent of the resolution.

Also, for the record, according to the datasheet, the logic for the
special handling based on hysteresis that was removed was incorrect.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 9c7f76114360..985b8fecd65a 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -465,10 +465,7 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 			     long m)
 {
 	struct ad2s1210_state *st = iio_priv(indio_dev);
-	u16 negative;
 	int ret = 0;
-	u16 pos;
-	s16 vel;
 
 	mutex_lock(&st->lock);
 	gpiod_set_value(st->gpios[AD2S1210_SAMPLE], 0);
@@ -494,20 +491,11 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 
 	switch (chan->type) {
 	case IIO_ANGL:
-		pos = be16_to_cpup((__be16 *)st->rx);
-		if (st->hysteresis)
-			pos >>= 16 - st->resolution;
-		*val = pos;
+		*val = be16_to_cpup((__be16 *)st->rx);
 		ret = IIO_VAL_INT;
 		break;
 	case IIO_ANGL_VEL:
-		vel = be16_to_cpup((__be16 *)st->rx);
-		vel >>= 16 - st->resolution;
-		if (vel & 0x8000) {
-			negative = (0xffff >> st->resolution) << st->resolution;
-			vel |= negative;
-		}
-		*val = vel;
+		*val = (s16)be16_to_cpup((__be16 *)st->rx);
 		ret = IIO_VAL_INT;
 		break;
 	default:
-- 
2.34.1

