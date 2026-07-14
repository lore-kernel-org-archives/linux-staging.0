Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558C4D8D93
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056294; cv=none; b=XBkacLmYug2BVbDNajEM7xYGSNcDj6u7GJ1kesrhXx4CrBM675KjpxJrFy3igxoNSrGNuaVDO4/G0TX1CpcTUipslcyqVwSOyOb0hYVmoIvJ1K0FOZvAKhU7t67LS+YVT7yLazzj38UHCYA7V9NGMC1JnfTthTKz7xulrIEEUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056294; c=relaxed/simple;
	bh=Doe/noE/VDzrhJcyhcBLmdrRHSxJXKSyGVrXNoRFS60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgmxmQ67QMLOViVwn4PKeWWMQ95rI9s39lxAoOos9rNs+o8WRLiIyA21nTkjXLNehyZQTXwMa52I5h7VlF/UIxBPeGZdaFkAOM12D5CjF54957ejeQtoesA6TccM8TTe0W/ebtQnzNiy8ZEO++0QtC+zrlxwliv889dPaK9dqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=poqzi64f; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="poqzi64f"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so39237785e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056288; x=1784661088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfWoPu5aITaJ5jCwkR3a7VKo4LHkSTdvVPxiL19RVY4=;
        b=poqzi64ffpJg8eJemFnhU16DAyaK1WEb2GMpUl0h7oz/4UCpySz8pA5eeYTRb64Mpc
         QuLDGXwXzBjLnn0kAoGnFLk9DELHT2EyC1bqbjtu/j4Wk2KJ5RgAKqSufBQofu7QwAiG
         giticBXCwBukKSv6bsnv6VvDDJDb920UPxuTOOs8osanS29BVf740UGC+fznDEfuB4pI
         RgB9EmETBsvV5K2tTPlJoEVyDMe9iFGJA7UPKJMmy+FTM4wI2057JBQyk3ek/JHpdiyt
         FhVHvNi9b3Sp/m9aOt8r9ZfpkaJ3p92Xjp5TDGlWQH7OFdwi9iEeU8P2lKpx+Mgb7TZi
         ULug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056288; x=1784661088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfWoPu5aITaJ5jCwkR3a7VKo4LHkSTdvVPxiL19RVY4=;
        b=V5AwK6P9dvZolA9wVQ4aK6kkJN+DpkzILGZv3xFq47gkMZL5islVFFRH5cdC0rL+qf
         DRp1In6E5l1uvO/KhrgVcDkGzvo2dyYxf6LmJmXU4Wnnrvt0LbDR0gsG6B2a6+bccDdX
         OxljLI64I5AvDPuIWTjBi4RTe2OUJ7kJMIRMSD5Z5QqKN/+9bJpItuvj/J1AY1/hYHTQ
         Uj2Ep9N/Aq20/cn5IaL9gzgI9QGYdl1x7H+gDajklYNge3IGN5IsM5WGRBFX0lfEJzHA
         vZ7c/h78R7crw4rK3y7oOcvkHiszbftzFi1mo1CwYMx3sDZCxEWFV+ZJhu5ZJDzSYM6U
         7csg==
X-Forwarded-Encrypted: i=1; AHgh+RqrWclGjyD5kstFyc+GLYuaoEzaqcXbrbZjvp6cBWgSl7ToCx/exnjC1I3SLZr/2HrCJfA/wUdmUjd5hRsf@lists.linux.dev
X-Gm-Message-State: AOJu0YyEeJpFdyNy5yoA67o7/p/KVcBIYJKt3OpqMPDA7A2trpVsJ039
	21L6zYmpEk4hTNiQdHiHV42wTRdMR33I/VEZk4bwxK7FbSJFiIMLZfBs
X-Gm-Gg: AfdE7clrP39y03ZKUbpOaEXMi5FPzbvA4BY6X4K39t1q3ES+P6dblzbA0Zxkvnm4V4O
	T/5TPKLJ4EFsvvJ1rtDR1VrtHBKfGAV/4PnYndQPfJj6/x9f/O/r2bte+BOeHyrHfH9XSpIlF4I
	MIR3k2ZXGPSdrurx4/6U+qEfXJFUeiYWOc+aTD+gIwYRAiH4Y1ftwOq0vanJO0/E/W9cteWNwNw
	uRiw6Qwb5UzReWOJfYlXZDWkY8WUN93VcUTrvTXNbe6lwAbwKZD3XkTzUKbyWYqCyDmjHI4WfFt
	CDLLxWV8i9pnpagiG/z1jdmgwzPzob2J9fg9TJa7ywSLaeDQFDRslo28kCkReXjaTxiVpy8zfP1
	IG5aer5y15ciIHwB9P4ewLuVcrpdgKFkyC0V8Q7ANAQNywbMFSIaSpqcIUKr7QUwBoEN3J/Q0hN
	XX0DvWG/6O49G7gJR2E+ITnvjvozIW3+9OErckRCApklt4oGoFB7Ruk7NglKLPt9rLAw2oRem49
	aq88s5+Js4XIlqiCXTv2A==
X-Received: by 2002:a05:600d:644d:20b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-49538992cfbmr31608585e9.5.1784056288413;
        Tue, 14 Jul 2026 12:11:28 -0700 (PDT)
Received: from evil-archie.tail5479a9.ts.net ([2a02:1388:23c0:16c0:aa41:f4ff:fec6:26e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm100677815e9.14.2026.07.14.12.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:11:28 -0700 (PDT)
From: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: namcao@linutronix.de,
	tomasz.unger@yahoo.pl,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Panagiotis Gravias <graviaspanagiotis1@gmail.com>
Subject: [PATCH 3/3] staging: fbtft: Replace udelay with usleep_range
Date: Tue, 14 Jul 2026 22:09:42 +0300
Message-ID: <20260714190958.219437-6-graviaspanagiotis1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
References: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warnings preferring usleep_range over udelay.
Replaced udelay() calls with usleep_range() providing a reasonable
upper bound to allow the scheduler to coalesce timer interrupts.

Signed-off-by: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c    |  4 ++--
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..d2400bb44f1c 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 200);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 200);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..e26766f58a50 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 200);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 20);
 	write_reg(par, 0x0025, 0x003B);	/* amplitude setting */
 	write_reg(par, 0x0026, 0x0034);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 20);
 	write_reg(par, 0x0027, 0x0004);	/* amplitude setting */
 	write_reg(par, 0x0052, 0x0025);	/* circuit setting 1 */
-	udelay(10);
+	usleep_range(10, 20);
 	write_reg(par, 0x0053, 0x0033);	/* circuit setting 2 */
 	write_reg(par, 0x0061, 0x001C);	/* adjustment V10 positive polarity */
-	udelay(10);
+	usleep_range(10, 20);
 	write_reg(par, 0x0062, 0x002C);	/* adjustment V9 negative polarity */
 	write_reg(par, 0x0063, 0x0022);	/* adjustment V34 positive polarity */
-	udelay(10);
+	usleep_range(10, 20);
 	write_reg(par, 0x0064, 0x0027);	/* adjustment V31 negative polarity */
-	udelay(10);
+	usleep_range(10, 20);
 	write_reg(par, 0x0065, 0x0014);	/* adjustment V61 negative polarity */
-	udelay(10);
+	usleep_range(10, 20);
 	write_reg(par, 0x0066, 0x0010);	/* adjustment V61 negative polarity */
 
 	/* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 300);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.55.0

