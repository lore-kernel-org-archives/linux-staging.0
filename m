Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5126D4CD
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760999; cv=none; b=Ij+50Je5eHdDFi9ZUWYHzxTmQtpLbSEXHIZfigg4HPHrSOM002MqLxKR54w0UxRjLkP4GwB+oWl0Hu1/v4PgP5t7+60kSrzs67wGYIygqpWhpEiw/slDIcAxhzo4HTr+mlDzaXlOJyyLfU13XXqnfhSGRYH4j60howjVGnsbHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760999; c=relaxed/simple;
	bh=FnV0IJmLlwk0Yk8Amd2W/sf6pDwZoG+c8cE9oXjsy6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNdKyef+j1jlmq6Bcv9++I8v5X6d/HgjfsbmN+NN5SaegEcnmzL/9yDBCNXQDtAo1Wok0fm9yswiJA3gIJOIT80YwEh0IrFcDlFArfpppvqTunhUatDnCqgELXBNB92yt8mLEAVrurkVD+Uo0YOrNK1XmS32HdplhCffUC94sNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwNUkKOA; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwNUkKOA"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7f1243792f2so983386b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Jan 2026 20:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760997; x=1768365797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLWOELcEjrI2iHJxLfRXTvBZahch6VAgebKRz7irVnw=;
        b=OwNUkKOAk1ErOajl78cgasDUqsDAsjDu+4U18w9YLYRPsRzGpzGgbrjjZTCA4vJ66Z
         IUgSR7vpkBa5tb548WtGdHuGULadeZQz+aaEbhjSR2GvLY6bXEAMYXb6OwjtmcmjQf68
         neYQqQeMr3qmU0ri/RQlLuAnqQPfr4brF3MlgDGa6YzoTxGtsGZ+qkskOwldOuxdMDh8
         3Xdsj703A9Ul+l5gxnPZPmMM4riSk1M/z9VgebnzTbh11Qetri/PAGuhH3PW8xjQHVmv
         r8sJ7mxOVKDFM7OyjbhY3CFcnk8dU1vfRf39Rmze5L28Ht2nAV6jaPmDa/+4rhJqtxvP
         xmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760997; x=1768365797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLWOELcEjrI2iHJxLfRXTvBZahch6VAgebKRz7irVnw=;
        b=Hs8vS73V+ZsX+W+amIFbRIqSUGUZaEtyEslYYU0u3A9Ky7wSRldfZeVd5ImhogsxUy
         uJnrWaivbIm/61Z/JRhPezGbqvmRRS1R4BKsDkfFjF37jpFGZYswjPvXbeKF7k9+IDMM
         UTrCKaSPGrJGb7z0UTUgPhOoBrPZg9XVit8NpL11ngspKRQE1cscpQ90M3o8TQiSJMzH
         T1uDm1HyC+tg7eQftmqNisq3xe0cg31xinil+TxRY2Wg53F0/9A1MGNMdX/PphLgGqHK
         C1TAIq4+rrxeWOPYpn7aboYwfF34vsV5tmJhbf7ibqeMkvDmBtkZz/3aWiS73jab+DAX
         Lxig==
X-Forwarded-Encrypted: i=1; AJvYcCXTs8v1YnBjmjbtvOlnh+cKO/cRCdglbrT/uAATlWr8giHmQ+6czDx4vLCtGsLaZhCWc6kux3N2VRclXG/Z@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5WR3Btb1ckwowJQlkam4MnejxWCxbCIAbi+H910SCLObWtzCC
	GFe0BKcWMMwA/tjosDBJT7wRfbTc6IFyJ6pQVdTU13jjFVaYIOtloP59
X-Gm-Gg: AY/fxX54EvLoHnTcc/mlRa/N8GXyx/UJbNn8yclOFSsfh90wK/idpMCUp7Y8f1slfnj
	ShksFzYIKf5CGNydZ77WsIbArPHgs2tDLey3srvYyZCcOLMHjk9eG2B23n7FygFMMwWWK73eAe/
	WigxP1bN9+eW4MKG0coRimIzeoNMQhCZF+VoPDSBhqeP8e/tumItPBMf7YKqvDfVaJ6HScboFUn
	DIc+fUD4Hqc8W3jz4hpbYM5/Eikryz9n+alFLQJkEDjbIHHnksrHGyuq5wFpeUf3PiHr8cQEsPB
	tYCvROrO8gUFaqvUsIlB2lObuDwrJ1Zs1yuoef9hWEU8lTnW/tN+kxerNjPZRmGrUOj+Ut8uBU5
	icCq9yqeulUsLH/G5wrQ2N+zpWlxhMaYRDs+pzCfYRgYjJjyDYAY4ZDrwiylWdpDupmDyEBfkNr
	5ukuNtGDQKrk1p5bQz30ERQ5xT1/2ZdkloRxrepNRg6jJzf0hw7UtcyQ==
X-Google-Smtp-Source: AGHT+IEF2tiwIdEjUKJoleA4BSAnBVhOgZtlhWyisn+mWM00+oMK/a966pLLKiRVpDOA/U4Wkrlj0A==
X-Received: by 2002:a05:6a21:32a0:b0:366:2677:4b38 with SMTP id adf61e73a8af0-3898f8f5458mr1134448637.8.1767760997324;
        Tue, 06 Jan 2026 20:43:17 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:17 -0800 (PST)
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
Subject: [PATCH v4 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:55 -0800
Message-ID: <20260107044258.528624-3-chintanlike@gmail.com>
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

fbtft provides sysfs interfaces for debugging and gamma configuration,
but these are not required for the core driver.

Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
sysfs operations are skipped while the code remains buildable and
type-checked.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
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

