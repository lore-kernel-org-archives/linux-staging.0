Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43489494819
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199299; cv=none; b=lkhstrWzHEd3R+aH7Qq6S1iSPYIJU+vReY7zLRgoBfiydxd2TsSo+8kfffdfY/oB4iKTYaPS29lJAezR+yaP1tFcH2biRGKZErCS738b/TSSnLVRRW4/AkhX9kca8IpmL50pEwJ/RjpdYbgFYYbcolAXHU7cHIf8s2x5WWaijIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199299; c=relaxed/simple;
	bh=wCT9vleSDIdlrhijo0+ZTRLZDZnpWNE+2f/b/xLpYNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0J4zBoTqP2ED3RPIj5ztCxRtP+pgnyPi66ABF0gSezEv4ETonN0U6XtTwiBSFGOtJXFrz569xG8j9SUbWi+qHCaPc4gN8sHmDzQmpQ+26wcIccyinjqgt/LjxCC7xnPUSGgLrWP9WBtp81jiKMKJEdNoNsfMzQMjD3Xf/Ouok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHGiSzpb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHGiSzpb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b9320423cso37625985e9.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199295; x=1788804095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrzKcCrBMmgNTYePdfcU19apjEXt14IF8iaoGtUHGqA=;
        b=IHGiSzpbg3PzUmkP2Y9NZGhqMhZsOj8dEOhsf79MMZfM94mmDsWvhin1vFS1og3JW9
         Z3YHN2qrY1FEpzYijpcX2qSRpTJ2VkxpuNeHaCeukjIsdJ7CUe8mfnLA7X4pqg60KR3/
         M6xFhFbILXfK34oRb7+D2COAH7QlsciHmlVrfqh/FWwzX0KT8pS/utyp/GkRdwrzISrC
         CcEQZQ5WfzwNTYe1+RIiPi6Hqdk0wn2N46OUFKqVXe4m3parj8tGFMQ8j6DVwN130mx2
         ysGPJfGs8tNnbhsSuWg/71hpGd3o6qOgVmHjdhdOi8gShQuhlp3DnPjgN1JtQZ30zoiS
         vv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199295; x=1788804095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrzKcCrBMmgNTYePdfcU19apjEXt14IF8iaoGtUHGqA=;
        b=iWMByeBVcUeY67Zd/IO/AdNAT+6+ZWicB5g5iZeZC+ErIfnym7RfCyD01G4DUnooJ7
         BYlz/cgOdWJN0WP+3qziuRr3y2z8GaWDtYn9O+USOZDUz4ycvhEvB5cnUj7qb7gzmRZm
         p219euW08KVzeRyTAjZUjVVWHICB/4AtFxRqB5S0+qe/LnxJ/nMG0W5r5mOvF+u17CR7
         C+W7Bpq2cw1lc9nRkXd2YgZ2CLG9/+Cli0j6salQi+DOXIoSEahPRA4AlzYEJLfMerfB
         /HRgyZahZM4iG3HN1wZG0hykZUtpxxz8RJdHey3BRZAr2SwuFI+iZ7JQgWVb8j/gQzvn
         U9vQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYgwdPtLqdPIlF+Tg0njqcUjkb4hODjoYQbiMt8HibEtGp077zcsGV+8pfsodglNLq8JL/rAFwMiqkGg3q@lists.linux.dev
X-Gm-Message-State: AFuF++kNfcInD68w2Sq1HxQK7K80o1SJWXyQh++vZhWmldE6oEX9H4Co
	mNOnuU4bkzk5JmnFS71jinurBWneXK6xueCA9Swvh6KVS/8Vo3LCsTdE
X-Gm-Gg: AR+sD129kJSSRueiFX3uqFuhyvB26b8d7c6OO9DXjHEKs63T1uzo1Iy52N68SQgNd58
	8Kt5QZ1AzQJ9x9A1jrabP1jBzuocfECBOkID221bZ+UP5BgwkJ4tWdSSbL+LD+LYrBUH2fylWNH
	X7WPqg3m2YOtg2Cfy0ir2kku9YvHZWYGVXM/1adXE8AcU7WnsOPL5/jPifV/XGdoR+lEuESKs0D
	38Sgtnebp2mBm7UoBZ/WsoN7DXJtFNwOxi4Vy2pt9nwxq3lhbTEmGG5luF0iM0CndQ9jT37Ww+D
	GnbymwV1zdWbg9GiZtYSFH2abf7VwMoJugwpkRiPe2zUEARcfyWC6RS4IO+me1ksdzBnhVjD26e
	gBQr3aUykgTK4FSZ1GR5moctMfFyBTGYePoZgy0fc6YYViTsV8bP34ypnJUewO2UT8eKFSCQaF8
	HTgZCH+qaX1e/gXu9QBk+msl6NgwPD2NbYJd2SxwJfQYLs7u88v05YlspTA9HadDAUnwAa4W7Sc
	q4jSU5RvFocnTt/IpOPkcXmCZeue/6bjGMrgmoY6h4=
X-Received: by 2002:a05:600c:3b2a:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cdc57d1d1mr37540515e9.16.1788199295451;
        Mon, 31 Aug 2026 11:01:35 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:35 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 15/16] media: atomisp: allow raw Bayer capture
Date: Mon, 31 Aug 2026 20:01:00 +0200
Message-ID: <20260831180101.3109854-16-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

