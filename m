Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738243E866F;
	Mon, 18 May 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100250; cv=none; b=qVtpkd5MrOlk1RUKmwwO4PS/59nLZ3SEZl2h8rwUEnvt0kVYTdV7UTVsIMVWKY9slmzF+70Bfj0Ytd1PLwvXBzyai3+fQXIfXgX4ug7Y0YEBFrNfPfziVSbQiuwJxnnB9hQdQhx7Jn4zFOhpr+PtNE8nors99OEJLo6YbkAmYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100250; c=relaxed/simple;
	bh=a94F18r5g+FvBqZBmEeOdOnNuIqh/W6Oyf8UGJe6Jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/AeY9UDBocX+OUT3id3pnzmji2es0PZ8E3pRTuo9WvpKzQIfqx3emrqxcaW4ZGXHVbHDPkSY+jdhpLa5DY5HS/F8eQC0mNq+SZKSyTQNc8NhDtT8UDtKxq5zgJE+051KjubE1aZnXTcxSgLnLsoF+HXYoNTcgtvOFJb2SCVlXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9E0A91F80041;
	Mon, 18 May 2026 10:30:18 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0D92FB40818; Mon, 18 May 2026 10:30:17 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5C629B407F7;
	Mon, 18 May 2026 10:25:00 +0000 (UTC)
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
Subject: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
Date: Mon, 18 May 2026 12:24:45 +0200
Message-ID: <20260518102451.417971-11-paulk@sys-base.io>
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

Use the dedicated helper to check possible pixelformats against the
provided mbus code in order to support MC-centric format enumeration.

Note that multiple pixelformats may be returned for a given mbus code.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index a836fa7f081a..409c28621093 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file *file, void *priv,
 static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
+	const struct sun6i_csi_capture_format *capture_format;
+	const struct sun6i_csi_bridge_format *bridge_format;
+	u32 mbus_code = fmtdesc->mbus_code;
 	u32 index = fmtdesc->index;
+	unsigned int index_valid = 0;
+	unsigned int i;
+
+	/* Video-node-centric enumeration. */
+	if (!mbus_code) {
+		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+			return -EINVAL;
+
+		fmtdesc->pixelformat =
+			sun6i_csi_capture_formats[index].pixelformat;
+		return 0;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	if (!bridge_format)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
+		capture_format = &sun6i_csi_capture_formats[i];
 
-	return 0;
+		if (!sun6i_csi_capture_format_check(capture_format,
+						    bridge_format))
+			continue;
+
+		if (index_valid == index) {
+			fmtdesc->pixelformat = capture_format->pixelformat;
+			return 0;
+		}
+
+		index_valid++;
+	}
+
+	return -EINVAL;
 }
 
 static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
@@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.54.0

