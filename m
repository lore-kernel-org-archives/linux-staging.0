Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3559C3FC5;
	Sun, 12 Sep 2021 08:21:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id i23so9521883wrb.2;
        Sun, 12 Sep 2021 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loVuR5rf8xXZUXrkvmuZ4jdfaeutXsglZCQg6SpqqWI=;
        b=mz9rcT5C8Hmf5wIRx6BVghFw/iPtNymfvfF8cuTcwBpj3tVtFNUDyVqKD9m/hwVuja
         3oAvSb7+QD/evuBHr8Ge9l0bHp6YhNR5ijLNRdBnZH9ubgoCtegSHThuZGr3Naml2G/U
         W4YxkMnq5xXcIl5MkbWBAFtwdeVgbAl9fHQ49aJZpXXC9l2Ak8oXuHuFx1hnFGI06Oa3
         QQFCQY32NwzQQVDyh4iAJF43lBrDw0Zhr6PysXZk2hkbX2C0/Zy7fukuJ+kVdJH9evC7
         NAJy4Q8w5Jwri1ZgA23SAcCuPq+NeBWHegfSMHCTApZ/Ls1t2EoVpYrEiAKf3szTCznS
         F3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loVuR5rf8xXZUXrkvmuZ4jdfaeutXsglZCQg6SpqqWI=;
        b=i5F6WCWZ8W1Y/P7mIZh354avywYYzlrSNhwrltc/DT8Uvihg/mkxFo8SpWTs1YaUqh
         SelAC4DeQkGCXgpQ3hBppKPUK+KTDy2wlcvwNoF5QuWmRGpWgaW/fDy8wz06QQ7Q65o3
         EWV5SUbNrYGj6oPRiscwaKfNGgPdGfrcOGK4y/WCDwHTmNAT7MrnGO1HivqtmYhFYGjl
         dimYSoSLAkJWPP6sgs60rjxahbcYBDqbfYQbmEHIepYabvonLx6r7UvH6myIJ2Tt4yGn
         YODkGDtME67onhqEB+Md0AEjstxGzNEViIWB0mYYUJowIMKADfqidHnKhfFvgn7tChUc
         ++dg==
X-Gm-Message-State: AOAM5300a5j5pv6daK7yQ63Jj4YIK93MYZxumwWML5xyqPJbwHbOCOz9
	0IUYayzdbVE0K0quHfGH5b0=
X-Google-Smtp-Source: ABdhPJymmVlbyu3mVI7xzQefhW6DAWK5wy+DMJxGBpj1f82ZRDyXtzqEeAd+gIeNepxhQTShqR7x+Q==
X-Received: by 2002:a5d:63c5:: with SMTP id c5mr6563829wrw.135.1631434864600;
        Sun, 12 Sep 2021 01:21:04 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id z7sm4734148wre.72.2021.09.12.01.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 01:21:04 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: wens@csie.org,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] media: cedrus: add check for H264 and H265 limitations
Date: Sun, 12 Sep 2021 10:20:51 +0200
Message-Id: <20210912082051.404645-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912082051.404645-1-jernej.skrabec@gmail.com>
References: <20210912082051.404645-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cedrus supports only YUV420 H264/H265 content and mostly only 8-bit
colours (except on H6, where 10-bit are also supported).

Add validation callback to SPS controls, which will reject unsupported
combinations.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 46 +++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index e7741178465b..9dd30cb568e8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,50 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
+		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+
+		if (sps->chroma_format_idc != 1)
+			/* Only 4:2:0 is supported */
+			return -EINVAL;
+		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
+			/* Luma and chroma bit depth mismatch */
+			return -EINVAL;
+		if (sps->bit_depth_luma_minus8 != 0)
+			/* Only 8-bit is supported */
+			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_SPS) {
+		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
+		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
+
+		if (sps->chroma_format_idc != 1)
+			/* Only 4:2:0 is supported */
+			return -EINVAL;
+
+		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
+			/* Luma and chroma bit depth mismatch */
+			return -EINVAL;
+
+		if (ctx->dev->capabilities & CEDRUS_CAPABILITY_H265_10_DEC) {
+			if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
+				/* Only 8-bit and 10-bit are supported */
+				return -EINVAL;
+		} else {
+			if (sps->bit_depth_luma_minus8 != 0)
+				/* Only 8-bit is supported */
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops cedrus_ctrl_ops = {
+	.try_ctrl = cedrus_try_ctrl,
+};
+
 static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
@@ -62,6 +106,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_SPS,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 	},
@@ -120,6 +165,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SPS,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
-- 
2.33.0

