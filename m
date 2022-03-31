Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CECA43
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 19:37:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 422C41F4725B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648755478;
	bh=n6MPrL7fQ9yMzjnP11oTkFqivourvSLa0aWHcN/kENg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jkEylmlesJkAj/v1WszIOWWnTqVvM5yv/nbStUOKJ7IsZuMzohiE12OqgETjnrjws
	 0sO7cTfSLluqql9ZvlMIAG+O+mLQsHVOh+A30WQ6sz0JXqICdTNXwM1SIQSV8pnVeU
	 hZCtn5pSTa6++6wSEcsyyFGzt9xjp+qEtTo9syicqb4eBoI+9gSIKIb4ubcGmTqWWe
	 SOhW1vW9cWFx90iSef9jrGTYd6+yV826nWnRkxVRcd6sxXBb/Z/14wSZUAe/32v6bz
	 p6PTyc9uUEbB9bpyK+Gth3D10QNCf5b2LXC56dsKWaBQ1IiMpzmpXj642yOyrynz3V
	 XbUiJSobUUpZg==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/23] media: rkvdec: h264: Validate and use pic width and height in mbs
Date: Thu, 31 Mar 2022 15:37:17 -0400
Message-Id: <20220331193726.289559-16-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

The width and height in macroblocks is currently configured based on OUTPUT
buffer resolution, this works for frame pictures but can cause issues for
field pictures.

When frame_mbs_only_flag is 0 the height in mbs should be height of
the field instead of height of frame.

Validate pic_width_in_mbs_minus1 and pic_height_in_map_units_minus1
against OUTPUT buffer resolution and use these values to configure HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c |  4 ++--
 drivers/staging/media/rkvdec/rkvdec.c      | 10 ++++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 8d44a884a52e..a42cf19bcc6d 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -672,8 +672,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		  LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO),
 		  DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG);
-	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.width, 16), PIC_WIDTH_IN_MBS);
-	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.height, 16), PIC_HEIGHT_IN_MBS);
+	WRITE_PPS(sps->pic_width_in_mbs_minus1 + 1, PIC_WIDTH_IN_MBS);
+	WRITE_PPS(sps->pic_height_in_map_units_minus1 + 1, PIC_HEIGHT_IN_MBS);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY),
 		  FRAME_MBS_ONLY_FLAG);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD),
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 2df8cf4883e2..1b805710e195 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -29,8 +29,11 @@
 
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
+
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+		unsigned int width, height;
 		/*
 		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
 		 * but it's currently broken in the driver.
@@ -45,6 +48,13 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+
+		width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
+		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+		if (width > ctx->coded_fmt.fmt.pix_mp.width ||
+		    height > ctx->coded_fmt.fmt.pix_mp.height)
+			return -EINVAL;
 	}
 	return 0;
 }
-- 
2.34.1

