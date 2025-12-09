Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D63009EC
	for <linux-staging@lists.linux.dev>; Tue,  9 Dec 2025 04:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254505; cv=none; b=RoqgPUrPZMI7O3p+i61qmt6Pe/B4xoNZeGNRbUjP/QBbUBFfWTLQlXfsTcMy0SzDwEZTL5U+rr7CFw44L+MIPUgsEu2o7vbAuiboD8JSA9sIdeKJiKeph+XanItBTsd7LwuMDvVzKFrVIsv5u+/8A9vJxb7yKuBM+bhvt+cNpzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254505; c=relaxed/simple;
	bh=3pidgD9TpcdjmuGEM4+2gj7Du8pBd7MRvFriroyxajI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlqtVbYTC90pBMWn5rmcmiplVWhSq8MCqhkQn35I6yBocsESL8vzD54bc/CyUhJRyUqxM3ZjoYF48RmH6w4PZ1VD3zOZaubS0zv5FbIkn6ohyX1D7zS2vVLopA0NMSZcDAnLZ9K4hqL3lPuUOiN15KTWc0lvS6Q8gZsew/cmX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqLqCjE+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqLqCjE+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340bb1cb9ddso4282640a91.2
        for <linux-staging@lists.linux.dev>; Mon, 08 Dec 2025 20:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254502; x=1765859302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoV8ebquCT6L/RZ0AqbPbGv9Gx9G1WrRRbUTSZpd9fE=;
        b=cqLqCjE+9jkAL2aK4PB8MV6yv8+5GC6/4S9gDSBBhSbZxyfshvjHCqXAaypK51LT/h
         qm6oiHk0AdbWBIxqYkFlDMZr4HEOLivwSH/d1hiU/Y1Rgyd5Y57ChQOGGVQM0B27qLXn
         N1qFqAWeNV9L1zltPl4UlIH4t0mHGRFcNh6JaQ7609feaKD1C43RCRK9Kd+tc100o7gx
         VO9MDwxgny3WErysPQzL2COtHsWG/r6UXHBR/esr/G1eO9A8PCBdDhuQIyjMY/gpdAan
         Rt52ZBPB3MZ5k/NTRosHelETOAiSzt3MO6WeDZL5mO2OomWYpYyE6eE8v/FyC6U12VWw
         aubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254502; x=1765859302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DoV8ebquCT6L/RZ0AqbPbGv9Gx9G1WrRRbUTSZpd9fE=;
        b=cJkoK82IgxyzCNTShNBzb3jU1ULUkm9iamcGu7OPW1k4A3cvlb0cWgGIEmPdaZhKdZ
         Te9gpUwlxBcEP8MiT8/wQcEwORfheLqEnDsF4hPhrnE7ZBsRE9U+yh7UJMACjGgO8j4M
         kOn3KeG35ASYNMp6WBMNw/Y25j416QcOQ5IXO0a8LbkfBEq5Ji7CoMmzbtbkQ8XbhXj0
         9iueHTC0XHsJ0DoOik1cGGwDjhN3Olu5A4hn/7jiA1FDZRZgdLwREMGm1tDnWE1aztFG
         x8OL2/LpjQc2zMYiQjOmApGm5P/MHfHgjMAAh66SC1flIsL56AcXi0od7MgIUlTGB/8/
         wRew==
X-Forwarded-Encrypted: i=1; AJvYcCUhwm7R7s4yDKMnm18S0u8mE7u/5I2DzSBosl0c1+5sNJvR026p3Z9xgAMLSirvIHzJAedGOy/xOPueA0GY@lists.linux.dev
X-Gm-Message-State: AOJu0YyfjY0y/IolBOaZ+aAejagP/125CwcT8E0porEwKl8vw2XPdrCb
	zQ+ay6YbHcwW7W+/GUfKKzWNE0X3DfqHpSb701pPOgGVgvyyQUv3Z8co
X-Gm-Gg: ASbGncuK9dFbGlwPWRsld4qhHgxED2E9dD97LPagkprHC0iwmAZViGDUhI6+VYlDUgS
	YdKLImGLDONAF6rOrEWN/cq4a58Z+2h0mc0ctLBiXoV0wK7zXFVe3yXlDVc9cDIbiRPF0WnhPCI
	Pq01j5IGa6l+4YCmFfd4TW+04TMv4qNNHXM9SyBKDpKSasRDT5deW/78psjnCaSUPPWB3EB8t9H
	oCr7qNeRzB9dQjNJSLwDVZ1PdsL1T5VjX3QAc4lZlmUsOwAtwXk6OFnRTFZhpqKe90+qs5zY8T3
	MMaRoXSuqMdjHEqIB0o2mat168SDghE+jdwz3+/u9dlEntYkbgVGz14sBXx7CwRr/aKjNohILyp
	sw/Ak3dx+M0u7nG4+jIQsNzmE0RS3BBTrpZhbs0nsCsvrcdKUxO1Zvpmv2qZBLT4iDroKIRK5WB
	EaDYgQgkPh5IwiQ/WI0bltSy47KkhLQ5E25P/VTd95hsc=
X-Google-Smtp-Source: AGHT+IGhZ172wJMCe8Y+hl9H/FCCQtSdsSpkHLmThykFWMzH/YAfrcNiqXS6r43YyTp5Eyv9aHLeZg==
X-Received: by 2002:a17:90b:1a8b:b0:343:f509:aa4a with SMTP id 98e67ed59e1d1-349a260a9d0mr7994609a91.36.1765254501596;
        Mon, 08 Dec 2025 20:28:21 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:21 -0800 (PST)
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
Subject: [PATCH 2/3] omapfb: Guard sysfs code under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:43 -0800
Message-ID: <20251209042744.7875-3-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
References: <20251209042744.7875-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omapfb implements multiple sysfs attributes for framebuffer rotation,
overlays, and debug information. These interfaces depend on FB_DEVICE
being enabled.

This patch wraps all sysfs attribute definitions, registration, and
removal in #ifdef CONFIG_FB_DEVICE. For FB_DEVICE=n, lightweight stub
functions are provided so that the driver builds and runs without
exposing sysfs interfaces.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/Kconfig        |  2 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index f4cdf999a080..ee664decbb64 100644
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
@@ -13,6 +12,7 @@ menuconfig FB_OMAP2
 	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for OMAP2+ based boards.
+	  Selecting FB_DEVICE enables additional sysfs interfaces.
 
 if FB_OMAP2
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 831b2c2fbdf9..0a340f69484f 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -24,6 +24,7 @@
 
 #include "omapfb.h"
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t show_rotate_type(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -585,4 +586,14 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 					&omapfb_attrs[t]);
 	}
 }
+#else
+int omapfb_create_sysfs(struct omapfb2_device *fbdev)
+{
+	return 0;
+}
+
+void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
+{
+}
+#endif
 
-- 
2.43.0

