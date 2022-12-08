Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB12F3D;
	Thu,  8 Dec 2022 14:20:49 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 47A4BC000D;
	Thu,  8 Dec 2022 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670509248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MxNU8R0hlLPBF9tSthFNrX9x65pnLvPWMOB/8u2G9pw=;
	b=i5y8KAuAxBn0vHH8ZCOIGjzQYRalTXiPXwlbTriiSCczChCkKhSPkdoSe6cktlwxZvIAYH
	Jby1hCvQgI4n/8WHkfAGe38jHTpNxytOtArOavYCjxXtmcj+CK2ouJ1sZYgGF8JOB5bxAk
	IPsbmMCynNJT01h4LMQHIyU+8XpS5Q3wvA7QzJzXSPc+ADcQ0oAidqfCTmJRXeBobHWhN+
	6WXu9dMbwBXG87S11+SCp+06LuL1z1urnHnM/B5fuXvVbtXl6B98YSUx0WVfQy9RvDSE1a
	/BExhhH/giPAIlfRs7uGTPIisO/ixin+tihlrNtEffcgf5UR+kHIyD/Uh/uwow==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Conor Dooley <conor@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v3 10/12] media: sun6i-isp: capture: Fix uninitialized variable use
Date: Thu,  8 Dec 2022 15:20:04 +0100
Message-Id: <20221208142006.425809-11-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208142006.425809-1-paul.kocialkowski@bootlin.com>
References: <20221208142006.425809-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the stride_chroma variable was previously initialized to zero,
it's actually stride_chroma_div4 that is set to hardware registers.

Initialize it to zero instead to avoid an uninitialized variable use
and get rid of the associated smatch warning.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Fixes: e3185e1d7c14 ("media: staging: media: Add support for the Allwinner A31 ISP")
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 4b592820845a..1595a9607775 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -108,8 +108,8 @@ sun6i_isp_capture_buffer_configure(struct sun6i_isp_device *isp_dev,
 void sun6i_isp_capture_configure(struct sun6i_isp_device *isp_dev)
 {
 	unsigned int width, height;
-	unsigned int stride_luma, stride_chroma = 0;
-	unsigned int stride_luma_div4, stride_chroma_div4;
+	unsigned int stride_luma, stride_chroma;
+	unsigned int stride_luma_div4, stride_chroma_div4 = 0;
 	const struct sun6i_isp_capture_format *format;
 	const struct v4l2_format_info *info;
 	u32 pixelformat;
-- 
2.38.1

