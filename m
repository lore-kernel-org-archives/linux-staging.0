Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475577E
	for <linux-staging@lists.linux.dev>; Tue,  2 May 2023 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036616; x=1714572616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Po284pkusD+oh26TkRbRThDBdVYfcNJXuLPkM5pnIbQ=;
  b=o/yGpWsyl+6ywsmYaKf7RVK0eGgYUvIY8wOzsPDfXDgVpDFhUXiF/58d
   PGfK7H0ol9e6GWx5JryeO2K3OBhY94qaGLpjdD/4vSnZYrBklrXCw68qf
   uGss19LZ9hKeuqtTkY0xj309S0rp4X7C8cBz2rBgS7w9ejyduoymkcnif
   lZLy1VFsITGAcEakhqeKiztyz1qImp/VkBd8LG0AltrkP9Q8C25lG9pY8
   RW8Hw1lDt2U+rFz6BpT6lOLUPJZkAv7415TyEkHjEjhUNb3eZZX0D6Nci
   JHbrI70fnkjpRQAnIY/ewnWgjki+Ts7bgS2ix56esVT3m6rlpbjR48Vz9
   g==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671759"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 May 2023 16:09:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 02 May 2023 16:09:04 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 02 May 2023 16:09:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036544; x=1714572544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Po284pkusD+oh26TkRbRThDBdVYfcNJXuLPkM5pnIbQ=;
  b=RFeGnDP4JGZChE7tW5kzhNXyqsTOVV3k92MZYySGSdHER9ETTrU0Pklf
   RjlEhujqB1r6a2jv2Ej06vX8hxPT/9nyh6b74s7/5ShbP5Md1gapsvSwg
   1h52TnmC+qHhXVP+nsyaP6a7/u5yKqxTlXlKTI8JVONAbMExQbarqzuLe
   yfclzyMdzLiXLoJ9IoVRA4dwCXkQxudQQ0KZx4dCqb9a4p/KFjpzldQok
   I9lpcQV4LMQ9Sf6blhXVs4vU+aYwGPQfkSTtb0XLcb6nSiqCXQesOeCRw
   ltPpnHVk6XgMgFKIsm7HjoThW6I/+GLTmrZmCorFhfoP3HGUFq7+7MqlF
   w==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671758"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 May 2023 16:09:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1DB3F280056;
	Tue,  2 May 2023 16:09:04 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] media: staging: media: imx6-mipi-csi2: Add log_status core callback
Date: Tue,  2 May 2023 16:09:02 +0200
Message-Id: <20230502140902.2324813-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This prints all register values.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This might help when trying to figure if capturing does not work.

 drivers/staging/media/imx/imx6-mipi-csi2.c | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index c07994ea6e96..ab565b4e29ec 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -564,6 +565,49 @@ static int csi2_registered(struct v4l2_subdev *sd)
 				      V4L2_FIELD_NONE, NULL);
 }
 
+/* --------------- CORE OPS --------------- */
+
+static int csi2_log_status(struct v4l2_subdev *sd)
+{
+	struct csi2_dev *csi2 = sd_to_dev(sd);
+
+	v4l2_info(sd, "-----MIPI CSI status-----\n");
+	v4l2_info(sd, "VERSION: 0x%x\n",
+		  readl(csi2->base + CSI2_VERSION));
+	v4l2_info(sd, "N_LANES: 0x%x\n",
+		  readl(csi2->base + CSI2_N_LANES));
+	v4l2_info(sd, "PHY_SHUTDOWNZ: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_SHUTDOWNZ));
+	v4l2_info(sd, "DPHY_RSTZ: 0x%x\n",
+		  readl(csi2->base + CSI2_DPHY_RSTZ));
+	v4l2_info(sd, "RESETN: 0x%x\n",
+		  readl(csi2->base + CSI2_RESETN));
+	v4l2_info(sd, "PHY_STATE: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_STATE));
+	v4l2_info(sd, "DATA_IDS_1: 0x%x\n",
+		  readl(csi2->base + CSI2_DATA_IDS_1));
+	v4l2_info(sd, "DATA_IDS_2: 0x%x\n",
+		  readl(csi2->base + CSI2_DATA_IDS_2));
+	v4l2_info(sd, "ERR1: 0x%x\n",
+		  readl(csi2->base + CSI2_ERR1));
+	v4l2_info(sd, "ERR2: 0x%x\n",
+		  readl(csi2->base + CSI2_ERR2));
+	v4l2_info(sd, "MSK1: 0x%x\n",
+		  readl(csi2->base + CSI2_MSK1));
+	v4l2_info(sd, "MSK2: 0x%x\n",
+		  readl(csi2->base + CSI2_MSK2));
+	v4l2_info(sd, "PHY_TST_CTRL0: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_TST_CTRL0));
+	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_TST_CTRL1));
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops csi2_core_ops = {
+	.log_status = csi2_log_status,
+};
+
 static const struct media_entity_operations csi2_entity_ops = {
 	.link_setup = csi2_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -581,6 +625,7 @@ static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops csi2_subdev_ops = {
+	.core = &csi2_core_ops,
 	.video = &csi2_video_ops,
 	.pad = &csi2_pad_ops,
 };
-- 
2.34.1

