Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14532D5416
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123029; cv=none; b=XasJrEF4aYpxK5kNuvqLOUJHR4k5VE7hw1r+F3FoA33ssyvoizQO5cQsItRRHQW8a4k8FNJzb/16CTWo4WMbdXfivt2Mp2AqQyqgOE1hT9I4YvWDEzDIknpF/iybB2EJAdYg4ogb299au3VoBMLSj0JSIM15HzyMPXX9uBDgq18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123029; c=relaxed/simple;
	bh=UkrCfcHpZ1i8AvHQA/75nfwWAOIjYXg29xVkb1liZX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9olZh8TE/F71IZKMvmq38Oyc5S8PYTdvUtmUMwHqihhNoj6vGiNVLpeirfxqe3/fcxV9rCcdTGU3PeIoDW7aOxrqA7jt3yW4AL7P2iyHRvgi1FSblHN1rRbiIMCdduTrEE5oejK9pkfQqfj2JdMcjyFSw8UIpVSaDnd05m/rSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fV7QSHfz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fV7QSHfz"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0c09bb78cso9492095ad.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 21:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123027; x=1766727827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OguNjtskMuqb5lnf7iu+ciDjHTh+c3vKrdbcOWFfIs=;
        b=fV7QSHfzl/mGNTTElxkhS+0MCO7cFMSydW69ClNi5thAqpmC/1T1sMYBauxAeVaYrB
         B7HZ3yKp+JZJE3NUhHiI9grKQcewmrXWaPRbP/+4Gkiie8wX+LfM9LhM8bNQNEFifmZI
         qmn+mbBMlHBhjnPAX2W1tUhL9ZJ/2GTt0kpdOFUD19xZ50LDPauQ/q05naALhPGQZgWB
         r/LUmTbbpB+d+VTNg6lsr8obIIBBnO5EfIll505nsWdaAzCx1uyKXaW9/QVcQLeuGLaJ
         jUE2cce15d6kNhcQHofHQ1eBsfphVhFafhqOc3MyqqcaEmWSfN0X/VOn6SUmePIIeg60
         0XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123027; x=1766727827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OguNjtskMuqb5lnf7iu+ciDjHTh+c3vKrdbcOWFfIs=;
        b=qDvrhCAsdcHgiPITj+eA33uNWt2biIJBdBAH179Dh995IlWmaK4SXk+pGa99S++Yxh
         nn9VS8bW0RwEYC//YvMQegNFaiNXbo06PKz7YDZkdFuFWLCO2wFckuONZExNPc3KsdPO
         C+FPhI2KVkxOZF38wrl4Ro/cwmHvuwy0jJN9uUxl2dZW5gP6D3y+ijsrEvAG97wFZnmm
         k/nV+ita/4edmmNiBpL2yuNpQBk4iq9UllAAUBdW/nkFOuWebmF/UZpA6nCPnfO1GksM
         juwnC1e053m0ArInXGbUtRKof2msC6cYm1DubGN8T0CLftHdi1ZGqdcVXY6qEa5q3mUx
         /iKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBIvnNbf7L9M8yRpB3ZTmo3p2h7EHGwEnCjTB86PV87b656qq5kx7Aq6HLs6+1ZghwY/C7N1mGvN8YRmEV@lists.linux.dev
X-Gm-Message-State: AOJu0YzeSs5r43WoMfiLrTqUxo9Fl1gV4A5X8fHrdbytOpAJPHn0GG32
	i/9V5T5YScXprEBrkExoHe37oAf0GYIDXiXUGGHvhHiMUfPuh+adxoY/I6i3Czuz
X-Gm-Gg: AY/fxX7E1gROma3G6OSFdzw6hWvTaSu7QFJiHVpC/SUwrsZUmbUPHcM0GjoZRdw4Xm4
	HWmBU8AB0AlgJFxQ5qw54lUGJ3+CsvIGiBsP6W6Ffd9j1rBv1Ni/78hfZUPMkvPBOI7UH1NOBHl
	p6wgms86Bdon+A5/91fjaAcUrZaGkO4PvSLNy2MwcFXASg541TYPz1rGC3bH2YN1URYy2IbM1WK
	7H/1rCkSQt2LRTvtJTOduYQRyoqOCj37ZUW3/dIrYHOeEs5yNi+Bi2fPQGEiueU3qACkT5r8ZDI
	IuCoHuYpsuQ5H8cfvyi+FvWbgmVzQB8MkuDRWGb2/kffgamg6Urg7IfOhg6FVkeaGqqtXQw9wbv
	mZiB9mG1foxYSbDF+SJzbT6cDw5tK6RDyWBlqeQuY88hMGrQRjkEltP4u0iFjcWaM6mqo4XxJN6
	rg96zYy9Q8VUNV+6HXSEAYyjRiLarC9dtAk2RDwhTp1AM=
X-Google-Smtp-Source: AGHT+IFIN9O1bSTaoX7Y9Xly+yqtX/VSEkwqhmoGFiL1kW7k2Mixeaj5EcJ8LC8LuF4Nk/249G3y9g==
X-Received: by 2002:a17:902:cec7:b0:295:134:9ae5 with SMTP id d9443c01a7336-2a2f0d41127mr17823485ad.24.1766123027055;
        Thu, 18 Dec 2025 21:43:47 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:46 -0800 (PST)
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
Subject: [PATCH v2 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Thu, 18 Dec 2025 21:43:18 -0800
Message-ID: <20251219054320.447281-4-chintanlike@gmail.com>
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

omapfb provides several sysfs interfaces for framebuffer configuration
and debugging, but these are not required for the core driver.

Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() to obtain the backing device at runtime.
When FB_DEVICE is disabled, sysfs operations are skipped while the code
still builds and is type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs and stubs with runtime checks
- Use dev_of_fbinfo() to skip sysfs when unavailable

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

