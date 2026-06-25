Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311CE3A7F6D
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389103; cv=none; b=B6HIoVibhDJ5mHKlfsZorrqYq+LdKAeSnpwLK/TT0TYNDSxk9QRTiYvVsFOpQ2hMvPvL5I4KzhqhGfj0Dv6UnV3vsmq4AhB2ERO34D0fmuLjG9sxYOjIcc/XEPUz9FMzNkO20ciX9LcKhaKArdlJ/WAAlv9B3Ispk/Us7QkY76E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389103; c=relaxed/simple;
	bh=KX4j5dfZ4TIbacLcQ0pYkg286VcTDip2XjdZMyDtwTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KU43TlQF10asr0xQSHpbi4pM4JHAJw/fCeQXMHTM2fH2cLdhGMtg5b1tdXHtmnW3NB9XHybH/Ahg9+2esu5zns4csKIjreGj9qGflu7MHlWkuJU1SOJkNl85aGikg+AJl8vszUPgX24nSBGtCucTQsCb7n5E23rpcndD2uODb8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8HlVYs2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8HlVYs2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-46db3c9a9e0so452497f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782389100; x=1782993900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hys8RmE1l7PhUa99M9ZeaA23kXdy/j07bAQ7G83FKzg=;
        b=n8HlVYs230Gwu6Q+7nsV7YeWnI1TV/fn+HwZjc6B5qVt9+i8LkfdP89WrX1mahnGFJ
         NcPntI/A4yfkUvgXUAQvt0LXQaNE9rYngebByxaaK8CIdMx8TSfIbvFB0OfNclP3EjSE
         hx+RWho+gHux/Op3scbu/fvMORgKUTn8nFTTav3XKnCkktQByLXZuLC4sYQ/QLHVXxvp
         S7hCMvg+vGtzEBMfgx8MgyH9Nsg0ElNkMYuaboKKERijnc5yWlG+Y/jN9IOHY53zFNdN
         MxB8icltY8EXvROwqUMSe1jvANRkrrSEPumVFqyMdstzvMX/og9+UNsx0xO/e+bhbZkd
         1y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389100; x=1782993900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hys8RmE1l7PhUa99M9ZeaA23kXdy/j07bAQ7G83FKzg=;
        b=E5wsdPDSwZVAVz4B7Klde03LZEfLwWOR+yUCeiNnG/DNwyASm+X0xsZERlUYt8eFDF
         dLYFPPI+BLgmJ4skSF7Gt7Y84eGi26gOjA2viA26bUu7Ulmqq/7jbHyM3laGEzbMZjZp
         OF7tHbU7HSbgQKpLAi5GYcuUHSVdHYCepQSYDt6K/USYMvpS5KsnJmFMS+zqO9r+RtMM
         aMNkZkTwA7SkzmMSdJV4B3teXbDtn4ck7aZahLCd/V/G3fbNtGow3EwBODW86XZxxXPB
         rKFhX+zLu8Hw/sFRmk4vUajyxg6iRVtCceZ6edkT8BjRkyLw0GYvbTkyif/tXFVKy3bt
         9O3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8AuGQJBXdF1fpLmHScIBuXPze+zB7JVAaELxpIiStbqYfNgHJxr0B/dQzyfBfxgwurzENJQctzGW2k4QCi@lists.linux.dev
X-Gm-Message-State: AOJu0YyLl0fj6VoifGQALViTTEYcRmwTStb/xwy62fVu/JFCQk4TRrGC
	4qLhpYyqU+21SG8ShF/S6R+hWRCtDpcKvBIM5xCORolDBRZ5uH+aWy0k
X-Gm-Gg: AfdE7clNI3UJ36rQJh9E70hQJXe+03GOpd+ITKBExiPwI4Apg4c+p6MW16KzXB9U1Af
	2EW2oCDhH1G8mY2VHUvlebV83/aZ4NzKYqib+sQI3+0dH7aOiHyCL/8Qpgdi7xz7DkI0qu9kidK
	y6+s4u8nB8Qsr8j2G0co6jVR8QjtF363hk49lSN0KZz1KRXi60vSjznPhONRezPbjtYi1mBFpso
	5UJdOfT4mcIVFks2ucoelwnOiERsO6qjs/YLzeKvdEiAKeqPsO8VujbzEExUE0M3JkDoTcXypJW
	tEkPCGsgIE+TbrstInlRd7AB3lkRcJLnp5IHTB5xnNYM6S2bGoXsLwe/YPcrMPUwD7stLwECaA/
	o1m7fyUVEoxa0kFAXTRypUsvvlM/o3jC8WEo9mySz84VQ+YwZkS/4zq76oWR+hKh+Z0YUybSty6
	FPUFzL9vrAq6jlYVU5pThiCjACO2j0dSsu/g0Sh5nApo34D5lluFNEt8i0
X-Received: by 2002:a05:600c:1d0d:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-4926689f6d5mr32803555e9.37.1782389099369;
        Thu, 25 Jun 2026 05:04:59 -0700 (PDT)
Received: from legion.localdomain ([31.223.63.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49265fa8004sm49941925e9.10.2026.06.25.05.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:04:58 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: [PATCH] staging: iio: frequency: ad9834: use guard() for mutex locking
Date: Thu, 25 Jun 2026 15:04:55 +0300
Message-ID: <20260625120456.1267-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual mutex_lock()/mutex_unlock() pairs with guard(mutex) in
ad9834_write() and ad9834_store_wavetype(). The mutex is now released
automatically when each function returns, removing the need for
explicit unlock calls.

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index bdb2580e2..f15819eaf 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <asm/div64.h>
 
 #include <linux/iio/iio.h>
@@ -152,7 +153,7 @@ static ssize_t ad9834_write(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD9834_REG_FREQ0:
 	case AD9834_REG_FREQ1:
@@ -210,7 +211,6 @@ static ssize_t ad9834_write(struct device *dev,
 	default:
 		ret = -ENODEV;
 	}
-	mutex_unlock(&st->lock);
 
 	return ret ? ret : len;
 }
@@ -226,7 +226,7 @@ static ssize_t ad9834_store_wavetype(struct device *dev,
 	int ret = 0;
 	bool is_ad9833_7 = (st->devid == ID_AD9833) || (st->devid == ID_AD9837);
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 
 	switch ((u32)this_attr->address) {
 	case 0:
@@ -269,7 +269,6 @@ static ssize_t ad9834_store_wavetype(struct device *dev,
 		st->data = cpu_to_be16(AD9834_REG_CMD | st->control);
 		ret = spi_sync(st->spi, &st->msg);
 	}
-	mutex_unlock(&st->lock);
 
 	return ret ? ret : len;
 }
-- 
2.53.0

