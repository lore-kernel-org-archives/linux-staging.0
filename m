Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED95376A18
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141927; cv=none; b=dQ5wsffVeTixkhB5fjJjL6VltDtUcSnnBqST2I3IRtJoDCejEFOhVGzcFpb1mhO8J84gLuH5gzRJ09DSbrutMVfSIUTejPXr02xl6g/TJsjPt/apjlJMQkQMk7o+7H3J0Oiq6Rf+FnSZ3Cm1AdnjMk4hLJOxLwsfRnaeIkkDzY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141927; c=relaxed/simple;
	bh=83YEOZo4PClS4BUDoGTUwFMIvQIULytsxHnuGLsllEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=McSPHMU8XXqr8UJsrb9koVsbH1YHgr1XEBKzELX+f1t8VlogyGBxF39aNkoW/vBRPOXVrCSM+B5n1TkE2oiObBwj5QnxRK/1pqY+PcFnBgvKRc8afeNeJ01HtrsAlGbtYAXKXL+pYGD54t1/5BF9ExrQ0h6i1mnWx9clYrxvo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQqW+l7Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQqW+l7Y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so37151975e9.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141923; x=1782746723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+FbGuHfeWoNi/lXKYN24egtcTrn6rTefu8w9kcMeGk=;
        b=MQqW+l7YF4NWapa29AwbNzykcuHUAohGdSGTmu+rxWXQJu9F4BrTX8k44S2Kfr70Z1
         +g89NS7XZ/YfrxSPXWSUwRm2ZbzgDr2B4/h4GJMlY9r2ZCNXoDw66kja4RI7RSaKzaWK
         kzs+XVgNxpztGSNYubpigDBLhdBihFd/E031IHC03ySxyDrPlM7K8lTmT45V0Oc1KWuO
         hUC+u04AVY4geu9MnBFtsxf0cYROti3gRM2nrifkRzsQnHb52XAkHP6SghqAkFgiGgPi
         hwUYpxfRuGYTeZmEPYO00YISXNqS9FhaCRehZWtolXRT7lEqoA/ptsYyJCV0RC0Lffd9
         76UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141923; x=1782746723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+FbGuHfeWoNi/lXKYN24egtcTrn6rTefu8w9kcMeGk=;
        b=lJFTaAtjGfNS+Ed7cIUDgxd+kaKk2aYzUyvGhd513DWGSpk+XMYUKSLCZl+SlzD0qJ
         TMRU67PUnfnomFIuPWnwprdGbZMwa8f6/xPBQJedjQM1CfrVhg5A7W8nGBbtx3lpUAqa
         Ar1euKubE5tNU+V/Ah2wDeCkeXJjeFZ5d24HU0whWWVZJt7G5cAbLdpQJ0nG5ws6bkqR
         aUXAHtdfHi1NOUGAEVMTxsnuqs6/w571sR2duWQIEcRLMyPH7rMXzehaIm6SJqMOu5y8
         YkOGmVJ4n4yooObe2IO0uhMs3tu9S2Ic0RUrUxUOq6Uo3OSPGxta3ECABHsD8+oyq2Jr
         QUOw==
X-Forwarded-Encrypted: i=1; AFNElJ+FxWBCqpo1Cq1Zr4oJHmJ8Z2NZ88MTRP5L/Pi0daH8t8X4vsmpkEbIX4o5jvlRr/XsQsdDKhKrL8IH4Mma@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqlj7fyHGp8pn5TiT9+qATAYB/U2ENS9Nx0UktvAiTFQYCrI+E
	pt0ak5iSI6qQQDjtwSVD+z+rSpNDKQ2k7FJLDpvEu6mSxijBsh6xZTCy
X-Gm-Gg: AfdE7ck1vZZNYfs4u8tR9yypy1GT9S1uX+UY//X5hvHOL8ZxXrKn0lGhg+6Fb/7hzGE
	+SNl+Jnbvd3eubgw+aRK0z213LElv7ct+DB+TMv0LJMK4B3YyoQ/0+l0OhHObtD8dEyUCGIehXC
	xx3ro9DZgHxbJU+Vy/UtsI+tJA6pxM2lk5uJFHWdhlvK55zhBv6MkWBBkCiIHZjO7Uc/1UbhqPD
	ym6rZr6ex/3h8C97yK+6PPaLsvUUUIlamsiwlb0WINOYA5OoVX2zcV82Ch39wBaE+m0SnA77dOn
	euQ1GT3sBhE/u43YfUJhFoFyeCfq2ebmCbTMiG7p+xHiCstcQSmlx8stUpA3ZWqn8OxWWpGrOd3
	bCSSRt48bgUUUEiA1m6xhZlJzvHNJtCVHnpF8ziQDaMqgbwXOZNI/zdaHaFa98qmq6DNcVLAcsB
	/ENLbD2phw3y4hom0Xynxfeu9VVPNvzmAu1aCuQA==
X-Received: by 2002:a05:600c:5285:b0:492:463c:48b7 with SMTP id 5b1f17b1804b1-492463c5257mr193028095e9.22.1782141922516;
        Mon, 22 Jun 2026 08:25:22 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492492338dasm217883655e9.1.2026.06.22.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:25:22 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	deller@gmx.de
Cc: azuddinadam@gmail.com,
	chintanlike@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
Date: Mon, 22 Jun 2026 18:25:04 +0300
Message-ID: <20260622152506.78627-3-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622152506.78627-1-amit.barzilai22@gmail.com>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SSD133X screens were getting 8bpp (RGB332) instead of the 16bpp
(RGB565) that they support. This change adds a boolean to the
deviceinfo struct selecting whether the variant is driven at
DRM_FORMAT_RGB565.

Changed SSD133X to now utilize 65k color (RGB565).

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 55 +++++++++++++++++++++++++------
 drivers/gpu/drm/solomon/ssd130x.h |  7 ++++
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 04da4f2f7d08..2b0a8218f529 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -140,6 +140,12 @@
 #define SSD133X_SET_PRECHARGE_VOLTAGE		0xbb
 #define SSD133X_SET_VCOMH_VOLTAGE		0xbe
 
+/* ssd133x remap byte (data of SSD13XX_SET_SEG_REMAP) */
+#define SSD133X_SET_REMAP_COM_SPLIT		BIT(5)
+#define SSD133X_SET_REMAP_COLOR_DEPTH_MASK	GENMASK(7, 6)
+#define SSD133X_COLOR_DEPTH_256			0x0
+#define SSD133X_COLOR_DEPTH_65K			0x1
+
 #define MAX_CONTRAST 255
 
 const struct ssd130x_deviceinfo ssd130x_variants[] = {
@@ -206,6 +212,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 	[SSD1331_ID] = {
 		.default_width = 96,
 		.default_height = 64,
+		.format_rgb565 = 1,
 		.family_id = SSD133X_FAMILY,
 	}
 };
@@ -584,6 +591,10 @@ static int ssd132x_init(struct ssd130x_device *ssd130x)
 
 static int ssd133x_init(struct ssd130x_device *ssd130x)
 {
+	u8 remap = SSD133X_SET_REMAP_COM_SPLIT |
+		   FIELD_PREP(SSD133X_SET_REMAP_COLOR_DEPTH_MASK,
+			      ssd130x->device_info->format_rgb565 ?
+			      SSD133X_COLOR_DEPTH_65K : SSD133X_COLOR_DEPTH_256);
 	const u8 cmds[] = {
 		2, SSD133X_CONTRAST_A, 0x91,
 		2, SSD133X_CONTRAST_B, 0x50,
@@ -595,9 +606,9 @@ static int ssd133x_init(struct ssd130x_device *ssd130x)
 		 * Horizontal Address Increment
 		 * Normal order SA,SB,SC (e.g. RGB)
 		 * COM Split Odd Even
-		 * 256 color format
+		 * 256 or 65k color format, depending on the variant
 		 */
-		2, SSD13XX_SET_SEG_REMAP, 0x20,
+		2, SSD13XX_SET_SEG_REMAP, remap,
 		2, SSD133X_SET_DISPLAY_START, 0x00,
 		2, SSD133X_SET_DISPLAY_OFFSET, 0x00,
 		1, SSD133X_SET_DISPLAY_NORMAL,
@@ -794,14 +805,20 @@ static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
 	 * COM0 to COM[N - 1] are the rows and SEG0 to SEG[M - 1] are
 	 * the columns.
 	 *
-	 * Each Segment has a 8-bit pixel and each Common output has a
-	 * row of pixels. When using the (default) horizontal address
-	 * increment mode, each byte of data sent to the controller has
-	 * a Segment (e.g: SEG0).
+	 * Each Segment holds one pixel and each Common output has a row
+	 * of pixels. A pixel is 8 bits (one byte) in the 256 color
+	 * (RGB332) format or 16 bits (two bytes) in the 65k color
+	 * (RGB565) format. When using the (default) horizontal address
+	 * increment mode, the pixel data is sent Segment by Segment
+	 * (e.g: SEG0 first).
 	 *
 	 * When using the 256 color depth format, each pixel contains 3
 	 * sub-pixels for color A, B and C. These have 3 bit, 3 bit and
 	 * 2 bits respectively.
+	 *
+	 * When using the 65k color depth format, each pixel contains 3
+	 * sub-pixels for color A, B and C. These have 5 bit, 6 bit and
+	 * 5 bits respectively.
 	 */
 
 	/* Set column start and end */
@@ -872,9 +889,24 @@ static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 	ssd130x_write_data(ssd130x, data_array, columns * height);
 }
 
+/*
+ * The SSD133X family can drive the panel in either RGB332 (1 byte per pixel)
+ * or RGB565 (2 bytes per pixel). The format is a per-variant policy choice
+ * selected through ssd130x_deviceinfo::format_rgb565, not a capability probe.
+ * Centralize the choice here so that the buffer sizing (allocation, clear and
+ * blit pitch) can never disagree.
+ */
+static const struct drm_format_info *ssd133x_format_info(struct ssd130x_device *ssd130x)
+{
+	if (ssd130x->device_info->format_rgb565)
+		return drm_format_info(DRM_FORMAT_RGB565);
+
+	return drm_format_info(DRM_FORMAT_RGB332);
+}
+
 static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = ssd133x_format_info(ssd130x);
 	unsigned int pitch;
 
 	if (!fi)
@@ -945,7 +977,7 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 				struct drm_format_conv_state *fmtcnv_state)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = ssd133x_format_info(ssd130x);
 	unsigned int dst_pitch;
 	struct iosys_map dst;
 	int ret = 0;
@@ -956,7 +988,10 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
 	iosys_map_set_vaddr(&dst, data_array);
-	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	if (ssd130x->device_info->format_rgb565)
+		drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	else
+		drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
 	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);
 
@@ -1414,7 +1449,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = ssd133x_format_info(ssd130x);
 	unsigned int pitch;
 	int ret;
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index a4554018bb2a..b0b487c06e04 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -54,6 +54,13 @@ struct ssd130x_deviceinfo {
 	bool need_pwm;
 	bool need_chargepump;
 	bool page_mode_only;
+	/*
+	 * Per-variant output format selector for the SSD133X data path. The
+	 * hardware can drive the panel in RGB332 (1 byte/pixel) or RGB565
+	 * (2 bytes/pixel); this is a policy choice per variant, not a
+	 * capability probe. When set, the variant is driven at RGB565.
+	 */
+	bool format_rgb565;
 
 	enum ssd130x_family_ids family_id;
 };
-- 
2.54.0

