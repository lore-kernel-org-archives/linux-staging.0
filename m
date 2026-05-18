Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460833EBF33;
	Mon, 18 May 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100198; cv=none; b=h675zoKe2d24pYLtv91kfEcpq2ScWRyQg8fVP2ZIiJAh837R8qSNvYrZzbbVtM9VfffHC6WeHq8R+dggpHwbmHLfcUWAvyMOI5gF9tuHbte8bybwFzw80uZodGQvnqL5z405Rs94jTxSx7Re+XvI9tc0gDBYTGSg4wa02ZHXlPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100198; c=relaxed/simple;
	bh=N6jBm7mjftN6RyzhLYEDB/ctTHQIpMFcWgaVKSlq3IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APbiX4W55FT8kevvQhxGLpIRJjULMmxkp67fuCdWrgyan1jWpO6Rvys2ExOaoxjsWxQ98RfwFUbHh2ellJOM2tf5MzMK6SyS2NpAT74vSn0b8KhcNv6XEaw+q/PzLxdbpJy6DEBoN+ixmEZ3Xu6B3Lbjz3zYeRPMYdp39zPLTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 8F9251F80044;
	Mon, 18 May 2026 10:29:44 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 10E15B40818; Mon, 18 May 2026 10:29:43 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0C8EBB407F6;
	Mon, 18 May 2026 10:24:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 09/16] media: sun6i-csi: Split format validation to a dedicated helper
Date: Mon, 18 May 2026 12:24:44 +0200
Message-ID: <20260518102451.417971-10-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new sun6i_csi_capture_format_check helper based on the
link_validate code, which will be reused to implement MC-style
pixelformat enumeration.

Formats not listed in v4l2_format_info are now checked via
sun6i_csi_capture_format_check (which only concerns raw formats)
instead of blindly allowing them.

Also fix a comment in the raw format table.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 87 +++++++++++--------
 1 file changed, 49 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f788b4234673..a836fa7f081a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -213,7 +213,7 @@ struct sun6i_csi_capture_format *sun6i_csi_capture_format_find(u32 pixelformat)
 /* RAW formats need an exact match between pixel and mbus formats. */
 static const
 struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[] = {
-	/* YUV420 */
+	/* YUV422 */
 	{
 		.pixelformat	= V4L2_PIX_FMT_YUYV,
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
@@ -327,6 +327,51 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static bool
+sun6i_csi_capture_format_check(const struct sun6i_csi_capture_format *capture_format,
+			       const struct sun6i_csi_bridge_format *bridge_format)
+{
+	const struct v4l2_format_info *format_info;
+	u32 pixelformat = capture_format->pixelformat;
+	u32 mbus_code = bridge_format->mbus_code;
+	bool match;
+
+	format_info = v4l2_format_info(pixelformat);
+
+	/* Some raw formats like JPEG are not listed: try a direct match. */
+	if (!format_info)
+		return sun6i_csi_capture_format_match(pixelformat, mbus_code);
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		return false;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_RGB &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		return false;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		if (bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV422)
+			return false;
+
+		/* YUV420 input can't produce YUV422 output. */
+		if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    format_info->vdiv == 1)
+			return false;
+	}
+
+	/* With raw input mode, we need a 1:1 match between input and output. */
+	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
+	    capture_format->input_format_raw) {
+		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		if (!match)
+			return false;
+	}
+
+	return true;
+}
+
 /* Capture */
 
 static void
@@ -915,13 +960,11 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	const struct v4l2_format_info *format_info;
 	struct v4l2_subdev_format src_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = link->source->index
 	};
 	u32 pixelformat, capture_field;
-	bool match;
 	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
@@ -950,44 +993,12 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		return -EINVAL;
 	}
 
-	format_info = v4l2_format_info(pixelformat);
-	/* Some formats are not listed. */
-	if (!format_info)
-		return 0;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
-	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
-		goto invalid;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_RGB &&
-	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
-		goto invalid;
-
-	if (format_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
-		if (bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV420 &&
-		    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV422)
-			goto invalid;
-
-		/* YUV420 input can't produce YUV422 output. */
-		if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_YUV420 &&
-		    format_info->vdiv == 1)
-			goto invalid;
-	}
-
-	/* With raw input mode, we need a 1:1 match between input and output. */
-	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
-	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat,
-						       src_fmt.format.code);
-		if (!match)
-			goto invalid;
+	if (!sun6i_csi_capture_format_check(capture_format, bridge_format)) {
+		v4l2_err(v4l2_dev, "invalid input/output format combination\n");
+		return -EINVAL;
 	}
 
 	return 0;
-
-invalid:
-	v4l2_err(v4l2_dev, "invalid input/output format combination\n");
-	return -EINVAL;
 }
 
 static const struct media_entity_operations sun6i_csi_capture_media_ops = {
-- 
2.54.0

