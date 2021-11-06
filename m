Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492C2C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:38:38 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id r8so71572iog.7
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=udKl62y2x/Oh2cW97C2eKZ5L1gu+lpGXEnEESf3ayO4=;
        b=fF8BuidW/FPcrJ2yf9wm3QJp4AL8b8rBt6CifE+v2//RxyWSJ0hVD/OyKAhAsI5g/z
         hNJAwWjZen9DblNTkvtAI4ExLnad4GRPXUULPZzZHurrnwyg+MPopwjt0IhcnDhrLcYh
         +Nr14SsC38b+nmVhUfrkeJi5pCMxSJhnhSXgOTYBaCGJ/hWFuVdcmKFApFelUfu7fhbS
         osvVDZ2rbFtFgQUcnuso2Ba/OcqSDAw3vt5ahC66vP5km3HC0vuMbSaC9M6oRB5M6qMe
         Q6ZvkqvIVDBS69JJIxBC54fXdis+xwlSM5FzxFZ/Rn+dptLc3ax9jjvGgliZ3tSN1Ytv
         BZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=udKl62y2x/Oh2cW97C2eKZ5L1gu+lpGXEnEESf3ayO4=;
        b=sACY6dlDnqKQNoQFFj5U7DYeH+j+NHt0MQoCkC2b5ljHdNFTJPVuo0o6twGWelNHcR
         afbjy+FYjopGhfXXU+B7nicpvRBOv3GgMWAQytCW4vVeRwvgSYPtclKpd3C+LTDdRM1K
         26SOpn2PdGGIEB+WVHbBYToY/xpb7qCCfD+TYJBokrVwbbi4jeB3IKAtB3qsOwBynRRH
         4We6bC4PoeYXy9hT5Ur99Cj/OnFyxDRWlmdoaUpDNvngMSUh+h/1Rvhpvqx2xiM8ZCKY
         eO/148qJA1X4CkhwMuxm1WqhoBhfHaWqCP7L1q9Isj4Fk/nFKuWhkSGHKy5DcpSC2/a+
         dAWQ==
X-Gm-Message-State: AOAM5324/1p72rn/RDxNBzGx8ftBHG4uot9WF3ttCJ5GCHhUMHwQuBdC
	VlkQSUJ2o45J2do+InWT7tY=
X-Google-Smtp-Source: ABdhPJzi/tEgr5ILGu/G4uh+io+CaFv2TdlL4qlt4DJ0TsFdO3pDfvEw1qfgLCdAoScQ2u7hufdjBA==
X-Received: by 2002:a05:6602:2cce:: with SMTP id j14mr5024039iow.23.1636223918087;
        Sat, 06 Nov 2021 11:38:38 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id o10sm7174077ilu.49.2021.11.06.11.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:38:36 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: tharvey@gateworks.com,
	frieder.schrempf@kontron.de,
	marek.vasut@gmail.com,
	jagan@amarulasolutions.com,
	aford@beaconembedded.com,
	cstevens@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-rockchip@lists.infradead.org (open list:HANTRO VPU CODEC DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [RFC 5/5] arm64: dts: imx8mm:  Enable Hantro H1 Encoder
Date: Sat,  6 Nov 2021 13:38:01 -0500
Message-Id: <20211106183802.893285-6-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106183802.893285-1-aford173@gmail.com>
References: <20211106183802.893285-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M Mini has a Hantro H1 video encoder which appears
as a media device.

Media device information
------------------------
driver          hantro-vpu
model           hantro-vpu
serial
bus info        platform: hantro-vpu
hw revision     0x0
driver version  5.15.0

Device topology
- entity 1: nxp,imx8mm-vpu-h1-enc-source (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video3
	pad0: Source
		-> "nxp,imx8mm-vpu-h1-enc-proc":0 [ENABLED,IMMUTABLE]

- entity 3: nxp,imx8mm-vpu-h1-enc-proc (2 pads, 2 links)
            type Node subtype Unknown flags 0
	pad0: Sink
		<- "nxp,imx8mm-vpu-h1-enc-source":0 [ENABLED,IMMUTABLE]
	pad1: Source
		-> "nxp,imx8mm-vpu-h1-enc-sink":0 [ENABLED,IMMUTABLE]

- entity 6: nxp,imx8mm-vpu-h1-enc-sink (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video3
	pad0: Sink
		<- "nxp,imx8mm-vpu-h1-enc-proc":1 [ENABLED,IMMUTABLE]

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 725c3113831e..b4c204cbced8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1289,6 +1289,26 @@ vpu_g2: video-codec@38310000 {
 			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
 		};
 
+		vpu_h1: video-codec@38320000 {
+			compatible = "nxp,imx8mm-vpu-h1";
+			reg = <0x38320000 0x10000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "h1";
+			clocks = <&clk IMX8MM_CLK_VPU_H1_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "h1",  "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_H1>,
+					 <&clk IMX8MM_CLK_VPU_BUS>,
+					 <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						<&clk IMX8MM_SYS_PLL1_800M>,
+						<&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_H1>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.32.0

