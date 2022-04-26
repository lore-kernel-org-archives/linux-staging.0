Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960FC63D
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 12:58:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id F359F1F43999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1650977911;
	bh=mlmVguJcq18q2C5FsZYpROZPrzKGkqiR80YOa10U0rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R4DhZD/ZO/ZdN80EgBWl3CS/bbfNmq0mGNkaXtVKCew0b+SnrGkmV0GdkFy2zQZzj
	 /J1QimWglAQnyxDyECg5tgducpujBvM7Jgn9I+pVNQ17xK0KLQKLq1NyZ2LjHJZizs
	 0IxLhE91L+gsPFTfB4BrsOoanpy/oB9V+TZ76QqbIX2qZ2FeSc3Hikz3TUBtukHukW
	 gGactiPcwUwSMCxq6Fg2Ryr+iijk6a/spxFCBeAF9sv0CLB+igDPaGCO+51/9V0shg
	 NIOuXwDbLBdLSIN6xt60BecfrAGk4xZHH0HggzrLiGP4//WTfbNVeNSYTmRwhrpE0b
	 GDecRSL1kCfpQ==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nicolas@ndufresne.ca,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 18/24] media: rkvdec: Ensure decoded resolution fit coded resolution
Date: Tue, 26 Apr 2022 08:57:44 -0400
Message-Id: <20220426125751.108293-19-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
References: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

Ensure decoded CAPTURE buffer resolution is larger or equal to the coded
OUTPUT buffer resolution.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index e3d44d5b35f3..2bc4b1a40989 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -257,6 +257,8 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
 
 	/* Always apply the frmsize constraint of the coded end. */
+	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
+	pix_mp->height = max(pix_mp->height, ctx->coded_fmt.fmt.pix_mp.height);
 	v4l2_apply_frmsize_constraints(&pix_mp->width,
 				       &pix_mp->height,
 				       &coded_desc->frmsize);
-- 
2.34.1

