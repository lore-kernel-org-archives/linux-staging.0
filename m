Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E769475
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:19 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40479f8325fso11094615e9.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307458; x=1695912258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gabiCx8aQ+iMVEJft2DL0LHbd3RWq71VIbUUi+w3JfM=;
        b=R0bEWopnYjdbQHecVCk0tNZU6ArMzE7ez5FqD2955RB7KCC/T2xlLOiwsoeCsL/6i9
         UBrEj0v65sh1qmIiVjT0TbDH07Sk14RMl2gFP6zqKVRYT0m7NLNHqmiqn9wRuSfOO1j2
         5SmzYVWfYQ0fALllcN+4DZ/nGTcYL/f7Zj3ZkNv8RJ7tNCqaRRtafqwwFbdS9K/HSqF+
         Dw8WJgfWfkW14361bRoqywSixoGoy8mMYupHe0cnmdZCXXotXqj6pD93z/8hFGSbaPOk
         1+9GHGyLqW1TkCPaPxQSJ4ONlEyTq9CvpRRWtMrOOWKCDoh1boPPimdYegJfyADPJCDW
         gikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307458; x=1695912258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gabiCx8aQ+iMVEJft2DL0LHbd3RWq71VIbUUi+w3JfM=;
        b=beePpfxMhS1JJm4yF0FNIG0dedZI6wZ/vSxvB6D9yV4YRHOd113+XyQ9TShk0Cmi/1
         p/+7Xi1BL3ooINV3D+3CpppgInEoJ4GzlC1WQqqCOBtU9qfzHx/WXaSaIJJc4sJ5vNNp
         0CLvBTZn4Zghmp2O97h2VVfe8Tvi3ADWaZLYj+EeH9qLeJWXSTqYmuFrLKrz2RI+LWOm
         iSrUF2eMxHmtc0jpIeCWPYK55KYSR14g0yUBdvMtcnzwwfIScYUBBvoffoy/kvOZmtia
         rVuaHDNox5N259I6lgc8zvX5USs2NDZEr6jqhkLij+xPCIZLYGsBWH+Dm1jXnXoM0KJ1
         1dWA==
X-Gm-Message-State: AOJu0YyNhJv7rAwDZi1z1IvnFUvexuFatGVGlpJvlufY7ej1wHh8bfsQ
	+vsEzdVPeOApinjQKhvSies0+g==
X-Google-Smtp-Source: AGHT+IGMZl/TatrnYES3LNioCY2DwT26zyGRXXVW2ZtQaBOVUD3PWf2yg31geciAz9PBdjwldIVOpA==
X-Received: by 2002:a05:600c:ad4:b0:3f9:b430:199b with SMTP id c20-20020a05600c0ad400b003f9b430199bmr5382331wmr.15.1695307457930;
        Thu, 21 Sep 2023 07:44:17 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:17 -0700 (PDT)
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
Subject: [PATCH v2 06/19] staging: iio: resolver: ad2s1210: always use 16-bit value for raw read
Date: Thu, 21 Sep 2023 09:43:47 -0500
Message-Id: <20230921144400.62380-7-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921144400.62380-1-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
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

