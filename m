Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3C38A73E
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 05:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772083579; cv=none; b=U0C1Bg4dfmxQLc23rAmfG+4YTsdVm944oOJdLDSSDD3/CsAyMFVNtJMzIRrU34RKTFNKgf7hqksn3b3e86VEV/Dwnie6QvAzIZC0AWFeZQiGYG9UeCYGaJdUmI8bdd0yDB6YhDy0l84u3ilFqdS/46xX9atlySiE5JaNFWMQW94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772083579; c=relaxed/simple;
	bh=w5wY9LO2Pk7znAAv+TBh8NdDYQlGt/PiTy8nFT23sMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mC22ItJFV4OLrqxK7ztekoF8cQ7/e+O0N5kJba7Ox+vxFl1UQcLWYODUFtMDk6btNlPaosnNIu681+3ST/LNZYK64TU5eizVW8d50QbIIzFA6Qxq/3IS1hj2lkCDVTzKK/zSek4nXQrSmOxkdVm5pxl3ni3By45+Fy4bdvcXPAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWikX+g2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWikX+g2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso5030645e9.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 21:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772083577; x=1772688377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOmVHNFGTb86WHQt7RSCacKlGSq4Tvh/jlgRo06YTiU=;
        b=hWikX+g29oyLDenCO7xmloY9msMWGIY8i6kd+U1nfZT/L/gQ8J/tO2alCvKNWKpY/X
         ei6BvDFJLZYf8HbWtX8SgBxQl2n+TLBaxLzEClihTO7aWy6tobqvsKzfhY/IRHIeEbUz
         SVZXE+fG+hUgENlolBBSxoooINA+x/9uDBFc9WI3uguUP07IWCLJ0kp7ohGDteMG0iP0
         gex7ouJ5CNiTVm/4A6KzMwI48er3jS11/fhnxXc+IqT0m8QH218BI1v8YSKKDhqiXXdJ
         adz84wb9RoQAPLGEj2DX7Bq03FjjRq6lNRWaUlw72QuuzwSetW8FuFfkf4bbIAP63yDV
         FXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772083577; x=1772688377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOmVHNFGTb86WHQt7RSCacKlGSq4Tvh/jlgRo06YTiU=;
        b=MIsWDtvQl9LbIx7SMLb1Ifu66JkCvET3lU6Ja4Sf88X3jmGLMmNxB6v+oHtA/JM5Tj
         DHX7ncXVclQ1VYSobJVF2ub0IGnpnFAMCx/RIsMqpZuMCxRFjoRgrNU0RAfBydTlxoH9
         EloES/4EQ3XZYGnGxoi6xtv3sTgBRSkxv+nvH4UO1ayDOL09KY8JVOuv5wQVu13tR8wh
         uZoYwtZrUaLPnEcOhN0OzRcGcU6ZisgbQjUD15zOTTgp5jhkSZ16dRk3EA5PsV5R0cp6
         eCn+Og1uVg15JQfuYAuFBZ5F99QtZf6u12/qoKfnnmj8lvGtzI36H5G0Aay8lbEV6XMd
         I31A==
X-Forwarded-Encrypted: i=1; AJvYcCV7lbG49XSqLSsl9oV6N/0QgIL21Z6EPMEXa5bx298kQ5ZxGHCcqv0DmvfZ0lL2NweGEYFjO+Xq1uRDbAhh@lists.linux.dev
X-Gm-Message-State: AOJu0YzgZJX+/TzOHtrAP0EdjfznmXBB6kFfvleWD6GYtVG9dcumP0iT
	LMdzg0GWQt77woipadKk9x3CUiE2LdBqu+dQd1N9/fDfOVupON0+GCvR
X-Gm-Gg: ATEYQzy9N19PIjr2Y8iUFATH+BJ1AYl81vVQ80DgZ4F5KERWSbQWqkipAD0MCq75Gwp
	Uk7RFVdo+ZCSvjqYAgUz0viEMgpR6rmIe/SRWeDI1DYrfvzXQpNTattES9R/rAWKpZ/5ascA9+d
	MwGWyqHBLYEZKwXDVnZLapxDdgpj+dxa6JSNJRMK/0SZfpmBIahzLxf2ENQyJ5O9Os4AMwj7F1/
	rjevRHsjWzBG5Y0HArzPi1FczAH0d6UGNdmxsaVPg+Xs9FexsaZCeoZUjG/D1TyCZLWJvCNKV8L
	LgkflfZBviI6fYhjMhyyqiN/B08GQy8R7jndg6QWGBBTZWSZSEYP6q8rjte6g5cJGOohJvCP/0P
	0Ve1s8VHLS+l+BaSzf7IQNtx7hxfN851+Knxi08ws1chi8PvhXujHkVA/qRjBqVSHDIoHK9qKVT
	OjwJ7DgrTB
X-Received: by 2002:a05:600c:a47:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-483c21a9b06mr43033435e9.29.1772083576673;
        Wed, 25 Feb 2026 21:26:16 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9566sm41800805e9.3.2026.02.25.21.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:26:16 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
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
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: [PATCH] staging: iio: adc: ad7816: add timeout to busy-wait loop
Date: Thu, 26 Feb 2026 05:26:15 +0000
Message-ID: <20260226052615.65734-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816_spi_read() function polls the busy GPIO pin in a tight
loop without any timeout. If the hardware fails to deassert the
busy signal, the kernel hangs indefinitely in an unbounded
busy-wait.

Replace the open-coded while/cpu_relax() loop with
read_poll_timeout() which polls every 5 us and returns -ETIMEDOUT
after 1 ms. Per the AD7816 datasheet the maximum conversion time
is 27 us (temperature channel), so 1 ms provides generous margin.

Also handle the case where gpiod_get_value() returns a negative
error code, which the original loop silently treated as not-busy.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135..7b8a78e4d 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/gpio/consumer.h>
 #include <linux/device.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -85,8 +86,14 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	}
 
 	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
-		while (gpiod_get_value(chip->busy_pin))
-			cpu_relax();
+		int val;
+
+		ret = read_poll_timeout(gpiod_get_value, val, val <= 0,
+					5, 1000, false, chip->busy_pin);
+		if (val < 0)
+			return val;
+		if (ret)
+			return ret;
 	}
 
 	gpiod_set_value(chip->rdwr_pin, 0);
-- 
2.43.0

