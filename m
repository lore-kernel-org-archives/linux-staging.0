Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru [93.188.205.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95735772B
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.205.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220107; cv=none; b=f+dku1taMwGnx5H0Rh9hYj4hj0dwUg0MZrf0JErR6I2XxEayyTIRo5w9AnJiH3hEK3kz36NcXIEzUw39DZPqymohVhV3b5ol7/dIirjvLSgYHSM4UY1iaRdstIdAojoXbQj50f2cZPcaXWaw9FGx1I9eaVhHX1SGPasc9JnDkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220107; c=relaxed/simple;
	bh=TrxqcYqosusx3z/UbaVA6l6OPDcl2cGqeX7pIJvYw6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HqPeBSPgUpcQvmIsI4CQ5GHJpRmET5S6rMQ/GsrhZE4a4Z12SJG0A50oegaqYNcTd9B2QqrVXKIvcD0aVgjYj6IXPjzStip8qpm1wss4HhCL0ebeQARfhSZWl0yvd+EezL6IWvW3NQzWu0en42P/eOG5K9PfIMyRi/tlBzv/k8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; dkim=pass (2048-bit key) header.d=astralinux.ru header.i=@astralinux.ru header.b=BDHMHnJ8; arc=none smtp.client-ip=93.188.205.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astralinux.ru header.i=@astralinux.ru header.b="BDHMHnJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1768219726;
	bh=TrxqcYqosusx3z/UbaVA6l6OPDcl2cGqeX7pIJvYw6o=;
	h=From:To:Cc:Subject:Date:From;
	b=BDHMHnJ85E79i3rbaZw1HVEUxkO8KB5KTyVBObpeHQ9o8UXKroU3+EKgxVc/OnZtJ
	 Kbqy+elP/BhlLrFoeM+zFmPWUKB5Y81TjjRPpwXZ9b+6Souqa6pnp+PzZ1d+738mKt
	 t7vC8n7x+EupRjB9JBkYySUJGpb3YNEiutW1f+lWDt2W6E4u5KUwPr4JLUhX1pVm9v
	 smU82hnQMcx5OfRwU6GKAq8Q3TrVJK3hXDEHfTzoX8jPrph7m9ICllGkFTeEojCe0N
	 tRu4rmdnqmMY6iQ88SOYLvu0e20GgdHQWt7aYzJ0p9ClqaHEH0QIp37MSHlY4muOA6
	 nhHiqNkmb+cMQ==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id 60C301F4E5;
	Mon, 12 Jan 2026 15:08:46 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Mon, 12 Jan 2026 15:08:44 +0300 (MSK)
Received: from rbta-msk-lt-169874.astralinux.ru.astracloud.ru (unknown [10.198.25.116])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4dqWNn4Q25zSgqV;
	Mon, 12 Jan 2026 15:08:09 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: Hans de Goede <hansg@kernel.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] media: staging: atomisp: remove unnecessary NULL checks in sensor drivers
Date: Mon, 12 Jan 2026 15:07:49 +0300
Message-Id: <20260112120749.90664-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 86 0.3.86 47cb2a3d3f5c7e795bff2d0998e8c196722872ab, {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;new-mail.astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 199427 [Jan 12 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/01/12 07:47:00 #28107568
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

There are unnecessary NULL checks for v4l2_subdev_format::format
pointer in ov2722 and gc2235 sensor driver format operations.
The fmt pointer is derived from &format->format where format
is a pointer to an embedded struct v4l2_mbus_framefmt inside
struct v4l2_subdev_format, therefore fmt cannot be NULL.

Remove unnecessary NULL checks for v4l2_subdev_format::format
pointer to avoid unnecessary computations and make code
clearer.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 5 -----
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 6050637a0def..98d43b93a3ba 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -535,8 +535,6 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	if (format->pad)
 		return -EINVAL;
-	if (!fmt)
-		return -EINVAL;
 
 	mutex_lock(&dev->input_lock);
 	res = v4l2_find_nearest_size(gc2235_res_preview,
@@ -577,9 +575,6 @@ static int gc2235_get_fmt(struct v4l2_subdev *sd,
 	if (format->pad)
 		return -EINVAL;
 
-	if (!fmt)
-		return -EINVAL;
-
 	fmt->width = dev->res->width;
 	fmt->height = dev->res->height;
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index a4519babf37d..aaf30f072ad5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -635,8 +635,6 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->pad)
 		return -EINVAL;
-	if (!fmt)
-		return -EINVAL;
 	ov2722_info = v4l2_get_subdev_hostdata(sd);
 	if (!ov2722_info)
 		return -EINVAL;
@@ -705,8 +703,6 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 
 	if (format->pad)
 		return -EINVAL;
-	if (!fmt)
-		return -EINVAL;
 
 	fmt->width = dev->res->width;
 	fmt->height = dev->res->height;
-- 
2.39.2

