Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9D2882CD
	for <linux-staging@lists.linux.dev>; Wed, 28 May 2025 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447010; cv=none; b=KE35HKPMpbHz7BgCLk6xtykA9yFAm/G+O7LWTtLaSDlsZoduwY5cDT30xFsqHkk5NGJ2v05NWYkSn9yyRUg2CTG5xs6nqKQdFQc/relll9MIC57+QPUV9Dj25/RphJqV/d9VDi6Tefk64aqGe73bbUoRcWJwFadPZ17cgYmDHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447010; c=relaxed/simple;
	bh=BMRUJzr0/HLa3ogV5/HusC1YamEdyusN8YfIZyUZixE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uKgS058+GzcxFPt+hiH7ywk9xNbqfL/G2VvCq6kTvjOnHG8XX7MsvjLWKx4I6FF8Pdq1Jl0AsK7keY6EpCT9Vxi5swtDLKefHPseao1Q0vjerHRNdAZw2CWWqJV2KiMeV4lbULoe1fv0Jsx+CbtuOITwzJFXo/0zR4YJRHJ9bj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=c8EiS8Q1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="c8EiS8Q1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso34885e9.3
        for <linux-staging@lists.linux.dev>; Wed, 28 May 2025 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748447005; x=1749051805; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yl6vUzUKKmJBwsdJArAjkBP/TBHxNgwshqS0VE0gt4=;
        b=c8EiS8Q1WgRXbB9hjj92AVLWLamEey5HCfpuxbur7PxnGBqktG/Zn9V8BRhjp/kMgj
         SuodAqKsHA0iMjhTT9qIkC9ir2orPL2hpFAxTKNK5i9uhKd0xd6fkZM3kZ/qe+93oIp5
         R6p2ceNjZcyUSj5GHCNknzmCWwnRa48CZj7iBaxuB7UgYxahdQUNZpB+jBjvzSQ3al5h
         S9X0Gtm9ZICPg9IxVx/ITBV2GfcTJmFGRmvyCyvPupagVkcyoN5u3EB0DqFfS26jglWz
         3HpD40UmT71r5CTcC9pEGLmo+Thq53OyV17jfgP/1kAvMhYJW2maQW9QgYlWRQ4UyVGT
         uWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748447005; x=1749051805;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yl6vUzUKKmJBwsdJArAjkBP/TBHxNgwshqS0VE0gt4=;
        b=qTvRLOGa1A7HcRIBbSI7mVQqqAWSb1JvgYXqAj6lNmB9WSp7WDFylTxRVp7mAIhzo0
         ct3cKH0p5KbZUiw43MSJSsTxem8QxZ2xLyusRV2s35/bu78s+CK2QSfbYGLeIvjqgYH8
         JARAyN1WCLpGhAr+EFpVZy804azt2wxelPxdCtgYAinr6NRNrV6ulQ0AwDneXibDfQo1
         MsWaMuEx9UI0sx/sPs8qK1CkLkDvXOZtcsz8SwbAr6Ox57+cow1cmZpRlLcuMIw5q0sP
         L7dkGH2qy12q/2l81voNzdBYtK5CpOw4kE/LbFdy8OZqB/IjXZhNW1WELOrLC9u2GwTf
         OUbw==
X-Forwarded-Encrypted: i=1; AJvYcCWRammwKptbH+4zjRw3emH75AXDJIFFpNRtgAS/y77DQ1o9GHF4ptOJIXv7KnG6XRWx0rw+88hOk2Sg2TL7@lists.linux.dev
X-Gm-Message-State: AOJu0YwB8GYpj3fgHr/PtNsosGm/Wril+vQUkeje2EOMKLx+qrSvjpky
	RCbfhehOvrnkIzuDZjAHSBSS7etj7vgT7yFP1SKFwighFbC/vosYTdQ9qduq84EnhLE=
X-Gm-Gg: ASbGnctzSl7PqpHGQ9cyJGMqdyR2qWGj9wt/0lsouccgKZ6p34P4ktuSVkQwhrP0lPV
	qK7OopyUIsi4CCF31YsN1mGU984UazcajpVuExsQ/bAL4SqRp1egoJJkpDnf8ZJMdydNHHPXoMT
	Fw/0+2eyjewz4hQsYDKYfYcNi4LhPmLkJUtuc6lbLcPdagU72k21ZnU1FVx8IBE1gh+bjjF8UU/
	16tsc5VDbhMIXFo78r/K6Eoa6CW2cehTEJ7mcjRf+iDcrcDqTUATPkS6MkWi0q7030IGNs1gEhQ
	GBaAe5jRPbxKcXqZKEQe75N848h9bnt7xbF5Ea6nSCBYTTY/+qQjmpTodRnkU0hXvGtK3uD8cRg
	NCKQm/sJVUladUokhwxXBUjZa06YpPB1/KvcFurCUsUE=
X-Google-Smtp-Source: AGHT+IFbbv0BZAtT3+HnJDyyTNgCMRJZb9KZLNLH4dIHpFGSJZsnxop7uFuUlZaFtez53aVT2kI+Hg==
X-Received: by 2002:a05:600c:6214:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-44cc05358b3mr170613645e9.4.1748447004994;
        Wed, 28 May 2025 08:43:24 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eacd6f1bsm1769856f8f.80.2025.05.28.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:43:24 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Wed, 28 May 2025 17:42:30 +0200
Subject: [PATCH] staging: fbtft: add invert display parameter
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAOUuN2gC/x3MTQqAIBBA4avErBswS/u5SrSoHGsgLFQiCO+et
 PwW770QyDMFGIoXPN0c+HQZVVnAus9uI2STDVJIJZTskA/u66ZCdjf5iCYuKNpZaaVJG2sgh5c
 ny88/HaeUPolD9bRkAAAA
X-Change-ID: 20250528-ili9341-invert-dtb-07a5656e6dfd
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=BMRUJzr0/HLa3ogV5/HusC1YamEdyusN8YfIZyUZixE=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNy8chB2y8w5nbK9+RztKsMs3unwb1aVwo2U36
 FwTbirKHOeJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDcvHAAKCRC5WrpGvQUG
 8GvpD/9SsZFzhvQs0gQHp72J5bWBgaHGOAaSW43Xne+PZMAjdUCH4O23F2Syc387TEDUe/FTeWZ
 kp5HtOO3HdadO8z0wT6nXXINzJfFLkXufNXmxFbHQ8x2VuSGTlIKYhuzla4BlFV+dJJ60/83RRX
 DKADQ1s4itlnkqEVyeD3cJad734FHh6ZjaqG7sZobZxqcZcGRO7LBBO2SSveqlUZO502Tp9b0MM
 LHZwjVFPUcDWZpBoJZUTg0Bw5calTX2Mh/Ibwzr1yERYLUO01KqWi2/01IGvu01G3ucNGq0RR2A
 n7LHuRVOZkJFaBjUx2XPi7bPBYD47fgBMRT5/uIeCM5gh/W/DXFUU+t6j5A6vOE7SF61jWbGrsY
 wBC3xLx+WDXCvrFhj9xAmV5L+TRjvCEWIsuOy7q88ge/SI7t4d913AWKAEvdvhnhllg+mOSH7Dc
 BZOo5wTDep2WxoScD9VgeqMv4v8QwkOGCv9H1fDhWZY1fxNCwvpQU9bH111ZD8aSHZPAEHgTdQN
 eKx6hZNtBFIjq40TAQ5zQnGnAa2NfisLBqVqKAFgaqFahnwB3bRj6EXC4ME4wuCKH1g2O8+xQKY
 LLKmSqiMsu+UM56ihNwxQ4hVpy5WeDercM0s+Fc2UdFzPNnzrSr1G4BS1YhpzNousCBK7vnlKwX
 dOZ+YVluePM0Drg==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

Add devicetree parameter to enable or disable the invert feature of the
ili9341 display

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 drivers/staging/fbtft/fb_ili9341.c | 3 +++
 drivers/staging/fbtft/fbtft-core.c | 2 ++
 drivers/staging/fbtft/fbtft.h      | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 47e72b87d76d996111aaadcf5e56dfdfc1c331ab..a184f57df12b5ad6612a2e83b664a8911c7c79be 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -103,6 +103,9 @@ static int set_var(struct fbtft_par *par)
 		break;
 	}
 
+	if (par->invert)
+		write_reg(par, 0x21);
+
 	return 0;
 }
 
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a606dc4a176f5a37fa59f6a7d3a2af3..4e827e9899e32313f2e4a9bf12ff49283a63fed3 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -641,6 +641,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	par->buf = buf;
 	spin_lock_init(&par->dirty_lock);
 	par->bgr = pdata->bgr;
+	par->invert = pdata->invert;
 	par->startbyte = pdata->startbyte;
 	par->init_sequence = init_sequence;
 	par->gamma.curves = gamma_curves;
@@ -1107,6 +1108,7 @@ static struct fbtft_platform_data *fbtft_properties_read(struct device *dev)
 	pdata->display.bpp = fbtft_property_value(dev, "bpp");
 	pdata->display.debug = fbtft_property_value(dev, "debug");
 	pdata->rotate = fbtft_property_value(dev, "rotate");
+	pdata->invert = device_property_read_bool(dev, "invert");
 	pdata->bgr = device_property_read_bool(dev, "bgr");
 	pdata->fps = fbtft_property_value(dev, "fps");
 	pdata->txbuflen = fbtft_property_value(dev, "txbuflen");
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 317be17b95c1672404fc6aecda24d0a1f563685d..71c9c35e7548de314088ac3aeb160d6c6aaf75c9 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -125,6 +125,7 @@ struct fbtft_display {
  * @display: Display properties
  * @gpios: Pointer to an array of pinname to gpio mappings
  * @rotate: Display rotation angle
+ * @invert: Invert display colors
  * @bgr: LCD Controller BGR bit
  * @fps: Frames per second (this will go away, use @fps in @fbtft_display)
  * @txbuflen: Size of transmit buffer
@@ -135,6 +136,7 @@ struct fbtft_display {
 struct fbtft_platform_data {
 	struct fbtft_display display;
 	unsigned int rotate;
+	bool invert;
 	bool bgr;
 	unsigned int fps;
 	int txbuflen;
@@ -229,6 +231,7 @@ struct fbtft_par {
 	bool first_update_done;
 	ktime_t update_time;
 	bool bgr;
+	bool invert;
 	void *extra;
 	bool polarity;
 };

---
base-commit: 914873bc7df913db988284876c16257e6ab772c6
change-id: 20250528-ili9341-invert-dtb-07a5656e6dfd

Best regards,
-- 
Bram Vlerick <bram.vlerick@openpixelsystems.org>

