Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72952E0407
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072550; cv=none; b=iRn6ZSrgjiLfMfxVGc+/wsgNTjc5Fu+7+TDHeDEfe70ylYKgPfpMubXT9FgblDspAfnqyvosMhjrePmd0RCJe6cFszQBAc6cIPScB8NP4QUO0CAuNFO/iswNk+Ucr7TDCxHCgfaKMRg+C3PvmvHd8JNUa/MhERw9KAdpLNSUTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072550; c=relaxed/simple;
	bh=NLZLkjHuusyZxcw9lTFQIq8VGGtemLVYiNqCQHZYJL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxWNor3xSylTHTuxMgbm+2SrSMjb5p2E7IIc5UwGiWueWXH4wzrnDpVCP8zZSybPvzfbMwnFKcDqZ1p9vOpGYWWPBzurvm8sDZ5mPQiNimkUtRKJw3NnardCGppogfOrEoB8zFPxkY4NON6q60TWMR493vxexQga8VJc1sh4sns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxi+rHLe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxi+rHLe"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a12ebe4b74so172909065ad.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 21:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072548; x=1767677348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ci5hl1fGtHa6SMuwo1VapvWaLUMCAvqlqzaI482cWA=;
        b=Jxi+rHLeYEqlShQadSPRikJYcqTOW7noyuGaJstrwUac785rRl6ua5qab1Zsj7VQSQ
         AOOoTYjEJv0xM171B2jDrCITEe8X/V0y1tvYuazbOEWnGx5V1YMIwFue/WGNnaGMSNQ6
         0r4UKjNxm5okziGxM+gEQ4Kk8qQVsD0kJZL+ZQUHouayLUVRs1anPbrwymAhC64ARCgT
         XRiMdWRzVjLHzpDMdQiiJUW8Lse2ch3zB4JpcUw9kbmaYKpg1GLe3bAXRzluncl7xgMe
         d2iu9WnDIwPNazokvb1Nco/CfsnbPOocFfuUzfT0pwBXElKJ9mslMD93pV8BOGuNBCjo
         1iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072548; x=1767677348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ci5hl1fGtHa6SMuwo1VapvWaLUMCAvqlqzaI482cWA=;
        b=kJzxa1yplsKaaNNNMFuJzI6CTohhlbQoI3xZdDaZUxA0P3rCoyRQY/fcWqFSB8ygOE
         OL2lGncP17ymv2FifpaBmWwz743REQ5AhDrqXCh0yRGxNL/52ktPkJlkCUKGw/H79RQb
         279TPtFnXsJnjMrx7BBMd5ZanEFY8AI/9DzaQ6vwGVx6pGiXVWRT68jtaLrtOPDZKeid
         +y2/nz+PqaluCQ5nL5BrsQ7XzpAWHSh3s/rRGNn60UyVb9M1a1cHm/ZLyp/vfAtyBq2y
         dUpeCmidqd+P7MmU1y36Xsws3MzU2ArjuEfvEIVqnpI2Og4+98b1+DSFm9+zoFVEXdZW
         fkQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXud06ZGxxIm6jlMOEA4DUbGLp821wR7PGyog+puGTO4riPsTR+cxUp8IgEeH2tyv25EupAacaVO1FFSiiD@lists.linux.dev
X-Gm-Message-State: AOJu0YxGrwIO7tVFKDzRwRlKC0bVH8ohq94YyMI5RJik/cs5gLxIfHkv
	1dCKf+I++xpTewng/of2XR7VVmxwtR4QABzEzh1k9grMQR5X3EXFi9OQ
X-Gm-Gg: AY/fxX5s1iSOx16ayvnULd43PNDB+l5iMla5py+upm6YSREbIG0QF5EWX/Iitwei7CH
	W/Xxl0oqgO9dFwxjR0ADakMH5+QCTr47KmnBKzVaSr0gv0W5dnZZQbttTp7zmzsAeUDBCXIiErl
	T9NK35ffB/S3kfWDDJ46TFM6A38teHh2YGYqHSs+vW5HJdmUgP22srqwrbTqhmfyJxu0X3j98vm
	Jkva0WhfquIHHiy8BcQO6rsDdi8Dn/XouxEHVSRumNsPPsw5GXpGofel1cCZhpvGGTHvOgQUD9x
	V+CNJF47NfbxLXSFzBU7Gu+HkReCYHi5QVGQNLMwYfOgnZYomJhz+KgwpFKHa8D6RE2M766Ms6S
	wkDFrYFCFHiuS3wkOF2SaulbTgvh3Fj63qWaCX3zYYD15Dn08D8/XZrwCZag1pZO9Q2AXADASrK
	LMjxa3cuxL/pt7oGjvgM/KNM31qewYrwjcC8L7qRhrZA==
X-Google-Smtp-Source: AGHT+IGHZFAx8HgkjBpBEKVqWvo2fMWKQIfWR+KFRWNCjGwdqjZSd66OErzGlHaqwrUbyJ5EQMboOQ==
X-Received: by 2002:a17:903:4405:b0:295:565b:c691 with SMTP id d9443c01a7336-2a2f22292e6mr304546365ad.17.1767072548211;
        Mon, 29 Dec 2025 21:29:08 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:07 -0800 (PST)
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
Subject: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Mon, 29 Dec 2025 21:28:21 -0800
Message-ID: <20251230052827.4676-4-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
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
 drivers/video/fbdev/omap2/omapfb/Kconfig        |  3 ++-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index 831b2c2fbdf9..ef555dd598aa 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -558,10 +558,14 @@ int omapfb_create_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("create sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
 		int t;
+
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++) {
-			r = device_create_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			r = device_create_file(dev, &omapfb_attrs[t]);
 
 			if (r) {
 				dev_err(fbdev->dev, "failed to create sysfs "
@@ -580,9 +584,13 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("remove sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
+
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

