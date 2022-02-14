Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E97A35
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 18:42:40 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E34A1C0008;
	Mon, 14 Feb 2022 18:42:35 +0000 (UTC)
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
Subject: [PATCH 5/8] staging: media: imx: Use DUAL pixel mode if available
Date: Mon, 14 Feb 2022 19:43:15 +0100
Message-Id: <20220214184318.409208-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220214184318.409208-1-jacopo@jmondi.org>
References: <20220214184318.409208-1-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pixel sampling mode controls the size of data sampled from the CSI
Rx queue. The supported sample size depends on the configuration of the
preceding block in the capture pipeline and is then dependent on the SoC
version the CSI peripheral is integrated on.

When capturing YUV422 data if dual sample mode is available use it.

This change is particularly relevant for the IMX8MM SoC which uses the
CSIS CSI-2 receiver which operates in dual pixel mode.

Other SoCs should be unaffected by this change and should continue to
operate as before.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/media/imx/imx7-media-csi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 112096774961..a8bdfb0bb0ee 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -426,6 +426,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
 	struct v4l2_pix_format *out_pix = &vdev->fmt;
+	struct imx_media_dev *imxmd = csi->imxmd;
 	int width = out_pix->width;
 	u32 stride = 0;
 	u32 cr3 = BIT_FRMCNT_RST;
@@ -436,7 +437,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	cr18 &= ~(BIT_CSI_HW_ENABLE | BIT_MIPI_DATA_FORMAT_MASK |
 		  BIT_DATA_FROM_MIPI | BIT_BASEADDR_CHG_ERR_EN |
 		  BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
-		  BIT_DEINTERLACE_EN);
+		  BIT_DEINTERLACE_EN | BIT_MIPI_DOUBLE_CMPNT);
 
 	if (out_pix->field == V4L2_FIELD_INTERLACED) {
 		cr18 |= BIT_DEINTERLACE_EN;
@@ -500,6 +501,13 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		case MEDIA_BUS_FMT_YUYV8_2X8:
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
+
+			/* If dual mode is supported use it. */
+			if (imxmd->info->sample_modes & MODE_DUAL) {
+				cr18 |= BIT_MIPI_DOUBLE_CMPNT;
+				cr3 |= BIT_TWO_8BIT_SENSOR;
+			}
+
 			break;
 		}
 	}
-- 
2.35.0

