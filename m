Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14342D4B71
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123031; cv=none; b=uuzRyrJzAASkI/bw5xLVc/n43l/pNXQ5tOCxU0a3jee6KqtOFRE0DAFgH8AkXAjieljiNEuZs0gpytEAX1l3BoC7PLaxRxvkiD8Bd8N4XXqWKMlM3QConzHBXLb4KBS9iO7F7P2mNyPZHdcry8n4BK7zXTwPioNM3rIK7R12Xek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123031; c=relaxed/simple;
	bh=wTBNcJt2rI9S3EuSYIzTN+CG+sDnu9ds+FK4O8Ikt9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCxGUEXii9DG5BvlzWUMBESIFD1HyyonrHtmLlaAq40TxesapStNht8e+k8lHAIYusID+JZgEvN4JEmUtnTDVpcrsD0I+yoc1TYZ3+kjut6ZMSIHmcTiTgroKy8XDzveAfok27MxdRYduarTHpkVbQNFICczOxKa302mYNqbizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eF7X5xHP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF7X5xHP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0a33d0585so13296935ad.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 21:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123029; x=1766727829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyhsaHMpowAoVL5AwJvNjQeVURBtbaVBE0KV9gHYSKY=;
        b=eF7X5xHP7NooTz/OnL2IP0iC6qhcoXlnnbwAzbXcsxwGnGipuLAmZ7PEkDXfjMAL/d
         QuiqJ8/nKA0PPgCSbqBYKdXq88xfbJTsd5KTfFwm+rKqqRqkjwj3HVn7R8e5/XbLUqB+
         D9ysk0YzsfAFXlk3+aQwA3q2fZSIVsT3D7uXxYZH/ffC5FFBfL66S59rlmOYpcl20j+0
         3JiejiZ3Y0YRVVTwcm9AksjKqRpEB7/ZG+DKMTBbpotSs3ff3E060MkxyhriOafSqeyy
         lRH3jK4wTsDMxms/wrLr7nYxUYk4wxjhuqvoH/rnBktYBu8zvee1QJzmUSnRs5d3C9hw
         wohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123029; x=1766727829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GyhsaHMpowAoVL5AwJvNjQeVURBtbaVBE0KV9gHYSKY=;
        b=BCEnAMBVK8EyT0VqakEMmsv8s/0wqYGPMyP/Krlmlw4e7+sXlWW893cD19Oxf7UbQ9
         vr650tOJTbRyVoVbIM2ODuoaxg51ScGCEthggdd9JrqCvZr4rRg+szJ12HvtT++U8z7i
         +vSO1M5asLP6+PBFMGTnRIrf01aykEP/WdqNV/i+wYfDx4/dtZJJlC4YuvdP7OUS1Akc
         /BQ0SRp1meHDdulPcSoddd29pL5yEVW57Mq3uoGQjvuYkiCHjrggKzhaen0td02IBUjV
         sGElDc0byfbdMO3QaYO2oSDNtxrxdLrRDAtxSmw7DlXg6ty1QK77w2PNrssjEt70Rky1
         x60g==
X-Forwarded-Encrypted: i=1; AJvYcCX0lTH21Y+S2RuqUdJwbadKJ6cUUJgG2zVhGKJIzD+kcI++yo0DWQyEc8qzxR3Nm59C56DV2xkUyjN6cH1n@lists.linux.dev
X-Gm-Message-State: AOJu0YwOaOmbQjPpPpt5ewA4J25kapc5c2M8cTG709SvJl17iwhhmh3x
	SpAZoB8/aZXW/yzQojBkNS7mQqHX2AbZlc8l7aLF67QIV2JQBHoq/yCuee9ArhCl
X-Gm-Gg: AY/fxX47gv8fO8FJd0sF/bbz3wltMlWIPxyos+nSRwcdJVu9w9BWxLV4jwShkeQ6ilR
	5obMOPGHwQl1fiYAzSpu6WbZEgg3VfULw0fAYTrKhsnPeKJF2yLt+7MWYsR/am3eKBEZM4g90fq
	+x6i4bV7rn/0q6N8Izc2fO1i3hDUPIeZJ26URaFPOKCO+sm+QMsY2Q691WFpN2TO2Wu/KB9q/CG
	n6f2NJ11PMKbZUoZENwPVmm9P5550bULQwels04euy6qXu+0y4NFuEjO7LDh+B1gsE8mbij7Z4p
	UDENaLAVjhgO2eLzDqziSO6iTMwUTRQ8Rv4NVtp4BLGGtmK6hnTb4GeFs/LEaxiJuQeHaU3gruy
	Gtzd4cHSbcftyeSxeiW1F4WV7nfB3zrKME7adOsGtglbIfxj9bK7F1sFLy9I+J14PSg5E/yEMcA
	KLBE5X/gTv/HNvhYgzKD6f1Tuk5FgHuCRemhNkufUcr9A=
X-Google-Smtp-Source: AGHT+IHXEchSi8iM+Y5+MS3Ww91XngpXuQu21mxZ8hWmVfsLgeWot8cDnyt6+QWma8zqSPX6kmHH4g==
X-Received: by 2002:a17:902:f68f:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-2a2f22049acmr15569505ad.6.1766123029021;
        Thu, 18 Dec 2025 21:43:49 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:48 -0800 (PST)
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
Subject: [PATCH v2 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
Date: Thu, 18 Dec 2025 21:43:19 -0800
Message-ID: <20251219054320.447281-5-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
References: <20251219054320.447281-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make sysfs support optional by defining overlay_sysfs_groups as NULL when
FB_DEVICE is disabled. The driver always sets .dev_groups, and the kernel
naturally skips NULL attribute groups while the code remains buildable
and type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs with NULL overlay_sysfs_groups
- Always populate .dev_groups

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..704c17ad241e 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1350,7 +1350,16 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
+
+#ifdef CONFIG_FB_DEVICE
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#else
+/*
+ * When CONFIG_FB_DEVICE is disabled, define overlay_sysfs_groups as NULL.
+ * The compiler will optimize out the sysfs code paths when dev_groups is NULL.
+ */
+static const struct attribute_group *overlay_sysfs_groups[] = { NULL };
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0

