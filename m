Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF42726ED59
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 04:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761002; cv=none; b=l9Ul9kSDNdy5OUt01FoiGN71mS/pMnrswhVAk0uYBDZam8U4Qp/mO2B+B1K4qcBjwTC0y1uu3ke6vgiAOEnkUbRy2CvD0H0NpxdjvgRy1nMLDBT+DdPGiA3HBDqp8rEyJakUDbqfhlnDLehVKrZN20jUWXd4AmGTXkqAl4ApEYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761002; c=relaxed/simple;
	bh=tRNeZwnYBDiJ5gpYRj3YNtC9pI+I0JQn8tmEq71PS0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/8x+pFcHl3e78gk5fuCIf6iIJN2oN+R0BBOPHJ242uMGeUzn8FxfMOc3wrpahtm48mhCZiurjpa/mloUt3fyqI+aBtlR5spZTdOjE6BGzkuF+JVUW5DJnpo9na3rGQMBPf8v7Mhv1UnDRXT5DN9RLQFPYL5wMHp+JZWUt8gePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhdTsKOz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhdTsKOz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so8665715ad.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Jan 2026 20:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767761000; x=1768365800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rLU7DAV9qpUwuBQAOxfbjMQs4IqSMkv9fgfYLMr0Ww=;
        b=hhdTsKOzOMsNG+kOAuCNj8OeqVNik1XAFMxdo7O2qqqNWwAWMblRZssPPBFWKW86Eu
         HE7S7YJZpuID4vIm3J1L5R/u5cofdzl5DQf3s6TB/9lC1qvaWVro807sz7eu7DGr1STQ
         p9zqEO7Unr11Ikj4KRSpBBVpcyNmjjsqlu0UM+/JWpwMTblnPMNvqLHjZGkVWaq3KtGc
         ++znNS4KzuxC+yriBxnbeROnZxrgH1bkjpHX/VyJg+bpxMpV2UK2QeKUpsbsyQzxup35
         eetSGRxw0yHSjACQnEjEHw/SvUf7w1CZx4hiXfFF7p1zSnOY5mdUzlxGfV2aDAvzLAhz
         LCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767761000; x=1768365800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5rLU7DAV9qpUwuBQAOxfbjMQs4IqSMkv9fgfYLMr0Ww=;
        b=my3FHbGtspE8+Kk7u+3vaMaG3w65e2zG1MWEfIJIZ0tIsj8Jl9r5EE5J7wg3Ue6OtU
         kthEX8Rp9MoYh6gXkwg27MOEBWzXy7sl0lUSBa0orttbq7Qjq+Zq0ik9Pgg4P4JYxuqJ
         uaxZtRqflnZhnddnWt8NT0fxWFutIkEKcCDCpYDi5l3Kl1a1AQz7lxOJPXKpjT22mE1Y
         zLKutSugqqs2tKsRDpSc7bFvSvuvZv3wP0uLSrl3zjZJp6Od2Bs5GI5Tab4LhRQX7SMv
         bZEASLFDGhACMbWUvBYyjoGkg5YKMnHas2aV9Hy904lvh9jl8cAdvvpVz6FAmaWoHdgc
         1eLA==
X-Forwarded-Encrypted: i=1; AJvYcCUKC+wLX5WZka0vWuKwPXVqoUWlYKZ99txnq5nnZHLIx61PjFagScceptaQF8PTRCTV3zzMK8TxFsBL0AWg@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ9e8RPuBS+zLTMLI1iNddgq5xvvVvG4w06PCh42F5P1CNHzUd
	KuRMsIJuJ1qiP/VjsteRINiTiZV8cL5hwSd5ohxmntTqz4FcdadVOJ4P
X-Gm-Gg: AY/fxX6bYRTk5iTgSt32tm3aTsTsboDQx9aCyr8sd/Pnx9wELme5BE2i3OqxA7znt2d
	wDemLs7aLmsWSCcmwKqPOxWrrvx1tXmOEbkciqWWbyXo88Q15HuTD82rSHcFW5iCRhCFEW0PT8J
	DKL+Fwcn026dYQw3py3BpGPa0mUPKEheHY4Ie6iX9qtHQwXGmTUoyYq189A/zvi1NPxh+yKQm49
	LEtc0YyWW7K0/n3q3beQaC80b5I/bAsx/1c3X8p6N5MEvgtQSP4j+7zqdIuYd4sYETsCvozaCWF
	mCMZZDsN4NlKPc+oJUWzALxfZAwtKsWrlZoa3s4uFl9dDxVeG8Ijws5V5hl/xO8DFMJpWLPXjqD
	ZJB+9HpdgtDUSmd/0DKQiZ/R0oLrbOGzGNlan8tcS8oZxRnI71bt3MJ3//5Rh8Dt6EV/v3/mW2X
	gOnec1kFq5DE5T7kKvB8cfBM05CiB39X6nYubi7c6pf70=
X-Google-Smtp-Source: AGHT+IEc8TO2toWTGIaoXuv5rNAydXLamcJRscYf8Qm/aRVC4j2jXnovQzTTCfCrrqFWoia694nIZA==
X-Received: by 2002:a17:902:e952:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2a3ee48ace2mr10688365ad.34.1767761000170;
        Tue, 06 Jan 2026 20:43:20 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:19 -0800 (PST)
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
Subject: [PATCH v4 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:57 -0800
Message-ID: <20260107044258.528624-5-chintanlike@gmail.com>
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

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make overlay sysfs optional so that the driver can build and operate
even when FB_DEVICE is disabled. The kernel naturally ignores the
missing attribute group, preserving buildability and type safety.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..5f3a0cd27db3 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1343,14 +1343,17 @@ static DEVICE_ATTR_RW(overlay_mode);
 static DEVICE_ATTR_RW(overlay_position);
 static DEVICE_ATTR_RW(overlay_rop3);
 
-static struct attribute *overlay_sysfs_attrs[] = {
+static struct attribute *overlay_sysfs_attrs[] __maybe_unused = {
 	&dev_attr_overlay_alpha.attr,
 	&dev_attr_overlay_mode.attr,
 	&dev_attr_overlay_position.attr,
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
+
+#ifdef CONFIG_FB_DEVICE
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0

