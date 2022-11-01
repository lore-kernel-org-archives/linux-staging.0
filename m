Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A90A7E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 11:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FEFC433C1;
	Tue,  1 Nov 2022 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302215;
	bh=vLsWhaWfthnY1eDb3thOqafTKkz9DILQDMTO4Ks0ZkY=;
	h=From:To:Cc:Subject:Date:From;
	b=reH42v+QZegfrULq45Tg3GKowzECfbwwXAU4RxnG9r5wnSmvSQAGsCiaRmIUffXto
	 x33Y+w/HzelUdcwdzgu96CYj+kqsFVKayv5nctOgqyLH/cTHFSQ85PBS0QmwgHvu1c
	 7BHW6vDpqsSVWxf0bXXuzHpoNyIRcABW5OySIz9mZ9VsF1arYblvwhvw7NFT56oZJJ
	 7oHnUWnIpWp2YZDCtApNrGPcgaMSGiCjru+E3LJUXu1l0b3cw9VBcEwXIn5Osa2vkX
	 pRbYfR4FGyBFHdQbikYeQwngKOSE3F1W+nbyJZCcMpn6si5N1X4K1LhV528avFwC79
	 KaV8SEO6Lh7YQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 01/14] media: rkisp1: Initialize color space on resizer sink and source pads
Date: Tue,  1 Nov 2022 07:29:57 -0400
Message-Id: <20221101113012.800271-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 83b9296e399367862845d3b19984444fc756bd61 ]

Initialize the four color space fields on the sink and source video pads
of the resizer in the .init_cfg() operation. The resizer can't perform
any color space conversion, so set the sink and source color spaces to
the same defaults, which match the ISP source video pad default.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 4dcc342ac2b2..76f17dd7670f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -500,6 +500,10 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
 	sink_fmt->code = RKISP1_DEF_FMT;
+	sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	sink_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 
 	sink_crop = v4l2_subdev_get_try_crop(sd, cfg, RKISP1_RSZ_PAD_SINK);
 	sink_crop->width = RKISP1_DEFAULT_WIDTH;
-- 
2.35.1

