Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BC22C85
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 06:20:09 +0000 (UTC)
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam
 <slongerbeam@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i.MX6: Support 16-bit BT.1120 video input
Date: Wed, 06 Oct 2021 08:13:48 +0200
Message-ID: <m3o882n0ir.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Confirmed to work with ADV7610 HDMI receiver.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
index 658c173bebdf..2893b68f1f7a 100644
--- a/drivers/gpu/ipu-v3/ipu-csi.c
+++ b/drivers/gpu/ipu-v3/ipu-csi.c
@@ -261,10 +261,24 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_co=
nfig *cfg, u32 mbus_code,
 		cfg->data_width =3D IPU_CSI_DATA_WIDTH_8;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+		if (mbus_type =3D=3D V4L2_MBUS_BT656) {
+			cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_YUV422_UYVY;
+			cfg->data_width =3D IPU_CSI_DATA_WIDTH_8;
+		} else {
+			cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_BAYER;
+			cfg->data_width =3D IPU_CSI_DATA_WIDTH_16;
+		}
+		cfg->mipi_dt =3D MIPI_DT_YUV422;
+		break;
 	case MEDIA_BUS_FMT_YUYV8_1X16:
-		cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_BAYER;
+		if (mbus_type =3D=3D V4L2_MBUS_BT656) {
+			cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_YUV422_YUYV;
+			cfg->data_width =3D IPU_CSI_DATA_WIDTH_8;
+		} else {
+			cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_BAYER;
+			cfg->data_width =3D IPU_CSI_DATA_WIDTH_16;
+		}
 		cfg->mipi_dt =3D MIPI_DT_YUV422;
-		cfg->data_width =3D IPU_CSI_DATA_WIDTH_16;
 		break;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -352,7 +366,7 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *=
csicfg,
 			    const struct v4l2_mbus_config *mbus_cfg,
 			    const struct v4l2_mbus_framefmt *mbus_fmt)
 {
-	int ret;
+	int ret, is_bt1120;
=20
 	memset(csicfg, 0, sizeof(*csicfg));
=20
@@ -373,11 +387,18 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config=
 *csicfg,
 		break;
 	case V4L2_MBUS_BT656:
 		csicfg->ext_vsync =3D 0;
+		/* UYVY10_1X20 etc. should be supported as well */
+		is_bt1120 =3D mbus_fmt->code =3D=3D MEDIA_BUS_FMT_UYVY8_1X16 ||
+			mbus_fmt->code =3D=3D MEDIA_BUS_FMT_YUYV8_1X16;
 		if (V4L2_FIELD_HAS_BOTH(mbus_fmt->field) ||
 		    mbus_fmt->field =3D=3D V4L2_FIELD_ALTERNATE)
-			csicfg->clk_mode =3D IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
+			csicfg->clk_mode =3D is_bt1120 ?
+				IPU_CSI_CLK_MODE_CCIR1120_INTERLACED_SDR :
+				IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
 		else
-			csicfg->clk_mode =3D IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
+			csicfg->clk_mode =3D is_bt1120 ?
+				IPU_CSI_CLK_MODE_CCIR1120_PROGRESSIVE_SDR :
+				IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
 		break;
 	case V4L2_MBUS_CSI2_DPHY:
 		/*
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/me=
dia/imx/imx-media-csi.c
index 45f9d797b9da..ba93512f8c71 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -139,6 +139,8 @@ static inline bool is_parallel_16bit_bus(struct v4l2_fw=
node_endpoint *ep)
  * Check for conditions that require the IPU to handle the
  * data internally as generic data, aka passthrough mode:
  * - raw bayer media bus formats, or
+ * - BT.656 and BT.1120 (8/10-bit YUV422) data can always be processed
+ *   on-the-fly (converted to YUV420)
  * - the CSI is receiving from a 16-bit parallel bus, or
  * - the CSI is receiving from an 8-bit parallel bus and the incoming
  *   media bus format is other than UYVY8_2X8/YUYV8_2X8.
@@ -147,6 +149,9 @@ static inline bool requires_passthrough(struct v4l2_fwn=
ode_endpoint *ep,
 					struct v4l2_mbus_framefmt *infmt,
 					const struct imx_media_pixfmt *incc)
 {
+	if (ep->bus_type =3D=3D V4L2_MBUS_BT656) // including BT.1120
+		return 0;
+
 	return incc->bayer || is_parallel_16bit_bus(ep) ||
 		(is_parallel_bus(ep) &&
 		 infmt->code !=3D MEDIA_BUS_FMT_UYVY8_2X8 &&

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
