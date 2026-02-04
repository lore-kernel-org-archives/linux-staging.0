Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5F20DD51
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 04:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770179900; cv=none; b=JwteWRAZLle6W4fYOsf7XwVsvfeYfeo3Nci/Ji0t6xaEX/XRXXtB8X2+NLu6OlicE5b0Lm1DKxLZ4eSvR+cloeFaikWshFBttn4M56kwdwec3eIYq8+dm9atGU0n/z8WCPPkP1Z5x3pfnr9DINP+uJrmz+WNyu8EgV2nu6Gfoqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770179900; c=relaxed/simple;
	bh=IdC2P4k6AyJqhGp3rnM+Q37EVEjqtthBYoW7YhLNPog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PTpWBmYt+eze9CPYgOjoImNdLKLjicp33eyaLsv5DFkIzOx5/UpFzAHoCOU3gjuVnJwfpr5RDKpDqgc5cYVsR0iYMEbCpqshxGv4NS3Yl0FLo/nK5tYsir/koamvcCZe67OHzjQ9okUhPu88DdUNszdrggYZCIM5loxqZgM13KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/aUGN4W; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/aUGN4W"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c710439535so512848885a.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 20:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770179897; x=1770784697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGCt1oGCWGLX++wb2sUIXR3s0HE/K4T4ZaU5gwWu3Ys=;
        b=i/aUGN4WPX8CbOcItL2swx/mdnIrrF/YGQPBuo9I7kPCdq7KLW1QOt9wGdKt9/dwYs
         PM6nPF444FtG4WcAoyNdRFtDLuLSRJNr8sAdreTsEBy5UlBMR1E2ANxR1q99TfrsyYIf
         WrllZiIkd639s79hRK6rHYPSUgIqJDIxuMR4kNUo9GLJSkg0kWIluk2gWZP/8D7ZlUk0
         DdWzGUv32Wp2qnfFTOVJia3xMsu3LfNDC+udVRVazc11VjFHDzv71p0q70WMjIng7UA7
         7hAJ7noTugGIFvPx8TAp5vU3qfndzadJHmYl3W7ZxtoMKascVTXfppxs7Clt6VT0s8vu
         Ndfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770179897; x=1770784697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGCt1oGCWGLX++wb2sUIXR3s0HE/K4T4ZaU5gwWu3Ys=;
        b=oeALECSLshRKp0ihdfHY0yowko9IJH84BgaoN2uDnltE0AUuAt7I+YSyi7ePl9nyNP
         4vAvFqxc+fEUVTxPk6iUlhMLbRlSU50bou3IYW9DRjr4F3PbOJ5Pb6JBhUcAFfTm+UMc
         bUG2DJo6eE6YM3EJ+I5cIpwnhTJcX7OP6dTyCiaxFvnUlxBMB8DK/XoL7Jy2P9juKGXq
         G/SHBMcbbSbkVbVLrZiq5uuRIfrdjzoPtuLCJRdKqse5i6WCbDbihQvwfyhWoZFU8Qpe
         M+ym+7+di5lTx5XM58Mq4yMvaxFXEeVrB4ZDRfUu1r6O5sDCPpOwjdD+IqMIxZBQ4s9g
         lWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgwJsZjPXDXGHEy4lBm0MOACvECOEK4aEJrnzdjliEqp4pSjqXPnEFR9gLWCQyXP09L9abykU0I+W/A+MH@lists.linux.dev
X-Gm-Message-State: AOJu0YxTyJPayN9EOaHGE5mmcr9kUXt3OBjTjzQf+U5y+n1lPG13ADRi
	4aBgJy8AXQv294h/muKTyJ6Ky9O0iUyt3cSGBWhTZ5QYX5tLuu0Odjtj
X-Gm-Gg: AZuq6aKeMBdz9D/3M7FD4TeoeeVC2g+4pVdPRxtCJXbRtrCJu1i8onf6eAhUm7SkGAi
	gIWYdhmdo5WhEwBECzad2FZyhEBLvrLXhnRGd8TqBFKMUFYENL5HuJwZ1YcnAqSTiEEQbtIT7z4
	Jnj99sykXjBqJzw+oJff+PWe/acmODINds02JI14CM2q08PHs9nJJtVUCNtzkmudMfsHCoHQON6
	VGltZbUwLi0dnLRM9TSNEgCKKaN9duq6l4csw0R+EWMoP+pMUhAtJi+c70OJZGAj+TQW6nDoPqd
	vZwOzaG8Il5x/r57tobdNjJbxQnmOxbTOxBnd0vYV1UZyPV7hINrawqe0hjzNssHYsOcAhhp/h2
	6CJBhzi1uZHmkJyETJdiwb9DaTWTjbvKrxl5e+OlxFyFYgn7/Kzz2o08QhUbCo/l1rTkHc6TW3N
	3LKXUfhe5zftQQvQ==
X-Received: by 2002:a05:620a:1728:b0:8b2:e51d:610d with SMTP id af79cd13be357-8ca2f84c6a1mr227680685a.32.1770179897451;
        Tue, 03 Feb 2026 20:38:17 -0800 (PST)
Received: from Mac.home ([76.64.58.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fa81908sm110036485a.19.2026.02.03.20.38.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Feb 2026 20:38:17 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: David Lin <dtwlin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Neel Bullywon <neelb2403@gmail.com>
Subject: [PATCH] staging: greybus: uart: migrated from IDR to XArray API
Date: Tue,  3 Feb 2026 23:38:02 -0500
Message-ID: <20260204043802.65430-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced the IDR API with the XArray API for managing TTY minor numbers.
This addresses the checkpatch warning about DEFINE_IDR being deprecated.

Following changes include:
- Replaced DEFINE_IDR with DEFINE_XARRAY_ALLOC
- Replace idr_find with xa_load
- Replace idr_alloc with xa_alloc
- Replace idr_remove with xa_erase
- Replace idr_destroy with xa_destroy
- Updated the include to use xarray

No core functional changes, just modernized the code to a new API.

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
 drivers/staging/greybus/uart.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 5cece0a6606f..8bd6bf0a57a8 100644
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
@@ -362,7 +362,7 @@ static int alloc_minor(struct gb_tty *gb_tty)
 	int minor;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	minor = xa_alloc(&tty_minors, &minor, gb_tty, XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
 	if (minor >= 0)
 		gb_tty->minor = minor;
@@ -375,7 +375,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +984,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.44.0

