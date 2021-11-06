Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD62C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:38:29 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id i9so12840551ilu.8
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvL0Zqkz85LYHufmiL48sAs3q5REU5bqby89EtGa5w4=;
        b=dQkQ7I0h/Op484A/fxCcDEaFKI1EYy9YvNnHRQz7m5jY+d+nd6+HEMfWftsfGCRii2
         z+7JloOkv4G0TGEJMYeEDlf8/J+PzE059GS637NG1vDRvDAW/BiT4b/KJ39n20Yzw9xP
         ZZNARKwYM7LuxY2cXiHX5MNPph8SUhDbxUajDkBn73ZuK/qnTsL6omXF5eTQfCkJCPdX
         pLixK7CmOdpDGeW7ol2PVnV9Inaj+5mW3MAmh/vvslAzoUCfWX0tTKCwoaTmp/RBg29C
         OLtfjubdU5eCqBcFNXfx07fPWFrPLGogJzp6euxbkwOiYYdk3x+QnvEjEiB8j3pHcDG6
         rxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvL0Zqkz85LYHufmiL48sAs3q5REU5bqby89EtGa5w4=;
        b=MUqYpzajQfiB8nf+gAMtWYslkiYGhzH4VK8ucnDQRxHCyDmniZiicLJ7n38rBdhtOG
         H/vtlt/q5dEddkdecBwvrBQU7ErqtNrEmv7N/4rxlyCcX7VO/KGPS7DDz3ZVvxLfu/hS
         tiDAkOfr6PB6dH+Lvo3w4zJR19UP9QIWp8sQt6nLVMjO/od0DINpYiOQzfemPNFz9t/5
         MC9gyRS3yTTuQ207fal9Hsa1fqXTc/7O0m3Cw1RC1gT19ATLyiuMhNHwJICA1DcfzmDM
         erzQH6Dm59HeN0qabz/FTl6VUZ1oMQAkZAFiwam5ctPrbDO2tbFTjCfPRy8zl0i/1Ufg
         Sl+A==
X-Gm-Message-State: AOAM531ktoxSuPxnutqBf1gcxA6j4sbEBphscSZ9ABFVZEjhXmlBtLhE
	1dlSCH93hxjMxIoK/6ANncg=
X-Google-Smtp-Source: ABdhPJzpnoPITzTG+mm95hC+TJyxENY8UqxQSr3DwH9LA8qNFBvVkGOuSJvfXac+Sgygj/rZMcJEEw==
X-Received: by 2002:a92:d908:: with SMTP id s8mr25362965iln.168.1636223909120;
        Sat, 06 Nov 2021 11:38:29 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id o10sm7174077ilu.49.2021.11.06.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:38:28 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Alice Guo <alice.guo@nxp.com>,
	linux-rockchip@lists.infradead.org (open list:HANTRO VPU CODEC DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [RFC 2/5] arm64: dts: imx8mm:  Enable VPU-G1 and VPU-G2
Date: Sat,  6 Nov 2021 13:37:58 -0500
Message-Id: <20211106183802.893285-3-aford173@gmail.com>
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

Enable two hardware Hantro decoders called G1 and G2.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 1f69c14d953f..725c3113831e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1248,6 +1248,47 @@ gpu_2d: gpu@38008000 {
 			power-domains = <&pgc_gpu>;
 		};
 
+		vpu_g1: video-codec@38300000 {
+			compatible = "nxp,imx8mm-vpu";
+			reg = <0x38300000 0x10000>;
+			reg-names = "g1";
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g1";
+			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "g1", "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_G1>,
+					  <&clk IMX8MM_CLK_VPU_BUS>,
+					  <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						 <&clk IMX8MM_SYS_PLL1_800M>,
+						 <&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mm-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g2";
+			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "g2",  "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_G2>,
+					 <&clk IMX8MM_CLK_VPU_BUS>,
+					 <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						<&clk IMX8MM_SYS_PLL1_800M>,
+						<&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.32.0

