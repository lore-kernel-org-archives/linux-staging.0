Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD353EF0A0
	for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371216; cv=none; b=ssu+Nn44lUHHqDulFZ8B+RIaOY8R7gsEOCjBaj4pjOQob0A/anGfNi+tti4AQkTqCs/U13gd3J45KvuFyBzekvAwnvm4QwlEWRyzBp6o4KKHeeDjM50MXVSOrgm9qrZlJm19m9NU41HPo0WeECYA/+18AlzJQ58CmpfPRgNzYu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371216; c=relaxed/simple;
	bh=meearREFXdp/CGm2YFn0/RkjSyxzP4BssfIuK8nuSgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWvvd8fXBwtPn+2MH+srfLve0M5/MOrAGJ0lxpcCq796QJwHFyEZPsci5wFwEGqjUanluXxkkA2alKI5MBijxwOc1pM/+yyxI9WPP53tX6H1ZDGitvmekvVYakIapFDT1jKABPSpS49Ba8O9zLW6o1fY37BldUfdULcavUtNd3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmdHiqCc; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmdHiqCc"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so16022921fa.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371213; x=1786976013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+7dwwupXsqHgZrhPAZdkaTsGOaTCtAMuPI7NwqoOvE=;
        b=mmdHiqCcJBc1fjbXcfBAcfoVwzck62Ewb8ObtslA/wkuuGLSgzfWzZuWqWrxyWRce4
         49tQc99jLUhSXddxP/TLTjwnrY7V4XmG0ihIKDno+4qV9vMXSKbP3M6KlI3azVwr33/q
         S+nin8JDRw81wu8ustsutURZLDF026UL6rz4NbWppahDRfg1h5Ygzod/zD362ZsY7Fmv
         cjWgl8FDH3XC7NhVJi6GqosMMWQP/cpW0es2wqP9Uxkcihyp0+8KKeToG1yUdlgQb2A3
         XEY7JecmplD5s/C+WRC1rCb1/r7P4hFHppnKojvPINvNIiQlzU5QQcnNmO7NVyxfsXGW
         UoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371213; x=1786976013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+7dwwupXsqHgZrhPAZdkaTsGOaTCtAMuPI7NwqoOvE=;
        b=Ky4jf99DF+NVQqtq3LW6hdFtR0aiitUIotcTw96wkjmJCRdfanqJyOISAWgF6Xbz4P
         kIkR7vvXq0w26VZabDcDD1ACeaZL5EKtPnU2helcq/ME5i50+y/mdAJs52+ow6da9z40
         BLykp2B4aEdb0+eP3YR4kvs9k6PR9O92OwfWDtJAJoAz4PEnEv3yRWIifaj0ICKCUHny
         A3L6bSFZf8PZZQBHr4xJpeWhUhLolIvJiKM9LFpXdNeNicwXb9sS3Bq4nYQ0rpVpA1lN
         AMiQRxYP0N5k2KwjrkCjKAD4Ln5yIhn+oqSXvSdzWAFlCowVykGsRWpwj7Z+LfVTLRSY
         TU0A==
X-Forwarded-Encrypted: i=1; AHgh+RpDuv6kbHSTh5P9fWSBoUVr+E/Po01cAFqp78sIFZvTgCH6DNUMThgLIPP0ut0dXc9rvG23rBLc+KDjU9FH@lists.linux.dev
X-Gm-Message-State: AOJu0YxpTx2EGuMZwvihqlfNIEmnvLJoBmNJerbfKCLvZaJJqBe3Ah+4
	bxcH7ThRcZM+DzgKYQVlNm5zF45z/Jx58TzyJBE4nUz4lWH09rWW7DNM/QDQJZyc
X-Gm-Gg: AR+sD12c+xrYe2Gp2DdMfmx2lju3Re/SKZpIOFKlfZGHZvRivPMffTRXYnsxK3x/hD8
	v0lxPrrCAUXRmRGQJxIXexqXjjmClcPs5Y+a37eURtH+DEcQuHW0O74gdQLr8j2l2tQJe7iI86s
	N4u5uqENIwnumhedoRrhJDWf6yLXvYDI0nOAeV6mDcYWyT2lHC9MqcgDCK6PGfmc2EmGkRh19Js
	DLysxLHWRAzBdElJclXaoYiISySTMGBiXHpH2piFUwgQwYTYHv1LUqPbKpM4uL/c4MzaKJUEX5r
	um46RGTBVkGohcjU6nNXmZGy9RPdjOWicWDLjYLF8tR9gOlmYN4EcqK/S4SRPW06tyAZlVLo9MV
	/jAfMzSWek/T5syd4SvPulATzb9x8xyu0kj7dUwa58xP4cRAjwGeZ1QO6x9+yuK9H9IG5Jym+ba
	ndcXONkEh6PPMGn4kIwXLUQo2EH+p0vUjMx8SIqCV7SMEdWgHS1PgZiMQ=
X-Received: by 2002:a2e:be0e:0:b0:394:1254:10d2 with SMTP id 38308e7fff4ca-39fdefd0d29mr26019721fa.0.1786371213015;
        Mon, 10 Aug 2026 07:13:33 -0700 (PDT)
Received: from localhost ([46.172.73.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda8010csm24552931fa.3.2026.08.10.07.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:13:32 -0700 (PDT)
From: Dmitry Priz <dimahtms@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dmitry Priz <dimahtms@gmail.com>
Subject: [PATCH] staging: greybus: uart: convert from IDR to XArray
Date: Mon, 10 Aug 2026 17:10:43 +0300
Message-ID: <20260810141043.76948-1-dimahtms@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IDR is deprecated in favor of XArray, which manages its own
internal locking and provides a more consistent allocation API.

Convert tty_minors from an IDR to an allocating XArray. Update
the error check in gb_uart_probe() from -ENOSPC to -EBUSY, since
that is the error xa_alloc() returns when the allocation range
is exhausted, unlike idr_alloc() which returned -ENOSPC.

Build-tested and verified via boot in QEMU: the module loads,
registers with the greybus core, and unloads cleanly.

Signed-off-by: Dmitry Priz <dimahtms@gmail.com>
---
 drivers/staging/greybus/uart.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..edd6b0e25c8c 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
@@ -67,7 +67,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -342,7 +342,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -359,14 +359,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	u32 id;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &id, gb_tty, XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
-	return minor;
+
+	if (ret < 0)
+		return ret;
+
+	gb_tty->minor = id;
+
+	return id;
 }
 
 static void release_minor(struct gb_tty *gb_tty)
@@ -375,7 +380,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -854,7 +859,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 
 	minor = alloc_minor(gb_tty);
 	if (minor < 0) {
-		if (minor == -ENOSPC) {
+		if (minor == -EBUSY) {
 			dev_err(&gbphy_dev->dev,
 				"no more free minor numbers\n");
 			retval = -ENODEV;
@@ -984,7 +989,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.53.0

