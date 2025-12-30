Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AB22EB5A6
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072551; cv=none; b=YJb9dpSqN4IrGhV7YnYFACydyZ4/W1SCcedAwItvztMQ9hSYN3kANYQHyrt1CouXNmTHBNbC3w7FXQIv8sxZc0sXFz4XaFTqoXqxXlxSByb4rep0uV3gL3S1iIqGleeBNRCbEFY1N5S35Tz9Iq4D1HdEL6XSGt0Ow97i3uikJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072551; c=relaxed/simple;
	bh=GAGjpPhjgIvIUqlyfKlbs+tqnrLy69m1dh/HDqos+sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHPh56IVDsBCrpyFsfYSL3bo4dOsPjwbvULoofgB/AoxafaUV37KBZP/XnF40KQ7MNtygwUl7sHxI7TIBHmdAN2rHUzjTQp5u6GfID/WXTiAeoq6wXlXqB2NVRxFCyEysnH89fBOgiffsdrmvMVk2TJBEwZpA6GW1lFS/zMvaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6jONEi3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6jONEi3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0833b5aeeso132176625ad.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 21:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072549; x=1767677349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJqOs0RXEJY8E2s1bb5OeUsv+WqHfc5EFgK5KbB75l4=;
        b=l6jONEi3QzggiHYWCKxlSk+//ZCs9TiM/FYjV6BwhtdzhIqspC+g9+3M5+ZVmUQ4f+
         I/k2zgtgNYr3DX2GzLAe7qtxG1EW1d2GvIHS5kOwfdT94yVeDdGVdA683XExtK9jEMex
         9CYVVQLhtV0YsJdUz/elkG7JMub6JTxfCAh2F6bBCFPF9FTIgJRJLHZoK9NlDVf0Hhmq
         SvEiO0XDHUEtDwmavvVdkuHCBNnEM08BpfirInSS+kEly7Y+IQoA7P955p3t12jqg166
         xyxOi6UFsfUATsgXWFmDKpsbeUQRBw5X3twnW5l2mfNUtvHI/D+Oia/nOFh9yDCdW6AH
         SHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072549; x=1767677349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJqOs0RXEJY8E2s1bb5OeUsv+WqHfc5EFgK5KbB75l4=;
        b=lHG3ipma+lPpvKqf//KeHKJxYyGv2Xq9UnnPVF7NX8JHvC2JFIgryXZtLhzKE2PKLg
         e9NpQBGm506hxQstoiBaJeIyhXxd61jjni8le2qCuP7kSPyh8UThH+r/ag2YIZc/XM8p
         hCo3qZyolcqejV2ycxuFT4smT/QHSj6o1M99RbCYqv5epIcv2zPgdNU1gPZISBRGpFsp
         zWaxu6lhYnUc8ZhwCSM928F4n867sMh/6NBvhNRCQkVJcJfvubUQXCiZx4/zmkZloxqJ
         jIHqMhBOprQ0Hqki1xmnLIViKPBQa4y0NzVpazQT28oVNlJM7KrXeZ2V8xOV/IoSBn8W
         b7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXb+VOyRwVoadMpIx0ovJVnY0F1QoYUKD1gAV9hJkEiwztvfiFYliO01eNwX5stcpBnC1JtSBHdRBSLPkJC@lists.linux.dev
X-Gm-Message-State: AOJu0YxlSgZG1k5EJro/zZJ9uECq1hWcM6xgnuy4ZuBEE0DSD3r86TQy
	7eey6WLVmccmxrfkWF+JsKRUcBwifzx9K0/eYUY1MMMD+njUNHKDucfS
X-Gm-Gg: AY/fxX7QjfOg+Q01WQjzIr4Pnd+VsOoqSmDQA+gz3IQuD7uWPcVyUnXCDZFwTkdM/pb
	0d0bAFaMumBl3hyJAkUMOPMDAzJd7+WKlhgPyelSn0Zxx5m+8gwEOckurpXthkFWpv1MGyBbpB4
	EglXPOldEeGzGQaZDSWkGxhYy2lfayRBKIZvE50JabOZaA0wh9+WnLK3ddIWGmG44t/2upfIF9o
	KkzXQJrvCZHEvkKZPl9lAN7hOFJKRFWYK2onnt6xLYiiI+1fMz90IL8q0JAIGFRH6x6YW48ivq+
	5OCm9LksG+r5OwfEr2VbBxXI6fQsd8ET1TAQh/D9FeXcWFr+eWDQsEA3z2PLxvuq0w1ts7ccr5/
	LdnqV1LATeBdzN91ecVN3N5Zfpo7kI1ql8Qz0wqQvGnZhN3+kw/lSQmy6Wpwxqi8zBMpD0JzPpo
	F76uWmMMbY/w0sXeHUOa3v/tgwhslDsaK6+f1qbTcn80Pm/4DW/DEs
X-Google-Smtp-Source: AGHT+IHpNTh/+mtzP6KtG3m//yZa/VBoJcww6MwkW4PNCEdqrAaxVfXefkHC54eoavSEs+b2060qpw==
X-Received: by 2002:a17:902:cf08:b0:2a2:ecb6:55ac with SMTP id d9443c01a7336-2a2f220cbf6mr374425555ad.7.1767072549441;
        Mon, 29 Dec 2025 21:29:09 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:09 -0800 (PST)
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
Subject: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
Date: Mon, 29 Dec 2025 21:28:22 -0800
Message-ID: <20251230052827.4676-5-chintanlike@gmail.com>
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

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make sysfs support optional by defining overlay_sysfs_groups conditionally
using PTR_IF(). The driver always sets .dev_groups, and the kernel
naturally skips NULL attribute groups while the code remains buildable
and type-checked.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..cb7ed1ff9165 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(overlay_sysfs);
+
+#ifdef CONFIG_FB_DEVICE
+static const struct attribute_group overlay_sysfs_group = {
+	.attrs = overlay_sysfs_attrs,
+};
+#endif
+
+static const struct attribute_group *overlay_sysfs_groups[] = {
+	PTR_IF(IS_ENABLED(CONFIG_FB_DEVICE), &overlay_sysfs_group),
+	NULL,
+};
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0

