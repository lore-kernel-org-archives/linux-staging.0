Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20F3EEACB;
	Mon, 18 May 2026 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100377; cv=none; b=FLToJ0pXh+jUcgxAz/PL3HfA9d1u8i3S0Z/5/2GZGuu1oaxc+0QZuFtO95xcboBKz9xfjWJKz1sNm7XbIgC/YB3bb8FkLpkhwCZkVyTpRUhc29lKD29mkGb+wxG7WtOy3vsRiFL/jldB8VYMYjQIhTyV4VYKLI6vfZ8+uf0atSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100377; c=relaxed/simple;
	bh=2ryYcYdMDv3PHd8raqE/i1so2/ppAY539lB4WGhZSA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9XqwROr292T8HMx32ZmoQbBM70Ouw9XYnQyh/bvbbOHnGbBhKjYSP0l0fPLmG5PSRchjXFYxCbZHPhmQHKYdgwy+SSALyRs5vB/JLQLRbtZrpx4Gaz7eleDN5wr5v9YNIduUfr1ZgczqXf64BLZbT6Gar6mKbI6tdfh7mpqDyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5B19F1F80044;
	Mon, 18 May 2026 10:32:44 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D123EB4082D; Mon, 18 May 2026 10:32:43 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0912DB407FE;
	Mon, 18 May 2026 10:25:02 +0000 (UTC)
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
Subject: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric format enumeration
Date: Mon, 18 May 2026 12:24:50 +0200
Message-ID: <20260518102451.417971-16-paulk@sys-base.io>
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

Just make sure the provided mbus code is supported and carry on with the
existing implementation since the pixelformat is independent from the
mbus code.

The params video node only supports a single format and does not care
about the mbus format, but we can still report MC-centric support.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 3 ++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 24e731bcabe9..372b9331bd6d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -436,8 +436,14 @@ static int sun6i_isp_capture_querycap(struct file *file, void *priv,
 static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
+	u32 mbus_code = fmtdesc->mbus_code;
 	u32 index = fmtdesc->index;
 
+	if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
+		return -EINVAL;
+
+	/* Capture format is independent from proc format. */
+
 	if (index >= ARRAY_SIZE(sun6i_isp_capture_formats))
 		return -EINVAL;
 
@@ -697,7 +703,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *isp_dev)
 
 	strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_isp_capture_fops;
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 0cc48e2bc8c6..2622e5a07817 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
 
 	strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_TX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_isp_params_fops;
-- 
2.54.0

