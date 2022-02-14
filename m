Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE38A35
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 18:42:21 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id AB65D1C0003;
	Mon, 14 Feb 2022 18:42:15 +0000 (UTC)
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
Subject: [PATCH 0/8] media: imx: Destage imx7-mipi-csis with fixes on top
Date: Mon, 14 Feb 2022 19:43:10 +0100
Message-Id: <20220214184318.409208-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
  this series includes patches from two series previously sent
https://lore.kernel.org/linux-media/20220119112024.11339-1-jacopo@jmondi.org/
https://lore.kernel.org/linux-media/20220211180216.290133-1-jacopo@jmondi.org/

Which can now be marked as superseded.

The first 2 patches performs the de-staging of the imx7-mipi-csis driver and
takes into account comments recevied there.

The rest of the series builds on top of the comment received on:
https://lore.kernel.org/linux-media/20220119112024.11339-3-jacopo@jmondi.org/

If DUAL pixel mode is used in the CSIS driver, then the CSI block of the IMX8MM
SoC needs to be operated in dual mode as well. To do so, create per-SoC
configurations in imx7-media-csi.c and only set dual mode for the MM model
leaving the other ones untouched as they connect to a different CSI-2 receiver
which instead operates in single mode.

I've only tested on i.MX8MP which is not affected by these changes, so I
hope I've not broke anything. Laurent could you test on MM to see if it works
now ?

On top two small patches I was carrying in my tree to add more formats to the
CSIS driver.

Series based on top of the most recent media master branch.

Thanks
  j

Jacopo Mondi (9):
  media: imx: De-stage imx7-mipi-csis
  media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
  staging: media: imx: Add more compatible strings
  staging: media: imx: Define per-SoC info
  staging: media: imx: Use DUAL pixel mode if available
  media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
  media: imx: imx-mipi-csis: Add RGB565_1X16
  media: imx: imx-mipi-csis: Add RGB/BGR888

 Documentation/admin-guide/media/imx7.rst      |  2 +-
 ...-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
 .../bindings/media/nxp,imx7-csi.yaml          |  1 +
 MAINTAINERS                                   |  4 +-
 drivers/media/platform/Kconfig                |  1 +
 drivers/media/platform/Makefile               |  1 +
 drivers/media/platform/imx/Kconfig            | 24 +++++++++
 drivers/media/platform/imx/Makefile           |  1 +
 .../platform/imx/imx-mipi-csis.c}             | 44 ++++++++++++++--
 drivers/staging/media/imx/Makefile            |  1 -
 drivers/staging/media/imx/imx-media.h         | 44 ++++++++++++++++
 drivers/staging/media/imx/imx7-media-csi.c    | 52 ++++++++++++++-----
 12 files changed, 153 insertions(+), 24 deletions(-)
 rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (97%)

--
2.35.0

