Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4D72D613
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 10:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727691258; cv=none; b=NL3L+T3M2a/w+faeoAvdIQQ0oK6GJ2nmi5VXT94NWrQA4xQJOTtjoFm1aVQ6ZJaNsCZoGp4jx8SmtALRtP81rc+aNFmSiNJCPsk1lCs66UExEHaIXQq0/lKqBOKVczVACJmLkfy7Hl+WiT4uLUy/rWN1jdnl7IYZJzI73kt4Odc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727691258; c=relaxed/simple;
	bh=dWeU6pnFmFv117vXa519B54aTfsRh0l6v0ZkfL5Lwtw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L1h4peXwvpx8abLlMTb/jDaUDrFs45pgK3lul32U+S3OnN/jOsfv8aMMVSYjuLeu3DHW5v9gQbTwWNuzDBEgOpwLjhedqcaItMEYXlyXv2dFjupR0v2BY2jiNp4ZALydphw+fKWVo1/legF6SG2qmJSxT8ZKAVsp4GJsGyOT6W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyZYkq+z; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyZYkq+z"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7191fb54147so2997508b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 03:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727691256; x=1728296056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeqWJOPzZaRbF9gG0yA3SFCc22f9/UbzzT3ylYy44K0=;
        b=ZyZYkq+zb8RNkW09LZaFkDiaCD9Jwdu6ole/2cur8CrDlC/uBvdyHUUXTz4Kt/Qqpd
         xYDgdrUey3dN/Rs6hEC+++DGAhX2ZFO7oDgQlhhRG6ziWLuw+AE8wr+DoaxMTzqjFLnt
         fQQYYUlTkKtp6MLSg4a0ykrUc6wTQQz8FdnNqEcHfMC+WhS/QSPpGn88DSl70VEFF7za
         eKF8Wn2L8zxKX2O1WzR2+aGLZzWiBdEjfkMpxXzv3BlLxvBItupHHuq6NI9VcAsjOTIv
         G4KkM8/BpSKiHomUC8pGppTfK63OkP0+Pl7kn9OPp/9lFLEcOS4AH1/6EhGXI91x8kys
         a+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727691256; x=1728296056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeqWJOPzZaRbF9gG0yA3SFCc22f9/UbzzT3ylYy44K0=;
        b=oR3PEDE809gs14LxvEK76bBjZQYJPwgdE/l9jngH8rYYixG4ZHgWHBpwX7p79f+ENZ
         iOFWagBRc87WDYgEzGqyG36hJgVIJiwcgaTMpOzfZnEQBF0QPgntq7aD7ownVp2uRO3U
         IDTuL4LWVKegEkZQ7B8iT7DI4wuEJwjlXql4SV9TadRgGsixkHh6ZVHx8DTmvpWPiSyt
         D2ZP22eMD4saJ8O01WKgYQYdLA6M0O24kaK3GZVW0FclOR5kJl2hRXM7XTKfHitZAzdB
         JBAnAaYfa/X3QvSxg2HgFjmTMMH3WoMhA8MhD8ezlhqguqa5gLjYSoVDooaaljpFzSaa
         z5tw==
X-Forwarded-Encrypted: i=1; AJvYcCWRL/RbqiQKKxBf4bIuDOJXd09Cx6XuJ0XZvnmGE3BaKhKOwzfbqS/SmQurkWkhqTN8aG0swqTNrcLdZiT/@lists.linux.dev
X-Gm-Message-State: AOJu0YwRYVcXg50c5RCgtfIL4BUGz/Kx4E4qkUOhmRe+AhCv+vAhWZlf
	BPSnSXFCHcPmlBVWoSTRyU+a6u+PNLEbst0NXcrrc/hfuft3BfpM
X-Google-Smtp-Source: AGHT+IGKdx6IwYAgMFCo2EOm2aLHGc/L3S3ogRZ0t2c/hlLVQF5CXlJlAybcrG4oW/fHQrb/dtI+YA==
X-Received: by 2002:a05:6a00:1813:b0:718:d9fb:63e1 with SMTP id d2e1a72fcca58-71b25f3999cmr21202444b3a.10.1727691255909;
        Mon, 30 Sep 2024 03:14:15 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26536fd0sm5872043b3a.206.2024.09.30.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:14:15 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: Fix atomicity violation in get_serial_info()
Date: Mon, 30 Sep 2024 18:14:03 +0800
Message-Id: <20240930101403.24131-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Atomicity violation occurs during consecutive reads of the members of 
gb_tty. Consider a scenario where, because the consecutive reads of gb_tty
members are not protected by a lock, the value of gb_tty may still be 
changing during the read process. 

gb_tty->port.close_delay and gb_tty->port.closing_wait are updated
together, such as in the set_serial_info() function. If during the
read process, gb_tty->port.close_delay and gb_tty->port.closing_wait
are still being updated, it is possible that gb_tty->port.close_delay
is updated while gb_tty->port.closing_wait is not. In this case,
the code first reads gb_tty->port.close_delay and then
gb_tty->port.closing_wait. A new gb_tty->port.close_delay and an
old gb_tty->port.closing_wait could be read. Such values, whether
before or after the update, should not coexist as they represent an
intermediate state.

This could result in a mismatch of the values read for gb_tty->minor, 
gb_tty->port.close_delay, and gb_tty->port.closing_wait, which in turn 
could cause ss->close_delay and ss->closing_wait to be mismatched.

To address this issue, we have enclosed all sequential read operations of 
the gb_tty variable within a lock. This ensures that the value of gb_tty 
remains unchanged throughout the process, guaranteeing its validity.

This possible bug is found by an experimental static analysis tool
developed by our team. This tool analyzes the locking APIs
to extract function pairs that can be concurrently executed, and then
analyzes the instructions in the paired functions to identify possible
concurrency bugs including data races and atomicity violations.

Fixes: b71e571adaa5 ("staging: greybus: uart: fix TIOCSSERIAL jiffies conversions")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/staging/greybus/uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index cdf4ebb93b10..8cc18590d97b 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -595,12 +595,14 @@ static int get_serial_info(struct tty_struct *tty,
 {
 	struct gb_tty *gb_tty = tty->driver_data;
 
+	mutex_lock(&gb_tty->port.mutex);
 	ss->line = gb_tty->minor;
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
+	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
-- 
2.34.1

