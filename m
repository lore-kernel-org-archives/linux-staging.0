Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1E28F8;
	Thu, 25 Aug 2022 10:29:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C9B5ACDCA2;
	Thu, 25 Aug 2022 10:20:59 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2190DFF805;
	Thu, 25 Aug 2022 10:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661422852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4M0OUTtVFa6Uags3Jabt9ynYEV9lsMeV9tKIQyol+aM=;
	b=R8GgMm/w1fBcOGxQaOCQqP9Xoe0iVkicHfxKNKUwF4gjn169G6MukaSsnfAJoSAaETS6T0
	amYmO/daCjkAvpB0EKBDrwiecRcpV9LVd/kD1nyFWRFPCa+LtHdMdBMX13mFG9Zd/IcWdi
	1wWz28Fb82fYit2jDVlsIRbc55lX1Y7Thkt9TCcnxQ9rOmqBrsw8gmdbTp9oS0SASDXD0o
	GMGur4R2cVcIrGaiqkGIiepKN5SlgrY1JKybUNG2GiCPgomuPleolMi2/MTJy73gWgh4Zp
	S8j3O0DLPiCKsJjI7qUaPxUdMA/nxwpMvdSo75veRa1b/bc00bBZQocHTcN9wA==
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
Subject: [PATCH v2 3/7] media: sun6i-csi: Add a Kconfig dependency on RESET_CONTROLLER
Date: Thu, 25 Aug 2022 12:20:31 +0200
Message-Id: <20220825102035.419087-4-paul.kocialkowski@bootlin.com>
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

Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/sun6i-csi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
index 0345901617d4..e5b6991ce7f0 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_SUN6I_CSI
 	tristate "Allwinner V3s Camera Sensor Interface driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && COMMON_CLK  && HAS_DMA
+	depends on VIDEO_DEV && COMMON_CLK && RESET_CONTROLLER && HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.37.1

