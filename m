Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1059825CC74
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 04:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761001; cv=none; b=iLSlYukhR919MQGPzNGB2BhAUdzy4JtH1W/2Lq3QNRiEXRhq9JU0ituPiPur30v4+896EDN2BK4b1KUjGTwfbvJCxIzVoykk7sBXUK3x1KGpbl3IOs411XD+pfVmdvBrIDL8fKW4wSyC8EESlIaBvNFwe+9zVyAmzh4h04XPwLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761001; c=relaxed/simple;
	bh=+Fzr6kEopBOBGruOQNRZeskEAAtW+K4Nv+xnTvdpk0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkuff7PP8DDJSvLI/8kLzC4adGcN37RKLffH7bHW0yFBZrst+UlkBqZ0/rNcmfCoqtSg0X86vUDJHty7WM4MtBKZuLKIRbcXWWbedbL/2iSn2w1oPMpD1nMlep6k3bZtlweY3kWChJazSFAitCH/bmKXjXgA27Epe7wTumhOxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4efA8vY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4efA8vY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso975856a12.3
        for <linux-staging@lists.linux.dev>; Tue, 06 Jan 2026 20:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760999; x=1768365799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmNZiMiLRz7C+tpqpi8aiFEIQgPCT214fV1yD6bvzyk=;
        b=Q4efA8vYbqJJhMnl7zVe1SphNbd2xx5Fulvex9vsL3/0URQE1t5xsCQY2rBsPVooLB
         bs46BC5MLM9ZLoOBlSRuQ8SAkekpS9/qFcfTW79QiX3iXt3fsAT0J4OOK2Z17l2jNd0c
         0agDCEU3XlgpABbub9RGLP9oNPQdK6PgoT+1fc1+pKslyYrWJIkgD9dKYCFapjVvULNO
         Y4U/irymwBIQB5+fC/ChUXRdKl/U236k7JQWI4MEhdifRrPXNefvo4Jtv18MozQYHFq5
         CWz/7XSiM4Yd9EXOffZM2yMaqoK0fdKH9jingq0o7bXjqr6LBpOvo/8QY8mrQx3F+fe5
         01qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760999; x=1768365799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CmNZiMiLRz7C+tpqpi8aiFEIQgPCT214fV1yD6bvzyk=;
        b=hpMSeEGC8qJmE7iOm2+6VyAVmSOg1Iu8jhosZi22wya2FN1V03FcQDKByWB/ga2VXG
         ZCmlK2BeIjASvdnbR4m68d48xbn9hVfUYDy4u+GVz1/AGG3gOo9EPmfZkvmKviAXSN53
         84FBRh9YR2au8E+DST7AjZfocLtphxKGBW9VXZ6jZnDfqEaghbXFSUGpWEAAYbk5F6Mq
         Ae1b5nXy+4OUr97IhImBkQumRXtzs+MGgpBv+Mz2BBYXtiC8vUP97kEIO5VwME2k5i8k
         H8yQMC0TFy8Ox710ruV/QM0XgTMgnxuXTs8JFIoomvAa2uhK5yo1HbYA8mWmWYE37rqy
         qcqA==
X-Forwarded-Encrypted: i=1; AJvYcCX/G5pF0hU4iy05iKCZL8Ky0KUTCHm29bHAR0IuFcAkEJEfth/NB0b9QO+1SinB6E8v/z0/I5aUSHhDq1un@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8UzhjyvdO4NBiteD311w/dLZ4KddR0LbIZgGEdWIzdgXWyYf2
	H0e5RL9vN/6Bp3onjRHGdejhDIDNtfst0BrRRBCa5YW1KmVZAj+WeWJs
X-Gm-Gg: AY/fxX75Snsao/qMYI2c2eH75BFHN9duX26nMWCwlY6mBmhl0kdr2IQ8i80HUil4iWv
	o67u2zIclK/dao8wzzcRPBw+zOliNphh1Rv+y1569DyvQBqbPFIuKYpSHHk3kXRmUPEx/XAL3aM
	930YHQkReOtAymbi+V1G86R2Zzsh9xlYqKwpgJGzOYb8n5q6PsTa9cjFnz2Pkjd892k9+LMlqq7
	dJq0qrGdyheFjtzNXaXt48xC0c41j+ttOUJDH6TzSw1Qqzh6dYXpBismST1fd8bB6DLe2XI6bFJ
	iLj78dovRugIOLJ+OdFoONJcga188rFKbhXHj+/g7SHCKL1sWbAjYf+s97sT097r8nYqQWRcMQU
	WQ14bTRcyGEJJHjqvfo1XsxQ/XCFfpIIGFLhefS3nNzwiApLZvhNQMu2wjYbSuEL0AjBgIHoq/f
	PAaWc2Ve6zzGPF8yh2datn3+iYizgiuXUGxZxrdGV6b5xlSgOOmq56Pg==
X-Google-Smtp-Source: AGHT+IGyLXpHnLdUccdHLbJKV2U55q9FpnJ0qEZouF7Rk2ZDPQCEjkM51aika9hOgCehETQQWJIYhQ==
X-Received: by 2002:a05:6a20:918e:b0:34f:b660:770d with SMTP id adf61e73a8af0-3898f9dd14cmr1103698637.55.1767760998777;
        Tue, 06 Jan 2026 20:43:18 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:18 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:56 -0800
Message-ID: <20260107044258.528624-4-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107044258.528624-1-chintanlike@gmail.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omapfb provides several sysfs interfaces for framebuffer configuration
and debugging, but these are not required for the core driver.

Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() to obtain the backing device at runtime.
When FB_DEVICE is disabled, sysfs operations are skipped while the code
still builds and is type-checked.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/Kconfig       |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c    | 18 ++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index f4cdf999a080..2d20e79adefc 100644
--- a/drivers/video/fbdev/omap2/omapfb/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
@@ -5,7 +5,6 @@ config OMAP2_VRFB
 menuconfig FB_OMAP2
 	tristate "OMAP2+ frame buffer support"
 	depends on FB
-	depends on FB_DEVICE
 	depends on DRM_OMAP = n
 	depends on GPIOLIB
 	select FB_OMAP2_DSS
@@ -13,6 +12,8 @@ menuconfig FB_OMAP2
 	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for OMAP2+ based boards.
+	  FB_DEVICE is not required, but if enabled, provides sysfs interface
+	  for framebuffer configuration and debugging.
 
 if FB_OMAP2
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 831b2c2fbdf9..38a635d38d58 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -558,10 +558,15 @@ int omapfb_create_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("create sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev;
 		int t;
+
+		dev = dev_of_fbinfo(fbdev->fbs[i]);
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++) {
-			r = device_create_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			r = device_create_file(dev, &omapfb_attrs[t]);
 
 			if (r) {
 				dev_err(fbdev->dev, "failed to create sysfs "
@@ -580,9 +585,14 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("remove sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev;
+
+		dev = dev_of_fbinfo(fbdev->fbs[i]);
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++)
-			device_remove_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			device_remove_file(dev, &omapfb_attrs[t]);
 	}
 }
 
-- 
2.43.0

