Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E387A
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 18:01:25 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id DD169240003;
	Fri, 11 Feb 2022 18:01:19 +0000 (UTC)
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
	xavier.roumegue@oss.nxp.com
Cc: kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 0/3] media: De-stage imx7-mipi-csis.c
Date: Fri, 11 Feb 2022 19:02:13 +0100
Message-Id: <20220211180216.290133-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx7-mipi-csis.c driver has no obvious problems and can be destaged.

Move it to a newly created drivers/media/platform/imx directory and plumb
the Kconfig and build system.

To make it more controversial, I'm annoyed by having the SoC identifier in the
driver file name, as the same IP the driver controls is found on i.MX7 as well
as i.MX8 SoCs.

I'm not sure how it will look like when more CSI-2 receiver drivers will be
de-staged. Currently the situation is a bit confusing, but I think, looking at
the compatibles for each driver that it might be doable to remove the SoC
identifiers from driver names (although I'm sure it has been attempted in the
past).

Anyway, I'm mostly interested in 1/3 to be able to move the driver out of
staging and start adding support for other i.MX8 SoC revisions on top.

Series based on the most recent media/master tree.

Thanks
   j

Jacopo Mondi (3):
  media: imx: De-stage imx7-mipi-csis
  media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
  media: imx: Remove reference to i.MX7 from driver

 MAINTAINERS                                   |  2 +-
 drivers/media/platform/Kconfig                |  1 +
 drivers/media/platform/Makefile               |  1 +
 drivers/media/platform/imx/Kconfig            | 23 +++++++++++++++++++
 drivers/media/platform/imx/Makefile           |  1 +
 .../platform/imx/imx-mipi-csis.c}             | 10 +++++---
 drivers/staging/media/imx/Makefile            |  1 -
 7 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (99%)

--
2.35.0

