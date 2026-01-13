Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B230E839
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 21:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338369; cv=none; b=fEMWM8Yxsz6sRcrwOICFmG3QYrSOKbFIi9WDGn8HFyiCDAAkpmHcCMetGwV0LAD4b+eJ8QbO25DJtIWtLb8AN2nazSf3m1WX6P0JEzZJ7MMb+PeFPaBL+Y/jllzBmG5vCR4udHzCRPXbLkg3Xb5e6jUAdmW0TgAzOgnv0/akPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338369; c=relaxed/simple;
	bh=jfWi2Vl3wrmFdl4z1GlpV7sW46Sn1lmQfia1Ea1G1C0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NwO60KMKG3vMGTJF6N9pXNiJKbbWPI2X7IVg61f6q7VYS42sFSSth+yTWEbwPi3HkH2Oks2w2x51LhbTVI0Hf8DJCsgfEGrKOhiIzi52Pk1aBLgwA8e4fO3rQHv/rHpfsT6HncGQonyFvc0DUDsTeqHpBi0A3OBBT3k+blIITIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6kjuEqf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6kjuEqf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee07570deso4486665e9.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768338365; x=1768943165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX/Q3gJa9nyuedmUpH99IiHZs/+kDUZjSFi8hfs5S/8=;
        b=Q6kjuEqfcP1uvdYdbi30aWiquCjWxk+UenvvNB8gscYYvALYQjFgTP3GXdWEZAV8ds
         ivxvQX6QkSeMXDOjmRMmGPnFL3RFOG/uHKodNxwRFHpz5f9LfwtNfo0b/YUS85aZ4QrD
         9LsW42Xx5VfbIy1HbE6Ma876ygnWMgIizyPrwTIlfnlvxWXtUU/7BEAwJfGIM/rmk7Xo
         29mpr5nBeH7MFUJ+FTNiDe4PlOqUo96PqFZCSLmbZxZMJhOeMxEdvaeH+oZzWujmqMLZ
         0eqTbZosaJv/Kb+HvUxqwChsZNzJLNEiez7gEv7xpoySEVb212MIVIU00p/03xDOgzZe
         d+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338365; x=1768943165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX/Q3gJa9nyuedmUpH99IiHZs/+kDUZjSFi8hfs5S/8=;
        b=FdA3YoyEGTRu8nvK9qFXvzGbv/OTKPf9or+VpwRCTOEcz0fMOgNYzRBdNlVWZbu8yk
         NYF+3EXy/IVgEZH8IWZkOFpxpH8PkWZ9RP6RjaJTe55eBL0/KJeim+Fj3xUYxh/BHoxW
         sIjC6XycbXO5YJUitABgE9FEY8YZH2Kuqz7i1fheeu97KOuKvyH3GtxFKFKHq4JhvCYW
         FfI00dbtjACHoLSXfPtXJq7g1MVSSp72aDq9Dt20wgGs4wtPVTIh0aE6vrSRHPw1kobS
         I1rGWAITsdieIfpjuJluLEQZMGZtfByHKVjfJP4eb7SyZF79zdsD7aFO782+avc8YUDk
         thtw==
X-Forwarded-Encrypted: i=1; AJvYcCUu0ZSr+VZftZe7KnXxrxiW21dwcVc2SVN0NzSc32BTEOqKYDoGoSbrE0QF+A7AdSkWkiaxYQw0ZWg3uzvQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwY0pmMI3p+9BvKCrFrcd6SOrhow5Tp+MWAJINkd6i7qwoSGk0e
	9lhqMjglheKhU2ccHCcOyzIDkQLujPYPEOE1OA6ccpoEfUofHYnehktv
X-Gm-Gg: AY/fxX55f5tPGUjg3i+mH+NMjeSvdGNcR94muTc6Uk7+4tQjexNh0vHGU4tQTq3aIRf
	3/fstkxvsf6jsqFzj3jVSLuKSS4nUI5PGD6zkupLEcHvzizmgamrD4xh5YFUEODaX+G2+MzR3A4
	ERQMO7gKttJrj4ziFGfQ2Tq18OuVQWHPJPsVzuCeLZFu2qvwKgKrQsVndjb0WE5+94CEMoFyFlx
	UehBKM119fMNJh0Fqn2t+FurJsV0jYxJR1evKGULzobF5RIGmR2pl2nM8FypjxZhws62CQ1tKcX
	4NwFa3r5idNVNaHeQKpQl5aS2VGw4UuF+mCxbhWtNs3/mn4o13NamoN8EFWFPQh5aEJNqmwxZ83
	nNc7F/sZtzM0VDBSCYp/VAi5Us5noCQYRVX4SNXtYDXLGsTOWyec2rRFjSg7EA1VRChMrPUWJcE
	4PHBRRe6ogsHksio0maYcMCIkLcJwxLSGLXxrFrqUKIiSYXg==
X-Received: by 2002:a05:600c:528e:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-47ee32e011amr5733565e9.6.1768338365266;
        Tue, 13 Jan 2026 13:06:05 -0800 (PST)
Received: from ubuntu.localdomain ([154.161.44.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ed98abad1sm59042205e9.10.2026.01.13.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:06:04 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jianglei Nie <niejianglei2021@163.com>,
	Matthew Wilcox <willy@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gideon Adjei <gideonadjei.dev@gmail.com>
Subject: [PATCH v2] staging: fbtft: Change udelay() to usleep_range()
Date: Tue, 13 Jan 2026 13:05:59 -0800
Message-Id: <20260113210559.3020-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace udelay() calls >= 100us with usleep_range() to avoid busy-waiting.

The delays are used in init_display() callbacks. These callbacks are
invoked by fbtft_probe_common() during the driver's probe path. the
probe path runs in process context which already uses sleeping APIs.
This makes usleep_range() safe to use in these situations.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
 drivers/staging/fbtft/fb_upd161704.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..ee8d6b10374a 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250, 400);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..aed5cc7cabde 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,7 +32,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 200);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 400);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.34.1

