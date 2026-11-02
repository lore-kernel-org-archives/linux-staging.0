Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639002;
	b=nAJIEGa5EpaQ+zzSrPgtN8knQ3Si6zTOV7+FaSRcJiaN5B8s6AJYwkOkWs6FzD9B1h/6
	 mzh6U7iXI3Yt6ztaR/zTjkUt+4tnGcQ5KDBWTvnLtGnbsWXPK3jqJW4Q4A6L07LTwI4M5
	 R+7z2nzt1197HN0EBsr2zD4rjhKVusIb1mmxOtMDTCjbGpoSobwXTYDb7ER6vvoXsrS7Y
	 4nsiw3aIz440DwfJyJu5VX+4JLWTUADaUGQHZJR98HOpbrQZOP8NUsilxDa99eYf5RXt8
	 zO171hIaYDkSxBeni+dKRSJ3gpaSiaNrKv3Li5ZU4T/VWKLJovqkRCjOnPT5LKSXd/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
	b=YIA3tnic2cnwWj2yOtZqeCDUDxJoQw9YINxl1mOrlfvxFQGvvyz+CyA22dGl9bbfXoq8
	 98h1JD+9WV82QZf/nSCXghk3MjsXLaHtPEqRA1/6qUNrc46xCzTvUL6CL2G0Zn4TpMsA8
	 +Y6tbCK0B4XYRDJTqejGGRWqTD9u1K/y1IXxuJZXh0i/N3emhFXLhVT+QbZcwe/lVaZa7
	 My9UHe1fMZ/RNUTWqUcKwzZWAwPeGvaZ1B3j1aoUcRVc+GqEmrifbUDikmRpRJ8Xau/mR
	 MpFqOyVUY0ITCSCV5FZ8gkCx0/GakXQ2MhKlZMRuJqjw0KxgRTaZDN78XOu6AZ2fOog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OeA3gHXj;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87F606A330
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE87F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OeA3gHXj
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfb76b304so306729f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639000; x=1794243800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=OeA3gHXjBzIAxrTK3e7vvcPsLlRisRfQYSUezr6Tfzdv0V6K/y9T8HarmZacWYkIl2
         LK6V99mfhISMgKc8KmdZeWCZJ/SZmAYmj5nj7tUuBQQZzaoaRtAqAy+2R6YdweQX0vBw
         jHIu1awyrmnbqkDeXbz9SizdyxYAOJTC4gcq7Am+ImwnZ4wU1j6gxAofHMYGZJ4Y3d9h
         hoQWw3/Oz1NG+VJ2tfdR20ibDLETPSDz1i1IefS59jJBXTMfs4JSNM5W9yl1nnQdxDoH
         vvpj+TSaEAaZrnOp57SB7qs7rA7RDethV79QiOohOYcDn6VhdMxTg5qQMgIydlLLY3Ya
         lFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639000; x=1794243800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=CwI1u/wp1roLYIe6Fr4+Xrgj2dlY/zCeOGhbV6Pwuexar1jOAXbQnw/akMW7fObfac
         f6fra/sugB4vD5r2zVR4sNTPaOHTWxSCYCjcd434vPKfA8aHklnPbpSmqetnEuaP33ul
         NOOBAuBBEnKKheBL0d9I2zy/qeh9P6zacgmwWKbGE3r42A6mswuS7kIcWA0qRYDg1ma1
         Xz0PIntWqqgK1LB9hdMi+t7RiZFr+2kAUXH6yCF5eKbYFi++7yxtfrBQnl4m/7jIGAns
         njAC+tM9gJJzv6aBf7VkfS0/RgRuMNNM01Pm2F+f5p1gqboaJbP6MQmiue1aOncyOuhN
         IOpw==
X-Forwarded-Encrypted: i=1; AKwUvByfCY/p6499P8dnQ5JkfnxCPBNPsQZQSnpjpSebVBEk2AfhPQYMkys8r8egSJ/lq/F/gNmvYQ7LZPUo6Hdz@lists.linux.dev
X-Gm-Message-State: AFq9FYKZGlbdBEXPvDaJwPRlvX4M9vMjnViJX9H4ZsVbwGFLvM6f847D
	v4lbWUdcR0Ylg+lGeOlyLvnSTxlnb/KkCQhseOSmKKc6uVm3sSJaNynO
X-Gm-Gg: AYBFou2s4uxgfgucPP5JNh+K7nZCT6IIQLIXKU5Ubhjk0eR3B0nDZfvxmCAH3vpbWgW
	gQUYtuAZxHD5xDwVOF6PPZTVqBfYlBpeZbS6sIXsMiGOLIaBLjq7cG2jA+N2zf2xLT1Kll2C9ia
	7LN9ZEYlaKqn7xMzqVTCw61nyxwC2Ug4J7tMsa0EJCziSugeF6WCb9ClGz6TYN2DCyuoJGn5/HW
	SjBeSI3xCW2AktT2Ewelmp1Uu4UlB7OvW29Z95qisWPWuJO+0Hx0F4YAqTZYhg3ONuSDYHfdmwy
	U1GW3/IWepVZ0WRrSD1htedi6JzTQyDYF58AifhYpIGglEpfPrbQayD9gK06nIhVNx6kID6NPt9
	LzKNpCXdsmzXE0z6Fki0RYAftCXvXesnIQ2e4m0wPVIk1K0UxtzgA/m4Slz+/KWZxQzUccB95xc
	fgwWPGvCbS6EVqCLH6PeHE0RoKbHYOJVpHWrSCjpXxoszL+E2TEft/xViUSaoeZ3QuQbXoh1M1C
	oD8FinzPHCzTsJbgVpTBL7RibdBdq4hcV6bgsj4UmVRV0AXROan4fXEv3SzUFionsXrxv2uYELl
	TSMCrs+YS0eGe2P7FP36LNHnf2/vbODmNYFv5Xqd0qm/siMVF5lST3Dwp9zhjbwddQia6XLziER
	u0NwsJg9LItUZJOwRyG3atlAnL1oYUt7Ojvipy/JuQjsHvHDOUhL/wuNtmsxRoTmB+Xpjml4VTS
	v/LAc9CA2FkvrwcRFJBv2Pa3Rmjif8qdFUjX8Gn3gdxTPwuPbuAk/3SqVtHiBYi35aZoUHUuEnZ
	sWlAfYvtsroaNWlBg36B46NYQ8M5eR1mQlIznAsiBNke6gfgw==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr248056415e9.27.1793639000058;
        Mon, 02 Nov 2026 09:03:20 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:18 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  2 Nov 2026 18:02:55 +0100
Message-ID: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware decodes whatever picture size the SPS describes. An SPS
beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
are allocated, makes the hardware overrun memory and hang. On H616, the
JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
4216x528) leave the hardware wedged, so that every following job times
out until reboot.

Validate the SPS picture size in try_ctrl. Move the size limits to
cedrus_video.h for that.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..45deebddb630 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,10 +28,38 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * The hardware decodes whatever picture size the bitstream headers describe.
+ * Reject sizes beyond the hardware limits, or beyond the capture buffers once
+ * they are allocated, instead of letting the hardware overrun memory and hang.
+ */
+static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 height)
+{
+	struct vb2_queue *vq;
+
+	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
+		return -EINVAL;
+
+	/*
+	 * The hardware decodes whole 16x16 macroblocks, and all capture
+	 * formats pad the buffers to at least 16 pixels in both directions.
+	 */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vb2_is_busy(vq) &&
+	    (width > ALIGN(ctx->src_fmt.width, 16) ||
+	     height > ALIGN(ctx->src_fmt.height, 16)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
+
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+		u32 height;
 
 		if (sps->chroma_format_idc != 1)
 			/* Only 4:2:0 is supported */
@@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+			height *= 2;
+		if (cedrus_check_pic_size(ctx,
+					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
+					  height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
-		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
 		unsigned int bit_depth, max_depth;
 		struct vb2_queue *vq;
 
@@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+					  sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index adc7f255d7cf..2521315abdb7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -29,11 +29,6 @@
 #define CEDRUS_DECODE_SRC	BIT(0)
 #define CEDRUS_DECODE_DST	BIT(1)
 
-#define CEDRUS_MIN_WIDTH	16U
-#define CEDRUS_MIN_HEIGHT	16U
-#define CEDRUS_MAX_WIDTH	4096U
-#define CEDRUS_MAX_HEIGHT	2304U
-
 static struct cedrus_format cedrus_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_MPEG2_SLICE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
index 8e1afc16a6a1..367e52158f01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
@@ -22,6 +22,11 @@ struct cedrus_format {
 	unsigned int	capabilities;
 };
 
+#define CEDRUS_MIN_WIDTH	16U
+#define CEDRUS_MIN_HEIGHT	16U
+#define CEDRUS_MAX_WIDTH	4096U
+#define CEDRUS_MAX_HEIGHT	2304U
+
 extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
-- 
2.43.0

