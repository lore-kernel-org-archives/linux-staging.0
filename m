Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA82FAF;
	Fri, 10 Sep 2021 18:42:47 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 30EC7240005;
	Fri, 10 Sep 2021 18:42:44 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 19/22] soc: sunxi: mbus: Add A31 ISP compatibles to the list
Date: Fri, 10 Sep 2021 20:41:44 +0200
Message-Id: <20210910184147.336618-20-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A31 ISP sits on the mbus and requires the usual bus address
adaptation. Add its compatibles to the list.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/soc/sunxi/sunxi_mbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index d90e4a264b6f..7f0079ea30b1 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -37,6 +37,7 @@ static const char * const sunxi_mbus_devices[] = {
 	"allwinner,sun5i-a13-video-engine",
 	"allwinner,sun6i-a31-csi",
 	"allwinner,sun6i-a31-display-backend",
+	"allwinner,sun6i-a31-isp",
 	"allwinner,sun7i-a20-csi0",
 	"allwinner,sun7i-a20-display-backend",
 	"allwinner,sun7i-a20-display-frontend",
@@ -50,6 +51,7 @@ static const char * const sunxi_mbus_devices[] = {
 	"allwinner,sun8i-h3-csi",
 	"allwinner,sun8i-h3-video-engine",
 	"allwinner,sun8i-v3s-csi",
+	"allwinner,sun8i-v3s-isp",
 	"allwinner,sun9i-a80-display-backend",
 	"allwinner,sun50i-a64-csi",
 	"allwinner,sun50i-a64-video-engine",
-- 
2.32.0

