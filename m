Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C52F5A;
	Thu,  8 Dec 2022 13:55:53 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6CA972000F;
	Thu,  8 Dec 2022 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670507752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NirQ4Z0H8CCFNO8YF35iEuHBJ67K2AC07Y4K8xGkunI=;
	b=deKqCLsxjB88RmwnIcZIHBybtsPdTrLSzv+zQgNRFNikyTIWDuEu9NLsEvKJL7YNC3G9df
	Dm+ax6gFUOJkNzsg+VlE6qQ4BY9SjjTkjEOr58YVY/gNK/FfaagWL6DhCjO/8Pss8MVKbM
	xLdyr3LGB+Cu+5eNn2GKWm+d1KJrxt45wXrxTJosHfzGD91tRb1b+jvK1gg3ar4CuDbFjl
	a1zs5PNPj0vwZmy/K/hHHa2Iww0yagn8p54cIpbDIbmnwCdDElETYGeYYHm5XYOGnNgXA9
	mhtmXkKPIQkZaIl2//RuuuOZp+znQ9Z3o+ptvkYrlSiEYe68kC5G0zTTkDYydQ==
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
Subject: [PATCH v2 07/11] media: sun6i-isp: proc: Fix return code handling in stream off path
Date: Thu,  8 Dec 2022 14:55:08 +0100
Message-Id: <20221208135512.421903-8-paul.kocialkowski@bootlin.com>
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

Explicitly set ret to zero on disable path to avoid a related smatch
warning. This makes initialization at declaration useless.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index d69d2be0add2..a95709d2c573 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -173,8 +173,7 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_isp_proc_source *source;
 	struct v4l2_subdev *source_subdev;
 	struct media_pad *remote_pad;
-	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
-	int ret = 0;
+	int ret;
 
 	/* Source */
 
@@ -195,6 +194,7 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev *subdev, int on)
 	if (!on) {
 		sun6i_isp_proc_irq_disable(isp_dev);
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		ret = 0;
 		goto disable;
 	}
 
-- 
2.38.1

