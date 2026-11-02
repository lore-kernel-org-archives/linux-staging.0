Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612609;
	b=4U2lgnW7unr6kiARJOKDGVpmmiP703kbyL9n2XckiLVwXZUWaF/Hi0At3W4WT7wBfmmm
	 WaIGjGbFmdCSO/g9ED0tZetl9a0PTHephfhncTA7HnmKrV64TsQh4E36+aDqZnsk8zmAQ
	 8U806+Bm0CLayK9fhOME1Rb6ECxeMYHvlKP38z5EeyyE3KxiK62UsL7bWAA2AU/fHWvFi
	 sltfBeRLG6j/puc2Z7EWeYDh52ROW7JPIBF0sOpc6oH/pshcOEOgs5TjrU2QL69P0HDxD
	 RrSFQyIeXXs8eZ8rYSSbqleFlREGeft3jGYuC3Okr/fyuDE5M97ceUV1IJrSwXPUQQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=teF6NADalu5/7cF6wyx/P+C8roXp4OA8wuuPR0caYC0=;
	b=kHqG2u86C9qsW5/stHb+h93Ow2Ko6PQrFvh0m1oLQ4Pdsu3qr0OVu9XjkjnP+r1K264d
	 6jyVxGrAEG6y9T9LU5GSq5Zkgqxn1KhEMPaQHDOSS4oyR2kX4Z2ef9AdSMQXNJpk8KQhu
	 xs/gcfb+I1+K1a8SgTUV0atQLUDhR/Zx91nS24lqf6yDBKMtU1q9EaTLIQ53XrIJCw/eE
	 MIl10uwbMB0+h3n0y26W2yKC6IreNGTkTJue/cT0fz0CSS16dXXQnt7Zo9yjREbwA96W0
	 boZ84OKwJfmo/nFh4gR/hIDL8anK2DM4RKKuDPKdN4zfSem6i6KzgFM0Rw9ZBKsgAGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qpl3OlQq;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC980606A324
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 09:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC980606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qpl3OlQq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so23794215e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612607; x=1794217407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teF6NADalu5/7cF6wyx/P+C8roXp4OA8wuuPR0caYC0=;
        b=Qpl3OlQqYVlmwdxWwgZiP1OQwtPzRYeE57qqk7bcjGX1zDOUx9Jx7vulNcAiZSekNx
         v40Knvep8Bc0Anj2wozTqRnZ2DbyC3hq8f/6RPSA8sv1kKAOrnFihP7IyKh2zlx/CuI0
         gaY61B6IZiFLhe3bUeQ3/9/qmo1ECZaWkVzmROcHIchNJulqUBn2oSfUJMzid42nWPoe
         Jq0z1vYpYjOO2idn8cigWHO52Q/5oYuuW9hXFqjSGsHzsuhGh42LdVWv5PaTRscWcS2e
         LBKsrw4m3iqto4lmd39ZqziavzHsC3c4UWTeI9CJXiG/cCOb5THFJ0UADiyKd87ULhW6
         wtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612607; x=1794217407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teF6NADalu5/7cF6wyx/P+C8roXp4OA8wuuPR0caYC0=;
        b=oWhOVGxvcOdgmA8mNcq8K1RwJdJaZE+p+5IPc2bBRLxF1c5J0psmb4Q6407QyxZw90
         ym81Tc6d21/4Eu+Wr+plBIFxlk21UtzlMo6qj1I8JPKVKe6mMVZ7O3JSc37kI+Dk8hRt
         hs/+punpxypy01RtP0j8VrLYPOnVNC2JCcm0Mf9ssptDA/LPdL46F5tXOuYlXyVoyqn6
         qAn4LOc+lhfEiDASdz5xpf7TBrqxn+kcMsjQeO09g6Xbvyvc4+te701zVNVaX7DjAeMT
         aMUbOfHveSoiXopui91e9u476KYJPzO91ab1uLkJ2nN4lF7ezIwLR0GQBC1A9Z9MdZBS
         z6Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxwhs2eehIyjz9Xr1VMZwzCqUkn7TUDu5EhrTrxBT+31esCesBLUeJpWvugfj6YKIk43nLQyKMPIminyWoP@lists.linux.dev
X-Gm-Message-State: AFq9FYKjo6EtWbHIqiHN3VX30MmBdMLvJXC4Of5BQgz1yrAcy2yC1RH4
	bpqvSuln9L/9OyiGrNi2ENnM5pUgNLi4DmibIThn9S9P5YQiGJ9mtLxR
X-Gm-Gg: AYBFou1t/A37V62OjVKst8yQTCmDfnX+pRXOMT9xYUAUYtxTKJsK2sP2jXnRRpQYwMy
	2hDjEAaUZmoSgDK40pqafxjNZnRCR71cQo2oMHtZS8mPwYEy60Jen+R0Wx1J6MKmqDXXOjA3yvk
	jWYYQTGNmREd3msO43nzT3SeMDjU9KmXgp8x/F8Ck1sVc7Jy9zrwuBClASgRVtAhwMATtJzaFzu
	WPJz7JcgQxN9EX7uh0/jKwFw2xlzKjREZSN1a473B6XwWiLJPbI0PbzqDy0bYoglZcqENi9HqjA
	0hrorZ7HwiQvsexCTp3ILM1WLz6QpvHshwlCYW3R5/TJ+FB3b8GB7o4thQBYMxqT44CYz5RD7Ja
	7jgnnHaWeM5xP3Oy8IfuOSOGXxEG4goMlC7szGukk25KtaEMnuYEaFo9/Epv5cJARr3PnSVYj5p
	ysbSUNA5jHDnS+Flo08zzC70H1/3aJVhusb8fsd+XPXvqj1kPrJaMh06dlDaAzoF/8c8+S+xaMR
	4Ek0TvFo1lnbaXQPPZSwD0t2198hKie3RtotpLgA5V6ssO0qiZsnmeUmf5nlAWvkIQkqNde1rFq
	Zof74k2YKAiD7ETSmRsVGT6TpQv8EQHbQD28pNo=
X-Received: by 2002:a05:600c:46c8:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4ac16acfde1mr230539615e9.6.1793612607413;
        Mon, 02 Nov 2026 01:43:27 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm332507285e9.7.2026.11.02.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:43:27 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3 2/2] staging: iio: addac: adt7316: replace kernel.h with explicit headers
Date: Mon,  2 Nov 2026 11:42:36 +0200
Message-ID: <20261102094236.57757-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
References: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
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

Drop the proxy header <linux/kernel.h> and replace it with direct
inclusions per the Include What You Use (IWYU) principle. Also remove
unused headers and keep the list alphabetically sorted.

Explicitly add:
- <linux/bits.h> for BIT()
- <linux/err.h> for IS_ERR() and PTR_ERR()
- <linux/errno.h> for error codes (-EIO, -EPERM, -EINVAL, -ENOMEM,
  -ENODEV)
- <linux/kstrtox.h> for kstrtou8(), kstrtou16(), and kstrtoint()
- <linux/pm.h> for EXPORT_GPL_SIMPLE_DEV_PM_OPS()
- <linux/string.h> for memcmp()
- <linux/types.h> for fixed-width and standard types (u8, u16, bool, s64)

Drop unused headers:
- <linux/i2c.h> (no I2C symbols used in core driver)
- <linux/kernel.h> (proxy header)
- <linux/list.h> (no linked list symbols used)
- <linux/rtc.h> (no RTC symbols used)
- <linux/slab.h> (no kmalloc/kfree symbols used)
- <linux/workqueue.h> (no workqueue symbols used)

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
v3:
 - Replace <linux/kernel.h> and add/remove headers in this patch, as
   suggested by Joshua Crofts.
 - Explicitly add <linux/err.h>, <linux/errno.h>, and <linux/types.h>
   per IWYU after symbol verification.
v2:
 - Split from original monolithic patch.

 drivers/staging/iio/addac/adt7316.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 515f1fdae46b..54d942cae586 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,18 +5,19 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/gpio/consumer.h>
-#include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/kernel.h>
-#include <linux/list.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
-#include <linux/rtc.h>
-#include <linux/slab.h>
+#include <linux/pm.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
-#include <linux/workqueue.h>
+#include <linux/types.h>
 
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
-- 
2.56.0

