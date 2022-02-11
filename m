Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AA7A
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 18:01:34 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 1351F240002;
	Fri, 11 Feb 2022 18:01:28 +0000 (UTC)
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
Subject: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
Date: Fri, 11 Feb 2022 19:02:15 +0100
Message-Id: <20220211180216.290133-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220211180216.290133-1-jacopo@jmondi.org>
References: <20220211180216.290133-1-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.

The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
specify a SoC version number in the driver name.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 MAINTAINERS                                                     | 2 +-
 .../media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bdb8c881b0b..7def3b7d56bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/imx7.rst
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
-F:	drivers/media/platform/imx/imx7-mipi-csis.c
+F:	drivers/media/platform/imx/imx-mipi-csis.c
 F:	drivers/staging/media/imx/imx7-media-csi.c
 
 MEDIA DRIVERS FOR HELENE
diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
similarity index 100%
rename from drivers/media/platform/imx/imx7-mipi-csis.c
rename to drivers/media/platform/imx/imx-mipi-csis.c
-- 
2.35.0

