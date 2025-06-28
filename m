Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38357DA9C
	for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 04:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086778; cv=none; b=hE97Vh+7lU/kEp2SWTk3o872R1IIFplN85IA4rNr0D1fm1ySpTLchEv7GYXNaGNx1VM19JkJxcJZaGDLcSkV298s7D5ZkVbwcvSIaMjivoyhgT2P40qmo5Jtx/VVH9YbQ8npbf+xT/xzjz17QUyyArfscM7+zIYIziHkufbyogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086778; c=relaxed/simple;
	bh=uyaNcW6jpA0hMKzNuZeCHPISe0X7+l/P6QMUM3HwBqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQt85z2kmSDjWpcJiwn47cHtqoaqO2m7H9OQe1tGobRUdCrwzX8CpSKtAJOidqKqfa/j+HryhI5331nguvJCMh8oiACm33QeAvvJsdhMXHr5N3HBh1BHvQMv3bs3htADmixazJzDyF9G1S8qInWAjrMhWmj063k5BwrgtJ1GKQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF0ZgNDT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF0ZgNDT"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso200797a91.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 21:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751086776; x=1751691576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmKo+C8fi9hzazphKwRBopOBdxfENaddm6XbHcVbzUg=;
        b=jF0ZgNDT6bz64cs5Cc63HHAWjdWr/tjWOQtG0dlSkgJQgNUT8JPrQZdNJlktjCwws4
         unWU/ctLdDI0b0P9kBfqVrIiyaDCvS34bi9bxwxPINRHQgMfgTZfMVcu2sLYV98kXJww
         43j69b3HOdhQcIEtgeIojITiSlB4jR27vyoCFrj4k50uz3Vo6B9lMAXCvrPTYcsd0pV8
         yQ2tNgofvCm1xyRtyneKFnbvglwGnucKtRh/GFDcKCAedxWMDWgeuazCDubZ+sPT5qvC
         wqez5foCvMHXNVRgH2jyMgb3E5bWOx5GH0aB59UtiNhzteCrDcNNIDEtpuMWMbY85xGD
         ++Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086776; x=1751691576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmKo+C8fi9hzazphKwRBopOBdxfENaddm6XbHcVbzUg=;
        b=Zq75eLfWACJW5gDXiOJi/uTNH4vzRc+zGzuSMYYLvn5OgeLnBDuall4FwprFpmEfnJ
         sydyvNTfYe+Ri6Z2LuBn0FWzKASa6VwvkeKJEB6mZDhaZDOPCHy30IEqFsXHFow4sMde
         gjedN02gq59S0PKScKUQeJeR1Pe9f1/8O6PXilzvBZ0jRZ9Npsw4GR03WH1cAz692eRa
         kyVKgV0fOZDOQ0JVLR16YRzJlwf10tz451AaOeHrafCypPMj7mW43q/R06dPqga+hAXS
         Bhu5HOhw5/olHmp5ll7IWv+EstUlzptuQqo3YpLi5N/7VzVuLsBJ+e8XYZiArzgKbJsx
         f9HQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8/DqSEy4Zx3pu/RvFvCoP+OY5/eYGbTsyS6sFKI9PM0I9xKteMgSIx9iH71yFjeOuhMfNoQmFLrM52jrz@lists.linux.dev
X-Gm-Message-State: AOJu0Yypj4HOZp+WLZdy5pmhzbwGljDBrnfq1i8mzT+IL7zQYe6J41gx
	xMBJfcHuEWokg2PmMyEqsRaUdxkAN3KVm53or8SYM/Ufaszh8hRx7gFm
X-Gm-Gg: ASbGncuHoM/7B+hSMZNsYlfMBRH0TCtVHsXOOYol1mYVUhD/hIYSJiYyl/hwqDwrOcM
	CTmhShGxzoHB2zn8QwXYukAGY0AxFKzsipXwdNRmGvCFjtSuIcV/8bSevfSIkhWhspt1H51634g
	Zu9+Gwn7/za5irvKXbxePSiEWXKtaO4chg9Bn017UA9c96OVZEBTR1SnVJWVf0h3MtRd9iLz7VN
	4xCNhLZVC3p0SX5OmMQuYog7irg3ADMwBVMVoQN8BnAdILNx8CB1Zk+cyoiT6g1vurxjpTBgl44
	Wfrg6OuOdYUsBxTC0Ri3onmgh4/OlIVqpCp6M6QmH92JG5lPXSjYrY6WDkXdB4AGNipg2lBCWvZ
	kyC4Z8XeuT0Ip
X-Google-Smtp-Source: AGHT+IFhOudGHogRsEtI4KMV9dAd077PePKmHUXJX1znH/HZKoXbfKEqYzFx9OoEKg8xq+/T0eEo0w==
X-Received: by 2002:a17:90b:2c86:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-318c9264989mr7921897a91.25.1751086776032;
        Fri, 27 Jun 2025 21:59:36 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-318c13a271asm3659713a91.17.2025.06.27.21.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 21:59:35 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de,
	riyandhiman14@gmail.com,
	willy@infradead.org,
	notro@tronnes.org,
	thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
Date: Sat, 28 Jun 2025 10:29:06 +0530
Message-ID: <fd2be49cfef72799f17a96d01a4c6b92770cda7d.1751086324.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751086324.git.abdun.nihaal@gmail.com>
References: <cover.1751086324.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref
struct"), fb_deferred_io_init() allocates memory for info->pagerefs as
well as return an error code on failure. However the error code is
ignored here and the memory allocated could leak because of not calling
fb_deferred_io_cleanup() on the error path.

Fix them by adding the cleanup function on the error path, and handling
the error code returned by fb_deferred_io_init().

Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
v1->v2:
- Handle the error code returned by fb_deferred_io_init correctly
- Update Fixes tag to point to the commit that introduced the memory
  allocation which leads to the leak.

 drivers/staging/fbtft/fbtft-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..8538b6bab6a5 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -612,7 +612,8 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.line_length =    width * bpp / 8;
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
-	fb_deferred_io_init(info);
+	if (fb_deferred_io_init(info))
+		goto release_framebuf;
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
@@ -652,7 +653,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (par->gamma.curves && gamma) {
 		if (fbtft_gamma_parse_str(par, par->gamma.curves, gamma,
 					  strlen(gamma)))
-			goto release_framebuf;
+			goto cleanup_deferred;
 	}
 
 	/* Transmit buffer */
@@ -669,7 +670,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (txbuflen > 0) {
 		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
 		if (!txbuf)
-			goto release_framebuf;
+			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
 		par->txbuf.len = txbuflen;
 	}
@@ -691,6 +692,8 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 	return info;
 
+cleanup_deferred:
+	fb_deferred_io_cleanup(info);
 release_framebuf:
 	framebuffer_release(info);
 
-- 
2.43.0

