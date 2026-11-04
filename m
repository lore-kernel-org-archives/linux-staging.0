Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817318;
	b=GV0Op5nLik0UVHLe42wyn4uCJ1kAMiVhzm8XdCv87X99Uqblun+m8TqxV2NB7kLsJM9V
	 JEDBYuRDGNd7ou4CcPkL7GXqk9yAJ9jbDOGRHu/E6T7wF339S4UiDihN3J/ahi+vk+rpk
	 b+2hM2QZjT9vqTsEevRqAWjRBm7Od0VtN2nNqPtPfOO1NZv8r4POhAM/q0S9bpHdEm1jG
	 NtpirGOkSOs9cFSqVUSe51EAEXqgsRB/ge+2gvfaPL1BoaOufAZlo0VO09BhQTYWgTE7M
	 YQdJNXPZ28tvFG9OSYJ/rpC09u4hfL+lo3Wwe9BD+5bmDzE7tF0NMNZClSqavrYyWZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JcGDDVLFabrkV6b/q/P+th6iJ/MJURW7IlDAfrljWjc=;
	b=WatYHnjMawQ1Ljh6FEGPDoUIlmHvKSWdAaQ2/kjBTbninC7dcEdxlaYIs5aW69rXLoLO
	 1qJROZOy/t6ynTJtlLIbxNerNXyIqKtWT/R4BPRUgrvLZVF1tfIoJXr1sqi+AZlIlsW+S
	 dfLAnyedryc9HQXs0WYwpWFgcWCp6uleElgtQ7zOVC6vZv1QEslJlM5Knxqaw+fnlys7w
	 dicz507EUFwe44SCuQJYkmis5Dg0s9ZT5ktMdOXEHUgdaPzAHlEkTDH0DC3YtS9Sdt8Mo
	 bj510ksjnnjgiuRolG5n/38jqFVcVZDKDh1ljp3J/xnKu/+4qm4R9s8EWR4xHYQt4YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMv+61nm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325DA606D822
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 18:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 325DA606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMv+61nm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so13352725e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 10:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817316; x=1794422116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcGDDVLFabrkV6b/q/P+th6iJ/MJURW7IlDAfrljWjc=;
        b=aMv+61nmewDGcCJJlAV5nnbQ89oIzyoHY3DQYZqa4UxJX75iZlgndpMFhYc3BLYOm9
         jVC+BL/sYGtUrC80ASdwZjFyPe3K4JXIGjwg03JvhLMyGPTXDwrvTYIw7lJFMfGJAr6M
         rbKoIY5pDxwzD4VXSoI+jidaY1xosGnRV0+00g9KAvX1/z38vdWVfr5mORyfPTTYdfp5
         tKrdJxkx0teuIA6yVqZC3QSFY3cknNSZAX3/ppHlBoV7Mcp0UShjsOXsOl+iFIMIp0tb
         rvuR1KC6jKOl2iK67OumFWw5L5qAONBSLH8z464cGfM654ikzPG+rgsyIZ8M66AyjukY
         yPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817316; x=1794422116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcGDDVLFabrkV6b/q/P+th6iJ/MJURW7IlDAfrljWjc=;
        b=e/ttATjUu9KaXGTLztiRkxqh0FpIO6Hg386JtUQYbspBgsuj2uvD7veTrSaaENIqFx
         5i0bgL2z80S9hxO5Pi9X0eGv92iE/TdjsmQI7MJAmVxbodYXqwJ7tMoRsrzJmxxNXAiE
         QOqhTk8JsF86hjls3UHFI4PGIwZTYtywhS4togj/y6H2VnbGkdiVl4Y0gMA7/w9+W6Ku
         YP/hX4+30JZrLSvaqF5c019NNCTGI8WA6fLhDlcAxjetxR3ZoNbIa4TZMyuX9JnDZJbD
         ARwjinjEaD6Vk9nZoa9s9koQ706cuRY1+dAPun42XX25nm2CxSAP+Ovs56MfXuvZAyTw
         5bNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiicsSl0z8Gqg8Vl2PwgpseJ/VI6PYg1LdOoXakUlTwxDJyqp04MX1fZgC8DF6SF8vdGTvribBQEW9nCdq@lists.linux.dev
X-Gm-Message-State: APuU4Z84DxIYR6NP+VJ3rcfJKg3J15UNxGXDXjfeIw/R9LWtyUtvkRrx
	/7hK9i7KytAAqIARnPAssFthdmvI4Kz9xSGj23mIL5BDknOJyqf+EuTs
X-Gm-Gg: AYBFou2ymrTy9i/vPuXLRDhH54iaq6sgxUpSg4XdP4gAa/r0Q4vXzRqmzkrZAvOKiD3
	/LbGojXgG6M+zdUjiJb++VNgpTj8U3urZoWbb3SFdEo64vvCSJ6LIyB3bKaYX8tWb1v9JzNv3fb
	tDF94DuOOCygQCpfwmKyQj4kcFvMdRC83eE6GLjbqdlYBFxOKKR5UfMttmYKtA5a5BHZ5YISF7C
	wxzUke0B7pq4YWZHAY3fhj7pQAiib16aZVLeGbvPJnLBRN2v1Xaa8VXxPJxN4+rlv+nHjGyVY3A
	+j0VucY+Ozlct+zbNlDUh0q9jGz4Ow+T8qe6+NzyEjZesfIDeQE49BV6YoAzBX8q4Hz4qtUTBVP
	xgAAIyuwL6jPs9RfT1fqksVZJGGvrWFr8e25tSFp+JBUlspQ/g829Wystgl14JVckQK/GesN0bs
	lHS02B0+U1jji2xqr5gISVzYk05DPKu+kG6aWySH0z1QyP3cSdd8vbDbVC2EubLD9Qij4ji1zDE
	DSfxOrWRTpq2DpfKy21Qc0G3C0XHvNr6253wGDx9AEPgvNXN8z5YPjSDhqj2yqQ6AQObpbfmv/q
	JvHr8U5vzQRwwQmc8iiNQ4m35qz+RFioQ9Ncz8lcpBg44kOlkttPjKsp1so=
X-Received: by 2002:a05:600c:46cf:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b55e07e569mr5336135e9.15.1793817316624;
        Wed, 04 Nov 2026 10:35:16 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm31404915e9.3.2026.11.04.10.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:35:16 -0800 (PST)
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
Subject: [PATCH v4 2/2] staging: iio: addac: adt7316: replace kernel.h with explicit headers
Date: Wed,  4 Nov 2026 20:34:29 +0200
Message-ID: <20261104183429.20125-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
References: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
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

Reviewed-by: Joshua Crofts <crofts@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 Headers added:
 - <linux/bits.h> for BIT()
 - <linux/err.h> for IS_ERR() and PTR_ERR()
 - <linux/errno.h> for error codes (-EIO, -EPERM, -EINVAL, -ENOMEM,
   -ENODEV)
 - <linux/kstrtox.h> for kstrtou8(), kstrtou16() and kstrtoint()
 - <linux/pm.h> for EXPORT_GPL_SIMPLE_DEV_PM_OPS()
 - <linux/string.h> for memcmp()
 - <linux/types.h> for u8, u16, bool and s64

Headers dropped:
 - <linux/i2c.h>, <linux/kernel.h>, <linux/list.h>, <linux/rtc.h>,
   <linux/slab.h> and <linux/workqueue.h>

Changes in v4:
 - Moved the list of added/dropped headers out of the commit message.

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

