Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872557460;
	Fri, 24 Mar 2023 15:12:52 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19EA7E0015;
	Fri, 24 Mar 2023 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679670765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gIn39Y6zA0CFaVJ6us4+7VwM4cTlinJOP/M7fEZG7Y=;
	b=TX4hxQ9RP7XPd8vlAYXjTa8wCMrPziKlOupK2OrOzG5+o3vFMT+sIk3bH+cgHZGrioCslu
	cUSVKOFWdsQFwRsIBvf6lZNNVLfIlwljTuINbonSNl8WMSzdwFKhB3uBIsbInMZAyBx5rK
	BibBAi5OW3OuvgvSV4yo9PqsdTEe3PrwAZG8Y75zRgQT05IUfRj8CFOEy/d+B+aXplhooC
	zPehihj1vvb9fIIcfkwlSR9fC1Tn1r3/HUawg99RgKEYNV93ZL/B6KdK0pMrgNYEOLLOW9
	IFT9bttX58/dwOtb3iZz21JbY+hAvBgFkAaprkVe01g0n2YuotYU/YLywPdyTA==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Adam Pigg <adam@piggz.co.uk>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 3/9] media: v4l2: Introduce compressed pixel encoding definition and helper
Date: Fri, 24 Mar 2023 16:12:22 +0100
Message-Id: <20230324151228.2778112-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
References: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some pixel formats (such as JPEG) have their data compressed and
encoded in a specific way, which is not directly YUV, RGB or Bayer.

Add a new definition and helper for compressed pixel encoding to
represent this situation.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 include/media/v4l2-common.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 1bdaea248089..37554bc10e2a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -465,12 +465,14 @@ int v4l2_s_parm_cap(struct video_device *vdev,
  * @V4L2_PIXEL_ENC_YUV:		Pixel encoding is YUV
  * @V4L2_PIXEL_ENC_RGB:		Pixel encoding is RGB
  * @V4L2_PIXEL_ENC_BAYER:	Pixel encoding is Bayer
+ * @V4L2_PIXEL_ENC_COMPRESSED:	Pixel encoding is compressed
  */
 enum v4l2_pixel_encoding {
 	V4L2_PIXEL_ENC_UNKNOWN = 0,
 	V4L2_PIXEL_ENC_YUV = 1,
 	V4L2_PIXEL_ENC_RGB = 2,
 	V4L2_PIXEL_ENC_BAYER = 3,
+	V4L2_PIXEL_ENC_COMPRESSED = 4,
 };
 
 /**
@@ -512,6 +514,11 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
 	return f && f->pixel_enc == V4L2_PIXEL_ENC_BAYER;
 }
 
+static inline bool v4l2_is_format_compressed(const struct v4l2_format_info *f)
+{
+	return f && f->pixel_enc == V4L2_PIXEL_ENC_COMPRESSED;
+}
+
 const struct v4l2_format_info *v4l2_format_info(u32 format);
 void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
-- 
2.39.2

