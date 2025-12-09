Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72D230147C
	for <linux-staging@lists.linux.dev>; Tue,  9 Dec 2025 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254505; cv=none; b=gTjCOS/eXFmdtvfys0LhzwfYIPiMOZje9fsHwjn+67WPuoO6737Zl238gjfxWJXGajm5o7WYjpSMWH7TZnWz05kgy0sYZM/tcmZ+reo1LBHhmOROIDnmwi/skwWVK+UAcNfGDW57fROOICx3FSUx25MmR4ObVa6etjH9cFm3L5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254505; c=relaxed/simple;
	bh=LxCofJzFToPOuZEjMx+TyTe6Tdr2NQUdvBjzyB7tTZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X49OH0Cfi+XUXCbcZnerLpU7HQM7LjY/+Zf+GKJC59P3z4nyiU5igXaJP8j+rWn5cYsc8W89YA9+hpTARJnbMs1hf6F5Udg/TSQl1szN51MYDobHCOL3uWoE4b/UAOm2lGq1645uOLU3tZzN9K00qrFQcUumekBXcEdIhvgM8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nowDuZVX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nowDuZVX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3434700be69so7349250a91.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Dec 2025 20:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254503; x=1765859303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pa1Xejftpj9ZCjaie2sXROdWsX12z9SbomyYLGQRdM=;
        b=nowDuZVX1uuPk3d247sUOKcU//dL7of27NrHMmweCAFzX1ZhwapAYrtDAf96lEvb5s
         up0eUzvEb+lHqfUxPBXCwwMA9GUrdiXKk53fzSvQTXgHAl4RFwavBLX8k9tSqqt8goZV
         VGGjtKs0flRo1myTzUs6v9gemyg3fIac4WRhG4CNleOoCvwhpw/OrRyQky2fkj2xQ/U7
         uIBSWXw5RWqcORPMbPTTWJmw4DWI2YZFJyI0HU2CXAH2YuTS6YDkVdCEUSHiOSW91jza
         yplkgG8DTPPcWGO2Nyep4QqwnmIg8kzntu2t1d+xkHMm//Ap0olxMJeeNsxvjanREnf1
         MCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254503; x=1765859303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Pa1Xejftpj9ZCjaie2sXROdWsX12z9SbomyYLGQRdM=;
        b=WCzWW6+TO0oZzOk6/N2V5GPaxtHC5pxOMW220VJLypHapWWbjrOTi1EC6N4SrRxkcz
         gHnEbP1B72ZNEqrPZPBjJUTsISna2Wt5LrlP0PDXOSnQK3+veTY+VT4zZPze2xbafaT+
         +xdLhpqcmSr46pDc+TcERzvbVJHPDHw+y9VFnC+Swb/6naehGNhSCYQVjEEgdlRt0PNc
         sBCW24pROeVkVlr8KCiCddJO6OlHdGQz637YdSpuGHisRs/kXoIN9BvPhWd+wGyAjfah
         CYUjNtRhbUvgwo71lGLCwbVgI/h9RmZ2Gs588eLduN+/JxWMeH3W5wcoxyH6uxqXI5Ih
         mqSw==
X-Forwarded-Encrypted: i=1; AJvYcCXPt/LjpHnxlvbYNwtA3bbEqXhn0YeTlx0W6UTpUgE9pRY5JDrvmVeixRTW+V1f3wJA+3Cnu0Q3pdRf1UNG@lists.linux.dev
X-Gm-Message-State: AOJu0YxVLlgcEVpNudEum5H5bBwsOF5+Uz/T9PA74TgGAblu5lYmtinL
	ekd7jkNGWyHCy9F7qqM8lPgzYexXc0QtF459LpcAS7pYWg3NPaUqiKmi
X-Gm-Gg: ASbGncsklGbdL60ucNC0W3vj5dhOqRJ811nm7cmTR6XfMmtsIKKHhRzoDfCO55fWcTy
	U8q8yihbd8ohGIVkGJiwDAjA5rNaQlOlvyqYk/gcD6JG3SQd35CuLwm00Kd0RlFW/3fMl10W2dv
	0lgMspvcAmDWcCDcyAWwD8PiW2alooVzFZfBNq0oQfisfKh2TuIJgCV0QSagnC93kVvWbJYkJug
	0cM1yyJcbhCvteWiL4cM9gTOm10wZ5UI181nFpcC9fER1fLu7ZPUnRSRqfQTY3xOvJIIOIMWcr6
	e2WLnuzhQvd5O2usRkqBcRpKXFHi9Ut6clG4AXnCUP8xzRpjcp77t8OA+832jFUeYaJ70dknXkB
	+qtUwr5UWBKTMIxtEE+vryU4AlrDQ7QtCzdpGqZ48sfKS4MUjjGx8rWD8Sl4GczMsV/Yum4o6m+
	vqsi3hvJsWRPaZ3MqXpsjr+zvlXKb15bOFzwR/0ZvYnQ8=
X-Google-Smtp-Source: AGHT+IEAgpMVzxFDELmSe1EcFgFHHrMmtin3pr01zEUtdDpWNY9djhS44HySFgwBkRAy8M6k41HDxw==
X-Received: by 2002:a17:90b:58c5:b0:340:e517:4e05 with SMTP id 98e67ed59e1d1-349a256431bmr9237622a91.12.1765254503018;
        Mon, 08 Dec 2025 20:28:23 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:22 -0800 (PST)
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
Subject: [PATCH 3/3] sh_mobile_lcdc: Guard overlay sysfs interfaces under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:44 -0800
Message-ID: <20251209042744.7875-4-chintanlike@gmail.com>
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

The SH Mobile LCDC driver exposes overlay configuration via sysfs.
These attributes depend on FB_DEVICE and cause build failures when
FB_DEVICE=n.

Wrap all overlay sysfs attribute definitions and group registrations
within CONFIG_FB_DEVICE. When FB_DEVICE is disabled, the driver still
loads but without sysfs entries.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..a46da10789c3 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1182,6 +1182,7 @@ static int __sh_mobile_lcdc_check_var(struct fb_var_screeninfo *var,
  * Frame buffer operations - Overlays
  */
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t
 overlay_alpha_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -1351,6 +1352,7 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	NULL,
 };
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
@@ -2637,7 +2639,9 @@ static int sh_mobile_lcdc_probe(struct platform_device *pdev)
 static struct platform_driver sh_mobile_lcdc_driver = {
 	.driver		= {
 		.name		= "sh_mobile_lcdc_fb",
+#ifdef CONFIG_FB_DEVICE
 		.dev_groups	= overlay_sysfs_groups,
+#endif
 		.pm		= &sh_mobile_lcdc_dev_pm_ops,
 	},
 	.probe		= sh_mobile_lcdc_probe,
-- 
2.43.0

