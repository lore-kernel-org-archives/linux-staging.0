Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62EA2F37;
	Thu, 25 Aug 2022 10:29:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B5620CDDCD;
	Thu, 25 Aug 2022 10:21:02 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 303CEFF810;
	Thu, 25 Aug 2022 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661422855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fADrytMyJ+IeFhafpCR+cpxXr1qLiBUI9/+ESdhhNfw=;
	b=UbSY1kdVboP9QEeR1nDV8UeC/uJzbELAhmUrK3sGfswwgoqU5iE/KJC3NNjAygXWlqfRCc
	2RmIP1okH8BMPPS7nlbEoWBSaLjnQwSvatpy+nbuI+JiFUrELQKUnQTIdKwG2UZLzPndCj
	uXIOn1R0O77hCs1zFjbIpBJ02GeRyxqDchzbV6Ed3LjA7xddcAli3j5NY3IYsHb5yXh5fk
	jR+ZZCAceQ7B9k7hcQ2HjBPrnkgNK9pKD8tHuRs2yNjAmb8vmDzDDTiaKdJMpeQnYZL79o
	bGZnNZIuASB6ChtTvD419wPVJyWlquP3ngpGlhfY7/28nn+FceUaN+0xtzpLbw==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 5/7] media: sun8i-di: Add a Kconfig dependency on RESET_CONTROLLER
Date: Thu, 25 Aug 2022 12:20:33 +0200
Message-Id: <20220825102035.419087-6-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825102035.419087-1-paul.kocialkowski@bootlin.com>
References: <20220825102035.419087-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver relies on the reset controller API to work, so add
RESET_CONTROLLER as one of its Kconfig dependencies.

Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/sun8i-di/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig b/drivers/media/platform/sunxi/sun8i-di/Kconfig
index ff71e06ee2df..f688396913b7 100644
--- a/drivers/media/platform/sunxi/sun8i-di/Kconfig
+++ b/drivers/media/platform/sunxi/sun8i-di/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_SUN8I_DEINTERLACE
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_SUNXI || COMPILE_TEST
-	depends on COMMON_CLK && OF
+	depends on COMMON_CLK && RESET_CONTROLLER && OF
 	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-- 
2.37.1

