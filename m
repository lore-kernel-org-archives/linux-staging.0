Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B52FB2;
	Fri, 10 Sep 2021 18:46:36 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id E98DCD4C24;
	Fri, 10 Sep 2021 18:42:24 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id B6AEE240006;
	Fri, 10 Sep 2021 18:42:15 +0000 (UTC)
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
Subject: [PATCH 02/22] ARM: dts: sun8i: v3s: Parent the CSI module clock to the ISP PLL
Date: Fri, 10 Sep 2021 20:41:27 +0200
Message-Id: <20210910184147.336618-3-paul.kocialkowski@bootlin.com>
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

At reset time, the CSI module clock is parented to the video PLL, which
is used by the display engine. While the CSI module clock needs to be
clocked at precisely 297 MHz, the display engine will need to adjust its
clock usage depending on the display pixel rate.

As a result, the video PLL may be reconfigured to fit the need of the
display engine, which will break the CSI hardware.

A good way to work around this is to reparent the CSI module clock to
the ISP PLL (like it is done in the Allwinner SDK). Do this using the
device-tree assigned-clock properties.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 776913b3f85f..a77b63362a1d 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -622,6 +622,9 @@ csi1: camera@1cb4000 {
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
+
+			assigned-clocks = <&ccu CLK_CSI1_SCLK>;
+			assigned-clock-parents = <&ccu CLK_PLL_ISP>;
 		};
 
 		gic: interrupt-controller@1c81000 {
-- 
2.32.0

