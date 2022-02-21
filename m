Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C7F33C1
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 18:17:22 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id BF3561BF206;
	Mon, 21 Feb 2022 18:17:16 +0000 (UTC)
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
Subject: [PATCH v3] media: imx: imx8mq-mipi-csi2: Remove YUV422 2X8
Date: Mon, 21 Feb 2022 19:17:08 +0100
Message-Id: <20220221181708.378032-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
busses.

Drop it and while at it also add the canonical UYVY wire format for
packed YUV422 when transmitted on the CSI-2 serial bus.

Also beautify a little the formats declaration list by putting the
opening curly brace after the comment.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v1->v2:
- Fix subject (s/mp/mq) as reported by Adam
- Add UYVY_1X16 as suggested by Laurent

v2->v3:
- Add a missing comma
- Align the entries declaration style to the rest of the list

 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 56ef3b3b2906..449796a0b942 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -200,12 +200,13 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
 		.width = 14,
-	}, {
+	},
 	/* YUV formats */
-		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
 		.width = 16,
 	}, {
-		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.width = 16,
 	}
 };
--
2.35.0

