Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB5D4A2A7C
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289519; cv=none; b=goSeiWc9YmtpvSaOJUTPiAY33UKVTd5OawKVCYpClAeZb9mHem7maYveC+IYiEC3VpvVcy+dZi8VZcOzimz4Zx6eakCkaB/6FEJszKmzjhhXTvwv6C0hjJbPeE4z2nqupa34mzc+bl51okXrrjEmN891a2vP3qSLhxZewQcIye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289519; c=relaxed/simple;
	bh=//jCPP+eb8u5m4CIItyod+pODqByyo2ifauCpaFZfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jg3DEGWRVylvvoo66RCmzHVmOOY6bFOcijQByvdzgGLhHL0eAaklzGF5qKlz4egBSoGCL83pGQnNouhLZtIsqk6Dkzb91PyOXKcC5Hqdy3RvTUh93516SB0Ig1Cfnj3kiLpuxSkgvrKeyeMhmwFbghknG0M9qUSkQn4j2BHMXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSj/i2Pm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSj/i2Pm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so1556275e9.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289511; x=1788894311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=rSj/i2PmBrwtns6gs+WKz0IdRn7hcMsDd5bEY+TvQOnJjDVsoiqZIWct9rmtLYbT4q
         5aOsTD26baeQjltXektMP9fZsvSpelmKeeYF36yh0c7hwhDftMPaRWSI0WLxoXZZchaQ
         MgZ5XZDB2x4YRluWEoVavBmb1+QmlA6kOTE+El7FrQyCi2bijbcnmPzCVv8AyJS7qZbo
         uzilIPmww5Us6SaiUDO/rkkv1ZzmjbzOuzjBd8yd2S6o8is56KZgGaXSc0w9EioP1s/e
         aG36VZmVidpoJsbHsGB6Zg7Ry/K7/jr8/06RnHXAlZ50FHeNs+4GRv6IeGFLLrzJYJrb
         HZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289511; x=1788894311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=PbakUV2F4dh41LUQLlCZlAxJv4Rbv7kQFtzK5vMN9fqXh4cq71uvn6QtMwoOz+A7+E
         +E7ntpzzFEggsgQt7t0Iv6r1JMeymrLiqz88Dc/ecCZZ82nT1/21vwRdrfQV8vjya37I
         HprYfu7ZGrWdNoOfHnc7imvOiSx6k3ec3tIVJylQ3HnMHVbKgwwZxdFcqpvKXIrdye6I
         pG3ruHnq3xrZYO5RN052BstGH7w9PHTkn0hSOFnwq1AN1Wu0yrBAUvq1uIFUOmFNmxmm
         eiOUI6ljHHD342jjf4m0CFNmeTkEpRBvfVQY1hO8HDHyin1n9dwsUgx2WaugIrwpnjZV
         vOrw==
X-Forwarded-Encrypted: i=1; AHgh+RoosnXlWrIb/IkzYEigvZ9sMN4A1C/j5JEtYU77gHniIyh0gU7NMyM9fHeiqJvqns1kH8EZS3DpeuXwpgTh@lists.linux.dev
X-Gm-Message-State: AFuF++lz+Vm/WX3cLopJ+eXbP39CXWseDc/78sbX0KcDT/7EiziDWUlW
	oMASA4GeaIK9xiffxzUvgJik0hGqT3VmJDUszOc4suR9fkAjy5Z5HdnC
X-Gm-Gg: AR+sD12WBA6Kpw0rCgmTkpNV6lfQCdZVx9Y7Y2kelG24deLn9gl4GrJFKxhCZ2aJIL8
	DntGwsJDgP2nw2PZyhN7VanYWgYPLVKYtSMeyMHd5bwxZY5lGRIO0hWbM0foCP/STCiilt5XXvA
	GYyit1gmua9C1GCJ5ee08PdAykVqpILftkDZ0BWGvUlzUAmsEmylP4U9/5ZA/t3stqfrvqq0fvk
	XfGANiSChTu9zYpgxuvBkg+oDpei0b9RVPvhFPihX4MlgXkjvoG+MzNRhLH8pj6/fPe7OYwheqe
	5OTpq1VSqvzpzGItyVPDR4V4l9JGVCSZYZjeyS46QPbLpP++3F7sHy4mjMQ6ApbGyfCFxRA4XjR
	UCvVfaGDjj8MLM0+50UKFpsb3ff1yZ8GrCK/g2rhCyKDVQXZmbsBpevLo6ZaFdgaO/OYKTdahql
	I/rERU6Z9cmSHj5bqWSdRxSEpm+MmnrpZZYE2vvQYGYqB2ZbZGdN6iTvcgBQFfSKcaOLwY+QK+I
	duA5GK9ybWGfthefcll4DjCcde7/FoxAQSY8xnZFQ==
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr527810025e9.13.1788289511378;
        Tue, 01 Sep 2026 12:05:11 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:10 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/16] media: atomisp: allow raw Bayer capture
Date: Tue,  1 Sep 2026 21:04:37 +0200
Message-ID: <7ff456265a838f201118adb178107bc7fa72a7d1.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

