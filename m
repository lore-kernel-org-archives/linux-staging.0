Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3562F5A;
	Thu,  8 Dec 2022 13:55:58 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D5D9020012;
	Thu,  8 Dec 2022 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670507756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ez+xaGXRX17SiCVJoDh8t8wWoiu7lx7UzmAXmqGgMuE=;
	b=NNRxjaAUVStw8vOCJt2SvUiSvRS88BOkRQ8Z/wcWoiW3pwo9rtRFGjLRoUq8AeKWtf59gq
	F8EhazONxd1IzHMblQ/8tjBHBisg6eexFhfFMN3MFlAm+QsKr3JKz5cyBHoMDNYu53kRmS
	NJo+anYNlckuKOQEhE1WEh0FCWCTB/HJdITEkgZS4IDm/IwTH399h6PrLyQmDfi4C9Rq/A
	/MSGgd+9Uja1AbeZTfHQ5jogZjQljkycl7iOwmm5OYsXI+pEgHkkGk9HzJ2wjjSJcM6NnX
	YMLHsXA+C7oIg7uAPZSNdViicOsle0mV4O9wk9kzOQtn5M1gYg4h8Kl3WtYeqA==
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
Subject: [PATCH v2 09/11] media: sunxi-isp: proc: Declare subdev ops as static
Date: Thu,  8 Dec 2022 14:55:10 +0100
Message-Id: <20221208135512.421903-10-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208135512.421903-1-paul.kocialkowski@bootlin.com>
References: <20221208135512.421903-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The static keyword is missing in the v4l2 subdev ops definition for the proc.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index 4f34c1bc8be9..1ca4673df2b3 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -342,7 +342,7 @@ static const struct v4l2_subdev_pad_ops sun6i_isp_proc_pad_ops = {
 	.set_fmt	= sun6i_isp_proc_set_fmt,
 };
 
-const struct v4l2_subdev_ops sun6i_isp_proc_subdev_ops = {
+static const struct v4l2_subdev_ops sun6i_isp_proc_subdev_ops = {
 	.video	= &sun6i_isp_proc_video_ops,
 	.pad	= &sun6i_isp_proc_pad_ops,
 };
-- 
2.38.1

