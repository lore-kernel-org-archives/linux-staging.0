Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5528689B
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072549; cv=none; b=G+ny6Z+eEhgBA/LcDVck/VDRsc9p7RsUSC/cniNQHM2jCt1XFhlgoQ9s4QyAt02zXwakh5AZZtbeabEy1+gM+xWpxdblhqQGgpLXj16o//IOdLCSrtdbytvuDZK+Ukf7Px4ARazgD7BLitF8TH7xjbiTEJMnsDrtv/wo+7Nwbas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072549; c=relaxed/simple;
	bh=AxHW31F/u643GumGUG5OTePG8VH5O62R29ow3KWdMX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPfrZlAbDObrwHWuNiVYm016ciyTeh+nVaMYQt3+3mteErD+1sPdA4v6W5/nG9ab+Xb6gVN6UUhoOiFwku1fJiNFJkMabNGuD7MRfX1Fcboa70fegtVave++g9OrL0A0X1jdgR4HYK6NLf9tNt1lwh33C5wbm8u6qc26FN5Uotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHfSU5VA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHfSU5VA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09d981507so71203235ad.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072547; x=1767677347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2hI5Lo88RYKXzSxQDxQgMKWvWfPHcve4QtdDyVBhKg=;
        b=jHfSU5VAC6NxzkNHZCiaxmezu4ZEsRKJr0OZeUBpvojLnAnCW59u7kgsmaNGEeKt6D
         MSxRy4HOghT6uTpnR6Xhcj2EXSewAw4jjx39CMN52dHcrZLIioYIVZwhupdVYuoBMp9g
         4NzIjirAVTL4Eu63vEIqiFzYmTR8uycTOqsOZTcYL5ZI23OBP+NwYlFA2lDceGD6Ky2j
         pfwIf40WKP19Aivg1t2BApcVuBPDjBfHnNG+VPyh7T1KBTIUWjMQE5bTqGKGW09zV1A9
         wv2VXY8m3kWF52A2fffwPDi0S+KUBZSW23P61svYJIFBirzIj5i11T0BTNNQoo0MD6En
         VeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072547; x=1767677347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2hI5Lo88RYKXzSxQDxQgMKWvWfPHcve4QtdDyVBhKg=;
        b=SW6T4aqGP1E7na1fY+RL7hV1qKzRGc9AwMiQKecKRW1T583LpdPr/oPqNwMdVJprQQ
         hHvEi1a9i+iQA9E0YDFB5ZIGRIwfQ7v8vwSVHyPn3KK1R90Qry9G/4jylWEylRzVXBHt
         kMoZRqagsRHSyZVQWO2SVXVPXyKrSXt1c5eBc+JlgUaL5T4E3TnQyO9U+JGf4jOPo53r
         9B85iJSn/CRWQ6ACG/ZAvkDETsYDcNy5VByV0/OrXgxoRZl2MPXnPGcWyOi9RK20MpDL
         ZC3IqBkC64jDSx0a4zoQdCNT1yHZ4AuIPZuHd6GTv4wT6oVqg5khkz+AMtUjLP09IQ/+
         flhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo/wsVakBcwQLS+XRfqD8EAlKIFSC26H80wPB5eN4U0XFAXIw1s5YyCGPUNiNI5WTNCshhLJgN2IZLU/mL@lists.linux.dev
X-Gm-Message-State: AOJu0YzXkwltp2+7LV8I29HZ/i92n+FPcy2ed2ytycRlluPjrGxzlf1y
	XAvnXMVup/Tl/Eg8CcNJXCszISPBuUpvceUfgxGQ8nsPJS4jGo8eOo8G
X-Gm-Gg: AY/fxX7+pFUeyf11K6FaYw2UU0lPtScbILDWqG9g29oqkSGYlrZ3BQpF5vpQBWv8DAA
	6/Val2pWQtBZp5v9/NIEU2oOkRkAsB4OGVRYjWb+Z/Plv0ORKcEj3yRWMB7Zr3yyqPGso3hsQWY
	MSe++f6hTq13mnFm+I/vy/yh1vAGQrBhgsJ8sd1/X8CV4SBd0Ntgi9L94Re1A5XNyp3xKrYGEv8
	bwfEPQCcCgZvi9jkq81se6jbCqTbIjL1heV0xZHav97sqaIBrWktnAHeazSgU8IOtVtm2k+lSrE
	3FYA2EDTtx9AlK2P+cxMmGnd22IJbx9lFpHFV9WlEU9X/Ab4/YD7igsw1Wu3724S4qwCaqyYmtS
	nF357W1wkTiug45msqa9+koN3PXJd+DTbwvL5VDBa02D7vDWICxck75nROQfdujiGzIsm3N5PKs
	Dqs8LM99kLKzKDndOswEY9ZM6hxzz0faQj2f7k/YZGEQ==
X-Google-Smtp-Source: AGHT+IEzK1mfCzTYTBVF1B1JeAS/8wWfCanHdXYXITuiOcE0jrd5VC2Uc+2+6l74lzCrDnJw2EHo+g==
X-Received: by 2002:a17:902:f68e:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2a2caa9be93mr359745255ad.2.1767072546800;
        Mon, 29 Dec 2025 21:29:06 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:06 -0800 (PST)
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
Subject: [PATCH v3 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Mon, 29 Dec 2025 21:28:20 -0800
Message-ID: <20251230052827.4676-3-chintanlike@gmail.com>
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

fbtft provides sysfs interfaces for debugging and gamma configuration,
but these are not required for the core driver.

Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
sysfs operations are skipped while the code remains buildable and
type-checked.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/Kconfig       |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c | 20 ++++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

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
index e45c90a03a90..d05599d80011 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -203,14 +203,26 @@ static struct device_attribute debug_device_attr =
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
-	device_create_file(par->info->dev, &debug_device_attr);
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
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
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
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

