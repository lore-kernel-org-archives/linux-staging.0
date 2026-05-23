Received: from forward203d.mail.yandex.net (forward203d.mail.yandex.net [178.154.239.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18563321BD
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 05:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779513340; cv=none; b=AsDfiL/MS4pNCL+eO/exxxjatLFTAPIzI3UmwYWv3L3CE92ObE+1y9nG239s6wh1fTB1DIsSJ1hANT+H+T9OAjK/R3+rWFanLDKGO8L3fv9qJ5jzkSfUiX+oebsN/jLj0z5cZmLQD6LGEyISG5PPmiJiU7LPB6709S3SnPik9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779513340; c=relaxed/simple;
	bh=jhAZhwYyH3z/UIhyB6X6iqPxCoGsOadQwL2r0JLKflQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofn929UckVUp8nY3VTpRf3CDH1UnNeHXjxjtUFIKZe9bYkg42LgvJMtqyGqqujrKQOqo4v7mGzIgBowYZ0/weai8v+89iF3FMGgwxFSDdj1E7afNHfbRBk/5r7yYjYQrU3UdHBE7TCPqObWovYDVAq2agwtAHh8pgXi5TpdV36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=cLmbDDjY; arc=none smtp.client-ip=178.154.239.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="cLmbDDjY"
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward203d.mail.yandex.net (Yandex) with ESMTPS id BF57782609
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 08:15:26 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:27a5:0:640:93ca:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 08CA3C0040;
	Sat, 23 May 2026 08:15:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp) with ESMTPSA id DFNL0fJe2Ko0-PKEWkJ2t;
	Sat, 23 May 2026 08:15:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779513318;
	bh=fXeUhCQGKvbFptJcpXo4xTKVP8cMRRXUXFFOsgvWJ34=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=cLmbDDjYqM0/s3FszkQA4FXuZZCutTFV9FhaWenSkoa+ZUNgkqjXYyPjh3/u7TjW5
	 8RKhbnrkBchgpUHq2WpBWYreGQPLbpNQWy962O+0h206H/Xf+RRsD63KEB4dg4718N
	 bTbyr9+6+IdwsWEmIjoPWFZRQSPwAT+JtJa1wVZQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 1/5] staging: sm750fb: remove commented-out forward declarations
Date: Sat, 23 May 2026 05:15:05 +0000
Message-ID: <20260523051509.166152-2-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523051509.166152-1-ahmet@sezginduran.net>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The block at the top of sm750.c declares lynxfb_ops_write() and
lynxfb_ops_read() inside a commented-out #ifdef __BIG_ENDIAN guard.
Neither function is defined anywhere in the driver, so the block
is dead. Remove it.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..02db1418476b 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -8,15 +8,6 @@
 #include "sm750_accel.h"
 #include "sm750_cursor.h"
 
-/*
- * #ifdef __BIG_ENDIAN
- * ssize_t lynxfb_ops_write(struct fb_info *info, const char __user *buf,
- * size_t count, loff_t *ppos);
- * ssize_t lynxfb_ops_read(struct fb_info *info, char __user *buf,
- * size_t count, loff_t *ppos);
- * #endif
- */
-
 /* common var for all device */
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
-- 
2.53.0

