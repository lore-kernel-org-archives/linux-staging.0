Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B02D5416
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 05:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123027; cv=none; b=L7bwVpbeWZiX5PBsQfpJ1SQCbl2pnpiAv2zCsHJ4bGmzQcSi7TS/0dnlONyk1DQ7jWntFvX57g9M59O2TQX2Y+yxqzxRpporOAvG3L7U+GIloXi92HxBBDDm+TxDCUgbBF6PQ58SYitCI9S0M/1FHNFCDH7h0r+yeD8URtopjcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123027; c=relaxed/simple;
	bh=/h0B2MrEIB8vw1/0qkLk8pblOQDpqw3e0E/7EdgwDz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNxBxg+ok+eqRuc3iWZp6nkhTgOUQSXGxd8oYFPmSjy6FHvv70j5QddnIOzM1zEwqRVE1fJQd6OSOk0/NIlG9pwyLJAQ2TNDxgwTax4VdPUogCPaxIRZeVE3S4HfQh481uzjswpcgETYaOpJAJHQx+WpKjuZuzgr+lOGU7qyKtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDOXntmF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDOXntmF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0fe77d141so15047735ad.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 21:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123024; x=1766727824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLowgtUxpf7Ylc32b4gcev+kc2iAvzLFrJvCpgPdl8s=;
        b=kDOXntmFweOrpRU/WOaTDfzC44YfEUr/xIHw+bqq5JFpQn6mPHiXtvswnlxHBtVMt8
         yNnYs6jjGRfsyN27swEv8FZldH7HJw7vpVH/GemaUgcQ8siiFcEtHEiDTFPrVRDOBrR+
         nNBY7ViA40P1QrU4ajin+GYhVyQB8yIUfjd8x9dpTY0UdJ7VZVXh2feM6a6ISTntfo5r
         pkuMVhRcLHW1UZQg1Sm2EqUqSlh+VEPPxk2L9nPuQ+avl9OfxLsuMEDV2YD+WM/fwV8i
         YzhqEcQAKAJp/IaXN99HgklEEM0/BGeioTezq9O50Gp0pjkRhQwnKvVhksdGzUCewzvF
         Pj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123024; x=1766727824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLowgtUxpf7Ylc32b4gcev+kc2iAvzLFrJvCpgPdl8s=;
        b=MD7joN2uT/touiC2JlEbseRQuqMQEEiZGHj0/uH7dWdcEGmy/38RrLZE5IDRI4/qER
         jjiZA2iFsdU5c7OhrFMq5sklwzpohlHdT601j/9+W9Wa2rrQX9Mi7hQyCrKB01bZ9KJQ
         JH49MBCw5V317wSYRXrlXd+x3qkAdm8USICX6ItV+Pb5eF90OUdwK8GR3P6R6EGpOZSd
         NHCKs2aSrD3/MYlmnGhSuNehY8ttw+Z3SRzJsvpRpT45SKANFnqkFqkTwwszxWdAdr86
         nQkX1o+H2nBfn3X+cUivruUfQXxkl5mXO3LYB+ukHRR3sqmoqgW9SdRPjeir3cD2iDbz
         EwNA==
X-Forwarded-Encrypted: i=1; AJvYcCUoCWemkdo5d64Yg7HxcAYHpxwdYOwV61Pz52hEE3ATmyZKqQIu5LsnYzHJ+jnvQPfoPos+o4AlRZBBjtW3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+sTippQlJehm3TWzH10NP+2dyP+/za3BYpJSz9l7GnFoJZJc3
	Z4Rn6VKJVmMOEhrxRBG6eOJxvBlTjm5Em8UnURLNiaOnouAuUBak79Hk
X-Gm-Gg: AY/fxX4bZBxJ9yHKkhhoy6DTuUCxAdW9pl0SJLf9/FzZJiy22TslnS0tPZlp/PisvB9
	jdAIRHeJ9QPYXzJZ0ZHCqEuPOKPaojiSGgHafjK8DV9SlYEe3IAJ7n9r9mAiPUwAkkOU7Sq+GN1
	LCs6rRbM1aKi+SRN+hb4gOKEv080dElvCWDaY3ixJ65Pa+doO4DdX8oUNS+OvLaKsUKnmOTmMzR
	YE9NCRxUOBgUT/7/ZESwgrCUhqQ1/CBc60xudvosvYSruorpJcoY/qt7Op1Ohejw8Xo9WuqtkSp
	pAch9sFHoG+0Zl/keaEC1dw67sMQweLjrFD87vQACpMdXeaJzHBJxLOZL4yFI9HRMIWQZ/adh8Y
	6laMiCVPGaCgaQ00/qSu0UgHwXTN/CAU35mXJIYBv6pZqm+M5B6RVEopMpdI9f5wtn70f7V2Tma
	6E0S1Fft1onPnynRolBskRgbaG6ZtW9lcJ4lLOAQ4RZNc=
X-Google-Smtp-Source: AGHT+IHapH6OsO1AHtO1AIXlBe8ewsFWc/T53IxGs44x5WRWKW2jyFjQP7saYVlxU5+BW4fZO8YydA==
X-Received: by 2002:a17:902:e809:b0:297:cf96:45bd with SMTP id d9443c01a7336-2a2f2231b01mr17507025ad.19.1766123024262;
        Thu, 18 Dec 2025 21:43:44 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:44 -0800 (PST)
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
Subject: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Thu, 18 Dec 2025 21:43:17 -0800
Message-ID: <20251219054320.447281-3-chintanlike@gmail.com>
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

fbtft provides sysfs interfaces for debugging and gamma configuration,
but these are not required for the core driver.

Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
sysfs operations are skipped while the code remains buildable and
type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs with runtime checks
- Use dev_of_fbinfo() to guard sysfs creation and removal

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/Kconfig       |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index c2655768209a..578412a2f379 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -2,11 +2,14 @@
 menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
-	depends on FB_DEVICE
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
+	help
+	  Support for small TFT LCD display modules over SPI bus. FB_DEVICE
+	  is not required, but if enabled, provides sysfs interface for debugging
+	  and gamma curve configuration.
 
 if FB_TFT
 
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a90..848702fc871a 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -203,14 +203,24 @@ static struct device_attribute debug_device_attr =
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
-	device_create_file(par->info->dev, &debug_device_attr);
+	struct device *dev = dev_of_fbinfo(par->info);
+
+	if (!dev)
+		return;
+
+	device_create_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(par->info->dev, &gamma_device_attrs[0]);
+		device_create_file(dev, &gamma_device_attrs[0]);
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
 {
-	device_remove_file(par->info->dev, &debug_device_attr);
+	struct device *dev = dev_of_fbinfo(par->info);
+
+	if (!dev)
+		return;
+
+	device_remove_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
+		device_remove_file(dev, &gamma_device_attrs[0]);
 }
-- 
2.43.0

