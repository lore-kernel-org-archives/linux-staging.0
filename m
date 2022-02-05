Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA772C9D;
	Sat,  5 Feb 2022 19:02:12 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 31FF9CDCA7;
	Sat,  5 Feb 2022 18:54:55 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A0F29240004;
	Sat,  5 Feb 2022 18:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1644087287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDCmDmAN+Ty0U7DqUOAg9vP8g2Wl/CIoMBBYtqtH7g8=;
	b=CDEjJlCnsBm3lhVvhpzIl/nmi4riWbPPeXCShzknju9GZh4sGUYCq+KC+pVPMm3sXhQ/V4
	eXerouOKCBsh28ZubTVNey2POl3g3bHWFgfCP8BmqXoSPk8zCMU2//Bkpe+ghoPqdnJlxb
	s+Nyp91hYtYtAc33WlJzi/SZ14FMP46YNwCO8pwMTv58g1WoSBJZ8xg3BxBXXVjKjeoeye
	n2GhVNcWpKpkSlSqdrs++Abyp6MglLgM4+vy5bv5h/2bdJnCAWQehHpZXMQ3QxqUr4uYC+
	LKTAefwtGY2dJkn//aj2g+ass3BZd0plGsR2LZHyE8qqpXVNPEZvTEGDfAMkfA==
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
Subject: [PATCH v2 04/66] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
Date: Sat,  5 Feb 2022 19:53:27 +0100
Message-Id: <20220205185429.2278860-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V3s uses the mbus interconnect to provide DRAM access for a
number of blocks. The SoC can only map 2 GiB of DRAM, which is
reflected in the dma-ranges property.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 084323d5c61c..1b3048b6f197 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -577,6 +577,16 @@ int_mii_phy: ethernet-phy@1 {
 			};
 		};
 
+		mbus: dram-controller@1c62000 {
+			compatible = "allwinner,sun8i-v3s-mbus";
+			reg = <0x01c62000 0x1000>;
+			clocks = <&ccu CLK_MBUS>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x00000000 0x40000000 0x80000000>;
+			#interconnect-cells = <1>;
+		};
+
 		spi0: spi@1c68000 {
 			compatible = "allwinner,sun8i-h3-spi";
 			reg = <0x01c68000 0x1000>;
-- 
2.34.1

