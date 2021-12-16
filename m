Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E419C29CA
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 09:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id E9305DFFB4;
	Thu, 16 Dec 2021 01:03:56 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
	by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id re3f4k7x-6TU; Thu, 16 Dec 2021 01:03:56 -0800 (PST)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: martin.kepplinger@puri.sm,
	festevam@gmail.com,
	laurent.pinchart@ideasonboard.com,
	p.zabel@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	slongerbeam@gmail.com,
	kernel@puri.sm
Subject: [PATCH v2 1/2] media: imx: imx8mq-mipi-csi2: remove wrong irq config write operation
Date: Thu, 16 Dec 2021 10:03:35 +0100
Message-Id: <20211216090336.451665-2-martin.kepplinger@puri.sm>
In-Reply-To: <20211216090336.451665-1-martin.kepplinger@puri.sm>
References: <20211216090336.451665-1-martin.kepplinger@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The place where this register writel() that masks one interrupt is placed
does not guarantee that the device is powered so that's not allowed. Moreover
imx8mq_mipi_csi_start_stream() masks the interrupt anyway so the
write is not even needed. Remove it as this is a mistake that slipped in
with the driver.

Fixes: f33fd8d77dd0 ("media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller")
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 7adbdd14daa9..8f3cc138c52c 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -398,9 +398,6 @@ static int imx8mq_mipi_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
 	int ret = 0;
 
-	imx8mq_mipi_csi_write(state, CSI2RX_IRQ_MASK,
-			      CSI2RX_IRQ_MASK_ULPS_STATUS_CHANGE);
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(state->dev);
 		if (ret < 0)
-- 
2.30.2

