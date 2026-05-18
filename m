Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F33F075C;
	Mon, 18 May 2026 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100409; cv=none; b=K56gNoe6xXotkWWi7ykcfgMvUtI2nV/z7IOMht6xHBBOn7UJb2FRtzulqCbI4nIvus6oZRQuqawzVrjp7H9sUpgGiejjpimTpXWIyb8hQ0RSS8LxuVa43ntVbAMZm2dSYxEVMrU7szqtkk7F2vtvMhoGExA74Mg8RSlPixVimtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100409; c=relaxed/simple;
	bh=SgJOt2lJqQBSvcUOjOlop7PuiMEzx9YAgYU411aMNBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFXzNzLYdUp3rhzWhafJdO2SKZZna1h/v+iCkR5pTbvo3SzGBbBU8q2gbG9u4ShZdMMTSDxUTS18TM3MRXZ+8/+eJhQRSduSCMgkWPaF5o3ewGEmj1i5Gs0yG5Qbong/mfwutP4TOgq2JLsdNXZvxH1Ds4ELONHOwr+BtUTtsoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E7BB11F80041;
	Mon, 18 May 2026 10:33:09 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 6F611B4082E; Mon, 18 May 2026 10:33:09 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 52A59B407FF;
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
Subject: [PATCH 16/16] media: sun6i-isp: Add support for frame size enumeration
Date: Mon, 18 May 2026 12:24:51 +0200
Message-ID: <20260518102451.417971-17-paulk@sys-base.io>
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

This implements the enum_framesizes operation, which reports support for
even sizes.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 372b9331bd6d..e638ec32c7cd 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -452,6 +452,26 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_isp_capture_enum_framesizes(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *frmsize)
+{
+	if (frmsize->index)
+		return -EINVAL;
+
+	if (!sun6i_isp_capture_format_find(frmsize->pixel_format))
+		return -EINVAL;
+
+	frmsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	frmsize->stepwise.min_width = SUN6I_ISP_CAPTURE_WIDTH_MIN;
+	frmsize->stepwise.max_width = SUN6I_ISP_CAPTURE_WIDTH_MAX;
+	frmsize->stepwise.min_height = SUN6I_ISP_CAPTURE_HEIGHT_MIN;
+	frmsize->stepwise.max_height = SUN6I_ISP_CAPTURE_HEIGHT_MAX;
+	frmsize->stepwise.step_width = 2;
+	frmsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -522,6 +542,8 @@ static const struct v4l2_ioctl_ops sun6i_isp_capture_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= sun6i_isp_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_isp_capture_try_fmt,
 
+	.vidioc_enum_framesizes		= sun6i_isp_capture_enum_framesizes,
+
 	.vidioc_enum_input		= sun6i_isp_capture_enum_input,
 	.vidioc_g_input			= sun6i_isp_capture_g_input,
 	.vidioc_s_input			= sun6i_isp_capture_s_input,
-- 
2.54.0

