Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739A4A88
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 18:35:56 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id CCF7840005;
	Fri, 18 Feb 2022 18:35:49 +0000 (UTC)
From: Jacopo Mondi <jacopo@jmondi.org>
To: slongerbeam@gmail.com,
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
Subject: [PATCH v2 6/7] media: imx: imx-mipi-csis: Add BGR888
Date: Fri, 18 Feb 2022 19:34:20 +0100
Message-Id: <20220218183421.583874-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218183421.583874-1-jacopo@jmondi.org>
References: <20220218183421.583874-1-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the BGR888_1X24 image formats.

The BGR888 format definition matches how pixel components are sent on
the wire according to the CSI-2 specification.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index c7a771e3fdf3..fdf133f81c5b 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -366,6 +366,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
 		.width = 16,
 	},
+	{
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
+		.width = 24,
+	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-- 
2.35.0

