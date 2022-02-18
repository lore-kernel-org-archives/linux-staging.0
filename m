Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D054A88
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 18:35:47 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id BC0EB40002;
	Fri, 18 Feb 2022 18:35:43 +0000 (UTC)
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
Subject: [PATCH v2 4/7] media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
Date: Fri, 18 Feb 2022 19:34:18 +0100
Message-Id: <20220218183421.583874-5-jacopo@jmondi.org>
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

Bits 13 and 12 of the ISP_CONFIGn register configure the PIXEL_MODE
which specifies the sampling size, in pixel component units, on the
CSI-2 output data interface when data are transferred to memory.

The register description in the chip manual specifies that DUAL mode
should be used for YUV422 data.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 3e7efcf43a5f..86e7ea3713d9 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -173,6 +173,7 @@
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
+#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
 #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
 #define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
 #define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
@@ -506,7 +507,13 @@ static void __mipi_csis_set_format(struct csi_state *state)
 
 	/* Color format */
 	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
-	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
+	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
+		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
+
+	/* TODO: Verify which other formats require DUAL (or QUAD) modes. */
+	if (state->csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
+		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
+
 	val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
 	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
-- 
2.35.0

