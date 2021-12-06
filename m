Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093672CA6
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 97658DF539;
	Mon,  6 Dec 2021 05:13:18 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
	by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QP9B0PAlJ5sC; Mon,  6 Dec 2021 05:13:18 -0800 (PST)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 1/2] media: imx: imx8mq-mipi-csi2: fix system resume issue
Date: Mon,  6 Dec 2021 14:12:41 +0100
Message-Id: <20211206131242.2697464-2-martin.kepplinger@puri.sm>
In-Reply-To: <20211206131242.2697464-1-martin.kepplinger@puri.sm>
References: <20211206131242.2697464-1-martin.kepplinger@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

during system resume, interconnect bandwidth would be requested even
though the device is runtime suspended. This leaves the system in an
unbalanced state. Fix that by checking the state before.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 7adbdd14daa9..31a1e43733a0 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -714,6 +714,9 @@ static int imx8mq_mipi_csi_pm_suspend(struct device *dev, bool runtime)
 
 	mutex_unlock(&state->lock);
 
+	if (!runtime && pm_runtime_suspended(state->dev))
+		return 0;
+
 	ret = icc_set_bw(state->icc_path, 0, 0);
 	if (ret)
 		dev_err(dev, "icc_set_bw failed with %d\n", ret);
@@ -727,6 +730,9 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev, bool runtime)
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
 	int ret = 0;
 
+	if (!runtime && pm_runtime_suspended(state->dev))
+		return 0;
+
 	ret = icc_set_bw(state->icc_path, 0, state->icc_path_bw);
 	if (ret) {
 		dev_err(dev, "icc_set_bw failed with %d\n", ret);
-- 
2.30.2

