Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959A33C1
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 17:48:01 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 7ECFD1C0003;
	Mon, 21 Feb 2022 17:47:56 +0000 (UTC)
From: Jacopo Mondi <jacopo@jmondi.org>
To: aford173@gmail.com,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	martin.kepplinger@puri.sm,
	rmfrfs@gmail.com,
	xavier.roumegue@oss.nxp.com,
	alexander.stein@ew.tq-group.com,
	dorota.czaplejewicz@puri.sm
Cc: kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 5/7] media: imx: imx-mipi-csis: Add RGB565_1X16
Date: Mon, 21 Feb 2022 18:47:25 +0100
Message-Id: <20220221174727.320320-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220221174727.320320-1-jacopo@jmondi.org>
References: <20220221174727.320320-1-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RGB565_1X16 to the enumeration of supported image formats.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 9d5034759987..46055b5f8412 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -360,6 +360,12 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
 		.width = 16,
 	},
+	/* RGB formats. */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
+		.width = 16,
+	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-- 
2.35.0

