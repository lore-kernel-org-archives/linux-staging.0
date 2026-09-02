Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF9E4A8430
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360862; cv=none; b=IGNKe7Q5rMOYqX2YqNF2IiLg0GwGH5D3QCjKED87k+qf5OaIQ+ixgygjz+ZIUAbEWhzI3CL7cKyoCu1PkiK9oF78+xQb1keyw5Mx+F71qlyywycxWEx2FODMZ4ApEdcN9DFVIkzoddZDjgI4CGu5OAesBF+1rsBD8JzGKss9gtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360862; c=relaxed/simple;
	bh=//jCPP+eb8u5m4CIItyod+pODqByyo2ifauCpaFZfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMyAGO1Jw9qp7zy9CRAFzUqjlzrFpkCWnjVcw+d1+nqpFjiq0pYC9f22Qc61hPzNl62TluBMDDdo0aNm9GpBpPetrJ6v1V7pfGvk+H4uMTNncB1CTwg04/GX9ywJQEu3FDUKfmwKQajS0TZAkfwjYD3fofyW5iK8CguPe/QRL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiNG0oYh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiNG0oYh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso8054965e9.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360857; x=1788965657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=SiNG0oYh6Ossk5JtN2RKsT8yKmr1dN1+li+hOf3LokRYD4HgwEsA1lZsViqSjgudeX
         QgnLdqzm86SRvW2j85g75OexoaTbIGFsZzlnG+Z3sVtymN/Yp+oUAIgph0QYIspSAmpX
         lGb/0Pc98SO61nZhYre+VlWGXVkvR/UpjLOlszcGVEyIomE27OC941Vw1XKm8YhjGW0P
         dz0tylg3P6SRl/GaCoMc+AihPuGcRcUZPOFhjWA5DDUKy1LEdHfIWLuFhPA3QIBr4jj+
         aIBbIDtkIhshoTAw4ikE/RMDMLrLgx19RfuMI3P46ei17FYB57zLPIryBdmub8pMyr5B
         fVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360857; x=1788965657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=Q/jj61EEikjTors9Jfv8D39dzOQkN2jY91qxAuS+D9exlSHCavZZ0ut+kKfjxCWV6d
         J3oApP+d3vMwXdd5H+Vy1qnIw2rQQDyOAXciv4kYralmkv/wTjVky4yitNfAXIfira6Y
         8qmtE1VEGGqm3RGgowwrA4WXT9XL7fBYnWDKyTkNHw29JU6h/d2/zs83UdHSvd1TNAn+
         qkD1+7HWD7PCxIcUa2zqH/CZ7GGMUwMdCSYdtAw4QDSmsff3DHmHP5vwyqgfnERXQ4WY
         iJiSeDTcaBXWeg6z+jXuumRy4gbpAPkgoq9BS4/wfa4paI9VQFfDjA3F8En04dJvfZDZ
         i9ug==
X-Forwarded-Encrypted: i=1; AHgh+RrzDyasBJEcDDrP6vkkQtQtvFBjWunTyv7kH1VRVgb7jRy8Bt6ntK22XoR5buR+4BlXLEG/tEE7n+qpa20A@lists.linux.dev
X-Gm-Message-State: AFuF++mpURe87PvPaaEzRbigpbg6VDFdVLw+BEa3pDA6jK0+F4Ofpj28
	4tlpSLaiLV6dydVQTx8H4Y1Vx97xsXHYpNOOO8ycuIOiWD/N5VvR/kYJ
X-Gm-Gg: AR+sD112DC+DADrObizZAkAU0TCWmOqDwOgu3W0jX8B1uD0xLyOQ1NLD8LJl61h7E52
	Gu3os17xbqqSm/rNV+PdnK7iqUaXjB8TZ/51ixr2Qt9MqZh5x7FxiVkDkrqg+eenYAWIoto0n3c
	IgmJbnlQXbt8VxjeCVkPHDw1W8eHko52Ersbo2qzSYQg3THOhgsJKkRJZJI9SmegdjCkb20VgEQ
	LQtxK3m63PGKM0ef9rqZJ9Lsa0p3hxKh00dco9pMMVWtRyGJMLeQStD/g9F8hMhVdxsrqr1mTn/
	8Wv8SMpqw0iuK/GEmJNjJPCcDKG38JbE5I9/NFpGl4J1JgwyNTPOGdoD7X77RAeVyBUf9u+6X1Z
	lwlGiwagP9ZcNH8HEq8BJ4qj8fF5NwDD+VtA8M6OF48w6Eo44056h8cCJ5TYeoQ+t3aNstHkFoz
	WH1hW1/xrFJlZM7ijjH09GUmRSQg4meyCMcOMhbuUuNEkofBb+iheXX8sVo/FxSyfPnltBfFbOX
	7tv8X9aQo7AE5HqZ/bx2xLsAxqLmMKUPLXjQ8dSu6YQ
X-Received: by 2002:a05:600c:8411:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49ce58204a0mr95925455e9.8.1788360857170;
        Wed, 02 Sep 2026 07:54:17 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:16 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 15/16] media: atomisp: allow raw Bayer capture
Date: Wed,  2 Sep 2026 16:53:44 +0200
Message-ID: <5a163a69a3cb3b139f2c7ba5eee5b32bac575d27.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Enumerate only the raw format matching the sensor media-bus code and
reconcile raw requests with the code selected by the sensor. Userspace
opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.

Raw formats expose the full sensor transport frame so ISP2401 can use
its copy pipeline. Processed formats retain the existing global padding
behavior; selecting a smaller receiver crop remains a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 14 +++++++++++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 759effdb2e8d..99d2b73b160d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3815,8 +3815,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3838,7 +3837,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_pix_padding(isp, f, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else
+		atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3858,6 +3860,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
+
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87c29a940f9b..aa6d13a4de89 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -537,12 +537,21 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
+	struct v4l2_area padding = {
+		.width = pad_w,
+		.height = pad_h,
+	};
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
 
+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
@@ -554,9 +563,12 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - padding.width;
+	fsize->discrete.height = fse.max_height - padding.height;
 
 	return 0;
 }
@@ -630,7 +642,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    format->mbus_code != code.code)
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
-- 
2.53.0

