Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421449;
	b=oq4PROyud4nVM+HyzMLjWqVd1uHRpVCONCD4RrFYzXnFl+1sMziZmY5p/mBMTJfaDgD0
	 fG59QRuUFZHJ+7/HCTLwrqPBZ9B616veTkPY0Qv5d548CyGLhSAM6rBBIhwAkPfwqic9S
	 pEF2fUIk4DHsdOP16me20UIIpocToLyFSTP0oTg769oP41KZ+9eIwEGOXXB8IMkZMfWgY
	 +p8Bb1cWxr2k5pZuYbvlG9TuEFE58REaYxvZiavQntfrE23E6wyfe3YQqn9t2JtSyQiz0
	 nZfYdzlEg8K3WuDQVckebwWXNj4RG8epoOF8G3JotLqeJ4b4pbV4SJHBCYCVQGdIxuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=347Pp69Py5INxphdKhJwVesDtm7rdLRoZQ/uEcxqqXo=;
	b=rdN/f4z0i0tcTkqXzfsArDwV7BI3bUoxVYV8awDa10wYaNPbfRebMdwF7Q7oP/pQ1abC
	 kqbFrzeXauQiw0T4dx6f+tEVaYD176rclaqefw0qVFEg8xwgp3OuRffzrL85y+EpGlBFd
	 OPyQH3jTSRHX06/OUjHfYas0iN6g+RTFpBy5f1ejnN/qRdyjAsamyNRJ4EqChrauW075f
	 r+gTlnQ5b/hqCWOur7xjtJ1JPzJ8F38DUsBNMi9O6Ku+EaEczq279vM4d29YlyTi9AaYH
	 xCWsR89DxK9L4hv37F3ld/5pxFH/dX9d3nfaGhBQewOnwtdwt6dGNu+9HQhe3SYD5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OokSH9gl;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D39606A324
	for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 18:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D39606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OokSH9gl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so96725f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421447; x=1795026247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=347Pp69Py5INxphdKhJwVesDtm7rdLRoZQ/uEcxqqXo=;
        b=OokSH9glo2BjJ9q02F4T0o1YNLMFIQFOfi03n61XNfKL6IkHx9s11lC7rR/2R2eHYq
         GfXJyJtXObp5b+c01xwcmhX7soinmw1n2oT0zIhewR8paz8RyGLSlaZnr+rZsbplz2H2
         WMah3IGsoJMI5UajaG1DNoTaTGYBaEZ2VRiXtERRDuQlLDQNEW3MWLN3lLUVCilWLhPN
         x8lmyvAMUt6ZWiceh6zYomL4Gipi/qG1Skf2pCthFQBrjtrakux76JF0dqTF6g3qym1S
         ST/ZWexokCuzHGXQkRYaA1q/34+MDlSVgAaIcWy7YDRbQdGshxHf6Vo310FG+9bWGTdg
         Uhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421447; x=1795026247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=347Pp69Py5INxphdKhJwVesDtm7rdLRoZQ/uEcxqqXo=;
        b=jadVGujDXa9VZzK3pSyqM+aQCrjkw/oWYozwSfg8M/UOsbXoCdZPMHW/bBQbj8NsXj
         IlBO8OQR/aGrvYOFSwSJ2LfITgg5sZ5Kyg9U2dlTgPq/s630P5fpL6m/KN5oI96fgtSu
         1wRXpX43M18mV++UNky6IXoyUk55soJCfrQPqAMnAulO97USalaUfUgQYkNqQN+fM/KL
         ZowiWdNthoyG+GxxYneDv1f3fGekTM0maq47ie0KiSUQFMaLLHvapef12zLjtYKZtQYX
         0Chd3jk2R2v/8WtyoXgBHrTG7siCHUIxX5nvS0d5ubRvw+K+SMOyaf09jdoot2yKE9k7
         rVaA==
X-Forwarded-Encrypted: i=1; AL+hErF2PBLQ2pUZyxHIaNj+YxsuHzh+htd1/Cm487FvJuFIDoytRbivANPpODspS+xYCzQJ2erSW6kggi3RbpCX@lists.linux.dev
X-Gm-Message-State: APuU4Z9Av9dpyOJURmuiuvUDUJiLxnv1Ae413OBas0EOWMXUEXSDUANm
	YdfcGQ6pqxH10iTLgj79upR3YCsYcoe8KOu/xbdmX846qzVE+LHSZfrH
X-Gm-Gg: AYBFou2H8SpkNxG8h2oaf3+yEUicHHANqtrkMWiw2y/r3uqhPRGErY4cjF8FZ0RhLa7
	FxoyubYj1oO83S4FW6AkFcmZeTnnm8KuuFXnTcoTinJcFsB9/xgjJPCSdpSsUp8CvyRK7xFSqnr
	Q8e4f8vahLC7QZdqz2IW9lVjTSX2AhL0kRfJxtZT8usIApXdvWfBbNoPDBbWDjIv6w5Mz4Hopx4
	rmBbLqdVlqOqfmI5y7jbs5S1Rh5sSnqV1v8Qw/TDOpHfJ8LFY1w8JNTGqnIMMxZmafntS82yXB2
	PjfROenCToLTsSHpLK9s8UvIicifo+w2RueknnanTDvXnlhelFKWi9/sk24D4F794Z3v6qAfVqQ
	EdsW3s8k2+PeM4uYzMc34fy0VWr/NFOHdPHnMZTXC2HhlL4XsIkq7hQW8K0XftrPnRHIS6OIoUK
	T/6XsQFJEhWHe09gfvXf1pT667h2UAnpqKZEdVk7mLBwEpmKdCo9jB6VTvw8+GivdNoSm1BopRK
	ek2wvQiZ51h6SQjhSdlah+97HSRGd9cn48uw22o6q2naLPl8SbkZ4xcb0aM1HNc/rPUbd4LwXka
	kirPOYIKMSrndr4yZcwIvNLvcfxr9E7xGOBXAbzhamif08/Pz8Oa5YbbIOjY
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-49b01cf341fmr341199f8f.13.1794421446431;
        Wed, 11 Nov 2026 10:24:06 -0800 (PST)
Received: from AVIV-PC (89-139-9-231.bb.netvision.net.il. [89.139.9.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm12564099f8f.10.2026.11.11.10.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:24:05 -0800 (PST)
From: Aviv Levinson <levinson.aviv@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aviv Levinson <levinson.aviv@gmail.com>
Subject: [PATCH] staging: greybus: uart: replace IDR with XArray
Date: Wed, 11 Nov 2026 20:23:30 +0200
Message-ID: <20261111182330.77824-1-levinson.aviv@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Migrate the minor number allocation from the legacy IDR API to the
modern XArray API to take advantage of its built-in thread safety.

As part of this migration, the global `table_lock` mutex has been
removed. Mutating operations now rely on XArray's internal spinlocks,
and the lookup logic in get_gb_by_minor() has been updated to use
rcu_read_lock() combined with kref_get_unless_zero() to safely
pin the device reference without blocking.

Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
---
 drivers/staging/greybus/uart.c | 37 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a17c..2b1a5d4671dd 100644
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
@@ -66,8 +66,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
-static DEFINE_MUTEX(table_lock);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
 {
@@ -340,31 +339,37 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	rcu_read_lock();
+	gb_tty = xa_load(&tty_minors, minor);
+	if (gb_tty) {
+		if (!kref_get_unless_zero(&gb_tty->port.kref))
+			gb_tty = NULL;
+	}
+	rcu_read_unlock();
+
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
 			mutex_unlock(&gb_tty->mutex);
+			tty_port_put(&gb_tty->port);
 			gb_tty = NULL;
 		} else {
-			tty_port_get(&gb_tty->port);
 			mutex_unlock(&gb_tty->mutex);
 		}
 	}
-	mutex_unlock(&table_lock);
+
 	return gb_tty;
 }
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	unsigned int minor;
+	int ret;
 
-	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
-	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+	ret = xa_alloc(&tty_minors, &minor, gb_tty, XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
+	if (ret)
+		return ret;
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -373,9 +378,7 @@ static void release_minor(struct gb_tty *gb_tty)
 	int minor = gb_tty->minor;
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
-	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
-	mutex_unlock(&table_lock);
+	xa_erase(&tty_minors, minor);
 }
 
 static int gb_tty_install(struct tty_driver *driver, struct tty_struct *tty)
@@ -991,7 +994,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.53.0

